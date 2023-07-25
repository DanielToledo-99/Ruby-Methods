$LOAD_PATH.unshift("./09ideal_gas")

require "minitest/autorun"
require_relative "ideal_gas"

class IdealGasTest < Minitest::Test
  def test_ideal_gas_with_5_500_2
    assert_equal 10392.5, calculate_pressure(5, 500, 2), "When: calculate_pressure(5, 500, 2)"
  end

  def test_ideal_gas_with_15_100_20
    assert_equal 623.55, calculate_pressure(15, 100, 20), "When: calculate_pressure(15, 100, 20)"
  end

  def test_ideal_gas_with_7_5000_10
    assert_equal 29099.0, calculate_pressure(7, 5000, 10), "When: calculate_pressure(7, 5000, 10)"
  end
end