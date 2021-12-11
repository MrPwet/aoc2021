defmodule Aoc2021.Day07 do
  @moduledoc """
  Day 07 of advent of code
  """

  @spec part1([integer()]) :: integer()
  def part1(input) do
    median =
      input
      |> Enum.sort()
      |> Enum.at(div(length(input), 2))

    input
    |> Enum.reduce(0, fn crab_pos, oil ->
      oil + abs(crab_pos - median)
    end)
  end

  @spec part2([integer()]) :: integer()
  def part2(input) do
    avg = average(input)

    (avg - 1)..(avg + 1)
    |> Enum.map(fn avg ->
      input
      |> Enum.reduce(0, fn crab_pos, oil ->
        oil + compute_fuel(crab_pos, avg)
      end)
    end)
    |> Enum.min()
  end

  @spec average([integer()]) :: integer()
  def average(input) do
    size = length(input)

    input
    |> Enum.sum()
    |> (&(&1 / size)).()
    |> round()
  end

  def compute_fuel(pos1, pos1), do: 0
  def compute_fuel(pos1, pos2), do: 1..abs(pos1 - pos2) |> Enum.sum()
end
