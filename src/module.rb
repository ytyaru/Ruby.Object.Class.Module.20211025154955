#!/usr/bin/env ruby
module M; end
#module N < M; end #=>: syntax error, unexpected '<' (SyntaxError)class C; end
#M.new #=>: undefined method `new' for M:Module (NoMethodError)

module M
end

# 定数を定義する
module M
  MAX = 100
end
p M::MAX

# インスタンスメソッドを定義する
module M
  def m; :m; end
end
#p M::m    #=> undefined method `m' for M:Module (NoMethodError)
#p M.m     #=> undefined method `m' for M:Module (NoMethodError)
#p M.new.m #=> undefined method `m' for M:Module (NoMethodError)

# モジュール関数を定義する
module N
  def m; :m; end
  module_function :m
end
p N::m    #=> :m
p N.m     #=> :m
#p M.new.m #=> undefined method `new' for M:Module (NoMethodError)

# クラスメソッドを定義する
module O
  def O.m; :m; end
end
p O::m    #=> :m
p O.m     #=> :m
#p O.new.m #=> undefined method `new' for M:Module (NoMethodError)

module P
  def self.m; :m; end
end
p P::m    #=> :m
p P.m     #=> :m
#p P.new.m #=> undefined method `new' for M:Module (NoMethodError)

# 優先順位（同名のモジュール関数とクラス関数があったとき、先に呼ばれるのは後に定義したほうである）
module Q
  def self.m; :c; end
  def m; :m; end
  module_function :m
end
p Q.m #=> :m
module R
  def m; :m; end
  module_function :m
  def self.m; :c; end
end
p R.m #=> :c

