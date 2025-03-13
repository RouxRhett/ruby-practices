#!/usr/bin/env ruby

# ライブラリ
require 'date'
require 'optparse'

pick_today = Date.today
show_month = pick_today.month
show_year  = pick_today.year

opt = OptionParser.new

opt.on('-m [VAL]') do |v|
  if /^[0-9]+$/.match?(v)
    if 1 <= v.to_i && v.to_i <= 12
      # p "vは1~12"
      show_month = v.to_i
    else
      # p "vは1~12ちゃうで"
      puts __FILE__ + ': ' + v.to_s + ' is neither a month number (1..12) nor a name'
      exit 1
    end
  else
    # p "整数でない"
    puts __FILE__ + ': ' + v.to_s + ' is neither a month number (1..12) nor a name'
    exit 1
  end
end

opt.on('-y [VAL]') do |v|
  if /^[0-9]+$/.match?(v)
    if 0 < v.to_i && v.to_i < 10_000
      # p "vは1~9999"
      show_year = v.to_i
    else
      # p "vは1~9999ちゃうで"
      puts __FILE__ + ': year `' + v.to_s + "' not in range 1..9999"
      exit 1
    end
  else
    # p "整数でない"
    puts __FILE__ + ': year `' + v.to_s + "' not in range 1..9999"
    exit 1
  end
end

opt.parse!(ARGV)

show_cal = Date.new(show_year, show_month, pick_today.day)
check_today_exist = pick_today.year == show_cal.year && pick_today.month == show_cal.month
init_pos = show_cal.cwday # 初期位置判定に使う
cur_pos = init_pos # ループ用位置判定に使う
get_month_lastday  = Date.new(show_cal.year, show_cal.month, -1)

def day_print(today_exist, day, show)
  if today_exist == true && day == show.day
    print("\e[7m")
    print format('%2s', day)
    print("\e[0m")
  else
    print format('%2s', day)
  end
end
puts '      ' << show_cal.month.to_s << '月 ' << show_cal.year.to_s
puts '日 月 火 水 木 金 土  '

if init_pos != 7
  init_pos.times do
    print '   '
  end
end

(1..get_month_lastday.day).each do |i|
  if (cur_pos + 1) % 7 == 0
    day_print(check_today_exist, i, show_cal)
    puts '  '
  else
    day_print(check_today_exist, i, show_cal)
    print ' '
  end
  cur_pos += 1
end
puts ''
