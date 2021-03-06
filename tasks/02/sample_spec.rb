describe NumberSet do

  it 'initializes new instance' do
    numbers = NumberSet.new
#    expect(numbers).to eq []
  end

  it 'is empty on creation' do
    expect(NumberSet.new.empty?).to eq true
  end

  it 'can hold one number' do
    set = NumberSet.new << 1
    expect(set.include?(1)).to eq true
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

  it 'contains only unique numbers' do
    set = NumberSet.new << 1 << 1 << Rational(2,2)
    expect(set.size).to eq 1
  end

  # it 'can redefine [] method' do
  #   expect(NumberSet.new['a']).to eq 'a'
  # end

  #  it 'can access block in [] method' do
  #   set = NumberSet.new << 1 << 2 << 3
  #   expect(set[ & -> (n) {n.even?} ].to_a).to eq [2]
  #   # expect(set[{|n| n.even? } ].to_a).to eq [2]
  # end

  # it '[] method can filter when given a block' do
  #   set = NumberSet.new << 1 << 2 << 3
  #   # filth = Filter.new {|number| number.odd?}
  #   expect(set[ { |number| number.odd?} ].to_a).to eq [1,3]
  # end

  # it 'Filter class outputs block correctly' do
  #   filth = Filter.new {}

  # it 'Filter.new works' do
  #   expect(Filter.new(2){ |n| n.even?}).to eq true
  # end

  # it 'Filter.new passes block to @filter' do
  #   expect(Filter.new {|n| n.odd?}).to eq true
  # end

  it 'has valid Filter class methods' do
    expect(Filter.new{ |n| n.odd? }.accepts?(3)).to eq true
  end


  it '[] can filter via Filter class instance' do
    set = NumberSet.new << 1 << 2 << 3
    filtered_set = set[Filter.new{ |n| n.odd? }]
    expect(filtered_set.to_a).to eq [1,3]
  end

  it 'can filter via Typefilter' do
    set = NumberSet.new << 1 << 2.5+3i << 3 << Rational(3,2)
    filtered_set = set[TypeFilter.new(:complex)]
    real_set = set[TypeFilter.new(:real)]
    # expect(filtered_set.to_a).to eq [2.5+3i]
    expect(real_set.to_a).to eq [Rational(3,2)]
  end

  it 'can filter via SignFilter' do
    set = NumberSet.new << 1 << -2 << 2 << 0
    filtered_set = set[SignFilter.new(:positive)]
    expect(filtered_set.to_a).to eq [1,2]
  end

  it 'can chain filter methods' do
    set = NumberSet.new << 0 << 1 << 2 << 3
    filtered_set = set[Filter.new{|n| n.even?} & SignFilter.new(:positive)]
    expect(filtered_set.to_a).to eq [2]
  end

  # it 'can filter via TypeFilter' do
  #   set = NumberSet.new << 1 << Rational(2,3) << 3
  #   expect(set[TypeFilter.new(:integer)].to_a).to eq [1,3]
  # end

end
