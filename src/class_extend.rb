#!/usr/bin/env ruby
# 親メソッドを呼ぶ
class C; def m; :m; end; end
class D < C; end
p D.new.m

# 自メソッドを呼ぶ
class E; def m; :m; end; end
class F < E; def n; :n; end; end
p F.new.n

# 同名なら自メソッドが呼ばれる
class G; def m; :m; end; end
class H < G; def m; :n; end; end
p H.new.m #=> :n
