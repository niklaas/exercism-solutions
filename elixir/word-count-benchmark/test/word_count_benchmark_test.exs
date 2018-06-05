defmodule WordCountBenchmarkTest do
  use ExUnit.Case
  doctest WordCountBenchmark

  test "greets the world" do
    assert WordCountBenchmark.hello() == :world
  end
end
