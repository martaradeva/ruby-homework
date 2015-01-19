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

    def horizontal &block
      # define horizontal here
    end

    def vertical &block
      # define vertical here
      # make sure all strings are padded to max length
      #use instance_variable_set ?? add \n
      #ObjectSpace.each_object(String)
    end

    def render
      @screen+"\n"
    end

    def label (text, style: nil, border: nil)
      label = TextLabel.new(text)
      @screen += label.label
    end

  end

  class TextLabel
    attr_reader :label

    def initialize(text:)
      @label = text
    end

  end

    def border #border will be defined as a patch of method_missing
    end

    def style # style will be defined as a patch of method_missing
      # define label here
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

