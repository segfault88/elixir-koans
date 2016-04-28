defmodule AboutAtoms do
  use Koans

  think "Atoms are sort of like strings" do
    adam = :human
    assert adam == :human
  end

  think "Strings can be converted to atoms, and vice versa" do
    assert String.to_atom("atomized") == :atomized
    assert Atom.to_string(:stringified) == "stringified"
  end

  think "Atoms are often used as keys, because they're faster than strings" do
    map = %{name: "Jay"}
    list = [name: "Jay"]

    assert map[:name] == "Jay"
    assert list[:name] == "Jay"
  end

  think "Only atom keys may be accessed with dot syntax" do
    map = %{name: "Jay"}
    assert map.name == "Jay"

    map = %{"name" => "Jay"}
    assert_raise KeyError, fn -> map.foo end
    assert map["name"] == "Jay"
  end

  think "Dot syntax is stricter than access with brackets" do
    map = %{name: "Jay"}

    assert map[:age] == nil
    assert_raise KeyError, fn -> map.age end
  end

  think "It is surprising to find out that booleans are atoms" do
    assert is_atom(true)
    assert is_atom(false)
    assert :true == true
    assert :false == false
  end

  think "Modules are also atoms" do
    assert is_atom(String)
    assert :"Elixir.String" == String
    assert :"Elixir.String".upcase("hello") == "HELLO"
  end

  think "Atoms are used to access Erlang" do
    assert :erlang.is_list([])
    assert :lists.sort([2, 3, 1]) == [1, 2, 3]
  end
end
