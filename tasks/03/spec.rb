describe RBFS do

  describe 'File' do
    subject(:file) { RBFS::File.new }

    it 'can store data' do
      file.data = 'hello world'
      expect(file.data).to eq 'hello world'
    end

    it 'can accept data in the initializer' do
      file = RBFS::File.new('Hay :)')

      expect(file.data).to eq 'Hay :)'
    end

  end

  context 'data type' do
    context 'number' do
      it 'can be detected' do
        expect(RBFS::File.new(42).data_type).to eq :number
      end
    end

    context 'string' do
      it 'can be detected' do
        expect(RBFS::File.new("baba").data_type).to eq :string
    end
  end

    context 'symbol' do
      it 'can be detected' do
        expect(RBFS::File.new(42.to_s.to_sym).data_type).to eq :symbol
    end
  end

    context 'boolean' do
      it 'can be detected' do
        expect(RBFS::File.new(true).data_type).to eq :boolean
    end
  end

    context 'nil' do
      it 'can be detected' do
        expect(RBFS::File.new().data_type).to eq :nil
    end
  end

  end
end
