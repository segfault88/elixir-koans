defmodule AboutTuples do
  use Koans

  think "Getting tuples size is a kernel feature" do
    a_tuple = {:foo, :bar}
    assert tuple_size(a_tuple) == 2
  end

  think "Can reach tuple element with index" do
    a_tuple = {:foo, :bar}
    assert elem(a_tuple, 0) == :foo
  end

  think "In erlang tuples and lists start at index 1, which is different in Elixir" do
    a_tuple = {:foo, :bar}
    assert elem(a_tuple, 0) == :erlang.element(1, a_tuple)
  end

  think "Can set a tuple element" do
    a_tuple = {:foo, :bar}
    baz_tuple = put_elem(a_tuple, 0, :baz)
    # Note: think about immutability
    assert elem(a_tuple, 0) == :foo
    assert elem(baz_tuple, 0) == :baz
  end

  think "Setting a tuple element that does not exist raises an argument error" do
    a_tuple = {:foo, :bar}

    assert_raise ArgumentError, fn -> put_elem(a_tuple, 5, :baz) end
  end

  think "Insert an element at a position" do
    a_tuple = {:foo, :bar}
    baz_tuple = Tuple.insert_at(a_tuple, 2, :baz)
    assert elem(baz_tuple, 2) == :baz
  end

  think "Inserting a tuple element raises an argument error if index is invalid" do
    a_tuple = {:foo, :bar}
    assert_raise ArgumentError, fn -> Tuple.insert_at(a_tuple, 4, :baz) end
  end

  think "The building blocks of Elixir are tuples of three elements" do
    # Note: quote gives the representation of a block
    quoted_block = quote do
      a = 1 + 2
      assert a == 3
    end

    assert is_tuple(quoted_block) == true
    assert tuple_size(quoted_block) == 3
  end

  think "We can use tuples to define blocks of Elixir code" do
    # Note: unquote is the reverse of quote
    # It gives a block from its representation
    unquoted_block = unquote {:"{}", [], [1, 2, 3]}
    # Note: it's in hungarian notation
    # the atom :"{}" represents the function
    # the list [] contains metadata like the line and module where code is defined
    # the list [1, 2, 3] is the arguments passed to the function
    # For more info see Macros and the quote/unquote functions
    assert unquoted_block == {1, 2, 3}
  end

  think "Are tuples enumerable?" do
    assert_raise Protocol.UndefinedError, fn -> Enum.empty?({1, 2, 3}) end
    # Note:
    # Do you smell the underlying machinery that make lists and tuple types different?
  end
end
