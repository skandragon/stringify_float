[![Build Status](https://travis-ci.org/skandragon/stringify_float.png?branch=master)](https://travis-ci.org/skandragon/stringify_float)

# stringify_float

RubyMotion on 32-bit iOS devices suffers from poor floating point support:

    (main)> 1.2
    => 1.19999980926514

This causes no end of problem with Core Data, and other uses where we really
want more precision than RubyMotion currently provides.  Plus, generally
these values are converted to and from strings for presentation or editing.
These are convience functions to ease this use case as well.

## Installation

Add this line to your application's Gemfile:

    gem 'stringify_float'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stringify_float

## Usage

    class Model
      include StringifyFloat

      attr_accessor :cost
      stringify_float :cost

      attr_accessor :quantity
      stringify_float :quantity, precision: 1
    end

    >>> x = Model.new
    >>> x.stringifiedCost = "123.45"
    >>> x.stringifiedCost
    "123.45"

    >>> x.stringifiedQuantity = "123.45"
    >>> x.stringifiedQuantity
    "123.4"

"precision" specifies how many decimal places should be stored.  This should
be greater than 1, and as many positions as you wish.  Returned strings are
always 0-padded, so "123" becomes "123.00" (using the default precision).

The underlying data type limits how large a given integer can be.  If
using Core Data, an integer32 can store values up to 21,474,836.48 using the
default precision of 2.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
