# frozen_string_literal: true

module DECRadix50
  #
  # Encodes strings to the DEC Radix-50 encoding.
  #
  class Encoder
    def initialize(charset, string, replace_char)
      _validate_input_parameters(charset, string, replace_char)

      @charset = charset
      @string = string.upcase.gsub(/[^#{charset}]/, replace_char)
      @base = charset.length
    end

    # Based on the @jgn/radix50.rb
    # https://gist.github.com/jgn/707543
    def encode
      charset_values = @charset.split(//).each_with_index.to_h
      @string.chars.each_slice(3).map do |x, y, z|
        (((charset_values[x] || 0) * @base + (charset_values[y] || 0)) * @base + (charset_values[z] || 0))
      end
    end

    private

    def _validate_input_parameters(charset, string, replace_char)
      raise DECRadix50::ArgumentError, "charset cannot be empty" if charset.empty?
      raise DECRadix50::ArgumentError, "string cannot be empty" if string.empty?
      raise DECRadix50::ArgumentError, "replace_char should be exactly 1 character long" unless replace_char.length == 1
    end
  end
end
