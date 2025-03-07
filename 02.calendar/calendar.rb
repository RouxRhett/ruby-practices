#!/usr/bin/env ruby
require 'date'
# 
puts "e"
pick_today = Date.today
p pick_today.year
p pick_today.day
p pick_today.month

get_month_firstday = Date.new(pick_today.year, pick_today.month, 1)
get_month_lastday  = Date.new(pick_today.year, pick_today.month, -1)
show_cal = get_month_lastday - get_month_firstday

p show_cal

d1 = Date.new(2022, 3, 14)
d2 = Date.new(2022, 6, 8)

# Rational?から整数に変える
puts (d2 - d1).class
