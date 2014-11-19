describe "String#anagrams" do
  def anagrams_for(word, amongst:, are:)
    expect(word.anagrams(amongst)).to match_array are
  end

  it "finds simple anagram" do
    anagrams_for "world", amongst: ["wlord", "dwloor", "zombies", "anagrams_for"], are: ["wlord"]
  end

  it "finds no match" do
    anagrams_for "integral", amongst: ["fmi", "ruby", "course"], are: []
  end

  it "finds case insensitive anagrams" do
    anagrams_for "Starer", amongst: ["cashregister", "Arrest", "stance"], are: ["Arrest"]
  end

  it "eliminates anagram subsets or supersets" do
    anagrams_for "cool", amongst: ["col", "cooly"], are: []
  end

    it "a word is not an anagram of itself" do
    anagrams_for "world", amongst: ["World", "world", "wrold"], are: ["wrold"]
  end

    it "yields anagrams if block is given" do
    ary = "world".anagrams(["World", "wroLd", "wrold"]){|word| puts word}
    expect(ary).to match_array ["WROLD"]
  end
end
