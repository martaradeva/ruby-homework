module UI

  class TextScreen

    def self.draw &block
      @screen = Screen.new
      @screen.instance_eval(&block)
      puts "screen.group.flatten.join '' in render = #{@screen.group.flatten.join ''}"
      @screen.group.flatten.join ""
    end

  end

  class Screen
    attr_accessor :group

    def initialize
      @group = []
    end

    def add_group &block
      @group << instance_eval(&block)
    end

    def label (text, style: nil, border: nil)
      @lbl = TextLabel.new(text)
      add_group {@lbl}
      @group
    end

    def vertical(style: nil, border: nil, &block)
      # puts "BEGIN VERTICAL"
      @partial = UI::Screen.compose &block
      @partial.map {|element| element << "\n"}
      #puts "partial edited = #{@partial}"
      @group << @partial
      #puts "group after vertical = #{@group.inspect}"
      pad_and_apply(border) if border
      # puts "END VERTICAL"
      @group
    end

    def horizontal(style: nil, border: nil, &block)
      @partial = UI::Screen.compose &block
      #@partial << "\n"
      @partial.map { |element| [element] }
      @group << @partial
      # puts "partial of horizontal = #{@partial.map { |element| [element] }}"
      # # @partial.each do |element| @group << [element] end
      # # @group << @partial.map { |element| [element] }
      # puts "group at horizontal = #{@group.inspect}"
      if @group[0][0].is_a? Array 
        then @group[0] = transpose(@group[0])
      end
      # puts "group after transpose = #{@group.inspect}"
      pad_and_apply(border) if border
      @group
    end

    def pad_and_apply(border)
      puts "BEGIN BORDER"
      elements = @group[0]
      # puts elements[0].remove_newline
      # puts elements.map{|element| element.remove_newline} #remove newlines at end
      elements = elements.map{|element| element.remove_newline}
      # puts elements[0]
      # puts elements.map {|element| [element, element.length].inspect}
      puts "elements = #{elements.inspect}"
      max_length = elements.max_by{|element| element.length}.length
      # puts "max_length = #{max_length}"

      # puts elements[0].pad(max_length)
      elements = elements.map {|element| [border + element.pad(max_length).to_s + border]}
      puts "group after border = #{@group.inspect}"
      @group
      # make all elements of @group strings
      # make them as long as the longest
      # map border to each
      # return group
      elements = elements.map{|element| element << "\n"}
      @group = [elements]
      @group
    end

    private

    def transpose(array)
      new_array = []
      (0..array.length-1).each do |index|
        new_array[index] = []
      end
      puts "new_array = #{new_array.inspect}"
      (0..array.length-1).each do |sub_array_index|
        array[sub_array_index].each_with_index do |element, index|
          new_array[index] << element.remove_newline
        end
      end
      new_array.map { |element| element << "\n" }
      puts "new_array after transpose = #{new_array.inspect}"
      new_array
    end

    def self.compose &block
      @screen = Screen.new
      @screen.instance_eval(&block)
    end

  end

  class TextLabel
    attr_reader :label

    def initialize(text:)
      @label = text
    end

    def inspect
      @label
    end

    def <<(string)
      @label << string
    end

    def remove_newline
      @label = @label.chop #check if end is newline?
      self
    end

    def to_s
      @label.to_s
    end

    def length
      @label.length
    end

    def pad(integer)
      white_space = integer - @label.length
      @label << " " * white_space
    end
  end
end
