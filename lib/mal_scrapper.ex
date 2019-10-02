defmodule MalScrapper do
  require Logger


   @user_agent [{"User-agent", "MAL Wrapper"}]

   def top(type, page \\ 1) when page >= 1 do
     suffix = if page == 1, do: "", else: "?limit=#{(page - 1) * 50}"
     "https://myanimelist.net/topanime.php?type=#{type}#{suffix}"
       |> HTTPoison.get( @user_agent)
       |> handle_response()
   end


   defp handle_response({_, %{status_code: status_code, body: body}}) do
    Logger.info("Got response: status code=#{status_code}")
    case  check_for_errors(status_code, body)  do
     {:error, _}  -> []
        parsed_data -> parsed_data
    end
   
  end

  defp check_for_errors(200, body), do: body |> parse_data

  defp check_for_errors(_, body) do
    Logger.error(fn -> "Error response: #{inspect(body)}" end)
    {:error, body}
  end

  defp parse_data (data) do
   details = data 
             |> Floki.find("div.information, .di-ib mt4")
             |> get_anime_details()
   names = data 
              |> Floki.find(".hoverinfo_trigger ")  
              |> Floki.text(sep: "+")
              |> String.split("+")
   Enum.with_index(names) 
   |> Enum.zip(details) 
   |> Enum.map(fn {{name, index}, details} -> 
      %{name: name, rank: index + 1, details: details} 
    end)
  end

  defp get_anime_details(items) do
    for item <- items do
      with {"div", _, raw_details} = item do
         get_details(raw_details)
      end 
    end
  end

  defp get_details(raw_details) do
    raw_details |> Enum.reduce("", fn (d, acc) -> 
     case d do
        {"br", _, _} -> acc
        txt -> acc <> "|" <> String.trim(txt)
      end
     end)
  end
end
