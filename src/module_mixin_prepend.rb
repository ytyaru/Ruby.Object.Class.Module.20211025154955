#!/usr/bin/env ruby
# モジュールをクラスへMixinする
module M
  def m; :m; end
end
class C
  prepend M
end
p C.ancestors
#p C.m     #=> undefined method `m' for C:Class (NoMethodError)
#p C::m    #=> undefined method `m' for C:Class (NoMethodError)
p C.new.m #=> :m

# 複数prependしたときは後にされたほうが優先される
module M
  def m; :m; end
end
module N
  def m; :n; end
end
class D
  prepend M
  prepend N
end
p D.ancestors
p D.new.m #=> :n

# prependと自クラスなら自クラスが優先される
module M
  def m; :m; end
end
class E
  def m; :c; end
  prepend M
end
p E.ancestors
p E.new.m #=> :c

# includeとprependならprependが優先される
class F
  prepend M
  include N
end
p F.ancestors
p F.new.m #=> :c

# includeとprependと自クラスならprependが優先される
class G
  prepend M
  include N
  def m; :c; end
end
p G.ancestors
p G.new.m #=> :c


