# frozen_string_literal: true

$INPUT = File.readlines('data/jolts.txt').map(&:to_i)
$INPUT.sort!
$ONES = 1
$THREES = 1

def star1
  (0..INPUT.length).each do |i|
    group = INPUT[i, 2]
    break if group[1].nil?

    $ONES += 1 unless group[1] - group[0] != 1
    $THREES += 1 unless group[1] - group[0] != 3
  end
  puts $ONES.to_s
  puts $THREES.to_s
end

def star2
    $pairs = []
    $sets = []
    $previous_pair = []
    $index = 0
    $beg = true
    find_pairs($INPUT)
    $pairs.length.times do
      find_set
    end
    values = []
    $sets.each do |x|
      values.push x.size
    end
    news = []
    values.each do |x|
      if x == 1
        news.push 1
      elsif x == 2
        news.push 1
      elsif x == 3
        news.push 2
      elsif x == 4
        news.push 4
      elsif x == 5
        news.push 7
      end
    end
    ans = news.inject(:*)
    puts ans
end
  
def find_pairs(input)
    (0..input.length).each do |i|
      pair = input[i, 2]
      diff = pair[1] - pair[0] unless pair[1].nil?
      $pairs.push(pair) if diff == 3
    end
end
  
def find_set
    pair = $pairs[$index]
    set = []
    $INPUT.each do |x|
      if x <= pair[0] && $beg == true
        set.push x
      end
      next if $index == 0
      if x <= pair[0] && x >= $previous_pair[1] && $beg == false
        set.push x
      end
    end
    $beg = false
    $previous_pair = pair
    $index += 1
    $sets.push set
end  

star2