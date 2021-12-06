defmodule Aoc2021.Utils.Input do
  @moduledoc """
  Some helpers to read problem inputs
  """
  @spec read_to_array_of_int(String.t()) :: [integer()]
  def read_to_array_of_int(path) do
    path
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&string_to_integer!/1)
  end

  @spec read_to_array_of_string(String.t(), String.t()) :: [String.t()]
  def read_to_array_of_string(path, separator \\ "\n") do
    path
    |> File.read!()
    |> String.trim()
    |> String.split(separator)
  end

  @spec string_to_integer!(String.t()) :: integer()
  def string_to_integer!(str) do
    {nb, _} = Integer.parse(str)
    nb
  end
end
