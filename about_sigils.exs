defmodule AboutSigils do
  use Koans

  think "The ~s sigil is a different way of expressing string literals" do
    assert ~s{This is a string} == "This is a string"
  end

  think "Sigils are useful to avoid escaping quotes in strings" do
    assert "\"Welcome to the jungle\", they said." == ~s{"Welcome to the jungle", they said.}
  end

  think "Sigils can use different delimiters" do
    assert ~s{This works!} == ~s[This works!]
  end

  think "The lowercase ~s sigil supports string interpolation" do
    assert ~s[1 + 1 = #{1+1}] == "1 + 1 = 2"
  end

  think "The ~S sigil is similar to ~s but doesn't do interpolation" do
    assert ~S[1 + 1 = #{1+1}] == "1 + 1 = \#{1+1}"
  end

  think "~w is another sigil, it creates word lists" do
    assert ~w(Hello world) == ["Hello", "world"]
  end

  think "~w also allows interpolation" do
    assert ~w(Hello 1#{1+1}3) == ["Hello", "123"]
  end

  think "~W behaves to ~w as ~S behaves to ~s" do
    assert ~W(Hello #{1+1}) == ["Hello", "\#{1+1}"]
  end
end
