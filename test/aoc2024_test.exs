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

  test "Day 3 - part 1" do
    input = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
    assert Aoc2024.Day03.part1(input) == 161
  end

  test "Day 3 - part 2" do
    input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
    assert Aoc2024.Day03.part2(input) == 48
  end

  test "Day 3 - part 2 – end with don't" do
    input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)un?mul(8,5))"
    assert Aoc2024.Day03.part2(input) == 8
  end

  test "Day 3 - part 2 – support newlines within don't()...do() blocks" do
    input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)\n+mul(32,64](mul(11,8)undo()?mul(8,5))"
    assert Aoc2024.Day03.part2(input) == 48
  end

  test "Day 4" do
    input = """
    MMMSXXMASM
    MSAMXMSMSA
    AMXSXMAAMM
    MSAMASMSMX
    XMASAMXAMM
    XXAMMXXAMA
    SMSMSASXSS
    SAXAMASAAA
    MAMMMXMMMM
    MXMXAXMASX
    """

    parsed_input = Aoc2024.Day04.parse(input)
    assert Aoc2024.Day04.part1(parsed_input) == 18
    assert Aoc2024.Day04.part2(parsed_input) == 9
  end
end
