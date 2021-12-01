defmodule Aoc2021.Day01 do

  @spec part1([integer()]) :: integer()
  def part1(input) do
    {counter, _} =
      input
      |> Enum.reduce({0, nil}, &count_increase/2)
    counter
  end

  defp count_increase(measurement, {counter, nil}), do: {counter, measurement}

  defp count_increase(measurement, {counter, previous_measurement})
    when measurement > previous_measurement, do: {counter + 1, measurement}

  defp count_increase(measurement, {counter, previous_measurement})
    when measurement <= previous_measurement, do: {counter, measurement}
end
