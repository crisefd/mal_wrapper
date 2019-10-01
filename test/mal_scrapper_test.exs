defmodule MalScrapperTest do
  use ExUnit.Case
  doctest MalScrapper

  test "greets the world" do
    assert MalScrapper.hello() == :world
  end
end
