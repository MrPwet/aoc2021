defmodule Aoc2021.Utils.Vector2d do
  @moduledoc """
  Basic 2d vector
  """

  @type t() :: %__MODULE__{
          x: integer(),
          y: integer()
        }
  defstruct x: 0,
            y: 0
end
