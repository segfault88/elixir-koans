defmodule AboutMaps do
  use Koans

  think "Maps are a key-value store" do
    map = %{name: "Ryan", age: 27}
    assert map[:name] == "Ryan"
    assert map[:likes] == nil
  end

  think "Any value can be used as a key" do
    map = %{"name" => "Ryan", {:ok} => true}
    assert map["name"] == "Ryan"
    assert map[{:ok}] == true
  end

  think "There is more than one way to access a map" do
    map = %{name: "Ryan", age: 27}
    assert Map.get(map, :name) == "Ryan"
    assert Map.get(map, :likes, "programming") == "programming"
  end

  think "You can ask a map about its keys" do
    map = %{name: "Ryan", age: 27}
    assert Map.keys(map) == [:age, :name]
    # Further meditation:
    # Why are keys not returned in the order in which they're specified?
  end

  think "You can ask a map about its values" do
    map = %{name: "Ryan", age: 27}
    assert Map.values(map) == [27, "Ryan"]
  end

  think "You can ask a map if it has a key" do
    map = %{name: "Ryan", age: 27}
    assert Map.has_key?(map, :name) == true
    assert Map.has_key?(map, :likes) == false
  end

  think "Fetching a key works if the key exists..." do
    map = %{name: "Ryan", age: 27}
    assert Map.fetch(map, :name) == {:ok, "Ryan"}
  end

  think "... but what happens if we try to fetch a non-existant key?" do
    map = %{name: "Ryan", age: 27}
    assert Map.fetch(map, :likes) == :error
  end

  think "You can also pop a key" do
    map = %{amount: 10}
    {value, map} = Map.pop(map, :amount)
    assert value == 10
    assert map == %{}
  end

  think "Popping a non-existant key" do
    map = %{amount: 10}
    {value, map} = Map.pop(map, :age)
    assert value == nil
    assert map == %{amount: 10}
  end

  think "Merging together two maps" do
    map_1 = %{name: "Ryan", age: 27}
    map_2 = %{name: "Ryan B.", likes: "programming"}
    assert Map.merge(map_1, map_2) == %{name: "Ryan B.", age: 27, likes: "programming"}
  end

  think "Merging together two maps and doing something with their values" do
    map_1 = %{today: 10, yesterday: 20}
    map_2 = %{today: 20, yesterday: 5}

    assert Map.merge(map_1, map_2, fn (_k, v1, v2) -> v1 + v2 end) == %{today: 30, yesterday: 25}
  end

  think "Dropping keys" do
    map = %{name: "Ryan", age: 27}
    assert Map.drop(map, [:age]) == %{name: "Ryan"}
  end

  think "There's more than one way to remove a key" do
    map = %{name: "Ryan", age: 27}
    assert Map.delete(map, :age) == %{name: "Ryan"}
  end

  think "Changing a value" do
    map = %{name: "Ryan", age: 27}
    assert Map.put(map, :name, "Ryan B.") == %{age: 27, name: "Ryan B."}
  end

  think "Adding a new pair that doesn't exist" do
    map = %{name: "Ryan", age: 27}
    assert Map.put_new(map, :likes, "Programming") == %{age: 27, likes: "Programming", name: "Ryan"}
    assert Map.put_new(map, :name, "Ryan B.") == %{age: 27, name: "Ryan"}
  end

  think "Updating a key with a function" do
    map = %{amount: 10}
    assert Map.update(map, :amount, 0, fn (x) -> x + 1 end) == %{amount: 11}
    assert Map.update(map, :other_amount, 10, fn (x) -> x + 1 end) == %{amount: 10, other_amount: 10}
  end

  think "Updating keys that don't exist may not be desirable" do
    map = %{amount: 10}
    assert Map.update!(map, :amount, fn (x) -> x + 1 end) == %{amount: 11}
    assert_raise KeyError, fn -> Map.update!(map, :other_amount, fn (x) -> x + 1 end) end
  end
end
