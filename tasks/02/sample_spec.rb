describe NumberSet do
  it 'initializes new instance' do
    numbers = NumberSet.new
#    expect(numbers).to eq []
  end

  it 'is empty on creation' do
    expect(NumberSet.new.empty?).to eq true
  end

  it 'can hold one number' do
    expect(NumberSet.new<<1).to eq [1]
  end

  it 'can hold multiple numbers' do
    set = NumberSet.new << 1
    set << 2
    expect(set.empty?).to eq false
  end

  it 'has a valid size method' do
    set = NumberSet.new << 1 << 2
    expect(set.size).to eq 2
  end

  it 'can contain all four data types' do
    set = NumberSet.new << 1 << 0.5 << Rational(2,3) <<  (2.5+3i)
    expect(set.size).to eq 4
  end

  it 'can check for inclusion' do
    set = NumberSet.new << 1 << 2 << 3
    expect (set.incl(2)).to eq true
  end

  it 'contains only unique numbers' do
    set = NumberSet.new << 1 << 1 #<< Rational(2,2)
    expect(set.size).to eq 1
  end

  # it 'contains multiple numbers' do
  #   numbers = NumberSet.new
  #   numbers << Rational(22, 7)
  #   numbers << 42
  #   numbers << 3.14
  #   expect(numbers.size).to eq 3
  # end
 
#   it 'contains only unique numbers' do
#     numbers = NumberSet.new
#     numbers << 42
#     numbers << 42
#     expect(numbers.size).to eq 1
#   end
 
  # it 'contains only unique numbers of different types' do
  #   numbers = NumberSet.new
  #   numbers << 42
  #   numbers << 42.0
  #   numbers << Rational(84, 2)
  #   numbers << 42+0i
  #   expect(numbers.size).to eq 1
  # end
 
  # it 'can filter SignFilter' do
  #   numbers = NumberSet.new
  #   [Rational(-5, 2), 7.6, 0].each do |number|
  #     numbers << number
  #   end
  #   filtered_numbers = numbers[SignFilter.new(:non_negative)]
  #   expect(filtered_numbers.size).to eq 2
  #   expect(filtered_numbers).to include 7.6, 0
  #   expect(filtered_numbers).not_to include Rational(-5, 2)
  # end
 
  # it 'can filter TypeFilter' do
  #   numbers = NumberSet.new
  #   [Rational(-5, 2), 7.6, 0].each do |number|
  #     numbers << number
  #   end
  #   filtered_numbers = numbers[TypeFilter.new(:real)]
  #   expect(filtered_numbers.size).to eq 2
  #   expect(filtered_numbers).to include 7.6, Rational(-5, 2)
  #   expect(filtered_numbers).not_to include 0
  # end
 
  # it 'can filter standart filter' do
  #   numbers = NumberSet.new
  #   [Rational(-5, 2), 7.6, 0].each do |number|
  #     numbers << number
  #   end
  #   filtered_numbers = numbers[Filter.new { |number| number != 0 }]
  #   expect(filtered_numbers.size).to eq 2
  #   expect(filtered_numbers).to include 7.6, Rational(-5, 2)
  #   expect(filtered_numbers).not_to include 0
  # end
 
  # it 'can combine two filters with "and" rule' do
  #   numbers = NumberSet.new
  #   [Rational(-5, 2), 7.6, 0].each do |number|
  #     numbers << number
  #   end
  #   filtered_numbers = numbers[SignFilter.new(:non_negative) & Filter.new { |number| number != 0 }]
  #   expect(filtered_numbers.size).to eq 1
  #   expect(filtered_numbers).to include 7.6
  #   expect(filtered_numbers).not_to include Rational(-5, 2), 0
  # end
 
  # it 'can combine two filters with "or" rule' do
  #   numbers = NumberSet.new
  #   [Rational(-5, 2), 7.6, 0, 1, 3.4, 5+4i].each do |number|
  #     numbers << number
  #   end
  #   filtered_numbers = numbers[TypeFilter.new(:real) | TypeFilter.new(:complex)]
  #   expect(filtered_numbers.size).to eq 4
  #   expect(filtered_numbers).to include Rational(-5, 2), 7.6, 3.4, 5+4i
  #   expect(filtered_numbers).not_to include 1, 0
  # end
 
  # it 'contains no elements' do
  #   numbers = NumberSet.new
  #   expect(numbers.empty?).to eq true
  # end
 
  # it 'contains elements' do
  #   numbers = NumberSet.new
  #   numbers << 2
  #   numbers << 3
  #   expect(numbers.empty?).to eq false
  # end

  # it 'returns NumberSet object when filtered' do
  #   numbers = NumberSet.new
  #   [Rational(-5, 2), 7.6, 0].each do |number|
  #     numbers << number
  #   end
  #   filtered_numbers = numbers[SignFilter.new(:non_negative)]
  #   expect(filtered_numbers.class).to eq NumberSet
  # end

end