#!/usr/bin/env ruby
# dateを使うために必要なライブラリ
require 'date'

pick_today = Date.today

# 挙動確認
print pick_today.year
print pick_today.month
print pick_today.day
p pick_today.cwday # 初期位置判定に使う
init_pos = pick_today.cwday # 初期位置判定に使う
cur_pos = init_pos # ループ用位置判定に使う
get_month_lastday  = Date.new(pick_today.year, pick_today.month, -1)

def day_print(day)
  print sprintf("%2s", day)
end

puts "日 月 火 水 木 金 土  "

if(init_pos != 7)
  init_pos.times do
    print "   "
  end
end

(1...get_month_lastday.day).each { |i|
  if((cur_pos+1)%7==0)
    day_print(i)
    puts "  "
  else
    day_print(i)
    print " "
  end
  cur_pos += 1
}

p get_month_lastday.day
=begin
❯ cal           
     March 2025       
Su Mo Tu We Th Fr Sa  
                   1  
 2  3  4  5  6  7  8  
 9 10 11 12 13 14 15  
16 17 18 19 20 21 22  
23 24 25 26 27 28 29  
30 31              
❯ cal -m 01
    January 2025      
Su Mo Tu We Th Fr Sa  
          1  2  3  4  
 5  6  7  8  9 10 11  
12 13 14 15 16 17 18  
19 20 21 22 23 24 25  
26 27 28 29 30 31
=end
