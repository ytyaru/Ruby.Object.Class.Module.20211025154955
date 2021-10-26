#!/usr/bin/env ruby
# モジュールをクラスへMixinする
module M
  def m; :m; end
end
class C
  extend M
end
p C.ancestors
p C.singleton_class.ancestors
p C::m    #=> :m
p C.m     #=> :m
#p C.new.m #=> : undefined method `m' for #<C:0x024b0b68> (NoMethodError)

# extendと自クラスならextendが優先される
class D
  extend M
  def m; :d; end
end
p D.ancestors
p D.singleton_class.ancestors
p D::m    #=> :m
p D.m     #=> :m

class E
  def m; :e; end
  extend M
end
p E.ancestors
p E.singleton_class.ancestors
p E.new.singleton_class.ancestors
p E::m    #=> :m
p E.m     #=> :m

