#frozen_string_literal: true

When(/^I try to find 2020 with (.*)$/) do |list|
  list = list.split(',')
  length = list.size
  list.each do |x|
    target = 2020 - x.to_i
    puts target
    next unless list.include?(target.to_s)

    puts "Numbers are: #{x}, #{target}"
    final_number = x.to_i * target.to_i
    puts "Final number: #{final_number}"
  end
end

When(/^I try to find bad passwords with (.*)$/) do |list|
  list = list.split(',')

  goods = 0

  list.each do |x|
    data = x.split(' ')
    count = data[0].split('-')
    letter = data[1].tr(':', '')
    password = data[2]
    puts "Count: #{count}, Letter: #{letter}, Password: #{password}"

    spot1 = count[0].to_i - 1
    spot2 = count[1].to_i - 1

    letter1 = password[spot1]
    letter2 = password[spot2]

    puts letter1.to_s
    puts letter2.to_s

    next if letter1 == letter2

    if (letter1 == letter) && (letter2 != letter)
      goods += 1
      puts 'add 1'
    end

    if (letter1 != letter) && (letter2 == letter)
      goods += 1
      puts 'add 1'
    end
    # present_amount = password.count(letter)
    #
    # puts present_amount
    # if (present_amount >= count[0].to_i) && (present_amount <= count[1].to_i)
    #   puts "This password is valid."
    #   goods += 1
    # end
  end

  puts("Total goods: #{goods}")
end

When(/^I try to sled map (.*)$/) do |file|
  map = File.readlines(file).map(&:chomp)
  map2 = []
  map.each do |i|
    x = i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i + i
  end
  map2.map! {|line| line.split("") }
  position = 2
  total_trees = 0
  map2.each_with_index do |line, i|
    if i <= 1
      # puts i
      hit = line[position - 1]
      total_trees += 1 if (hit.eql? '#') && (i == 1)
    elsif (i > 1) && (i <= 322)

      if i.odd?
        position += 1
        next
      end
      hit = line[position - 1]
      # puts ("#{i} : #{hit}")
      total_trees += 1 if (hit.eql? '#')
    end
  end
  # map2.each_with_index do |line, i|
  #   position +=4
  #   hit = line[position-1]
  #   if hit.eql? '#'
  #     total_trees += 1
  #   end
  # end

  # map2.each_with_index do |line, i|
  #   print "Line= #{i+1}"
  #   if (i >= 3) && (i.even?)
  #     hit = line[position]
  #     print ", Hit at position #{position} is= #{hit}"
  #     position += 1
  #     if hit.eql? '#'
  #       total_trees += 1
  #     end
  #   end
  # end
  puts total_trees
end

