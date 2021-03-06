module RBFS
  class File
    attr_accessor :data

    def initialize(*data)
      @data = data[0]
    end

    def data_type
      case @data
        when String                    then @data_type = :string
        when Symbol                    then @data_type = :symbol
        when Numeric                   then @data_type = :number
        when (TrueClass or FalseClass) then @data_type = :boolean
        else                                @data_type = :nil
      end
    end

    def serialize
      self.data_type.to_s + ':' + @data.to_s
    end

    def self.parse(string)
      File.new string.split(":")[1]
    end

  end

  class Directory

    def initialize
      @directory = {}
    end

    def add_file(name, file)
      if !name.include? ":" then @directory.merge!({ name => file }) end
    end

    def add_directory(name, *directory)
      if directory then @directory.merge!({ name => directory[0] })
                   else @directory.merge!({ name => Directory.new })
      end
    end

    def [](key)
      @directory[key]
    end

    def files
      @directory.select{|key,value| value.class == RBFS::File }
    end

    def directories
      @directory.select{|key,value| value.class == RBFS::Directory }
    end

    def serialize(directory)
      "return string to save instead of object"
    end

    def self.parse(string)
      "turns string into a Directory object"
    end

  end

end