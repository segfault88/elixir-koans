defmodule AboutMatching do
  use Koans

  think "The match operator (=) binds values on the right to variables on the left" do
    a_variable = 1
    assert a_variable == 1
  end

  think "It matches patterns in data structures" do
    [a, b] = [1, 2]
    [c, d, e] = [4, 5, 6]

    assert a == 1
    assert b == 2
    assert c == 4
    assert d == 5
    assert e == 6
  end

  think "You can ignore values in the match" do
    [a, _] = ["Keep me", "Drop me"]

    assert a  == "Keep me"
  end

  think "The sides must match" do
    [a, a] = [1, 1]

    assert a == 1
  end

  think "It raises an error when the match fails" do
    assert_raise MatchError, fn -> [a , a] = [1 , 2] end
  end

  think "Matched values overwrite variable values" do
    a = 1
    assert a == 1

    [a, _] = [2, 3]
    assert a == 2
  end

  think "Values can be pinned to prevent them from being overwritten" do
    a = 1
    assert_raise MatchError, fn -> ^a = 2 end
    assert_raise MatchError, fn -> [^a, _] = [2, 3] end
    # Note: This is a way of asserting what the right-hand side of the match
    # meets your expectation. Similar to the literal: {:ok, result} = some_func
  end

  think "Matching a list inside a list" do
    [a] = [["Hello", "World!"]]

    assert a  == ["Hello", "World!"]
  end

  think "Matching a tuple" do
    {:ok, result} = {:ok, 12}
    assert result == 12
  end

  think "Matching the head and tail of a list" do
    [head|tail] = [1, 2, 3]
    assert head == 1
    assert tail == [2, 3]
  end
end
