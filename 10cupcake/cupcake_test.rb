$LOAD_PATH.unshift("./10cupcake")

require "minitest/autorun"
require_relative "cupcake"

class CupcakeTest < Minitest::Test
  def test_cupcake_random_mixin_1
    assert_equal  2.1,
    calculate_price("individual", "vanilla", "vanilla", "nutella"),
    "When: calculate_price('individual', 'vanilla', 'vanilla', 'nutella')"
  end
  
  def test_cupcake_random_mixin_2
    assert_equal  13.82,
    calculate_price("six pack", "chocolate", "oreo", "strawberry"),
    "When: calculate_price('six pack', 'chocolate', 'oreo', 'strawberry')"
  end

  def test_cupcake_random_mixin_3
    assert_equal  29.7,
    calculate_price("dozen pack", "red velvet", "mint chocolate", "peanut butter"),
    "When: calculate_price('dozen pack', 'red velvet', 'mint chocolate', 'peanut butter')"
  end

  def test_cupcake_with_no_frosting
    assert_equal  19.98,
    calculate_price("dozen pack", "chocolate", "oreo"),
    "When: calculate_price('dozen pack', 'chocolate', 'oreo')"
  end
end
