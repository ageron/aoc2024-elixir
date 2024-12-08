defmodule Aoc2024.Utils do
  def parse_integers(input, separator \\ ~r/\s+/) do
    input
    |> String.split(separator)
    |> Enum.map(fn int_str ->
      case int_str |> Integer.parse() do
        {int, ""} -> int
        _ -> raise "Invalid integer #{int_str}"
      end
    end)
  end

  def parse_rows_of_integers(input, separator \\ ~r/\s+/) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      parse_integers(line, separator)
    end)
  end
end
