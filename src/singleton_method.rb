#!/usr/bin/env ruby
# インスタンスの特異メソッドを定義する
class C
  def m; p 'm'; end
end
c = C.new
d = C.new
c.m
d.m
def d.m; p 'M'; end
c.m
d.m

# クラスの特異メソッドを定義する１
class D
  def D.m; :m; end
end
p D::m
p D.m
#p D.new.m #=> undefined method `m' for #<D:0x00a3c2d8> (NoMethodError)

# クラスの特異メソッドを定義する２
class E
  def self.m; :m; end
end
p E::m
p E.m
#p E.new.m #=> undefined method `m' for #<D:0x00a3c2d8> (NoMethodError)



