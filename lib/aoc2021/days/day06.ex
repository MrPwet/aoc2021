defmodule Aoc2021.Day06 do
  @moduledoc """
  Day 06 of advent of code
  """

  @type timers :: %{integer() => integer()}

  @spec part1([integer()], integer()) :: integer()
  def part1(input, nb_days) do
    input
    |> init_groups()
    |> spend_days(nb_days)
    |> Map.values()
    |> Enum.sum()
  end

  @spec part2([integer()], integer()) :: integer()
  def part2(input, nb_days) do
    part1(input, nb_days)
  end

  @spec spend_days(timers(), integer()) :: timers()
  defp spend_days(timers, day) do
    0..(day - 1)
    |> Enum.reduce(timers, &spend_day/2)
  end

  @spec spend_day(integer(), timers()) :: timers()
  defp spend_day(_day, timers) do
    %{0 => nb_0_timers} = timers

    new_timers = for x <- 1..8, into: %{}, do: {x - 1, Map.get(timers, x, 0)}

    new_timers
    |> Map.update(6, nb_0_timers, &(&1 + nb_0_timers))
    |> Map.update(8, nb_0_timers, &(&1 + nb_0_timers))
  end

  @spec init_groups([integer()]) :: timers()
  defp init_groups(timers) do
    groups = for i <- 0..8, into: %{}, do: {i, 0}

    timers
    |> Enum.reduce(groups, fn timer, groups ->
      Map.update!(groups, timer, &(&1 + 1))
    end)
  end
end
