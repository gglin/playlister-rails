module Prettifiable
  module InstanceMethods

    def sort_name()
      if name[0..3].downcase == "the "
        "#{name[4..-1]}, The"
      else
        name
      end
    end

    def spacer(name, width = nil)
      self.class.spacer(name, width)
    end

  end

  module ClassMethods

    def longest_name_length(categories)
      max = 0
      categories.each do |category|
        max = category.name.length if category.name.length > max
      end
      max + 1
    end

    def spacer(name, width = nil)
      width = name.length + 1 if width.nil?
      "#{name}                                                                                   "[0,width]
    end

  end
end