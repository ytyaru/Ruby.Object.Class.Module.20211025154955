#!/usr/bin/env ruby
class C
  class << self
    def m; :M; end
  end
end
p C::m
p C.m
#p C.new.m #=> undefined method `m' for #<C:0x00804f18> (NoMethodError)

class D; def m; :d; end; end
class << D
  def m; :M; end
end
p D::m    #=> M
p D.m     #=> M
p D.new.m #=> d

class E; def self.m; :e; end; end
class << E
  def m; :M; end
end
p E::m #=> M
p E.m  #=> M
#p E.new.m #=> undefined method `m' for #<E:0x01e8fe38> (NoMethodError)

