defmodule Aoc2021 do
  @moduledoc """
  Advent of code 2021
  """

  alias Aoc2021.Utils.Input
  alias Aoc2021.{Day01, Day02, Day03, Day04, Day05, Day06, Day07, Day08}

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

  def solve_day03 do
    input = Input.read_to_array_of_string("input_files/day03.txt")

    response_part1 = Day03.part1(input)
    puts(3, 1, response_part1)

    response_part2 = Day03.part2(input)
    puts(3, 2, response_part2)
  end

  def solve_day04 do
    input = Input.read_to_array_of_string("input_files/day04.txt", "\n\n")

    response_part1 = Day04.part1(input)
    puts(4, 1, response_part1)

    response_part2 = Day04.part2(input)
    puts(4, 2, response_part2)
  end

  def solve_day05 do
    input = Input.read_to_array_of_string("input_files/day05.txt")

    response_part1 = Day05.part1(input)
    puts(5, 1, response_part1)

    response_part2 = Day05.part2(input)
    puts(5, 2, response_part2)
  end

  def solve_day06 do
    input = Input.read_to_array_of_int("input_files/day06.txt", ",")

    response_part1 = Day06.part1(input, 80)
    puts(6, 1, response_part1)

    response_part2 = Day06.part2(input, 256)
    puts(6, 2, response_part2)
  end

  def solve_day07 do
    input = Input.read_to_array_of_int("input_files/day07.txt", ",")

    response_part1 = Day07.part1(input)
    puts(7, 1, response_part1)

    response_part2 = Day07.part2(input)
    puts(7, 2, response_part2)
  end

  def solve_day08 do
    input = Input.read_to_array_of_string("input_files/day08.txt")

    response_part1 = Day08.part1(input)
    puts(8, 1, response_part1)

    # response_part2 = Day08.part2(input)
    # puts(8, 2, response_part2)
  end

  defp puts(day, part, response) do
    IO.puts("Day#{day}, part#{part}: #{response}")
  end
end
