#!/usr/bin/env ruby
# dateを使うために必要なライブラリ
require 'date'

pick_today = Date.today

# 挙動確認
p pick_today.year
p pick_today.day
p pick_today.month


get_month_lastday  = Date.new(pick_today.year, pick_today.month, -1)
for(1..get_month_lastday.today) do |i|
  p i
end

p get_month_lastday.day