When(/^I try bypass airport security with passports from (.*)$/) do |file|
  book = File.read(file)

  pp_array = book.split("\n\n")
  pp2 = []
  pp_array.each do |i|
    x = i.gsub("\n", " ")
    pp2.push x
  end

  pp3 = []
  pp2.each do |i|
    x = i.split(" ")
    pp3.push x
  end
  puts pp3

  pp4 = []
  pp3.each do |i|
    if i.size < 7
      next
    elsif i.size == 7
      check_byr = false
      check_iyr = false
      check_eyr = false
      check_hgt = false
      check_hcl = false
      check_ecl = false
      check_pid = false
      i.each do |x|
        check_byr = true if x.include? "byr"
        check_iyr = true if x.include? "iyr"
        check_eyr = true if x.include? "eyr"
        check_hgt = true if x.include? "hgt"
        check_hcl = true if x.include? "hcl"
        check_ecl = true if x.include? "ecl"
        check_pid = true if x.include? "pid"
      end
      pp4.push(i) if check_byr == true && check_iyr == true && check_eyr == true && check_hgt == true && check_hcl == true && check_ecl == true && check_pid == true
    else
      pp4.push(i)
    end
  end
  puts pp4
  puts pp4.size

  pp5 = []
  pp4.each do |i|
    if i.size < 7
      next
    elsif (i.size == 7) || (i.size == 8)
      check_byr = false
      check_iyr = false
      check_eyr = false
      check_hgt = false
      check_hcl = false
      check_ecl = false
      check_pid = false
      i.each do |x|
        if x.include? "byr"
          y = x.split(":")
          check_byr = true if (y[1].to_i >= 1920) && (y[1].to_i <= 2002)
        end
        if x.include? "iyr"
          y = x.split(":")
          check_iyr = true if (y[1].to_i >= 2010) && (y[1].to_i <= 2020)
        end
        if x.include? "eyr"
          y = x.split(":")
          check_eyr = true if (y[1].to_i >= 2020) && (y[1].to_i <= 2030)
        end
        if x.include? "hgt"
          y = x.split(":")
          if y[1].include? "cm"
            y[1].gsub("cm", "")
            check_hgt = true if (y[1].to_i >= 150) && (y[1].to_i <= 193)
          elsif y[1].include? "in"
            y[1].gsub("in", "")
            check_hgt = true if (y[1].to_i >= 59) && (y[1].to_i <= 76)
          end
        end
        if x.include? "hcl"
          y = x.split(":")
          z = y[1].to_s
          if z[0] == "#"
            check_hcl = true if z.length == 7
          end
        end
        if x.include? "ecl"
          y = x.split(":")
          z = y[1].to_s
          check_ecl = true if (z == 'amb') || (z == 'blu') || (z == 'brn') || (z == 'gry') || (z == 'grn') || (z == 'hzl') || (z == 'oth')
        end
        if x.include? "pid"
          y = x.split(":")
          z = y[1]
          if z.to_i >= 0 && z.to_i <= 999999999
            check_pid = true if z.to_s.length == 9
          end
        end
      end
      pp5.push(i) if check_byr == true && check_iyr == true && check_eyr == true && check_hgt == true && check_hcl == true && check_ecl == true && check_pid == true
    else
      puts ('wrong length')
    end
  end
  puts pp5
  puts pp5.size
end

When(/^find seating with (.*)$/) do |file|
  seating_chart = File.read(file)
  seating_array = seating_chart.split("\n")
  seating_array2 = []
  seating_array.each do |i|
    arr = i.split("")
    seating_array2.push arr
  end

  row_assignments = []
  seat_assignments = []
  seating_array2.each do |i|
    row = 0..127
    row_array = row.to_a
    seat = 0..7
    seat_array = seat.to_a
    s = 4
    r = 64
    i.each do |x|
      if x == 'F'
        row_array = row_array.first(r)
        r /= 2
      elsif x == 'B'
        row_array = row_array.last(r)
        r /= 2
      elsif x == 'L'
        seat_array = seat_array.first(s)
        s /= 2
      elsif x == 'R'
        seat_array = seat_array.last(s)
        s /= 2
      end
    end
    row = row_array[0]
    row_assignments.push row
    seat = seat_array[0]
    seat_assignments.push seat
  end

  decoded_seats_array = []
  row_assignments.each_with_index do |x, i|
    array = [x, seat_assignments[i]]
    decoded_seats_array.push array
  end

  b = decoded_seats_array.sort
  b = b.drop(2)

  puts b
  count = 0
  number_count = 1
  bad = []
  b.each do |x|
    count += 1 if x[0] == number_count
    if count == 8
      number_count += 1
      count = 0
    end
  end
  puts bad
  id_array = []
  decoded_seats_array.each do |x|
    n = ((x[0].to_i) * 8) + (x[1].to_i)
    id_array.push n
  end

  final_array = []
  decoded_seats_array.each_with_index do |x, i|
    n = [x[0], x[1], id_array[i]]
    final_array.push n
  end
  # puts final_array

  s = final_array.sort
  puts s
  # seat_check = []
  # row_check = []
  # row_assignments.each do |x|
  #   if row_check.include? x
  #     # do nothing
  #   else
  #     row_check.push x
  #   end
  # end
  # sss = row_assignments.sort
  # puts sss
end

