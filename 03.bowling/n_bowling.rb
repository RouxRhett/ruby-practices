#!/usr/bin/env ruby
# frozen_string_literal: true

# 値を受け取る
score = ARGV[0]
# 引数を配列に入れる
scores = score.split(',')
shots = []

# ストライク分を[10,0]に変換、その他も文字列から値に変換
scores.each do |s|
  if s == 'X' # strike
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

# 二次元配列に格納する(1フレーム[1投目,2投目],...),[[6, 3], [9, 0], [0, 3], [8, 2], [7, 3],...
frames = []
shots.each_slice(2) do |s|
  frames << s
end

point = 0
frames.each do |frame|
  point += if frame[0] == 10 # strike
             30
           elsif frame.sum == 10 # spare
             frame[0] + 10
           else
             frame.sum
           end
end
puts point
