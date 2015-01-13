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
      data_type, data_string = string.split(":", 2)
      file_content = parse_data(data_type, data_string)
      # file_content = parse_data *string.split(":", 2) #I don't really understand what the wilcard goes for
      File.new (file_content)
    end

    private
    def self.parse_data(type, data)
      case type
        when "string" then parsed = data
        when "symbol" then parsed = data.to_sym
        when "number" then parsed = parse_number(data)
        when "boolean" then (data == "true") ? parsed = true : parsed = false
        when "" then parsed = nil
      end
    end

    def self.parse_number(data)
      if data.include? "." then data.to_f else data.to_i end
    end
  end

  class Directory
    attr_reader :directories
    attr_reader :files
    attr_accessor :name

    def initialize
      @directories = {}
      @files = {}
    end

    def add_file(name, file)
      if !name.include? ":" then @files.merge!({ name => file }) end
    end

    def add_directory(name, *directory)
      @directories.merge!(directory ? {name => directory[0]} : {name => Directory.new})
    end

    def [](key)
      @directories[key] or @files[key]
    end

    # def serialize(directory)
    #   "return string to save instead of object"
    # end

    def serialize
      #return string to save instead of object
      result = ''
      result << @files.length.to_s + ":"
      @files.each do |name, file| 
        result << [name, file.serialize.length.to_s, file.serialize].join(":")
      end
      result << @directories.length.to_s + ":"
      @directories.each do |folder|
        result << folder[0].to_s << ":"
        result serialize
      end
      result
    end

    def self.parse(string)
      "turns string into a Directory object"
    end
  end

end





  # class String
  #   def take!(*length)
  #     if length then self.slice! (0..length[0])
  #     else chunk, self = self.split(":", 2)
  #       chunk
  #     end
  #   end