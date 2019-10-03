defmodule ElixirForumScrapper.MixProject do
  use Mix.Project

  def project do
    [
      app: :mal_scrapper,
      name: "MAL Scrapper",
      version: "0.1.2",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "My Anime List Scrapper",
      source_url: "https://github.com/crisefd/mal_wrapper",
      docs: [extras: ["README.md"]],
      aliases: aliases(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison, ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
       {:httpoison, "~> 1.5.0"},
       {:floki, "~> 0.21.0"},
       {:ex_doc, "~> 0.21", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["ChrisTheWeird"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/crisefd/mal_wrapper"}
    ]
end
defp aliases do
    [c: "compile"]
end

end
