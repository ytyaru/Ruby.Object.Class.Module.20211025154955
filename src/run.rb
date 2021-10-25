#!/usr/bin/env ruby
module M
  def m; :mi; end
  def self.m; :mc; end
end
module N
  def m; :ni; end
  def self.m; :nc; end
end
module O
  def m; :oi; end
  def self.m; :oc; end
end
class C
  def m; :c; end
  def self.m; :cc; end
end
class D < C
  prepend M
  include N
  extend O
  def m; :d; end
  def self.m; :cd; end
end
p C.ancestors
p C::m
p C.m
p C.new.m
p D.ancestors
p D::m
p D.m
p D.new.m
d = D.new
e = D.new
p d.singleton_class.ancestors
p e.singleton_class.ancestors
p d.m
p e.m
def e.m; :e; end
p e.singleton_class.ancestors
p d.m
p e.m
#p e.singleton_class.ancestors[0].methods
#p e.singleton_class.ancestors[0].method :m
#p (e.singleton_class.ancestors[0].method :m).call
#p (e.singleton_class.method :m).call
#e::m
e.extend O
p e.singleton_class.m
p e.singleton_class.ancestors

