#!/usr/bin/env ruby

# ライブラリ
require 'date'
require 'optparse'

current_date = Date.today
current_month = current_date.month
current_year  = current_date.year

opt = OptionParser.new

opt.on('-m [VAL]') do |v|
  if /^[0-9]+$/.match?(v)
    if v.to_i.positive? && v.to_i <= 12
      # p "vは1~12"
      current_month = v.to_i
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
    if v.to_i.positive? && v.to_i < 10_000
      # p "vは1~9999"
      current_year = v.to_i
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

calendar   = Date.new(current_year, current_month, current_date.day)

# 初期位置判定を表示月1日に指定するために定義
calendar_firstday = Date.new(calendar.year, calendar.month, 1)
calendar_lastday  = Date.new(calendar.year, calendar.month, -1)

def print_day(date)
  if date == Date.today
    print("\e[7m")
    print format('%2s', date.day)
    print("\e[0m")
  else
    print format('%2s', date.day)
  end
end
# 式展開に書き方を合わせた
puts "      #{calendar.month}月 #{calendar.year}"
puts '日 月 火 水 木 金 土  '

calendar_firstday.wday.times do
  print '   '
end


(calendar_firstday..calendar_lastday).each do |date|
  print_day(date)
  if date.saturday?
    puts '  '
  else
    print ' '
  end
end
puts ''
