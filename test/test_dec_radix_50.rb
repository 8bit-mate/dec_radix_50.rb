# frozen_string_literal: true

require_relative "test_helper"

class TestDECRadix50 < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::DECRadix50::VERSION
  end

  def test_encoder_valid_input
    radix50 = DECRadix50.encode(DECRadix50::MK90_CHARSET, "ABCDEF")

    assert_equal [1683, 6606], radix50
  end

  def test_encoder_valid_input_with_spaces
    radix50 = DECRadix50.encode(DECRadix50::MK90_CHARSET, "A B   ")

    assert_equal [1602, 0], radix50
  end

  def test_decoder_valid_input
    str = DECRadix50.decode(DECRadix50::MK90_CHARSET, [1602, 0])

    assert_equal "A B   ", str
  end

  def test_decode_encode
    orig_arr = [123, 456, 789]
    str = DECRadix50.decode(DECRadix50::MK90_CHARSET, orig_arr)
    res_arr = DECRadix50.encode(DECRadix50::MK90_CHARSET, str)

    assert_equal orig_arr, res_arr
  end

  def test_encode_decode
    orig_str = "ABCDEFGHI123"
    arr = DECRadix50.encode(DECRadix50::MK90_CHARSET, orig_str)
    res_str = DECRadix50.decode(DECRadix50::MK90_CHARSET, arr)

    assert_equal orig_str, res_str
  end

  def test_encode_decode_custom_base
    charset = " ABCDE"

    orig_str = "A B B A  "
    arr = DECRadix50.encode(charset, orig_str)
    res_str = DECRadix50.decode(charset, arr)

    assert_equal orig_str, res_str
  end

  def test_decode_encode_custom_base
    charset = " ABCDE"

    orig_arr = [215, 214, 213]
    str = DECRadix50.decode(charset, orig_arr)
    res_arr = DECRadix50.encode(charset, str)

    assert_equal orig_arr, res_arr
  end
end
