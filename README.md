# RegexPermutator

Creates all the permutations of strings from a simple Regex definition. The memory usage can get quite large if not used wisely. With great power...

## Description

Takes a Regexp object and generates all the possible strings that it would match.

`RegexPermutator.permutations(/Beverly Hills [[:digit:]]0210/)` generates:
`"Beverly Hills 00210"` through `"Beverly Hills 90210"`

In it's state right now it recognizes character classes like `[[:alpha:]]` and character ranges like `[a-z]` and `[abc123]`. Does not recognize the all matching period, groups or varying quantities yet . Back references are not planned to be implemented, but could be if demand is high enough.

All the results are generated in memory before being returned so memory usage could quickly go through the roof when using large ranges (like the period matcher).

## Installation

Add this line to your application's Gemfile:

    gem 'regex-permutator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install regex-permutator

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( http://github.com/<my-github-username>/regex-permutator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
