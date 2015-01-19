module UI

  class TextScreen

    def self.draw &block
      screen = Screen.new
      screen.instance_eval(&block)
      puts screen.render
      screen.render
    end
  end

  class Screen
    def initialize()
      @screen = ""
    end


    def render
      @screen+"\\n"
    end

    def label (text, style: nil, border: nil)
      label = TextLabel.new(text)
      @screen += label.to_s
    end

  end

  class TextLabel
    attr_reader :label

    def initialize(text:)
      @label = text
    end

    def to_s
      @label
    end
  end

end