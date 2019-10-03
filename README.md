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

### Get top animes

``` shell
  MalScrapper.get_top_anime <TYPE>
```

`<TYPE>` can have take these values: `airing`, `upcoming`, `tv`, `movie`, `ova`, `special`, `bypopularity`, `favorite`

### Output
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
### Get anime by genre

``` shell
  MalScrapper.get_anime_by_genre <GENRE_NAME>
```
`<GENRE_NAME>` cant take these values:
`:Action`, `:Adventure `,  `:Cars `, `:Comedy `, `:Dementia`,
`:Demons `, `:Drama `, `:Ecchi `, `:Fantasy `, `:Game `, `:Harem`,
`:Hentai `, `:Historical `, `:Horror `, `:Josei `, `:Kids `, 
`:Magic`,  `:"Martial Arts"`, `:Mecha `, `:Military `, `:Music `, 
`:Mystery`, `:Parody `, `:Police `, `:Psychological `, `:Romance `, 
`:Samurai`, `:School `, `:"Sci-Fi" `, `:Seinen `, `:Shoujo `, 
`:"Shoujo Ai"`, `:Shounen`, `:"Shounen"`, `:"Shounen Ai"`, 
`:"Slice of Life"`, `:Space`, `:Sports`, `:"Super Power"`, 
`:Supernatural`, `:Thriller`, `:Vampire`, `:Yaoi `,  `:Yuri`


### Output
``` shell
[
...
%{
    description: "Yato and Yukine have finally mended their relationship as god and Regalia, and everyone has returned to their daily life. Yato remains a minor and unknown deity who continues taking odd jobs for five...read more.",
    metadata: [
      type: "TV",
      episodes: "13",
      score: "8.38",
      start_date: "10-03-15",
      members: "714,152"
    ],
    name: "Noragami Aragoto"
  },
  %{
    description: "As summer arrives for the students at UA Academy, each of these superheroes-in-training puts in their best efforts to become renowned heroes. They head off to a forest training camp run by UA's pro he...read more.",
    metadata: [
      type: "TV",
      episodes: "25",
      score: "8.61",
      start_date: "04-07-18",
      members: "701,529"
    ],
    name: "Boku no Hero Academia 3rd Season"
  },
  ...
]
```

### Search

``` shell
  MalScrapper.search <TYPE> <TERM>
```
`<GENRE_NAME>` Can take these values: 
`:all` `:anime` `:character` `:person` `:manga` `:news` `:featured` `:forum ` `:club ` `:user`

`<TERM>` can be any string



Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/mal_scrapper](https://hexdocs.pm/mal_scrapper).

