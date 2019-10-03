defmodule MalScrapper do
  alias MalScrapper.AnimeData

  @type valid_top_types() ::
          :airing | :upcoming | :tv | :movie | :ova | :special | :bypopularity | :favorite

  @type genres() :: :Action | :Adventure | :Cars | :Comedy | :Dementia 
                    | :Demons | :Drama | :Ecchi | :Fantasy | :Game | :Harem 
                    | :Hentai | :Historical | :Horror | :Josei | :Kids | :Magic
                    | :"Martial Arts" | :Mecha | :Military | :Music | :Mystery
                    | :Parody | :Police | :Psychological | :Romance | :Samurai
                    | :School | :"Sci-Fi" | :Seinen | :Shoujo | :"Shoujo Ai"
                    | :Shounen | :"Shounen" | :"Shounen Ai" | :"Slice of Life"
                    | :Space | :Sports | :"Super Power" | :Supernatural | :Thriller
                    | :Vampire | :Yaoi | :Yuri

  """ Need to check
     %{:Action => 1, :Adventure => 2, :Cars => 3, :Comedy => 4, :Dementia => 5 , :Demons => 6, :Drama => 7, :Ecchi => 8 , :Fantasy => 9 , :Game => 10,
       :Harem  => 11, :Hentai => 12, :Historical => 13, :Horror => 14, :Josei => 15, :Kids => 16, :Magic => 17, :"Martial Arts" => 18, :Mecha => 19,
       :Military => 29, :Music => 30, :Mystery  => 31, :Parody => 32, :Police => 33, :Psychological => 34, :Romance => 35, :Samurai => 36, :School => 37,
       :"Sci-Fi" => 38, :Seinen => 39, :Shoujo => 40, :"Shoujo Ai" => 41, :Shounen => 42, :"Shounen" => 43, :"Shounen Ai" => 44, :"Slice of Life" => 45, 
       :Space => 46, :Sports => 47, :"Super Power" => 48, :Supernatural => 49, :Thriller => 50, :Vampire => 51, :Yaoi => 52, :Yuri => 53 }
  """

  @genres_map   %{:Action => 1, :Adventure => 2, :Cars => 3, :Comedy => 4, :Dementia => 5 }

  @spec get_top_anime(valid_top_types(), Integer.t()) :: List.t()

  @spec get_anime_by_genre(genres(), Integer.t()) :: List.t()

  def get_top_anime(type, limit \\ 1) do
    AnimeData.top(type, limit)
  end

  def get_anime_by_genre(genre, limit \\ 1) do 
    AnimeData.genre({genre, @genres_map[genre]}, limit)
  end
end
