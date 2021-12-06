defmodule Aoc2021.Day01 do
  @moduledoc """
  Day 01 of advent of code
  """

  @spec part1([integer()]) :: integer()
  def part1(input) do
    {counter, _} =
      input
      |> Enum.reduce({0, nil}, &count_increase/2)

    counter
  end

  @spec part2([integer()]) :: integer()
  def part2(input) do
    {counter, _} =
      input
      |> list_of_sum()
      |> Enum.reduce({0, nil}, &count_increase/2)

    counter
  end

  @spec count_increase(integer(), {integer(), nil | integer()}) :: {integer(), integer()}
  defp count_increase(measurement, {counter, nil}), do: {counter, measurement}

  defp count_increase(measurement, {counter, previous_measurement})
       when measurement > previous_measurement,
       do: {counter + 1, measurement}

  defp count_increase(measurement, {counter, previous_measurement})
       when measurement <= previous_measurement,
       do: {counter, measurement}

  @spec list_of_sum([integer()]) :: [integer()]
  defp list_of_sum(input) do
    {lst, _, _} =
      input
      |> Enum.reduce({[], nil, nil}, &sum_of_three/2)

    lst
  end

  @spec sum_of_three(integer(), {[integer()], integer(), integer()}) ::
          {[integer()], integer(), integer()}
  defp sum_of_three(elem, {lst, nil, nil}), do: {lst, nil, elem}
  defp sum_of_three(elem, {lst, nil, op1}), do: {lst, op1, elem}
  defp sum_of_three(elem, {lst, op1, op2}), do: {lst ++ [op1 + op2 + elem], op2, elem}
end
