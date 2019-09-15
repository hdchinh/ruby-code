#ADD METHOD IN SPECIAL OBJECT

class Bird
  def initialize(weight)
    @weight = weight
  end
end

special_bird = Bird.new(0.1)
def special_bird.set_color(color)
  @color = color
end

def special_bird.get_color
  @color
end

special_bird.set_color('yellow')
puts special_bird.get_color

#ADD METHOD IN SPECIAL CLASS

# same instance

#WIRTING CODE THAT WRITE CODE

#Module#define_method
#Object#instance_variable_set()
#Object#instance_variable_get()

class Cat
  PROPS = ["height", "weight", "hair_color", "blood_type", "age"]

  PROPS.each do |prop|
    define_method("set_#{prop}") do |val|
      instance_variable_set("@#{prop}", val)
    end

    define_method("get_#{prop}") do
      instance_variable_get("@#{prop}")
    end
  end
end

cat = Cat.new
cat.set_height('Milu')
puts cat.get_height


#ATTR_ACCESSOR

class SmartCat
  # built-in metaprograming
  attr_accessor(:height, :weight)
  attr_accessor(:color)
end

smart_cat = SmartCat.new
smart_cat.color = 'yellow'
puts smart_cat.color


#CUSTOME STRING

class String
  def new_method
    p "it's new instane method"
  end
end

"meocondilonton".new_method

#CUSTOME METHOD_MISSING

class LostMethod
  def method_missing(name, *args)
    puts "method name: #{name}"
    puts "args: #{args}"
  end
end

lm = LostMethod.new
lm.some_method(1, 2)

#MODULE INCLUDED
module A
  def A.included(mod)
    puts "#{self} included in #{mod}"
  end
end

module Enumerable
  include A
end

# Run first when include a module

# => example from https://ruby-doc.org/core-2.6.4/Module.html#method-i-included



# MODULE METHOD_ADDED
module Chatty
  def self.method_added(method_name)
    puts "Adding #{method_name.inspect}"
  end
  # def self.some_class_method() end
  def some_instance_method(); end

  def some_instance_method2(); end
end

# => example from https://ruby-doc.org/core-2.6.4/Module.html#method-i-included

#MODULE_EVAL, CLASS_EVAL, INSTANCE_VAL

class Thing

end

a = %q{def hello() "Hello there!" end}

Thing.instance_eval(a)

puts Thing.hello()

#SINGLETON METHOD

thing = Thing.new

def thing.new_method_for_thing
  p 'new method for thing'
end

thing.new_method_for_thing

# singleton method live in Eigenclasses
