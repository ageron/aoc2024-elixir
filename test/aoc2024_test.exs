defmodule Aoc2024Test do
  use ExUnit.Case
  # doctest Aoc2024

  test "Day 1" do
    parsed_input =
      Aoc2024.Day01.parse("""
      3   4
      4   3
      2   5
      1   3
      3   9
      3   3
      """)

    assert Aoc2024.Day01.part1(parsed_input) == 11
    assert Aoc2024.Day01.part2(parsed_input) == 31
  end

  test "Day 2" do
    parsed_input =
      Aoc2024.Day02.parse("""
      7 6 4 2 1
      1 2 7 8 9
      9 7 6 2 1
      1 3 2 4 5
      8 6 4 4 1
      1 3 6 7 9
      """)

    assert Aoc2024.Day02.part1(parsed_input) == 2
    assert Aoc2024.Day02.part2(parsed_input) == 4
  end
end