When(/^collect answers from (.*)$/) do |file|
  answers = File.read file
  answers = answers.split "\n\n"
  # unique_answers = []
  # count_per_group = []
  # total_yes_count = 0
  # answers.each do |x|
  #   x = x.gsub("\n", "")
  #   x = x.split("")
  #   a = x.uniq
  #   unique_answers.push a
  #   count_per_group.push a.size
  #   total_yes_count += a.size
  # end
  # puts total_yes_count

  part2 = []
  answers.each do |x|
    a = x.split("\n")
    part2.push a
  end
  puts part2
  part3 = []

  part2.each do |x|
    a = []
    x.each do |i|
      i = i.split("")
      a.push i
    end
    part3.push a
  end
  puts part3

  part4 = []
  part3.each do |x|
    x = x.inject(:'&')
    part4.push x
  end
  puts part4
  part5 = []
  part4.each do |x|
    part5.push x.size
  end
  puts part5

  final_sum = 0
  part5.each do |x|
    final_sum += x
  end
  puts final_sum
end

When(/^find gold bags from (.*)$/) do |file|
  rules = File.read file
  rules = rules.split("\n")
  bags_with_shiny = []
  first_level_bags = []
  second_levl_bags = []
  third_level_bags = []
  fourth_level_bags = []
  fifth_level_bags = []
  six_level_bags = []
  seven_level_bags = []
  eight_level_bags = []
  nine_level_bags = []
  ten_level_bags = []
  eleven_level_bags = []
  twelve_level_bags = []
  thirteen_level_bags = []

  gold_bag = ""
  rules.each do |i|
    i = i.gsub(".", "")
    if i.include?("shiny gold")
      x = i.split(" ")
      container = x[0] + " " + x[1]
      if container == "shiny gold"
        gold_bag = i
        next
      end
      bags_with_shiny.push i
      first_level_bags.push container
    end
  end

  parsed_rules = Hash.new
  rules.each do |rule|
    parsed_rules[breakdown_rule(rule)] = breakdown_colors(rule)
  end
  # puts parsed_rules
  color = 'shiny gold'
  color_values = []
  color_hash = Hash.new

  # answer = recursion(parsed_rules,'shiny gold')
  # puts answer
  ########### WORKING HERE ################
  # puts parsed_rules
  # rules = parsed_rules
  sums = []
  # 1000.times do
  #   parsed_rules.each do |rule|
  #     if rules.empty?
  #       puts 'end of recursion'
  #     elsif rule[0] == 'shiny gold'
  #       sum = get_sum('shiny gold', rules)
  #       sums.push sum
  #     else
  #       rules[1].each do
  #         # get colors and multipliers for the rule
  #         colors = get_colors(rules, color)
  #         multipliers = multipliers_for_color(rules, color)
  #         # for each color, sum it's branch
  #         colors.each_with_index do |x, i|
  #           n = get_sum(rules, x)
  #           n = n * multipliers[i]
  #           puts "here:" + n
  #         end
  #       end
  #     end
  #   end
  # end

  #
  # parsed_rules.each do |rule|
  #   a = []
  #   color = rule[0]
  #   value = get_rule_count(rule)
  #   a.push color
  #   a.push value
  #   color_values.push a
  #   color_hash[color] = value
  # end

  parsed_rules.each do |rule|
    color = rule[0]
    sum = 0
    rule[1].each do |x|
      x.each do |k, v|
        sum += v
      end
    end
    color_hash[color] = sum
  end
  # puts color_values
  puts color_hash

  colors_in_row = ["shiny gold"]

  row_values = []
  row_values.push(color_hash[colors_in_row[0]])
  puts row_values


  # n = sum_color(parsed_rules, 'shiny gold')
  # puts n
  #
  # nn = multipliers_for_color(parsed_rules, 'shiny gold')
  # puts nn
  #
  # # f = sum_row(parsed_rules, nn, get_colors(parsed_rules, 'shiny gold'))
  # puts f
  # rules.each do |x|
  #   x = x.gsub(".", "")
  #   first_level_bags.each do |y|
  #     if x.include?(y.to_s)
  #       a = x.split(" ")
  #       container = a[0] + " " + a[1]
  #       if container == y.to_s
  #         next
  #       end
  #
  #       second_levl_bags.push container
  #     end
  #   end
  # end
  #
  # rules.each do |x|
  #   x = x.gsub(".", "")
  #   second_levl_bags.each do |y|
  #     if x.include?(y.to_s)
  #       a = x.split(" ")
  #       container = a[0] + " " + a[1]
  #       if container == y.to_s
  #         next
  #       end
  #
  #       third_level_bags.push container
  #     end
  #   end
  # end
  #
  # rules.each do |x|
  #   x = x.gsub(".", "")
  #   third_level_bags.each do |y|
  #     if x.include?(y.to_s)
  #       a = x.split(" ")
  #       container = a[0] + " " + a[1]
  #       if container == y.to_s
  #         next
  #       end
  #
  #       fourth_level_bags.push container
  #     end
  #   end
  # end
  #
  # rules.each do |x|
  #   x = x.gsub(".", "")
  #   fourth_level_bags.each do |y|
  #     if x.include?(y.to_s)
  #       a = x.split(" ")
  #       container = a[0] + " " + a[1]
  #       if container == y.to_s
  #         next
  #       end
  #
  #       fifth_level_bags.push container
  #     end
  #   end
  # end
  #
  # rules.each do |x|
  #   x = x.gsub(".", "")
  #   fifth_level_bags.each do |y|
  #     if x.include?(y.to_s)
  #       a = x.split(" ")
  #       container = a[0] + " " + a[1]
  #       if container == y.to_s
  #         next
  #       end
  #
  #       six_level_bags.push container
  #     end
  #   end
  # end
  #
  # rules.each do |x|
  #   x = x.gsub(".", "")
  #   six_level_bags.each do |y|
  #     if x.include?(y.to_s)
  #       a = x.split(" ")
  #       container = a[0] + " " + a[1]
  #       if container == y.to_s
  #         next
  #       end
  #
  #       seven_level_bags.push container
  #     end
  #   end
  # end
  #
  # rules.each do |x|
  #   x = x.gsub(".", "")
  #   seven_level_bags.each do |y|
  #     if x.include?(y.to_s)
  #       a = x.split(" ")
  #       container = a[0] + " " + a[1]
  #       if container == y.to_s
  #         next
  #       end
  #
  #       eight_level_bags.push container
  #     end
  #   end
  # end
  #
  # rules.each do |x|
  #   x = x.gsub(".", "")
  #   eight_level_bags.each do |y|
  #     if x.include?(y.to_s)
  #       a = x.split(" ")
  #       container = a[0] + " " + a[1]
  #       if container == y.to_s
  #         next
  #       end
  #
  #       nine_level_bags.push container
  #     end
  #   end
  # end
  #
  # rules.each do |x|
  #   x = x.gsub(".", "")
  #   nine_level_bags.each do |y|
  #     if x.include?(y.to_s)
  #       a = x.split(" ")
  #       container = a[0] + " " + a[1]
  #       if container == y.to_s
  #         next
  #       end
  #
  #       ten_level_bags.push container
  #     end
  #   end
  # end
  #
  # rules.each do |x|
  #   x = x.gsub(".", "")
  #   ten_level_bags.each do |y|
  #     if x.include?(y.to_s)
  #       a = x.split(" ")
  #       container = a[0] + " " + a[1]
  #       if container == y.to_s
  #         next
  #       end
  #
  #       eleven_level_bags.push container
  #     end
  #   end
  # end
  #
  # rules.each do |x|
  #   x = x.gsub(".", "")
  #   eleven_level_bags.each do |y|
  #     if x.include?(y.to_s)
  #       a = x.split(" ")
  #       container = a[0] + " " + a[1]
  #       if container == y.to_s
  #         next
  #       end
  #
  #       twelve_level_bags.push container
  #     end
  #   end
  # end
  #
  # rules.each do |x|
  #   x = x.gsub(".", "")
  #   twelve_level_bags.each do |y|
  #     if x.include?(y.to_s)
  #       a = x.split(" ")
  #       container = a[0] + " " + a[1]
  #       if container == y.to_s
  #         next
  #       end
  #
  #       thirteen_level_bags.push container
  #     end
  #   end
  # end

  # 594.times do |i|
  #   array = []
  #   rules.each do |x|
  #     x = x.gsub(".", "")
  #     array.each do |y|
  #       if x.include?(y.to_s)
  #         a = x.split(" ")
  #         container = a[0] + " " + a[1]
  #         if container == y.to_s
  #           next
  #         end
  #
  #         array.push container
  #       end
  #     end
  #   end
  # end

  # puts bags_with_shiny
  # puts first_level_bags
  # puts second_levl_bags
  # puts third_level_bags
  # puts fourth_level_bags
  # puts fifth_level_bags.sort
  # puts six_level_bags.sort
  # puts seven_level_bags.sort
  # puts eight_level_bags.sort
  # puts nine_level_bags.sort
  # puts ten_level_bags.sort
  # final_bags = first_level_bags.uniq + second_levl_bags.uniq + third_level_bags.uniq + fourth_level_bags.uniq + fifth_level_bags.uniq + six_level_bags.uniq + seven_level_bags.uniq + eight_level_bags.uniq + nine_level_bags.uniq + ten_level_bags.uniq
  # puts final_bags.uniq.size
