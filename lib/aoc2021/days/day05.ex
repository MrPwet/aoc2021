defmodule Aoc2021.Day05 do
  @moduledoc """
  Day 05 of advent of code
  """
  alias Aoc2021.Day05.HydrothermalVents

  def part1(input) do
    vents =
      input
      |> Enum.map(&HydrothermalVents.create/1)
      |> Enum.reject(&HydrothermalVents.diagonal?/1)

    sea_map =
      vents
      |> Enum.reduce(%{}, fn (vent, sea_map) ->
        vent
        |> HydrothermalVents.get_all_points()
        |> Enum.reduce(sea_map, fn (point, sea_map) ->
          sea_map
          |> Map.update(point, 1, &(&1 + 1))
        end)
      end)

    sea_map
    |> Map.values()
    |> Enum.filter(&(&1 >= 2))
    |> length()
  end

  def part2(input) do

  end
end
