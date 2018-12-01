defmodule Day01 do
  @moduledoc """
  Documentation for Day01.
  """

  @doc """
  computes a frequncy from an initial and a list of changes.

  ## Examples

      iex> Day01.compute_frequency(1, [])
      1
      iex> Day01.compute_frequency(1, [2])
      3
      iex> Day01.compute_frequency(1, [2, -1])
      2

  """
  def compute_frequency(initial, []), do: initial
  def compute_frequency(initial, [next | rest]) do
    compute_frequency(initial + next, rest)
  end

  def run do
    list = String.split(File.read!("input.txt"))
    compute_frequency(0, Enum.map(list, &String.to_integer/1))
  end
end
