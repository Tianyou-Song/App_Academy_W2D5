class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each.with_index do |b, idx|
      sum += b.ord * idx
    end
    sum
  end
end

class String
  def hash
    sum = 0
    self.each_byte.with_index do |b, idx|
      sum += b * idx
    end
    sum
  end
  
  # def hash 
  #   self.chars.reduce do |acc, el|
  #     acc = acc.ord ^ el.ord
  #   end 
  # end 
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0 
    self.keys.map {|el| el.to_s}.each do |b|
      sum += b.ord
    end
    self.values.map {|el| el.to_s}.each do |b|
      sum += b.ord
    end
    sum
  end
  
  # def hash 
  #   self.keys.reduce do |acc, el|
  #     acc = acc ^ el
  #   end 
  # end 
end
