defmodule Aoc2021.Utils.Input do
  @spec read_to_array_of_int(String.t()) :: [integer()]
  def read_to_array_of_int(path) do
    path
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&string_to_integer!/1)
  end

  @spec string_to_integer!(String.t()) :: integer()
  def string_to_integer!(str) do
    {nb, _} = Integer.parse(str)
    nb
  end
end
