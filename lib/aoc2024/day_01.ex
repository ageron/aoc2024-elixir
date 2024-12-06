defmodule Aoc2024.Day01 do
  def parse(input) do
    Aoc2024.Utils.parse_rows_of_integers(input)
    |> Enum.map(&List.to_tuple/1)
    |> Enum.unzip()
  end

  def part1({col0, col1}) do
    sorted_col0 = col0 |> Enum.sort()
    sorted_col1 = col1 |> Enum.sort()

    Enum.zip(sorted_col0, sorted_col1)
    |> Enum.map(fn {val0, val1} ->
      abs(val0 - val1)
    end)
    |> Enum.sum()
  end

  def part2({col0, col1}) do
    col0
    |> Enum.map(fn val0 ->
      count = Enum.count(col1, fn val1 -> val0 == val1 end)
      count * val0
    end)
    |> Enum.sum()
  end
end
