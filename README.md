# Advent of Code 2024 in Elixir

If you've never heard of Advent of Code, you're missing out. Check it out now at [adventofcode.com](https://adventofcode.com/about)!

I mostly do AoC puzzles for fun, generally coding in Python or Rust, but I've also found that it's a great way to get some experience with other programming languages, such as Elixir, Haskell, or Julia.

This repository contains all my solutions to the [AoC 2024](https://adventofcode.com/2024) puzzles using Elixir.

As I'm still learning Elixir, the code may not always be as simple or idiomatic as it could be. If you have suggestions for things I could improve, please don't hesitate to file an issue or submit a PR. Thanks!

## Usage

Make sure you have Elixir and Git installed, then open a terminal and run:

```shell
git clone https://github.com/ageron/aoc2024-elixir
cd aoc2024-elixir
mix aoc2024.run
```

You can specify days to run if you want, for example this will run days 2, 4, and 6:

```
mix aoc2024.run 2 4 6
```

## Getting the data

I've also included a little `get_data.py` utility to automatically download the data of the day, at the right time (you'll get a countdown if you're early). I was too lazy to code it in Elixir, but perhaps I'll port it one day. To use it, just type the following command in a terminal, replacing `{day}` with the day you want:

```
cd /path/to/this/repository
python get_data.py 2024 {day}
```

The script requires the `requests` and `pytz` libraries, which you can install like this:

```
python -m pip install --user requests pytz
```

The first time you run `get_data.py`, you will be asked to login to AoC in your browser, [find your session cookie](https://github.com/wimglenn/advent-of-code-wim/issues/1), and save it into a `.session` file in the current directory.

Have fun!
