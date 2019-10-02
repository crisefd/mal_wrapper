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
  MalScrapper.top <TYPE>
```

```<TYPE>``` can have all of these values: "airing", "upcoming", "tv", "movie", "ova", "special", "bypopularity", "favorite"

## Output
``` shell
...
%{
    details: "|Movie (1 eps)|2020 - 2020|18,378 members",
    name: "Fruits Basket 2nd Season",
    rank: 46
  },
  %{
    details: "|TV (12 eps)|Oct 2019 -|17,125 members",
    name: "Shirobako Movie",
    rank: 47
  },
...
```


TODO: Add support for genre/person/character search



Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/mal_scrapper](https://hexdocs.pm/mal_scrapper).

