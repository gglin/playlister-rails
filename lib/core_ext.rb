class ::Array

  # Enumerable.grep(pattern) only matches when pattern === element
  # Enhance functionality so that it also matches when element =~ pattern
  #    /abc/ === "abc" returns true
  #    However, "abc" === /abc/ returns false
  #    /abc/ =~ "abc"  &  "abc" =~ /abc/ will both find a match
  def grep2(pattern)
    self.select do |element|
      if pattern.class == element.class
        element == pattern
      else
        element =~ pattern
      end
    end
  end

  # returns an array of downcased names (string), given an array of objects
  def objects_to_names 
    self.collect{ |object| object.name.downcase }
  end

  # returns (filters) an array of objects from the original objects list, given an array of downcased names (strings)
  def names_to_objects(objects) 
    self.collect do |name|
      objects.detect{ |object| object.name.downcase == name } 
      # doesn't work properly if there are two of the same name, as this will always return the first result
    end
  end

  # returns an array of new objects, based on each element of the original array having that new object as a method name
  def objects_to_objects(new_object)
    self.collect{ |object| object.send(new_object) }
  end

end