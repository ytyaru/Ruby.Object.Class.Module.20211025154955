#!/usr/bin/env ruby
module M; end
#module N < M; end #=>: syntax error, unexpected '<' (SyntaxError)class C; end
#M.new #=>: undefined method `new' for M:Module (NoMethodError)

module M
end
