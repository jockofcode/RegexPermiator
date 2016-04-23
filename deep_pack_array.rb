def deep_pack_array( parens = "(((O_o)))",upstream = [] )
  chars = [] 
  string = parens

  if string == "" 
    return
  end
    c = string[0]
    if c[0] == "("
      return [ deep_pack_array( string[1..-1] ) ]
    else
      return deep_pack_array( string[1..-1] ) 
    end
end

