defmodule Day02 do
  @moduledoc """
  --- Day 2: Inventory Management System ---
  You stop falling through time, catch your breath, and check the screen on the device. "Destination reached. Current Year: 1518. Current Location: North Pole Utility Closet 83N10." You made it! Now, to find those anomalies.

  Outside the utility closet, you hear footsteps and a voice. "...I'm not sure either. But now that so many people have chimneys, maybe he could sneak in that way?" Another voice responds, "Actually, we've been working on a new kind of suit that would let him fit through tight spaces like that. But, I heard that a few days ago, they lost the prototype fabric, the design plans, everything! Nobody on the team can even seem to remember important details of the project!"

  "Wouldn't they have had enough fabric to fill several boxes in the warehouse? They'd be stored together, so the box IDs should be similar. Too bad it would take forever to search the warehouse for two similar box IDs..." They walk too far away to hear any more.

  Late at night, you sneak to the warehouse - who knows what kinds of paradoxes you could cause if you were discovered - and use your fancy wrist device to quickly scan every box and produce a list of the likely candidates (your puzzle input).

  To make sure you didn't miss any, you scan the likely candidate boxes again, counting the number that have an ID containing exactly two of any letter and then separately counting those with exactly three of any letter. You can multiply those two counts together to get a rudimentary checksum and compare it to what your device predicts.

  For example, if you see the following box IDs:

  abcdef contains no letters that appear exactly two or three times.
  bababc contains two a and three b, so it counts for both.
  abbcde contains two b, but no letter appears exactly three times.
  abcccd contains three c, but no letter appears exactly two times.
  aabcdd contains two a and two d, but it only counts once.
  abcdee contains two e.
  ababab contains three a and three b, but it only counts once.
  Of these box IDs, four of them contain a letter which appears exactly twice, and three of them contain a letter which appears exactly three times. Multiplying these together produces a checksum of 4 * 3 = 12.

  What is the checksum for your list of box IDs?
  """

  @doc """
  input.txt contents mapped to one charlist per line
  """
  def input() do
    "input.txt"
    |> File.read!()
    |> String.split()
    |> Enum.map(&String.to_charlist/1)
  end

  @doc """
  What is the checksum for your list of box IDs?
  """
  def part1() do
    input() |> part1()
  end

  def part1(list), do: part1(list, 0, 0)

  defp part1([], twos, threes) do
    twos * threes
  end

  defp part1([head | tail], twos, threes) do
    {two, three} = process_line(head)
    part1(tail, two, three, twos, threes)
  end

  defp part1(tail, false, false, twos, threes), do: part1(tail, twos+0, threes+0)
  defp part1(tail, false, true, twos, threes), do: part1(tail, twos+0, threes+1)
  defp part1(tail, true, false, twos, threes), do: part1(tail, twos+1, threes+0)
  defp part1(tail, true, true, twos, threes), do: part1(tail, twos+1, threes+1)

  @doc """
  determines if the line has two or three occurances of a single character.
  Returns {twos, threes} both booleans.
  """
  def process_line(line) do
    {twos, threes, _} =
      Enum.reduce(line, {MapSet.new, MapSet.new, %{}}, fn c, {twos, threes, char_counts} ->
        update_counts(twos, threes, char_counts, c, Map.get(char_counts, c))
      end)

    {MapSet.size(twos) > 0, MapSet.size(threes) > 0}
  end

  # first time seeing c
  defp update_counts(twos, threes, char_counts, c, nil) do
    {twos, threes, Map.put(char_counts, c, 1)}
  end

  # second time seeing c
  defp update_counts(twos, threes, char_counts, c, 1) do
    {MapSet.put(twos, c), threes, Map.put(char_counts, c, 2)}
  end

  # third time seeing c
  defp update_counts(twos, threes, char_counts, c, 2) do
    {MapSet.delete(twos, c), MapSet.put(threes, c), Map.put(char_counts, c, 3)}
  end

  # fourth or subsequent time seeing c
  defp update_counts(twos, threes, char_counts, c, v) do
    {twos, MapSet.delete(threes, c), Map.put(char_counts, c, v+1)}
  end
end
