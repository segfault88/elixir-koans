defmodule AboutEnums do
  use Koans

  think "Do something with each element" do
    list = [1, 2, 3]
    Enum.each(list, fn (x) -> is_integer(x) end)
  end

  think "Mapping over a list" do
    list = [1, 2, 3]
    assert Enum.map(list, fn (x) -> x + 1 end) == [2, 3, 4]
    # Hint: Write a function!
  end

  think "Concatenation" do
    list_1 = [1, 2, 3]
    list_2 = [4, 5, 6]
    assert Enum.concat(list_1, list_2) == [1, 2, 3, 4, 5, 6]
  end

  think "Is an enumerable empty?" do
    refute Enum.empty?([1, 2, 3])
    assert Enum.empty?([])
  end

  think "Check if all items match" do
    list = [1, 2, 3]
    assert Enum.all?(list, fn (x) -> x < 4 end) == true
  end

  think "Check if any items match" do
    list = [1, 2, 3]
    assert Enum.any?(list, fn (x) -> x < 2 end) == true
  end

  think "Is it in the collection?" do
    list = [:a, :b, :c]
    assert Enum.member?(list, :d) == false
  end

  think "Find an element at an index" do
    list = [:a, :b, :c, :d]
    assert Enum.at(list, 0) == :a
  end

  think "What happens if we look outside the list?" do
    list = [:a, :b, :c, :d]
    assert Enum.at(list, 5) == nil
  end

  think "It can take a default" do
    list = [:a, :b, :c]
    assert Enum.at(list, 5, :something) == :something
  end

  think "Fetching is similar to at" do
    list = [:a, :b, :c]
    assert Enum.fetch(list, 0) == {:ok, :a}
  end

  think "Fetching tells you if it can't find an element" do
    list = [:a, :b, :c]
    assert Enum.fetch(list, 4) == :error
  end

  think "Fetching will raise an exception if it can't find an element" do
    list = [:a, :b, :c]
    assert_raise Enum.OutOfBoundsError, fn -> Enum.fetch!(list, 4) end
  end

  think "Find the first element that matches" do
    list = [1, 2, 3, 4]
    assert Enum.find(list, fn (x) -> x > 2 end) == 3
  end

  think "What happens when find can't find?" do
    list = [1, 2, 3, 4, 5]
    assert Enum.find(list, fn (x) -> x > 5 end) == nil
  end

  think "Find takes a default" do
    list = [1, 2, 3]
    assert Enum.find(list, 4, fn (x) -> x > 3 end) == 4
  end

  think "What is the index of an element?" do
    list = [1, 2, 3]
    assert Enum.find_index(list, fn(x) -> x == 2 end) == 1
  end

  think "Find and manipulate a value" do
    list = [1, 2, 3]
    assert Enum.find_value(list, fn (x) -> rem(x, 2) == 1 end) == true
    # TODO this seems to be a really bad example
  end

  think "Get each element with its index" do
    list = [:a, :b, :c]
    assert Enum.with_index(list) == [a: 0, b: 1, c: 2]
  end

  think "Chunking elements into groups" do
    list = [1, 2, 3, 4, 5, 6]
    assert Enum.chunk(list, 2) == [[1, 2], [3, 4], [5, 6]]
  end

  think "Chunking elements in steps" do
    list = [1, 2, 3, 4, 5, 6]
    assert Enum.chunk(list, 2, 1) == [[1, 2], [2, 3], [3, 4], [4, 5], [5, 6]]
  end

  think "Chunking elements in steps with padding" do
    list = [1, 2, 3, 4, 5, 6]
    assert Enum.chunk(list, 3, 2, [7]) == [[1, 2, 3], [3, 4, 5], [5, 6, 7]]
  end

  think "Chunking elements with a function" do
    list = [3, 4, 5, 6, 7, 8]
    assert Enum.chunk_by(list, fn (x) -> x > 5 end) == [[3, 4, 5], [6, 7, 8]]
  end

  think "Dropping elements" do
    list = [1, 2, 3, 4]
    assert Enum.drop(list, 2) == [3, 4]
    assert Enum.drop(list, 10) == []
    assert Enum.drop(list, -1) == [1, 2, 3]
  end

  think "Dropping while a condition is met" do
    list = [1, 2, 3, 4]
    assert Enum.drop_while(list, fn (x) -> x < 2 end) == [2, 3, 4]
  end

  think "Filtering" do
    list = [1, 2, 3, 4]
    assert Enum.filter(list, fn (x) -> rem(x, 2) == 1 end) == [1, 3]
  end

  think "Filtering and mapping" do
    list = [1, 2, 3, 4]
    assert Enum.filter_map(list, fn (x) -> rem(x, 2) == 1 end, &(&1 * 2)) == [2, 6]
  end

  think "Flat mapping" do
    list = Enum.flat_map([{1, 3}, {4, 6}], fn({x, y}) -> x..y end)
    assert list == [1, 2, 3, 4, 5, 6]
  end

  think "Joining into a string" do
    list = [1, 2, 3]
    assert Enum.join(list) == "123"
  end

  think "Joining with a separator" do
    list = [1, 2, 3]
    assert Enum.join(list, ",") == "1,2,3"
  end

  think "Mapping and joining" do
    list = [1, 2, 3]
    assert Enum.map_join(list, fn (x) -> x * 2 end) == "246"
  end

  think "Map reduce" do
    list = [4, 5, 6]
    assert Enum.map_reduce(list, 0, fn (x, acc) -> {x * 2, x + acc} end) == {'\b\n\f', 15} # wtf!?
    # TODO this example may be unecessarily difficult to grok
  end

  think "Zipping collections together" do
    list_1 = [1, 2, 3]
    list_2 = [4, 5, 6]
    assert Enum.zip(list_1, list_2) == [{1, 4}, {2, 5}, {3, 6}]
    # TODO would be nice to use values with more meaning. Like zipping atoms
    # and values together to make a keyword list.
  end

  think "Find the max value in a collection" do
    list = [6, 1, 5, 2, 4, 3]
    assert Enum.max(list) == 6
  end

  think "Find the max value using a function" do
    list = ["the", "longest", "word", "is", "expected"]
    assert Enum.max_by(list, &String.length(&1)) == "expected"
  end

  think "Find the minimum value in a collection" do
    list = [6, 1, 5, 2, 4, 3]
    assert Enum.min(list) == 1
  end

  think "Find the minimum value using a function" do
    list = ["the", "shortest", "word", "is", "expected"]
    assert Enum.min_by(list, &String.length(&1)) == "is"
  end

  defp numbers, do: 1..10

  think "Partitioning" do
    {left, right} = Enum.partition(numbers, fn(x) -> rem(x, 2) == 1 end)
    assert left == [1, 3, 5, 7, 9]
    assert right == [2, 4, 6, 8, 10]
  end

  think "Reduction" do
    result = Enum.reduce(numbers, 0, fn (x, acc) -> acc + x end)
    assert result == 55
    # TODO this could probably be illustrated before map_reduce. Also would be
    # nice to use values easier to compute in your head.
  end

  think "Rejection" do
    result = Enum.reject(numbers, fn(x) -> rem(x, 2) == 1 end)
    assert result == [2, 4, 6, 8, 10]
  end

  think "Reversal" do
    assert Enum.reverse(numbers) == [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
  end

  think "Shuffle" do
    refute Enum.shuffle(numbers) == numbers
    # Note: It's possible for this to fail. Does shuffle guarantee difference?
  end

  think "Slicing" do
    assert Enum.slice(numbers, 2, 2) == [3, 4]
  end

  think "Slicing beyond length" do
    assert Enum.slice(numbers, 2, 100) == [3, 4, 5, 6, 7, 8, 9, 10]
  end

  think "Sorting" do
    numbers = [1, 6, 3, 8, 4, 2, 9, 5, 7]
    assert Enum.sort(numbers) == [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  think "Unique elements" do
    numbers = [1, 1, 2, 3, 3, 4]
    assert Enum.uniq(numbers) == [1, 2, 3, 4]
  end

  think "Splitting" do
    numbers = [1, 2, 3, 4]
    {left, right} = Enum.split(numbers, 2)
    assert left == [1, 2]
    assert right == [3, 4]
  end

  think "Splitting with function" do
    {left, right} = Enum.split_while(numbers, fn (x) -> x < 5 end)
    assert left == [1, 2, 3, 4]
    assert right == [5, 6, 7, 8, 9, 10]
  end

  think "Take some elements" do
    assert Enum.take(numbers, 2) == [1, 2]
  end

  think "Take some elements from the end" do
    assert Enum.take(numbers, -2) == [9, 10]
  end

  think "Take every few elements" do
    assert Enum.take_every(numbers, 3) == [1, 4, 7, 10]
  end

  think "Take while function is true" do
    assert Enum.take_while(numbers, fn (x) -> x < 5 end) == [1, 2, 3, 4]
  end
end
