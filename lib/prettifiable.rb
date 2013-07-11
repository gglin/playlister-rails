module Prettifiable
  module InstanceMethods

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