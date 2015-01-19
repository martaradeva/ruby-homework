module UI

  class TextScreen

    def self.draw &block
      screen = Screen.new
      screen.instance_eval(&block)
      puts screen.render.inspect
      screen.render
    end
  end

  class Screen
    def initialize()
      @screen = []
    end

    def add_group &block
      @screen << [instance_eval(&block)]
      #@screen << element
      # add instance_eval so all added elements are executed beforehand?
    end

    def label (text, style: nil, border: nil)
      @lbl = TextLabel.new(text)
      #puts @lbl
      add_group {@lbl}
      #puts @screen.inspect
    end

    def vertical &block
      instance_eval(&block)
      @screen.map{|element| element << "\n" }
      #puts "*"
      puts @screen.inspect
    end

    def horizontal &block
      #@screen << [ yield ]
      instance_eval(&block)
      @screen = [ @screen]
      puts @screen.inspect
    end

    # def newline
    #   @screen << ["debug2"]
    # end

    def render
      @screen.flatten.join
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
      @label.to_s
    end

    # def newline
    #   @label = @label + "debug1"
    #   #returns screen hash with "\n"
    # end

  end
end
