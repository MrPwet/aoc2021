defmodule Days.Day06Test do
  use ExUnit.Case

  alias Aoc2021.Day06

  @input [3, 4, 3, 1, 2]

  test "Day06 - Part1 - Example" do
    assert Day06.part1(@input, 18) == 26
    assert Day06.part1(@input, 80) == 5934
  end

  test "Day06 - Part2 - Example" do
    assert Day06.part2(@input, 256) == 26_984_457_539
  end
end
