defmodule MalScrapper do
  @moduledoc """
    Scrapper for My Anime List.
    It provides basic functionalities to query data from the site
  """
  alias MalScrapper.AnimeData



  @type valid_top_types() ::
          :airing | :upcoming | :tv | :movie | :ova | :special | :bypopularity | :favorite

  @type genres() ::
          :Action
          | :Adventure
          | :Cars
          | :Comedy
          | :Dementia
          | :Demons
          | :Drama
          | :Ecchi
          | :Fantasy
          | :Game
          | :Harem
          | :Hentai
          | :Historical
          | :Horror
          | :Josei
          | :Kids
          | :Magic
          | :"Martial Arts"
          | :Mecha
          | :Military
          | :Music
          | :Mystery
          | :Parody
          | :Police
          | :Psychological
          | :Romance
          | :Samurai
          | :School
          | :"Sci-Fi"
          | :Seinen
          | :Shoujo
          | :"Shoujo Ai"
          | :Shounen
          | :Shounen
          | :"Shounen Ai"
          | :"Slice of Life"
          | :Space
          | :Sports
          | :"Super Power"
          | :Supernatural
          | :Thriller
          | :Vampire
          | :Yaoi
          | :Yuri

  @genres_map %{
    :Action => 1,
    :Adventure => 2,
    :Cars => 3,
    :Comedy => 4,
    :Dementia => 5,
    :Demons => 6,
    :Drama => 8,
    :Ecchi => 9,
    :Fantasy => 10,
    :Game => 11,
    :Harem => 35,
    :Hentai => 12,
    :Historical => 13,
    :Horror => 14,
    :Josei => 43,
    :Kids => 15,
    :Magic => 16,
    :"Martial Arts" => 17,
    :Mecha => 18,
    :Military => 38,
    :Music => 19,
    :Mystery => 7,
    :Parody => 20,
    :Police => 39,
    :Psychological => 40,
    :Romance => 22,
    :Samurai => 21,
    :School => 23,
    :"Sci-Fi" => 24,
    :Seinen => 42,
    :Shoujo => 25,
    :"Shoujo Ai" => 26,
    :Shounen => 27,
    :"Shounen Ai" => 28,
    :"Slice of Life" => 36,
    :Space => 29,
    :Sports => 30,
    :"Super Power" => 31,
    :Supernatural => 37,
    :Thriller => 41,
    :Vampire => 32,
    :Yaoi => 33,
    :Yuri => 34
  }

  @type search_type() :: :all | :anime | :character | :person | :manga | :news | :featured | :forum | :club | :user

  @spec get_top_anime(valid_top_types(), Integer.t()) :: List.t()

  @spec get_anime_by_genre(genres(), Integer.t()) :: List.t()

  @spec search(search_type(), String.t()) :: List.t()


  @doc """
    Gets top anime by the specified type

    Returns a list of maps with the data

    ## Examples:
    iex> AnimeData.top :upcoming
    [
      %{
        details: %{
          aired: "Apr 2009 - Jul 2010",
          episodes: "TV (64 eps)",
          members: "1,533,286 members"
        },
        name: "Fullmetal Alchemist: Brotherhood",
        rank: 1
      },
      ...
      ]

  """
  def get_top_anime(type, limit \\ 1) do
    AnimeData.top(type, limit)
  end

  @doc """ 
    Gets anime by genre

    Returns a list of maps with the data

    ## Examples:
    iex> MalScrapper.get_anime_by_genre :Action
    [
      %{
        description: "Yato and Yukine have finally mended their relationship as god..."
        metadata: [
          type: "TV",
          episodes: "13",
          score: "8.38",
          start_date: "10-03-15",
          members: "714,152"
        ],
        name: "Noragami Aragoto"
      },
      ...
      ]

  """
  def get_anime_by_genre(genre, limit \\ 1) do
    AnimeData.genre({genre, @genres_map[genre]}, limit)
  end

  @doc """
    REST Quick search feature

    Returns the matching elements

    ## Example:
    iex> MalScrapper.search :person, "hanazawa"
    {:ok,
      %{
        "categories" => [
          %{
             "items" => [
               %{
                 "es_score" => 4.724693,
                 "id" => 185,
                 "image_url" => "https://cdn.myanimelist.net/images/voiceactors/2/41455.jpg",
                 "name" => "Hanazawa, Kana",
                 "payload" => %{
                 "alternative_name" => "HanaKana; KanaHana",
                 "birthday" => "Feb 25, 1989",
                 "favorites" => 72213,
                 "thumbnail_url" => "https://cdn.myanimelist.net/r/116x76/images/voiceactors/2/41455.jpg?s=d9914bb7de8c6ceec02dc05bac8d36ea",
                 "type" => "person",
                 "url" => "https://myanimelist.net/people/185/Kana_Hanazawa"
                },
                ...
              ],
            ]
          }
        ]
      }
      }

  """
  def search(type \\ :all, term) do
    AnimeData.search(type, term)
  end
end
