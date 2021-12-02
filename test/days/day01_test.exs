defmodule Days.Day01Test do
  use ExUnit.Case

  alias Aoc2021.Day01

  @input [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]

  test "Day1 - Part1 - Example" do
    assert Day01.part1(@input) == 7
  end

  test "Day1 - Part2 - Example" do
    assert Day01.part2(@input) == 5
  end
end
