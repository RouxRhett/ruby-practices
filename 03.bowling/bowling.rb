#!/usr/bin/env ruby
# frozen_string_literal: true

# 値を受け取る
score = ARGV[0]
# 引数を配列に入れる
scores = score.split(',')
shots = []
# 1F1T Start
throw_count = 0

# ストライク分を[10,0]に変換、その他も文字列から値に変換
scores.each do |s|
  if s == 'X' # strike
    shots << 10
    if throw_count < 18 # 1~9F時(1F=2count)
      shots << nil
      throw_count += 1
    end
  else
    shots << s.to_i
  end
  throw_count += 1
end
p throw_count
p shots
# 二次元配列に格納する(1フレーム[1投目,2投目],...),[[6, 3], [9, 0], [0, 3], [8, 2], [7, 3],...
frames = []
shots.each_slice(2) do |s|
  frames << s
end
p frames
if(throw_count == 21)
  p "10Fは3投"
  frames[9].push(frames[10]).flatten!
  frames.pop
  p frames
end

# point = 0
# frames.each do |frame|
#   point += if frame[0] == 10 # strike
#              30
#            elsif frame.sum == 10 # spare
#              frame[0] + 10
#            else
#              frame.sum
#            end
# end
# puts point