end

def get_rule_count(rule)
  # find bag count in each bag method
  bag_hold_count = rule.gsub(/\D/, '')
  bag_hold_count = bag_hold_count.split("")
  bag_hold_count = bag_hold_count.map(&:to_i)
  bag_hold_count
  bag_hold_count = bag_hold_count.inject(:+)
  # bag_hold_count
end

# returns hash with rule hashed out in it
def breakdown_rule(rule)
  rule1 = rule.gsub(".", "")
  rule1 = rule1.split(" ")
  container = rule1[0] + " " + rule1[1]
  container
end

def breakdown_colors(rule)
  rule1 = rule.gsub(".", "")
  rule1 = rule1.split(" ")
  container = rule1[0] + " " + rule1[1]
  rule.gsub!("bags", "")
  rule.gsub!("contain", "")
  rule.gsub!(container, "")
  rule = rule.split(",")
  rule2 = []
  rule.each do |x|
    x.strip!
    rule2.push x
  end
  rule3 = []
  rule2.each do |x|
    x = x.split(" ")
    number = x[0].to_i
    color = x[1] + " " + x[2]
    h = Hash.new
    h[color] = number
    rule3.push h
  end
  rule3
end

def sum_color(rules, color)
  sum = 0
  rules.each do |rule|
    if rule[0] == color
      rule[1].each do |x|
        x.each do |k, v|
          sum += v
        end
      end
    end
  end
  sum
