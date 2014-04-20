require "RegexPermiator/version"

module RegexPermiator

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
end
