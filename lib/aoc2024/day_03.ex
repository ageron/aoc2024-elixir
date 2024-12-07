defmodule Aoc2024.Day03 do
  def part1(instructions) do
    ~r/mul\(([0-9]+),([0-9]+)\)/
    |> Regex.scan(instructions)
    |> Enum.map(fn [_all, num1_str, num2_str] ->
      case {Integer.parse(num1_str), Integer.parse(num2_str)} do
        {{num1, ""}, {num2, ""}} -> num1 * num2
        _ -> 0
      end
    end)
    |> Enum.sum()
  end

  def part2(instructions) do
    conditional_instructions =
      ~r/don't\(\).*?do\(\)/s
      |> Regex.replace(instructions, "|")

    # handle possible case where the instructions end with don't() and more mul
    conditional_instructions2 =
      ~r/don't\(\).*$/s
      |> Regex.replace(conditional_instructions, "|")

    part1(conditional_instructions2)
  end
end
