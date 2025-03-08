#!/usr/bin/env ruby

# ライブラリ
require 'date'
require 'optparse'

pick_today = Date.today
show_month = pick_today.month
show_year  = pick_today.year
m_na_flag  = false
y_na_flag  = false

opt = OptionParser.new

opt.on('-m [VAL]') {|v|
  if(v =~ /^[0-9]+$/)
    if(1 <= v.to_i && v.to_i <= 12)
      # p "vは1~12"
      show_month = v.to_i
    else
      # p "vは1~12ちゃうで"
      m_na_flag = true
    end
  else
    # p "整数でない"
    m_na_flag = true
  end
}

opt.on('-y [VAL]') {|v|
  if(v =~ /^[0-9]+$/)
    if(0 < v.to_i && v.to_i < 10000)
      # p "vは1~9999"
      show_year = v.to_i
    else
      # p "vは1~12ちゃうで"
      y_na_flag = true
    end
  else
    # p "整数でない"
    y_na_flag = true
  end
}

opt.parse!(ARGV)


show_cal = Date.new(show_year, show_month, pick_today.day)

init_pos = show_cal.cwday # 初期位置判定に使う
cur_pos = init_pos # ループ用位置判定に使う
get_month_lastday  = Date.new(show_cal.year, show_cal.month, -1)

def day_print(day)
  print sprintf("%2s", day)
end
puts "      " << show_cal.month.to_s << "月 " << show_cal.year.to_s
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
❯ cal -m 12
      12月 2025
日 月 火 水 木 金 土
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31           
❯ cal
      3月 2025
日 月 火 水 木 金 土
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
=end
