defmodule Aoc2021.Day08 do
  @moduledoc """
  Day 08 of advent of code
  """

  @spec part1([String.t()]) :: integer()
  def part1(input) do
    input
    |> Enum.map(&parse_input/1)
    |> Enum.map(&count_easy_digit_output/1)
    |> Enum.sum()
  end

  def part2 do
  end

  @spec parse_input(String.t()) :: {[String.t()], [String.t()]}
  def parse_input(input) do
    [entry, output] =
      input
      |> String.split("|")
      |> Enum.map(&String.trim/1)
      |> Enum.map(&String.split(&1, " "))

    {entry, output}
  end

  @spec count_easy_digit_output({[String.t()], [String.t()]}) :: integer()
  def count_easy_digit_output({_, output}) do
    nb_segments = [2, 4, 3, 7]

    output
    |> Enum.reduce(0, fn elem, acc ->
      if Enum.member?(nb_segments, String.length(elem)), do: acc + 1, else: acc
    end)
  end
end
