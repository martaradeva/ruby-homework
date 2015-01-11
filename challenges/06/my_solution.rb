class Module

  def attr_initializer(*field_names)
    begin
      self.class_eval do
        define_method :initialize do |*values|
          if field_names.length == values.length
            hash = Hash[field_names.zip(values)]
            hash.each{ |field, value| instance_variable_set("@#{field}", value) }
          else raise ArgumentError, "wrong number of arguments (#{values.length} for #{field_names.length})"
          end
        end
      end
    end
  end

end
