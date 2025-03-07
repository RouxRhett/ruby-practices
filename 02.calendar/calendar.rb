#!/usr/bin/env ruby
# dateを使うために必要なライブラリ
require 'date'

pick_today = Date.today

# 挙動確認
print pick_today.year
print pick_today.month
print pick_today.day
p pick_today.cwday # 初期位置判定に使う

get_month_lastday  = Date.new(pick_today.year, pick_today.month, -1)
(1...get_month_lastday.day).each { |i|
  p i
}

p get_month_lastday.day
