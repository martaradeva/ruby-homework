module UI

  class TextScreen

    # def self.draw &block
    #   compose &block
    #   puts "screen to render = #{@screen.group.inspect}"
    #   @screen.render
    # end

    # def self.compose &block
    #   @screen = Screen.new
    #   @screen.instance_eval(&block)
    #   #puts "screen.group in compose = #{@screen.group.inspect}"
    # end
    # def initialize
    #   @screen = Screen.new
    # end

    def self.draw &block
      @screen = Screen.new
      @screen.instance_eval(&block)
      puts "screen.group in render = #{@screen.group.inspect}"
      @screen.group.flatten.join
    end


  end

  class Screen
    attr_accessor :group

    def initialize()
      # @screen = []
      @group = []
    end

    def add_group &block
      @group << instance_eval(&block)
      #
      #@screen << element
      # add instance_eval so all added elements are executed beforehand?
    end

    def label (text, style: nil, border: nil)
      @lbl = TextLabel.new(text)
      #puts @lbl.label
      add_group {@lbl}
      puts "group when label = #{@group.inspect}"
      @group
      #puts @screen.inspect
    end

    def vertical &block
      @partial = UI::Screen.compose &block
      puts "partial of vertical = #{@partial.inspect}"
      @group = @partial.map{|element| [ element, "\n" ] }
      puts "group after vertical = #{@group.inspect}"
      @group
    end

    def horizontal &block
      @partial = UI::Screen.compose &block
      puts "partial of horizontal = #{@partial.inspect}"
      @partial << "\n"
      @group << @partial
      puts "group after horizontal = #{@group.inspect}"
      @group
    end

    def self.compose &block
      @screen = Screen.new
      @screen.instance_eval(&block)
      #puts "screen.group in compose = #{@screen.group.inspect}"
    end

    # def render
    #   puts "group.inspect = #{@group.inspect}"
    #   puts "group.flatten = #{@group.flatten.inspect}"
    #   @group.flatten.join
    # end
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
