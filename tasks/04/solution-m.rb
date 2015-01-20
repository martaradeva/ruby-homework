module UI

  class TextScreen

    def self.draw &block
      @screen = Screen.new
      @screen.instance_eval(&block)
      @screen.group[0] = @screen.group[0].map{|element| [ element, "\n" ] }
      puts "screen.group in render = #{@screen.group.inspect}"
      @screen.group.flatten.join
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
      puts "group when label = #{@group.inspect}"
      @group
    end

    def vertical &block
      @partial = UI::Screen.compose &block
      puts "partial of vertical = #{@partial.inspect}"
      @group << @partial#.map{|element| [ element, "\n" ] }
      puts "group after vertical = #{@group.inspect}"
      @group
    end

    def horizontal &block
      @partial = UI::Screen.compose &block
      #@partial << "\n"
      @partial.map { |element| [element] }
      @group << @partial
      puts "partial of horizontal = #{@partial.map { |element| [element] }}"
      #@partial.each do |element| @group << [element] end
      #@group << @partial.map { |element| [element] }
      puts "group at horizontal = #{@group.inspect}"
      if @group[0][0].is_a? Array 
        then @group[0] = transpond(@group[0])
      end
      puts "group after transpond = #{@group.inspect}"
      @group
    end

    def transpond(array)
      new_array = []
      (0..array.length-1).each do |index|
        new_array[index] = []
      end
      puts "new_array = #{new_array.inspect}"
      (0..array.length-1).each do |sub_array_index|
        array[sub_array_index].each_with_index do |element, index|
          new_array[index] << element
        end
      end
      puts "new_array after transpond = #{new_array.inspect}"
      new_array
    end

    # def transpond(array)
    #   new_array = []
    #   (0..array[0].length-1).each do |sub_array|
    #       transpond_element = []
    #       (0..array.length-1).each do |index|
    #           transpond_element << sub_array[index]
    #         end
    #       new_array << transpond_element
    #     end
    #   new_array
    # end

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
      @label.to_s
    end

    def to_s
      # puts @label.to_s
      @label.to_s
    end

  end
end
