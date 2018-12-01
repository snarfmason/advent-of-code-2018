defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  test "example 1" do
    list = [1, -2, 3, 1]
    assert Day01.compute_frequency(0, list) == 3
  end

  test "example 2" do
    list = [1, 1, 1]
    assert Day01.compute_frequency(0, list) == 3
  end

  test "example 3" do
    list = [1, 1, -2]
    assert Day01.compute_frequency(0, list) == 0
  end

  test "example 4" do
    list = [-1, -2, -3]
    assert Day01.compute_frequency(0, list) == -6
  end
end
