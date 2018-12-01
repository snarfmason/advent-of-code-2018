defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  test "compute_frequency example 1" do
    list = [1, -2, 3, 1]
    assert Day01.compute_frequency(0, list) == 3
  end

  test "compute_frequency example 2" do
    list = [1, 1, 1]
    assert Day01.compute_frequency(0, list) == 3
  end

  test "compute_frequency example 3" do
    list = [1, 1, -2]
    assert Day01.compute_frequency(0, list) == 0
  end

  test "compute_frequency example 4" do
    list = [-1, -2, -3]
    assert Day01.compute_frequency(0, list) == -6
  end

  test "duplicate_frequncy exmaple 2" do
    list = [3, 3, 4, -2, -4]
    assert Day01.duplicate_frequncy(list) == 10 
  end

  test "duplicate_frequncy exmaple 3" do
    list = [-6, 3, 8, 5, -6]
    assert Day01.duplicate_frequncy(list) == 5 
  end

  test "duplicate_frequncy exmaple 4" do
    list = [7, 7, -2, -7, -4]
    assert Day01.duplicate_frequncy(list) == 14 
  end

end
