require "regex_permutator/version"
require "regex_permutator/array_builder.rb"

module RegexPermutator

  CLASS_PATTERN = /\[\[:[a-z]+:\]\]/.freeze
  ESCAPED_PATTERN = /\\./.freeze
  REPEAT_PATTERN = /\?|\*|\{\d*,\d*\}/.freeze
  RANGE_PATTERN = /\[[^\]]+\]/.freeze
  TOKEN_PATTERN = /(#{CLASS_PATTERN}|#{RANGE_PATTERN}|#{ESCAPED_PATTERN}|#{REPEAT_PATTERN}|.)/.freeze

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

  def self.permutations( source)
    source = self.split_regex_tokens if source.class != Array
    self.deep_permutation( source )
  end

  def self.deep_permutation( tokens )
  # tokens =  self.split_regex_tokens( regex )

    token_feed_array = tokens.map do | token |
      self.character_array( token )
    end

    return token_feed_array.first if token_feed_array.length == 1

    token_feed_array.first.product(*token_feed_array[1..-1]).map(&:join)
  end

  def self.split_regex_tokens( regex )
    ArrayBuilder.deep_pack( regex.source.scan(TOKEN_PATTERN).flatten )
  end

end
