#!/usr/bin/env ruby
class C; end

class C
end

class C
  def initialize
    p 'コンストラクタ'
  end
end
C.new

class C; def m; :m; end; end
#C::m #=> undefined method `m' for C:Class (NoMethodError)
#C.m  #=> undefined method `m' for C:Class (NoMethodError)
p C.new.m

class C
  def m; :m; end
end

class C
  def m
    :m
  end
end

class C
  def m
    :m
  end
end






