require "regex_permutator/version"

module RegexPermutator

  CLASS_PATTERN = /\[\[:[a-z]+:\]\]/.freeze
  ESCAPED_PATTERN = /\\./.freeze
  REPEAT_PATTERN = /\?|\*|\{\d*,\d*\}/.freeze
  RANGE_PATTERN = /\[[^\]]+\]/.freeze
  TOKEN_PATTERN = /(#{CLASS_PATTERN}|#{RANGE_PATTERN}|#{ESCAPED_PATTERN}|#{REPEAT_PATTERN}|.)/.freeze

  def self.all_matching_chars( regex_char_match )
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

  def self.permutations( tokens )
    token_feed_array = self.split_regex_tokens( tokens ).map do | token |
      self.all_matching_chars( token )
    end
    return token_feed_array.first if token_feed_array.length == 1

    token_feed_array.first.product(*token_feed_array[1..-1]).map(&:join)
  end

  def self.split_regex_tokens( regex )
    regex.source.scan(TOKEN_PATTERN).flatten
  end
end
