defmodule Aoc2021 do
  @moduledoc """
  Advent of code 2021
  """
  alias Aoc2021.Utils.Input
  alias Aoc2021.{Day01, Day02}

  def solve_puzzles do
    solve_day01()
  end

  def solve_day01 do
    input = Input.read_to_array_of_int("input_files/day01.txt")

    response_part1 = Day01.part1(input)
    puts(1, 1, response_part1)

    response_part2 = Day01.part2(input)
    puts(1, 2, response_part2)
  end

  def solve_day02 do
    input = Input.read_to_array_of_string("input_files/day02.txt")

    response_part1 = Day02.part1(input)
    puts(1, 1, response_part1)

    response_part2 = Day02.part2(input)
    puts(1, 2, response_part2)
  end

  defp puts(day, part, response) do
    IO.puts("Day#{day}, part#{part}: #{response}")
  end
end
