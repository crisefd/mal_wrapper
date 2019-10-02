# MalScrapper

**My Anime List scrapper**

Checkout MAL page [here](https://myanimelist.net/)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `mal_scrapper` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mal_scrapper, "~> 0.1.0"}
  ]
end
```

## Usage

``` shell
  MalScrapper.get_top_anime <TYPE>
```

```<TYPE>``` can have all of these values: "airing", "upcoming", "tv", "movie", "ova", "special", "bypopularity", "favorite"

## Output
``` shell
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
  %{
    details: %{
      aired: "Apr 2011 - Sep 2011",
      episodes: "TV (24 eps)",
      members: "1,271,215 members"
    },
    name: "Steins;Gate",
    rank: 2
  },
...
]
```


TODO: Add support for genre/person/character search



Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/mal_scrapper](https://hexdocs.pm/mal_scrapper).

