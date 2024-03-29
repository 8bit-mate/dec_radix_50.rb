# frozen_string_literal: true

require_relative "dec_radix_50/decoder"
require_relative "dec_radix_50/encoder"
require_relative "dec_radix_50/version"

#
# Encodes strings to the DEC Radix-50 encoding.
#
module DECRadix50
  class Error < StandardError; end
  class ArgumentError < StandardError; end

  # Elektronika MK90 filenames charset:
  MK90_CHARSET = " ABCDEFGHIJKLMNOPQRSTUVWXYZ$./0123456789"

  # RT-11 filenames charset:
  RT11_CHARSET = " ABCDEFGHIJKLMNOPQRSTUVWXYZ$%*0123456789"

  #
  # Encode a string to the DEC Radix-50 encoding.
  #
  # @param [String] charset
  #
  # @param [String] string
  #   String to encode.
  #
  # @option [String] replace_char (" ")
  #   If a given string has characters that aren't included in the
  #   charset, they will be replaced with the replace_char. replace_char
  #   should be part of the charset.
  #
  # @return [Array<Integer>]
  #   Radix-50 (decimal numeral system).
  #
  def self.encode(charset, string, replace_char = " ")
    Encoder.new(charset, string, replace_char).encode
  end

  #
  # Decode array of integers to a string.
  #
  # @param [String] charset
  #
  # @param [Array<Integer>] int_array
  #   Integer values to decode.
  #
  # @return [String]
  #
  def self.decode(charset, int_array)
    Decoder.new(charset, int_array).decode
  end
end
