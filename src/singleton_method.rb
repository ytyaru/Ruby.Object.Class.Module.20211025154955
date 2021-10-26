#!/usr/bin/env ruby
# インスタンスの特異メソッドを定義する
class C
  def m; p 'm'; end
end
p C.singleton_class
p C.singleton_class.ancestors
c = C.new
d = C.new
c.m
d.m
def d.m; p 'M'; end
p c.singleton_class
p c.singleton_class.ancestors
p d.singleton_class
p d.singleton_class.ancestors
c.m
d.m

# クラスの特異メソッドを定義する１
class D
  def D.m; :m; end
end
p D.singleton_class
p D.singleton_class.ancestors
p D::m
p D.m
#p D.new.m #=> undefined method `m' for #<D:0x00a3c2d8> (NoMethodError)

# クラスの特異メソッドを定義する２
class E
  def self.m; :m; end
end
p E.singleton_class
p E.singleton_class.ancestors
p E::m
p E.m
#p E.new.m #=> undefined method `m' for #<D:0x00a3c2d8> (NoMethodError)



