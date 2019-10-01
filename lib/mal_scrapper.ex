defmodule MalScrapper do
    require Logger


   @user_agent [{"User-agent", "MAL Wrapper"}]

   def top(type, page \\ 1) when page >= 1 do
       suffix = if page == 1, do: "", else: "?limit = #{(page - 1) * 50}"
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
   data |> Floki.find(".hoverinfo_trigger ")  
        |> Floki.text(sep: "+")
        |> String.split("+")
        |> Enum.with_index()
   # extra = data |> Floki.find(".detail, .information, .di-ib, .mt4")
   #               |> Floki.text(sep: "+") 
   #               |> String.split("+")
   #               |> Enum.slice(8, 50)

   #|> Enum.map(&String.trim(&1))
   # ranks =  data |> Floki.find(".lightLink, .top-anime-rank-text")
   #            |> Floki.text(sep: "+") 
   #            |> String.split("+")
   # names
  end
end