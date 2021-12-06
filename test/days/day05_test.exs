defmodule Days.Day05Test do
  use ExUnit.Case

  alias Aoc2021.Day05

  @input [
    "0,9 -> 5,9",
    "8,0 -> 0,8",
    "9,4 -> 3,4",
    "2,2 -> 2,1",
    "7,0 -> 7,4",
    "6,4 -> 2,0",
    "0,9 -> 2,9",
    "3,4 -> 1,4",
    "0,0 -> 8,8",
    "5,5 -> 8,2"
  ]

  test "Day05 - Part1 - Example" do
    assert Day05.part1(@input) == 5
  end

  # test "Day05 - Part2 - Example" do
  #   assert Day05.part2(@input) == 1924
  # end
end
