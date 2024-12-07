defmodule Aoc2024.Day04 do
  def parse(input) do
    input |> String.split("\n", trim: true) |> Enum.map(&String.graphemes/1)
  end

  defp size(grid) do
    height = length(grid)
    width = grid |> Enum.map(&length/1) |> Enum.max()
    {height, width}
  end

  def part1(grid) do
    word_chars = "XMAS" |> String.graphemes()
    {height, width} = grid |> size()

    -1..1
    |> Enum.map(fn dy ->
      -1..1
      |> Enum.map(fn dx ->
        if dx == 0 && dy == 0 do
          0
        else
          0..(height - 1)
          |> Enum.map(fn y ->
            0..(width - 1)
            |> Enum.map(fn x ->
              all_chars_ok =
                word_chars
                |> Enum.with_index()
                |> Enum.all?(fn {char, index} ->
                  cy = y + index * dy
                  cx = x + index * dx

                  cond do
                    cy < 0 ->
                      false

                    cx < 0 ->
                      false

                    cy >= height ->
                      false

                    true ->
                      row = grid |> Enum.at(cy)

                      if cx >= length(row) do
                        false
                      else
                        row |> Enum.at(cx) == char
                      end
                  end
                end)

              if all_chars_ok do
                1
              else
                0
              end
            end)
            |> Enum.sum()
          end)
          |> Enum.sum()
        end
      end)
      |> Enum.sum()
    end)
    |> Enum.sum()
  end

  def part2(grid) do
    {height, width} = grid |> size()

    0..(height - 3)
    |> Enum.map(fn y ->
      0..(width - 3)
      |> Enum.map(fn x ->
        center = grid |> Enum.at(y + 1) |> Enum.at(x + 1)
        upper_left = grid |> Enum.at(y) |> Enum.at(x)
        lower_right = grid |> Enum.at(y + 2) |> Enum.at(x + 2)
        upper_right = grid |> Enum.at(y) |> Enum.at(x + 2)
        lower_left = grid |> Enum.at(y + 2) |> Enum.at(x)

        diag1? =
          (upper_left == "M" && lower_right == "S") ||
            (upper_left == "S" && lower_right == "M")

        diag2? =
          (upper_right == "M" && lower_left == "S") ||
            (upper_right == "S" && lower_left == "M")

        if center == "A" && diag1? && diag2? do
          1
        else
          0
        end
      end)
      |> Enum.sum()
    end)
    |> Enum.sum()
  end
end
