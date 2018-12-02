defmodule Day02Test do
  use ExUnit.Case
  doctest Day02

  test "abcdef" do
    assert Day02.process_line('abcdef') == {false, false}
  end

  test "bababc" do
    assert Day02.process_line('bababc') == {true, true}
  end

  test "abbcde" do
    assert Day02.process_line('abbcde') == {true, false}
  end

  test "abcccd" do
    assert Day02.process_line('abcccd') == {false, true}
  end

  test "aabcdd" do
    assert Day02.process_line('aabcdd') == {true, false}
  end

  test "abcdee" do
    assert Day02.process_line('abcdee') == {true, false}
  end

  test "ababab" do
    assert Day02.process_line('ababab') == {false, true}
  end

  test 'part1' do
    p = Day02.part1(
      ~w(
        abcdef
        bababc
        abbcde
        abcccd
        aabcdd
        abcdee
        ababab
      )c
    )
    assert p == 12
  end

  test 'solution I got from doing it in Ruby' do
    assert Day02.part1 == 5727
  end
end

