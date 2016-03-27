require "RegexPermiator/version"

module RegexPermiator

  CLASS_PATTERN = /\[\[:[a-z]+:\]\]/.freeze
  ESCAPED_PATTERN = /\\./.freeze
  TOKEN_PATTERN = /(#{CLASS_PATTERN}|#{ESCAPED_PATTERN}|.)/.freeze

  def self.all_matching_chars( regex_char_match )
    matches = (0..255).map do | char_number |
      character = char_number.chr
      if character =~ regex_char_match
        character
      else
        nil
      end
    end
    matches.compact!
  end

  def self.split_regex_tokens( regex )
    regex.source.scan(TOKEN_PATTERN).flatten
  end
end
