#!/usr/bin/env ruby
# モジュールをクラスへMixinする
module M
  def m; :m; end
end
class C
  include M
end
p C.ancestors
#p C.m     #=> undefined method `m' for C:Class (NoMethodError)
#p C::m    #=> undefined method `m' for C:Class (NoMethodError)
p C.new.m #=> :m

# 複数includeしたときは後にされたほうが優先される
module M
  def m; :m; end
end
module N
  def m; :n; end
end
class D
  include M
  include N
end
p D.ancestors
p D.new.m #=> :n

# includeと自クラスなら自クラスが優先される
module M
  def m; :m; end
end
class E
  include M
  def m; :c; end
end
p E.ancestors
p E.new.m #=> :c

class F
  def m; :c; end
  include M
end
p F.ancestors
p F.new.m #=> :c
