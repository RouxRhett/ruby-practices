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
      puts "#{__FILE__}: #{v} is neither a month number (1..12) nor a name"
      exit 1
    end
  else
    # p "整数でない"
    puts "#{__FILE__}: #{v} is neither a month number (1..12) nor a name"
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
      puts "#{__FILE__}: year `#{v}' not in range 1..9999"
      exit 1
    end
  else
    # p "整数でない"
    puts "#{__FILE__}: year `#{v}' not in range 1..9999"
    exit 1
  end
end

opt.parse!(ARGV)

display_calendar   = Date.new(show_year, show_month, pick_today.day)
check_today_exist  = pick_today.year == display_calendar.year && pick_today.month == display_calendar.month

# 初期位置判定を表示月1日に指定するために定義
get_month_firstday = Date.new(display_calendar.year, display_calendar.month, 1)
get_month_lastday  = Date.new(display_calendar.year, display_calendar.month, -1)
init_pos = get_month_firstday.cwday # 初期位置判定に使う

def print_day(today_exist, day, show)
  if today_exist == true && day == show.day
    print("\e[7m")
    print format('%2s', day)
    print("\e[0m")
  else
    print format('%2s', day)
  end
end
# 式展開に書き方を合わせた
puts "      #{display_calendar.month}月 #{display_calendar.year}"
puts '日 月 火 水 木 金 土  '

if init_pos != 7
  init_pos.times do
    print '   '
  end
end

(get_month_firstday..get_month_lastday).each do |date|
  print_day(check_today_exist, date.day, display_calendar)
  if date.saturday?
    puts '  '
  else
    print ' '
  end
end
puts ''
