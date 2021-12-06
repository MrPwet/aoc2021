defmodule Aoc2021.Day05.HydrothermalVents do
  @moduledoc """
  Hydrothermal vents related code
  """
  alias Aoc2021.Utils.{Vector2d, Input}

  @pattern ~r/(?<x1>\d+),(?<y1>\d+) -> (?<x2>\d+),(?<y2>\d+)/

  @type t() :: %__MODULE__{
    from: Vector2d.t(),
    to: Vector2d.t()
  }
  defstruct from: nil,
            to: nil

  @spec create(String.t()) :: t()
  def create(coords_str) do
    %{
      "x1" => x1,
      "y1" => y1,
      "x2" => x2,
      "y2" => y2
    } =
      Regex.named_captures(@pattern, coords_str)
      |> Enum.reduce(%{}, fn ({key, value}, acc) ->
        Map.put(acc, key, Input.string_to_integer!(value))
      end)

    %__MODULE__{
      from: %Vector2d{x: x1, y: y1},
      to: %Vector2d{x: x2, y: y2}
    }
  end

  @spec get_all_points(t()) :: [Vector2d.t()]
  def get_all_points(hydrothermal_vents) do
    %{from: v1, to: v2} = hydrothermal_vents

    cond do
      v1.x - v2.x == 0 ->
        Enum.map((v1.y)..(v2.y), &(%Vector2d{x: v1.x, y: &1}))
      v1.y - v2.y == 0 ->
        Enum.map((v1.x)..(v2.x), &(%Vector2d{x: &1, y: v1.y}))
      true ->
        (v1.x)..(v2.x)
        |> Enum.zip((v1.y)..(v2.y))
        |> Enum.map(fn {x, y} -> %Vector2d{x: x, y: y} end)
    end
  end

  @spec diagonal?(t()) :: boolean()
  def diagonal?(hydrothermal_vent) do
    %__MODULE__{
      from: %Vector2d{x: x1, y: y1},
      to: %Vector2d{x: x2, y: y2}
    } = hydrothermal_vent

    x1 != x2 && y1 != y2
  end
end
