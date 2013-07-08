module Sluggable
  module InstanceMethods

    def to_param
      self.id
    end

    def slug
      self.name.downcase.strip.gsub(/(\s|\\|\/)/, "-")
    end
    
  end

  module ClassMethods

    def find_by_slug(slug)
      all.detect{|a| a.slug == slug}
    end

  end
end