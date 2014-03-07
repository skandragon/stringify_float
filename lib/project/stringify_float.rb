module StringifyFloat
  def self.included(base)
    base.extend StringifyFloat::ClassMethods
  end

  module ClassMethods
    def stringify_float(name, opts = {})
      opts = {
        precision: 2,
      }.merge(opts)

      precision = opts[:precision]
      multiplier = 10 ** precision

      name_titleized = name.to_s.dup
      name_titleized[0] = name_titleized[0].upcase

      define_method("stringified#{name_titleized}") do
        value = send("#{name}")
        if value
          value = value.to_i
          "#{value / multiplier}.#{'%02d' % (value % multiplier)}"
        else
          ""
        end
      end

      define_method("stringified#{name_titleized}=") do |newValue|
        newValue = newValue.to_s
        if newValue.nil? or newValue.length == 0
          value = nil
        else
          int_string, fraction_string = newValue.split('.')
          value = int_string.to_i * multiplier
          if fraction_string
            fraction_string += "0" while fraction_string.length < precision
            fraction = fraction_string[0..(precision - 1)].to_i
            value += fraction
          end
        end
        send("#{name}=", value)
      end
    end
  end
end
