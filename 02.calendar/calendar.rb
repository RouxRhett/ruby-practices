#!/usr/bin/env ruby

# ライブラリ
require 'date'
require 'optparse'

pick_today = Date.today
show_month = pick_today.month
show_year  = pick_today.year

opt = OptionParser.new

opt.on('-m [VAL]') {|v|
  if(v =~ /^[0-9]+$/)
    if(1 <= v.to_i && v.to_i <= 12)
      # p "vは1~12"
      show_month = v.to_i
    else
      # p "vは1~12ちゃうで"
      puts __FILE__ + ": " + v.to_s + " is neither a month number (1..12) nor a name"
      exit 1
    end
  else
    # p "整数でない"
    puts __FILE__ + ": " + v.to_s + " is neither a month number (1..12) nor a name"
    exit 1
  end
}

opt.on('-y [VAL]') {|v|
  if(v =~ /^[0-9]+$/)
    if(0 < v.to_i && v.to_i < 10000)
      # p "vは1~9999"
      show_year = v.to_i
    else
      # p "vは1~12ちゃうで"
      puts __FILE__ + ": year `" + v.to_s + "' not in range 1..9999"
      exit 1
    end
  else
    # p "整数でない"
    puts __FILE__ + ": year `" + v.to_s + "' not in range 1..9999"
    exit 1
  end
}

opt.parse!(ARGV)

show_cal = Date.new(show_year, show_month, pick_today.day)

init_pos = show_cal.cwday # 初期位置判定に使う
cur_pos = init_pos # ループ用位置判定に使う
get_month_lastday  = Date.new(show_cal.year, show_cal.month, -1)

def day_print(day)
  print ("\e[7m")
  print sprintf("%2s", day)
  print ("\e[0m")
end
puts "      " << show_cal.month.to_s << "月 " << show_cal.year.to_s
puts "日 月 火 水 木 金 土  "

if(init_pos != 7)
  init_pos.times do
    print "   "
  end
end

(1..get_month_lastday.day).each { |i|
  if((cur_pos+1)%7==0)
    day_print(i)
    puts "  "
  else
    day_print(i)
    print " "
  end
  cur_pos += 1
}
