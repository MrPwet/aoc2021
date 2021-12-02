defmodule Aoc2021.Day02 do
  @moduledoc """
  Day 02 of advent of code
  """
  alias Aoc2021.Utils.Input

  @type direction :: :forward | :down | :up
  @type position :: {integer(), integer()}
  @type instruction :: {direction(), integer()}

  @spec part1([String.t()]) :: integer()
  def part1(input) do
    input
    |> parse_instruction()
    |> compute_position()
    |> multiply_position()
  end

  @spec parse_instruction([String.t()]) :: [instruction()]
  defp parse_instruction(lst) do
    Enum.map(lst, fn str ->
      [direction, str_value] = String.split(str, " ")
      value = Input.string_to_integer!(str_value)
      {String.to_atom(direction), value}
    end)
  end

  @spec multiply_position(position()) :: integer()
  def multiply_position({horizontal, depth}), do: horizontal * depth

  @spec compute_position([instruction()]) :: position()
  defp compute_position(instructions) do
    Enum.reduce(instructions, {0, 0}, fn (instruction, position) ->
      next_position(position, instruction)
    end)
  end

  @spec next_position(position(), instruction()) :: position()
  defp next_position({horizontal, depth}, {:forward, value}), do: {horizontal + value, depth}
  defp next_position({horizontal, depth}, {:down, value}), do: {horizontal, depth + value}
  defp next_position({horizontal, depth}, {:up, value}), do: {horizontal, depth - value}

end
