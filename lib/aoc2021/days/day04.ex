defmodule Aoc2021.Day04 do
  alias Aoc2021.Utils.Input
  alias Aoc2021.Day04.BingoGrid


  def part1(input) do
    {bingo_numbers, bingo_grids} = create_data_from_input(input)


    {bingo_numbers, _grids, winning_grid} =
      bingo_numbers
      |> Enum.reduce_while({[], bingo_grids, nil}, fn (number, {numbers, grids, _winning_grid}=acc) ->
        IO.inspect(acc, label: "acc")
        numbers = numbers ++ [number]
        IO.inspect(numbers, label: "numbers", charlists: :as_lists)

        case BingoGrid.winning_grids?(numbers, grids) |> IO.inspect(label: "winning?") do
          :no -> {:cont, {numbers, grids, nil}}
          {:yes, grid} -> {:halt, {numbers, nil, grid}}
        end
    end)

    BingoGrid.get_unmarked_numbers(bingo_numbers, winning_grid)
    |> Enum.sum()
    |> (&(&1 * List.last(bingo_numbers))).()
  end

  def part2 do

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
      |> IO.inspect(label: "Bingo grids")

    {bingo_numbers, bingo_grids}
  end
end