end

def multipliers_for_color(rules, color)
  numbers = []
  rules.each do |rule|
    if rule[0] == color
      rule[1].each do |x|
        x.each do |k, v|
          numbers.push v
        end
      end
    end
  end
  numbers
end

def get_colors(rules, color)
  numbers = []
  rules.each do |rule|
    if rule[0] == color
      rule[1].each do |x|
        x.each do |k, v|
          numbers.push k
        end
      end
    end
  end
  numbers
end

def get_golds_sum(rules, color)
  sum = 0
  rules.each do |rule|
    if rule[0] == color
      rule[1].each do |x|
        x.each do |k, v|
          sum += v
        end
      end
    end
  end
  sum
end

def get_sum(color, rules)
  sum = 0
  rules.each do |rule|
    if rule[0] == color
      rule[1].each do |x|
        x.each do |k, v|
          sum += v
        end
      end
    end
  end
  sum
end
#
# def recursion(rules, color)
#   if rules.empty?
#     puts 'end of recursion'
#   elsif color == 'shiny gold'
#     sum = get_sum(color, rules)
#     c = get_colors(rules, color)
#     recursion(rules, c)
#   else
#     # get colors and multipliers for the rule
#     colors = get_colors(rules, color)
#     multipliers = multipliers_for_color(rules, color)
#     # for each color, sum it's branch
#     colors.each_with_index do |x, i|
#       n = get_sum(rules, x)
#       n = n * multipliers[i]
#       puts "here:" + n
#     end
#
#   end
# end
#
# # def get_rule(color, color_hash, previous_rule_counts)
# #   color_value = color_hash[color]
# #
# # end
# def formula(rules, rule, color_hash)
#   color = rule[0]
#   colors = get_colors(rules, color)
#   color_values = []
#   colors.each do |x|
#     color_values.push(color_hash[x])
#   end
#   multipliers = multipliers_for_color(rules, color)
#   sum = 0
#   if color == 'shiny gold'
#     sum = color_values[0].to_i + color_values[1].to_i
#   else
#     color_values.each_with_index do |x, i|
#       n = x * multipliers[i]
#       sum += n
#     end
#   end
#   sum
# end

