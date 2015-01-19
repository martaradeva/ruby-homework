module RBFS
  class File
    attr_accessor :data, :name

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
    attr_accessor :name

    def initialize (*name)
      @directory = []
      @name = name[0] if name
    end

    def add_file(name, file)
      file.name = name
      @directory << file if !name.include? ":"
    end

    def add_directory(name, *directory)
      if directory.any? then directory[0].name = name
                             @directory << directory[0]
                        else @directory << (Directory.new(name))
      end
    end

    def [](key)
      @directory.select{ |current| current.name == key }[0]
    end

    def files
      @directory.lazy.map{|file| {file.name => file}}.reduce({}, :merge).
       select{ |key,value| value.class == RBFS::File }
    end

    def directories
      @directory.lazy.map{|directory| {directory.name => directory}}.reduce({}, :merge).
       select{ |key,value| value.class == RBFS::Directory }
    end

    def serialize(directory)
      "turns directory into string"
    end

    def self.parse(string)
      "turns string into a Directory object"
    end

  end

end
