defmodule Days.Day03Test do
  use ExUnit.Case

  alias Aoc2021.Day03

  @input [
    "00100",
    "11110",
    "10110",
    "10111",
    "10101",
    "01111",
    "00111",
    "11100",
    "10000",
    "11001",
    "00010",
    "01010"
  ]

  test "Day03 - Part1 - Example" do
    assert Day03.part1(@input) == 198
  end

  test "Day03 - Part2 - Example" do
    assert Day03.part2(@input) == 230
  end
end
