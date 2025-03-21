#!/usr/bin/env ruby
# frozen_string_literal: true

# 値を受け取る
score = ARGV[0]
# 引数を配列に入れる
scores = score.split(',')
shots = []

FRAME = 9
FRAME_FOR_INDEX = FRAME - 1
THROW = 2
MAX_THROW = 3
TOTAL_MAX_THROW = FRAME * THROW + MAX_THROW

# ストライク分を[10,0]に変換、その他も文字列から値に変換
scores.each do |s|
  if s == 'X' # strike
    shots << 10
    shots << 0 if shots.size < FRAME * THROW # 1~9F時(1F=2count)
  else
    shots << s.to_i
  end
end

# 二次元配列に格納する(1フレーム[1投目,2投目],...),[[6, 3], [9, 0], [0, 3], [8, 2], [7, 3],...
frames = shots.each_slice(2).to_a

if shots.size == TOTAL_MAX_THROW
  frames[9].push(frames[10]).flatten!
  frames.pop
end

point = frames.each_with_index.sum do |frame, index|
  score_in_frame = 0
  if index != FRAME
    next_first_throw = frames[index + 1][0]
    if frame[0] == 10
      score_in_frame = if next_first_throw == 10 && index != FRAME_FOR_INDEX
                         next_first_throw + frames[index + 2][0]
                       else
                         next_first_throw + frames[index + 1][1]
                       end
    elsif frame.sum == 10
      score_in_frame = next_first_throw
    end
  end
  score_in_frame + frame.sum
end

puts point
