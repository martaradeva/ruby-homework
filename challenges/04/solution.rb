def remove_duplicates(input)
  output = []
  input.each { |current| output << current if !output.include? current }
  output
  #trivial but working 
end

# def remove_duplicates(input)
#   output = []
#   input.map{ |current| 
#     if output.include? current 
#       then current = nil 
#       else output << current
#       end
#       }.compact
# end
