class String

  def word_wrap(row_length)
    @result = []
    if self.length > row_length
      self.gsub("\n", ' ').strip.each_line(' '){|line| @result << line.strip}
    end
    i = 0
    while i < @result.length 
        if @result[i..i+1].join(' ').length < row_length
            long_row = @result.delete_at(i..i+1).join(' ')
            @result.insert(long_row, i)
        else i = i+1
        end
    end
    @result
  end

end