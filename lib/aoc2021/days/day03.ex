defmodule Aoc2021.Day03 do
  @moduledoc """
  Day 03 of advent of code
  """
  @type count_map :: %{integer() => {integer(), integer()}}

  def part1(input) do
    gamma_rate =
      input
      |> count_most_common_bit()
      |> generate_gamma_rate()

    epsilon_rate = generate_epsilon_rate(gamma_rate)

    compute_power_consumption(gamma_rate, epsilon_rate)
  end

  def part2(input) do
    input
  end

  @spec init_count_map(integer()) :: count_map()
  defp init_count_map(size), do: for position <- 0..(size - 1), into: %{}, do: {position, {0, 0}}

  @spec count_most_common_bit([String.t()]) :: any()
  defp count_most_common_bit(input) do
    size = String.length(hd(input))
    count_map = init_count_map(size)
    input
    |> Enum.reduce(count_map, &count_bit_number/2)
  end

  @spec count_bit_number(String.t(), count_map()) :: count_map()
  defp count_bit_number(number, acc) do
    number
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.reduce(acc, &increase_count/2)
  end

  @spec increase_count({String.t(), integer()}, count_map()) :: count_map()
  defp increase_count({"0", position}, acc) do
    %{^position => {nb_0, nb_1}} = acc
    %{acc | position => {nb_0 + 1, nb_1}}
  end

  defp increase_count({"1", position}, acc) do
    %{^position => {nb_0, nb_1}} = acc
    %{acc | position => {nb_0, nb_1 + 1}}
  end

  @spec generate_gamma_rate(count_map()) :: String.t()
  defp generate_gamma_rate(count_map) do
    size = length(Map.keys(count_map))
    0..(size - 1)
    |> Enum.map_join(fn (position) ->
      %{^position => {x0, x1}} = count_map
      if x0 > x1, do: "0", else: "1"
    end)
  end

  @spec generate_epsilon_rate(String.t()) :: String.t()
  defp generate_epsilon_rate(gamma_rate) do
    gamma_rate
    |> String.graphemes()
    |> Enum.map_join(&(if &1 == "0", do: "1", else: "0"))
  end

  @spec compute_power_consumption(String.t(), String.t()) :: integer()
  defp compute_power_consumption(gamma_rate, epsilon_rate) do
    {gamma_rate, _} = Integer.parse(gamma_rate, 2)
    {epsilon_rate, _} = Integer.parse(epsilon_rate, 2)
    gamma_rate * epsilon_rate
  end
end
