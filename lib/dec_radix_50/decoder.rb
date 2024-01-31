# frozen_string_literal: true

module DECRadix50
  #
  # Encodes strings to the DEC Radix-50 encoding.
  #
  class Decoder
    def initialize(charset, encoded_values)
      @charset = charset
      @encoded_values = encoded_values
      @base = charset.length

      _validate_input_parameters
    end

    def decode
      charset_values = @charset.split(//).each_with_index.to_h.invert

      @encoded_values.map do |value|
        x = charset_values[(value / @base / @base) % @base]
        y = charset_values[(value / @base) % @base]
        z = charset_values[value % @base]
        "#{x}#{y}#{z}"
      end.join
    end

    private

    def _validate_input_parameters
      raise DECRadix50::ArgumentError, "charset cannot be empty" if @charset.empty?
      raise DECRadix50::ArgumentError, "input array cannot be empty" if @encoded_values.empty?

      max_value = @base * @base * @base
      in_range = @encoded_values.all? { |e| e < max_value }

      raise DECRadix50::ArgumentError, "encoded values should be less than #{max_value}" unless in_range
    end
  end
end
