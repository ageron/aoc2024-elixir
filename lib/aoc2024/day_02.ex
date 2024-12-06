defmodule Aoc2024.Day02 do
  def parse(input) do
    Aoc2024.Utils.parse_rows_of_integers(input)
  end

  def part1(reports) do
    reports |> Enum.count(&isValid/1)
  end

  defp isValid(report) do
    diffs =
      report
      |> Enum.zip(tl(report))
      |> Enum.map(fn {a, b} -> b - a end)

    diffs |> Enum.all?(fn diff -> diff in [1, 2, 3] end) ||
      diffs |> Enum.all?(fn diff -> diff in [-1, -2, -3] end)
  end

  def part2(reports) do
    reports |> Enum.count(&isValidWithProblemDampener/1)
  end

  defp isValidWithProblemDampener(report) do
    isValid(report) ||
      report
      |> Enum.with_index()
      |> Enum.any?(fn {_elem, index} ->
        isValid(report |> List.delete_at(index))
      end)
  end
end
