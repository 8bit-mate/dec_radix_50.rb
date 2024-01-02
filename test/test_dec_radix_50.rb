# frozen_string_literal: true

require "test_helper"

class TestDECRadix50 < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::DECRadix50::VERSION
  end

  def test_valid_input
    radix50 = DECRadix50.encode(DECRadix50::MK90_CHARSET, "ABCDEF")

    assert_equal [1683, 6606], radix50
  end
end
