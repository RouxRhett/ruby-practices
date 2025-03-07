#!/usr/bin/env ruby
# 1から20までの数をプリントするプログラムを書け。ただし3の倍数のときは数の代わりに｢Fizz｣と、5の倍数のときは｢Buzz｣とプリントし、3と5両方の倍数の場合には｢FizzBuzz｣とプリントすること。

(1..20).each{ |i|
  if(i % 15 == 0)
    puts 'FizzBuzz'
  elsif(i % 3 == 0)
    puts 'Fizz'
  elsif(i % 5 == 0)
    puts 'Buzz'
  else
    puts i
  end
}