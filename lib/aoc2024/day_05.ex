defmodule Aoc2024.Day05 do
  def parse(input) do
    [rules_raw, updates_raw] = input |> String.trim() |> String.split("\n\n")
    rules = Aoc2024.Utils.parse_rows_of_integers(rules_raw, "|")
    updates = Aoc2024.Utils.parse_rows_of_integers(updates_raw, ",")
    {rules, updates}
  end

  defp sort([], _rules), do: %{was_sorted?: true, list: []}

  defp sort([head | tail], rules) do
    result =
      tail
      |> Enum.reduce(%{sorted?: true, revlist: [], previous: head}, fn elem, acc ->
        if rules |> Enum.member?([elem, acc.previous]) do
          %{sorted?: false, revlist: [elem | acc.revlist], previous: acc.previous}
        else
          %{sorted?: acc.sorted?, revlist: [acc.previous | acc.revlist], previous: elem}
        end
      end)

    partially_sorted = [result.previous | result.revlist] |> Enum.reverse()

    if result.sorted? do
      %{was_sorted?: true, list: partially_sorted}
    else
      %{was_sorted?: false, list: sort(partially_sorted, rules).list}
    end
  end

  def part1({rules, updates}) do
    updates
    |> Enum.filter(fn update -> sort(update, rules).was_sorted? end)
    |> Enum.map(fn update -> update |> Enum.at(length(update) |> div(2)) end)
    |> Enum.sum()
  end

  def part2({rules, updates}) do
    updates
    |> Enum.map(fn update -> sort(update, rules) end)
    |> Enum.filter(fn sort_result -> not sort_result.was_sorted? end)
    |> Enum.map(fn sort_result ->
      sort_result.list |> Enum.at(length(sort_result.list) |> div(2))
    end)
    |> Enum.sum()
  end
end
