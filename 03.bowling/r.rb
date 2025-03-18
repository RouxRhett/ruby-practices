test = [[10, 977], [9, 0], [0, 3], [8, 2], [9, 3, 8]]

po = test.each_with_index.sum do |tes, index|
  p index
  if tes[0] == 100
    tes[0]
  else
    tes.sum
  end
end

p po