When(/^handheld game (.*)$/) do |file|
  # $ACCUMULATOR = 0
  map = File.readlines(file).map {|x| x.split(" ") }
  codeset = []
  map.each_with_index do |x, i|
    a =[]
    a.push(i)
    a.push x[0]
    c = x[1]
    b = c[0,1]
    a.push b

    c = c[1..-1]
    a.push c

    codeset.push a
  end
  # puts codeset
  $CODE_SET = codeset
  $CODE_SET_OG = codeset
  ### RULES ###
  # after an acc, immediately execute next below instruction
  # jmp will go forward or backward to next instruction. eg. jmp +1 is next below, jmp +2 skip next, etc
  # nop is no operation, does nothing, immediately executes next below instruction
  # location = 0
  # $have_been_here = []

  # run_code(codeset[location])
  $have_been_here_nop = []
  1000.times do
    $ACCUMULATOR = 0
    location = 0
    $have_been_here = []

    $set = modify_code_set($CODE_SET_OG)
    # puts set
    run_code($set[location])
  end
end

def run_code(code)
  # puts $ACCUMULATOR
  if code.nil?
    puts $ACCUMULATOR
  end
  location = code[0].to_i
  operation = code[1]
  direction = code[2]
  distance = code[3].to_i


  if $have_been_here.include?(location)
    # puts("This is the end of first loop:" + $ACCUMULATOR.to_s)
    return
  else
    $have_been_here.push(location)
  end

  if operation == 'nop'
    if (location+1) >= 641
      puts "This is right: " + $ACCUMULATOR.to_s
    end
    run_code($set[location+1])
  end

  if operation == 'acc'
    if (location+1) >= 641
      puts "This is right: " + $ACCUMULATOR.to_s
    end
    if direction == '-'
      $ACCUMULATOR -= distance
    elsif direction == '+'
      $ACCUMULATOR += distance
    end
    run_code($set[location+1])
  end

  if operation == 'jmp'
    if direction == '-'
      if (location-distance) >= 641
        puts "This is right: " + $ACCUMULATOR.to_s
      end
      run_code($set[(location) - distance])
    elsif direction == '+'
      if (location-distance) >= 641
        puts "This is right: " + $ACCUMULATOR.to_s
      end
      run_code($set[(location) + distance])
    end
  end
end

def modify_code_set(code_set)

  new_set = []
  changed = false
  code_set.each do |x|
    new_code = []
    if x[1] == 'jmp' && !$have_been_here_nop.include?(x[0]) && (changed == false)
      $have_been_here_nop.push x[0]
      new_code.push x[0]
      new_code.push 'nop'
      new_code.push x[2]
      new_code.push x[3]
      new_set.push new_code
      changed = true
    else
      new_set.push x
    end
  end
  return new_set
end

