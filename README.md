# dec_radix_50.rb

Encodes strings to the DEC Radix-50 encoding.

**RADIX 50** is an uppercase-only character encoding created by Digital Equipment Corporation (DEC) for use on their PDP, and VAX computers. RADIX 50's 40-character repertoire (050 in octal) can encode three characters into one 16-bit word (PDP-11, VAX). It was also adapted for use on the Soviet PDP-11 clones, notably the Elektronika MK90 portable computer.

The actual encoding differs between the systems.

Learn more on the [Wikipedia](https://en.wikipedia.org/wiki/DEC_RADIX_50).

## Installation

Add this line to your application"s Gemfile:

```ruby
gem "dec_radix_50"
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install dec_radix_50

## Usage

### Encoding

DECRadix50.encode(charset, string \[, replace_char\]) => Array\<Integer\>

### Arguments

+ **charset**: character set, should be 40 characters long for the DEC RADIX-50. The charset string length defines the base.

  The gem comes with two predefined characters sets:

  ```Ruby
  # Elektronika MK90 filenames charset:
  MK90_CHARSET = " ABCDEFGHIJKLMNOPQRSTUVWXYZ$./0123456789"

  # RT-11 filenames charset:
  RT11_CHARSET = " ABCDEFGHIJKLMNOPQRSTUVWXYZ$%*0123456789"
  ```

+ **string**: string to encode.

+ **replace_char**: replaces unsupported characters in the input string. Should be included in the charset. Default value is " " (a space).

### Returns

+ Array of integers.

### Example:

```ruby
require "dec_radix_50"

DECRadix50.encode(DECRadix50::MK90_CHARSET, "ABCDEF")
# => [1683, 6606]
```

### Decoding

DECRadix50.decode(charset, encoded_values) => String

### Arguments

+ **charset**: character set, should be 40 characters long for the DEC RADIX-50. The charset string length defines the base.

+ **encoded_values**: array of integers that represent an encoded string.

### Returns

+ String.

### Example:

```ruby
require "dec_radix_50"

DECRadix50.decode(DECRadix50::MK90_CHARSET, [2092, 1015, 34_320, 3259, 8001, 29_000, 3412, 24_567, 815, 859, 0])
=> "ALL YOUR BASE ARE BELONG TO US   "
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/8bit-mate/dec_radix_50.rb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
