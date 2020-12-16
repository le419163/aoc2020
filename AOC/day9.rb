# frozen_string_literal: true

def check_valid(input, value)
  combo = input.combination(2).to_a
  combo.select { |n| n.sum == value }.any?
end

def xmas_parser(input, preample)
  input.each_with_index do |v, i|
    next if i < preample
    return v unless check_valid(input[i - preample, preample], v)
  end
end

def star_1
  p "#{xmas_parser(INPUT, 25)} is the invalid number"
end

def group_checker(input, value, size)
  (0..input.length).each do |i|
    group = input[i, size]
    return group if input[i, size].sum == value
  end
  []
end

def encryption_weakness(input, goal)
  (2..20).each do |n|
    output = group_checker(input, goal, n)
    if output.any?
      output.sort!
      return output.first + output.last
    end
  end
end

def star_2
  p "#{encryption_weakness(INPUT, $goal)} is the encryption weakness"
end

$goal = 1_639_024_365

INPUT = [].freeze
File.readlines('xmas.txt').each do |line|
  INPUT << line.chomp.to_i
end

star_1
star_2