When(/^find bags (.*)$/) do |file|
  # map = File.readlines(file).map(&:chomp)
  # puts map
  # ruleset = []
  # map.each do |x|
  #   a = []
  #   c = x.split(" ")
  #   container = c[0] + " " + c[1]
  #   a.push container
  #   color_count = x.count(",") + 1
  #
  # end

  rules = File.read file
  rules = rules.split("\n")
  $parsed_rules = Hash.new
  rules.each do |rule|
    $parsed_rules[breakdown_rule(rule)] = breakdown_colors(rule)
  end
  puts $parsed_rules

  $dict = {}
  $parsed_rules.each do |rule|
    if rule[1][0].include? 'other .'
      next
    end
    $dict[rule[0]] = get_colors($parsed_rules, rule[0])
  end
  puts $dict

  $color_hash = Hash.new
  $parsed_rules.each do |rule|
    color = rule[0]
    sum = 0
    rule[1].each do |x|
      x.each do |k, v|
        sum += v
      end
    end
    $color_hash[color] = sum
  end
  # puts $color_hash

  # $ruleset = []
  # $parsed_rules.each do |x|
  #   rule = []
  #   rule.push x[0]
  #   x[1].each do |x|
  #     x.each do |k,v|
  #       a = []
  #       a.push k
  #       a.push v
  #       rule.push a
  #     end
  #   end
  #   $ruleset.push rule
  # end
  # puts $ruleset
  # $number = 1

  $count = 0
  ans = count_bags_inside('shiny gold')
  puts ans

end

def get_count(rules, color)
  # sum = 0
  colors = []
  multipliers = []
  rules.each do |rule|
    if rule[0] == color
      colors = get_colors(rules, color)
      multipliers = multipliers_for_color(rules, color)
      sum = ($number * multipliers[0]) + ($number * multipliers[1])
      $number += 1
      return sum
    end
  end
end

def gcr(color)
  multipliers = multipliers_for_color($parsed_rules, color)
  colors = get_colors($parsed_rules, color)
  s = 0
  multipliers.each_with_index do |x, i|
    s += x
    gcr(colors[i])
  end
  $sum.push s
end

def count_bags_inside(color)
  bags = $parsed_rules[color]
  count = 0
  if bags.nil?
    puts("#{color} empty, returning 0")
    return 0
  end
  puts("bags = #{bags}")
  bags.each do |bag|
    bag.each do |k, v|
      count += v
      puts("going into #{k}")
      count += (v * count_bags_inside(k))
    end
  end
  return count
end

When(/^find xmas weakness from (.*)$/) do |file|
  $number_set = File.readlines(file).map(&:to_i)
  # puts $number_set
  # $x = 0
  # $y = 24
  # $preamble = $number_set[$x..$y]
  # $location = 25
  #
  # 975.times do
  #   find_pair
  # end
  $goal = 1639024365
  # $new_numbers = $number_set.reject {|x| x >= 900000 }

  INPUT = []
  File.readlines('xmas.txt').each do |line|
    INPUT << line.chomp.to_i
  end

  star_2 #### GOOD ANSWER HERE #####
  end

def find_pair
  good_number = false
  number = $number_set[$location]
  $preamble.each_with_index do |x, i|
    next if good_number == true

    $preamble.each_with_index do |y, j|
      next if good_number == true
      next if i == j

      sum = x + y
      if sum == number
        good_number = true
        $location += 1
        $x += 1
        $y += 1
        $preamble = $number_set[$x..$y]
      end
    end
  end
  if good_number == false
    puts("bad number is: " + number.to_s)
  end
end

TEST_INPUT = %w(35 20 15 25 47 40 62 55 65 95 102 117 150 182 127 219 299 277 309 576).map{|s|s.to_i}

def check_valid(input, value)
  combo = input.combination(2).to_a
  return combo.select {|n| n.sum == value }.any?
end

def xmas_parser(input, preample)
  input.each_with_index do |v,i|
    next if i < preample
    return v unless check_valid(input[i - preample, preample], v)
  end
end

def star_1
  p "Is the test working: #{xmas_parser(TEST_INPUT, 5) == 127}"
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
  # p "Is the test working: #{encryption_weakness(TEST_INPUT, 127) == 62}"
  p "#{encryption_weakness(INPUT, $goal)} is the encryption weakness"
end