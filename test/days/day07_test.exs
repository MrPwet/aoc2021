defmodule Days.Day07Test do
  use ExUnit.Case

  alias Aoc2021.Day07

  @input [16, 1, 2, 0, 4, 2, 7, 1, 2, 14]

  test "Day07 - Part1 - Example" do
    assert Day07.part1(@input) == 37
  end

  test "Day07 - Part2 - Example" do
    assert Day07.part2(@input) == 168
  end
end
