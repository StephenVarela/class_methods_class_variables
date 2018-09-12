class MyClass

  def method1
    return method2
  end

  def method2
    return true
  end

  def method5(argu)
    return argu
  end

  def method6
    return method5(MyClass.method3)
  end

  def method4
    variable = MyClass.method3
    return variable
  end

  def self.method3
    return true
  end
end

me = MyClass.new
puts me.method1

puts me.method4

puts me.method6
