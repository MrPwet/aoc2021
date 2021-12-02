defmodule Days.Day02Test do
  use ExUnit.Case

  alias Aoc2021.Day02

  @input [
    "forward 5",
    "down 5",
    "forward 8",
    "up 3",
    "down 8",
    "forward 2"
  ]

  test "Day02 - Part1 - Example" do
    assert Day02.part1(@input) == 150
  end

  # test "Day02 - Part2 - Example" do
  #   assert Day02.part2(@input) == 0
  # end
end
