defmodule Aoc2024.Utils do
  def parse_rows_of_integers(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      line
      |> String.split(~r/\s+/)
      |> Enum.map(fn int_str ->
        case int_str |> Integer.parse() do
          {int, ""} -> int
          _ -> raise "Invalid integer #{int_str}"
        end
      end)
    end)
  end
end
