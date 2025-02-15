class Fish
  def method_missing(method_name) 
    puts "Fish don't have #{method_name} behavior"
  end

  def swim
    puts "Fish is swimming"
  end 
end

Fish = Fish.new
Fish.swim 
Fish.walk

