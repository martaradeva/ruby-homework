class String
  def absolute
    self.downcase.chars.sort
  end

  def anagrams(words)
    anagrams = []
    words = words.delete_if {|word| word.downcase == self.downcase}
    words.each { |word| anagrams << word if word.absolute == self.absolute}
      block_given? ? yield(anagrams) : anagrams.to_enum
  end

end
