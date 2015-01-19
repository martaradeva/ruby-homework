module UI

  class TextScreen

    def self.draw &block
      screen = Screen.new
      screen.instance_eval(&block)
      #puts screen.render.inspect
      screen.render
    end
  end

  class Screen
    def initialize()
      @screen = []
    end

    def horizontal &block
      yield
      @screen = [@screen, "\n"]
      #puts @screen.inspect
      #@screen << [@screen]
      #@screen = [] << @screen
      #@screen = [@screen.shift, @screen]
    end

    def vertical &block
      yield
      #@screen.map! {|group| [group, "\n"]}#.flatten!.pop

      #puts @screen.inspect
      # #@screen = [@screen, "\n"]

      length = @screen.length - 1
      separators = Array.new(length, ["\n"])
      @screen = @screen.zip(separators)
      puts @screen.inspect
    end

    def render
      @screen.join
    end

    def label (text, style: nil, border: nil)
      label = TextLabel.new(text)
      #@screen << [label.label]
      @screen << label.label
      #puts @screen.inspect
    end

  end

  # class Group

  #   def initialize(&block)
  #     @group = []
  #     yield
  #     @group = @label
  #   end
  # end

  class TextLabel
    attr_reader :label

    def initialize(text:)
      @label = text
    end

  end

    def border #border will be defined as a patch of method_missing
    end

    def style # style will be defined as a patch of method_missing
    end

end
######################
# foo.bar(42)

# method_missing(:bar, 42)

# class BasicObject
#   def method_missing(method_name, *arguments, &block)
#     message = "undefined local variable or method `#{method_name}' for #{inspect}:#{self.class}"
#     raise NoMethodError, message
#   end
# end

# respond_to_missing?

# puts global_variables.map { |var| var.to_s.ljust(16) }
#                      .each_slice(4)
#                      .map { |vars_per_line| vars_per_line.join(' ') }
#                      .join("\n")

#Method#receiver
