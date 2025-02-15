# class Foo 
#   attr_accessor :teste
#   def bar 
#     puts self 
#   end 
# end

# foo = Foo.new
# puts foo 
# foo.bar 

class Pen 
  attr_accessor :color 
  def pen_color
    puts "The color is " + self.color 
  end
end

pen = Pen.new
pen.color = "blue"
pen.pen_color

pen2 = Pen.new
pen2.color = "red"
pen2.pen_color

# class Foo
#   def self.bar
#     puts self 
#   end
# end

# Foo.bar


