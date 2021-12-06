defmodule Aoc2021.Day04 do
  @moduledoc """
  Day 04 of advent of code
  """

  alias Aoc2021.Utils.Input
  alias Aoc2021.Day04.BingoGrid

  def part1(input) do
    {bingo_numbers, bingo_grids} = create_data_from_input(input)

    {bingo_numbers, _grids, winning_grid} =
      bingo_numbers
      |> Enum.reduce_while({[], bingo_grids, nil}, fn (number, {numbers, grids, _winning_grid}) ->
        numbers = numbers ++ [number]

        case BingoGrid.winning_grids?(numbers, grids) do
          :no -> {:cont, {numbers, grids, nil}}
          {:yes, grid} -> {:halt, {numbers, nil, grid}}
        end
    end)

    BingoGrid.get_unmarked_numbers(bingo_numbers, winning_grid)
    |> Enum.sum()
    |> (&(&1 * List.last(bingo_numbers))).()
  end

  def part2(input) do
    {bingo_numbers, bingo_grids} = create_data_from_input(input)

    {bingo_numbers, _grids, last_winning_grid} =
      bingo_numbers
      |> Enum.reduce_while({[], bingo_grids, nil}, fn (number, {numbers, grids, _winning_grid}) ->
        numbers = numbers ++ [number]

        with 1 <- length(grids),
             [grid] <- grids,
             true <- BingoGrid.wins?(numbers, grid) do
              {:halt, {numbers, nil, grid}}
        else
          _ ->
            grids =
              grids
              |> Enum.reject(&(BingoGrid.wins?(numbers, &1)))
            {:cont, {numbers, grids, nil}}
        end
      end)

    BingoGrid.get_unmarked_numbers(bingo_numbers, last_winning_grid)
    |> Enum.sum()
    |> (&(&1 * List.last(bingo_numbers))).()
  end

  @spec create_data_from_input([String.t()]) :: {[integer()], [BingoGrid.t()]}
  defp create_data_from_input(input) do
    [bingo_numbers | bingo_grids] = input

    bingo_numbers =
      bingo_numbers
      |> String.split(",")
      |> Enum.map(&Input.string_to_integer!/1)

    bingo_grids =
      bingo_grids
      |> Enum.map(&BingoGrid.create/1)

    {bingo_numbers, bingo_grids}
  end
end
