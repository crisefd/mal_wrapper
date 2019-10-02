defmodule MalScrapper.TopAnimeData do
  require Logger

  @user_agent [{"User-agent", "MAL Wrapper"}]

  @base_url  Application.get_env(:mal_scrapper, :base_url)


  def top(type, limit) when limit >= 1 do
    suffix = if limit == 1, do: "", else: "?limit=#{(limit - 1) * 50}"
    "#{@base_url}/topanime.php?type=#{type}#{suffix}"
    |> HTTPoison.get(@user_agent)
    |> handle_response(limit)
  end

  defp handle_response({_, %{status_code: status_code, body: body}}, limit) do
    Logger.info("Got response: status code=#{status_code}")

    case check_for_errors(status_code, body, limit) do
      {:error, _} -> []
      parsed_data -> parsed_data
    end
  end

  defp check_for_errors(200, body, limit), do: body |> parse_data(limit)

  defp check_for_errors(_, body, _limit) do
    Logger.error(fn -> "Error response: #{inspect(body)}" end)
    {:error, body}
  end

  defp parse_data(data, limit) do
    details =
      data
      |> Floki.find("div.information, .di-ib mt4")
      |> get_anime_details()

    names =
      data
      |> Floki.find(".hoverinfo_trigger ")
      |> Floki.text(sep: "+")
      |> String.split("+")

    Enum.with_index(names)
    |> Enum.zip(details)
    |> Enum.map(fn {{name, index}, details} ->
      [members, aired, episodes] = details

      %{
        name: name,
        rank: (index + 1)  + ( (limit - 1) * 50),
        details: %{members: members, aired: aired, episodes: episodes}
      }
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
    raw_details
    |> Enum.reduce([], fn d, acc ->
      case d do
        {"br", _, _} -> acc
        txt -> [String.trim(txt) | acc]
      end
    end)
  end
end