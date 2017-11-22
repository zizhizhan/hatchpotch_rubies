# encoding: UTF-8

class AClass
  def self.inherited(*args)
    puts "#{args} #{__callee__} #{self}"
  end

  def ma; end
end

class BClass < AClass
  def self.inherited(*args)
    puts "#{args} #{__callee__} #{self}"
  end

  def mb; end
end

CClass = Class.new(BClass) do
  def mc; end
end

class CClass2 < BClass
  def mc; end
end

puts "CClass.ancestors = #{CClass.ancestors}"
puts "CClass2.ancestors = #{CClass2.ancestors}"







