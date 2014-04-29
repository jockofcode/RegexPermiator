require "regex_permutator/version"
require "regex_permutator/array_builder.rb"

module RegexPermutator

  CLASS_PATTERN = /\[\[:[a-z]+:\]\]/.freeze
  ESCAPED_PATTERN = /\\./.freeze
  REPEAT_PATTERN = /\?|\*|\{\d*,\d*\}/.freeze
  RANGE_PATTERN = /\[[^\]]+\]/.freeze
  TOKEN_PATTERN = /(#{CLASS_PATTERN}|#{RANGE_PATTERN}|#{ESCAPED_PATTERN}|#{REPEAT_PATTERN}|.)/.freeze

    # character_array takes a regular expression and outputs
    # all the characters that match that single character matching
    # expression.
    # example RegexPermutator.character_array(/[[:digit:]]/)
    def self.character_array( regex_char_match )
      matches = (0..255).map do | char_number |
        character = char_number.chr
        if character =~ Regexp.new(regex_char_match)
          character
        else
          nil
        end
      end
      matches.compact!
    end
    # Input /[[:digit:]]/
    # Outputs ["0","1","2","3","4","5","6","7","8","9"]


  # Takes a regex and outputs all the possible permutations
  # that could match it.
  # /SMITHS [[:digit:]]/
  def self.permutations( regex )
    source = self.split_regex_tokens( regex )
    self.deep_permutation( source )
  end
  # Input /[1-3][ab]/
  # Output ["1a","2a","3a","1b","2b","3b"]

  def self.deep_permutation( tokens )
    token_feed_array = tokens.map do | token |
      self.character_array( token )
    end

    return token_feed_array.first if token_feed_array.length == 1

    token_feed_array.first.product(*token_feed_array[1..-1]).map(&:join)
  end

  # split_regex_tokens takes a regex and outputs all the tokens
  # that make it up that regex with groups contained in arrays
  def self.split_regex_tokens( regex )
    ArrayBuilder.deep_pack( regex.source.scan(TOKEN_PATTERN).flatten )
  end
  # Input /[1-2]\s /
  # Output ["[1-2]","\s"," "]

end
