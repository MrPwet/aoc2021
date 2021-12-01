defmodule Aoc2021 do
  alias Aoc2021.Utils.Input
  alias Aoc2021.Day01

  def solve_puzzles do
    solve_day01()
  end

  def solve_day01 do
    input = Input.read_to_array_of_int("input_files/day01.txt")
    response = Day01.part1(input)
    puts(1, 1, response)
  end

  def puts(day, part, response) do
    IO.puts("Day#{day}, part#{part}: #{response}")
  end
end
