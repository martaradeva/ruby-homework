module UI

  class TextScreen

    def self.draw &block
      @screen = Screen.new
      @screen.instance_eval(&block)
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
      @group << @partial.map{|element| [ element, "\n" ] }
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
