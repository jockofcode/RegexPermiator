module ArrayBuilder

  def self.deep_pack( target_string , begin_array = /\A\(\z/, end_array = /\A\)\z/)
    end_result = []

    begin

      case [target_string[0]].flatten.first
      when end_array 
        return end_result, target_string[1..-1]
      when begin_array 
        upstream_result, target_string = deep_pack( target_string[1..-1], begin_array, end_array ) 
        end_result << upstream_result
        next
      else
        end_result << [target_string[0]].flatten.first
      end

      target_string = target_string[1..-1]

    end until !target_string || target_string.empty?

    end_result
  end

end
