#!/usr/bin/env ruby
module Name
  module M
    def m; :m; end
  end
end
class C; include Name::M; end
p C.new.m
