defmodule Aoc2021.Day04.BingoGrid do
  @moduledoc """
  Bingo related code
  """
  alias Aoc2021.Utils.Input

  @type t() :: %__MODULE__{
          nb_row: integer(),
          nb_column: integer(),
          data: [integer()]
        }
  defstruct nb_row: 0,
            nb_column: 0,
            data: []

  @spec create(String.t()) :: t()
  def create(input) do
    rows =
      input
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(&parse_row/1)

    nb_rows = length(rows)
    nb_column = length(hd(rows))

    %__MODULE__{
      nb_row: nb_rows,
      nb_column: nb_column,
      data: Enum.concat(rows)
    }
  end

  @spec parse_row(String.t()) :: [integer()]
  defp parse_row(row) do
    row
    |> String.trim()
    |> String.replace("  ", " ")
    |> String.split(" ")
    |> Enum.map(&Input.string_to_integer!/1)
  end

  @spec parse_row(t()) :: [[integer()]]
  defp get_rows(bingo_grid) do
    Enum.chunk_every(bingo_grid.data, bingo_grid.nb_column)
  end

  @spec get_columns(t()) :: [[integer()]]
  defp get_columns(bingo_grid) do
    %{nb_row: nb_row, nb_column: nb_column, data: data} = bingo_grid

    column =
      for col <- 0..(nb_column - 1),
          row <- 0..(nb_row - 1),
          do: Enum.at(data, row * nb_column + col)

    column
    |> Enum.chunk_every(nb_row)
  end

  @spec contains([integer()], [integer()]) :: boolean()
  defp contains(lst, bingo_numbers) do
    Enum.all?(lst, fn number ->
      Enum.member?(bingo_numbers, number)
    end)
  end

  @spec wins?([integer()], t()) :: boolean()
  def wins?(bingo_numbers, bingo_grid) do
    win_row =
      bingo_grid
      |> get_rows()
      |> Enum.any?(&contains(&1, bingo_numbers))

    win_col =
      bingo_grid
      |> get_columns()
      |> Enum.any?(&contains(&1, bingo_numbers))

    win_row || win_col
  end

  @spec get_unmarked_numbers([integer()], t()) :: [integer()]
  def get_unmarked_numbers(bingo_numbers, bingo_grid) do
    Enum.reject(bingo_grid.data, &Enum.member?(bingo_numbers, &1))
  end

  @spec winning_grids?([integer()], [t()]) :: :no | {:yes, t()}
  def winning_grids?(bingo_numbers, bingo_grids) do
    bingo_grids
    |> Enum.reduce_while(nil, fn bingo_grid, _ ->
      if wins?(bingo_numbers, bingo_grid) do
        {:halt, bingo_grid}
      else
        {:cont, nil}
      end
    end)
    |> case do
      nil -> :no
      grid -> {:yes, grid}
    end
  end
end
