defmodule Mix.Tasks.Aoc2024.Run do
  use Mix.Task

  @shortdoc "Run all the solutions, or just the ones for the given days"
  def run(args) do
    days =
      if args |> Enum.empty?() do
        1..25 |> Enum.map(&Integer.to_string/1)
      else
        args
      end

    days |> Enum.each(&run_day/1)
  end

  defp check_and_pad_day(day_str) do
    case day_str |> Integer.parse() do
      {day, ""} when day >= 1 and day <= 25 ->
        IO.puts("---- Day #{day}")
        {:ok, day |> Integer.to_string() |> String.pad_leading(2, "0")}

      _ ->
        {:error, "Invalid day `#{day_str}`"}
    end
  end

  defp load_module(padded_day_str) do
    module = Module.concat([Aoc2024, "Day#{padded_day_str}"])

    if match?({:module, _}, Code.ensure_loaded(module)) do
      {:ok, module}
    else
      {:error, "Module `#{inspect(module)}` is not defined."}
    end
  end

  defp load_input(padded_day_str) do
    file_path = "data/day_#{padded_day_str}.txt"

    case File.read(file_path) do
      {:ok, content} ->
        {:ok, content}

      {:error, reason} ->
        {:error, "Failed to read #{file_path}: #{reason}"}
    end
  end

  defp parse_input(module, input) do
    if function_exported?(module, :parse, 1) do
      {:ok, module.parse(input)}
    else
      {:ok, input}
    end
  end

  defp run_part1(module, parsed) do
    if function_exported?(module, :part1, 1) do
      result1 = module.part1(parsed)
      IO.inspect(result1)
      {:ok, true}
    else
      {:error, "Function `#{inspect(module)}.part1/1` is not defined."}
    end
  end

  defp run_part2(module, parsed) do
    if function_exported?(module, :part2, 1) do
      result2 = module.part2(parsed)
      IO.inspect(result2)
      {:ok, true}
    else
      {:error, "Function `#{inspect(module)}.part2/1` is not defined."}
    end
  end

  defp run_day(day_str) do
    with {:ok, padded_day_str} <- check_and_pad_day(day_str),
         {:ok, module} <- load_module(padded_day_str),
         {:ok, input} <- load_input(padded_day_str),
         {:ok, parsed_input} <- parse_input(module, input),
         {:ok, _success} <- run_part1(module, parsed_input),
         {:ok, _success} <- run_part2(module, parsed_input) do
    else
      {:error, msg} ->
        IO.puts("Error: #{msg}")
    end
  end
end
