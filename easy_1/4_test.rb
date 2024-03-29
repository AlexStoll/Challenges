require 'minitest/autorun'
require_relative '4.rb'

class TrinaryTest < Minitest::Test
  def test_trinary_1_is_decimal_1
    assert_equal 1, Trinary.new('1').to_decimal
  end

  def test_trinary_2_is_decimal_2
    assert_equal 2, Trinary.new('2').to_decimal
  end

  def test_trinary_10_is_decimal_3
    assert_equal 3, Trinary.new('10').to_decimal
  end

  def test_trinary_11_is_decimal_4
    assert_equal 4, Trinary.new('11').to_decimal
  end

  def test_trinary_100_is_decimal_9
    assert_equal 9, Trinary.new('100').to_decimal
  end

  def test_trinary_112_is_decimal_14
    assert_equal 14, Trinary.new('112').to_decimal
  end

  def test_trinary_222_is_26
    assert_equal 26, Trinary.new('222').to_decimal
  end

  def test_trinary_1122000120_is_32091
    assert_equal 32_091, Trinary.new('1122000120').to_decimal
  end

  def test_invalid_trinary_is_decimal_0
    assert_equal 0, Trinary.new('carrot').to_decimal
  end

  def test_invalid_trinary_with_digits_is_decimal_0
    assert_equal 0, Trinary.new('0a1b2c').to_decimal
  end
end