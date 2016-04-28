defmodule AboutNumbersAndBooleans do
  use Koans

  think "Basics numbers types" do
    assert is_integer(42)
    refute is_integer(42.0)
    assert is_float(42.0)
    refute is_float(42)
  end

  think "Is a hexadecimal number an integer?" do
    assert is_integer(0x2A)
  end

  think "Answer to the Ultimate Question of Life, the Universe, and Everything" do
    a_hex = 0x20
    a_dec = 10
    assert a_hex + a_dec == 42
  end

  think "You can use _ as separator in integer" do
    assert 100_000_000 == 100000000
  end

  think "Integers and floats have value equality" do
    assert 4 == 4.0
  end

  think "Integers and floats have value inequality" do
    assert 4 != 2.0
  end

  think "Strict equality checks types" do
    refute 4 === 4.0
    assert 4.0 === 4.0
  end

  think "Strict inequality checks types" do
    assert 4 !== 4.0
  end

  think "Are integers booleans?" do
    refute is_integer(true)
    refute is_boolean(0)
  end

  think "Boolean OR returns left side if true, otherwise right side" do
    assert true or true
    assert true or false
    assert false or true
    refute false or false
  end

  think "Boolean operators check their argument's type" do
    message = "argument error: " <> "1"
    assert_raise ArgumentError, message, fn -> 1 or true end
  end

  think "Other binary operators are relaxed about their argument's type" do
    assert 42 == 42  || 84
    assert 42 == 42  || nil
    assert 84 == nil || 84
    assert nil == nil || nil
  end
end
