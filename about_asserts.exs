defmodule AboutAsserts do
  use Koans

  think "We shall contemplate truth by testing reality, via asserts." do
    assert true
  end

  think "When reality lies, we shall refute truth" do
    refute true == false
  end

  think "Assertions are defined by ExUnit, an Elixir testing library" do
    ExUnit.Assertions.assert true == true
    ExUnit.Assertions.refute true == false
  end

  think "Enlightenment may be more easily achieved with appropriate messages." do
    assert true == true, "What happens when the assertion fails? One must try it."
  end

  think "To understand reality, we must compare our expectations against reality." do
    actual_value = 1 + 1
    expected_value = 2

    assert actual_value == expected_value
  end

  think "Assertions are smart" do
    is_1_equal_2? = fn -> assert 1 == 2 end
    is_1_greater_than_2? = fn -> assert 1 > 2 end

    message = "Assertion with " <> "==" <> " failed"
    assert_raise ExUnit.AssertionError, message, is_1_equal_2?

    message = "Assertion with " <> ">" <> " failed"
    assert_raise ExUnit.AssertionError, message, is_1_greater_than_2?
  end

  think "Some values are truthy; some values are falsy" do
    assert 42
    assert :foo
    refute nil
  end
end
