defmodule MalScrapper do
  alias MalScrapper.TopAnimeData

  @type valid_top_types() ::
          :airing | :upcoming | :tv | :movie | :ova | :special | :bypopularity | :favorite

  @spec get_top_anime(valid_top_types(), Integer.t()) :: List.t()

  def get_top_anime(type, limit \\ 1) do
    TopAnimeData.top(type, limit)
  end
end
