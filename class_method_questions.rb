class MyClass
@@temp_var = "Hello"

  def initialize
    @greeting = ''
  end

  def greeting
    return @greeting
  end

  def greeting=(greeting)
    @greeting = greeting
  end


  def self.get_greeting
    return @@temp_var
  end

  def set_greeting
    self.greeting=(MyClass.get_greeting)
  end

end


class MyClass2
@@temp_var = "Hello"

  def initialize
    @greeting = ''
  end

  def greeting
    return @greeting
  end

  def set_my_greeting(greeting)
    @greeting = greeting
  end


  def self.get_greeting
    return @@temp_var
  end

  def set_greeting
    set_my_greeting(MyClass2.get_greeting)
  end

end



puts "with setter syntax"
me = MyClass.new
puts me.greeting
me.set_greeting
puts me.greeting

puts "without setter syntax"
myself = MyClass2.new
puts myself.greeting
myself.set_greeting
puts myself.greeting
