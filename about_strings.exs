defmodule AboutStrings do
  use Koans

  think "Creating a new string" do
    a_string = "hello world!"
    assert a_string == a_string
  end

  think "Values can be interpolated into strings" do
    a_string = "1 + 1 = #{1+1}"
    assert a_string == "1 + 1 = 2"
  end

  think "How long is a piece of string?" do
    a_string = "Hello there"
    assert String.length(a_string) == 11
  end

  think "What does the string start with?" do
    a_string = "Hello there"
    assert String.starts_with?(a_string, "H") == true
    assert String.starts_with?(a_string, ["Bonjour", "Hello"]) == true
    assert String.starts_with?(a_string, ["Bonjour", "Greetings"]) == false
  end

  think "What does the string end with?" do
    a_string = "Live long and prosper"
    assert String.ends_with?(a_string, "prosper") == true
    assert String.ends_with?(a_string, ["multiply", "prosper"]) == true
    assert String.ends_with?(a_string, ["keep calm"]) == false
  end

  think "Does a string contain something?" do
    a_string = "May the force be with you"
    assert String.contains?(a_string, "force") == true
    assert String.contains?(a_string, ["voyager", "you"]) == true
    assert String.contains?(a_string, ["prosper"]) == false
  end

  think "Accessing letters by their positions" do
    a_string = "Hello world!"
    assert String.at(a_string, 2) == "l"
    assert String.at(a_string, 20) == nil
  end

  think "Slicing a string" do
    a_string = "Hello world!"
    assert String.slice(a_string, 6, 5) == "world"
    assert String.slice(a_string, -3, 6) == "ld!"
    assert String.slice(a_string, 20, 5) == ""
    assert String.slice(a_string, 4, 0) == ""
    assert String.slice(a_string, 0..5) == "Hello "
  end

  think "Capitalization" do
    a_string = "hello world!"
    assert String.capitalize(a_string) == "Hello world!"
  end

  think "Upcase" do
    a_string = "hello world!"
    assert String.upcase(a_string) == "HELLO WORLD!"
  end

  think "Downcase" do
    a_string = "SPEAK QUIETLY"
    assert String.downcase(a_string) == "speak quietly"
  end

  think "Reversing a string" do
    a_string = "sdrow sdrawkcab"
    assert String.reverse(a_string) == "backwards words"
  end

  think "Say it again" do
    a_string = "repeat this"
    assert String.duplicate(a_string, 3) == "repeat thisrepeat thisrepeat this"
  end

  think "Stripping on the left" do
    a_string = "  abc  "
    assert String.lstrip(a_string) == "abc  "
  end

  think "Stripping on the left with specific characters" do
    a_string = "$  abc  $"
    assert String.lstrip(a_string, ?$) == "  abc  $"
  end

  think "Stripping on the right" do
    a_string = "  abc  "
    assert String.rstrip(a_string) == "  abc"
  end

  think "Stripping on the right with specific character" do
    a_string = "  abc  $"
    assert String.rstrip(a_string, ?$) == "  abc  "
  end

  think "Stripping on both sides" do
    a_string = "  abc  "
    assert String.strip(a_string) == "abc"
  end

  think "Stripping on both sides with a specific character" do
    a_string = "$  abc  $"
    assert String.strip(a_string, ?$) == "  abc  "
  end

  think "Left justification" do
    a_string = "2"
    assert String.ljust(a_string, 3) == "2  "
  end

  think "Left justification with a specific character" do
    a_string = "2"
    assert String.ljust(a_string, 3, ?0) == "200"
  end

  think "Right justification" do
    a_string = "2"
    assert String.rjust(a_string, 3) == "  2"
  end

  think "Right justification with a specific character" do
    a_string = "7"
    assert String.rjust(a_string, 3, ?0) == "007"
  end

  think "Converting to an integer" do
    assert String.to_integer("10") == 10
    assert_raise ArgumentError, fn -> String.to_integer(10) end
  end

  think "Converting to an integer using a different base" do
    a_string = "11"
    assert String.to_integer(a_string, 16) == 17
    assert String.to_integer(a_string, 2) == 3
  end

  think "Converting to a float" do
    assert String.to_float("10.99") == 10.99
    assert_raise ArgumentError, fn -> String.to_float(10.99) end
  end
end
