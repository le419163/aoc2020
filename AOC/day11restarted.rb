# frozen_string_literal: true

$input = File.readlines('data/ferry.txt').map(&:chomp)
$input.map! {|line| line.split("") }

def star1(input)
    new_input = []
    input.each_with_index do |row, i|
        new_row = []
        row.each_with_index do |seat, j|
            new_seat = check_seat_boundaries(input, i, j, j)
            new_row.push new_seat
        end
        new_input.push new_row
    end
    puts new_input.to_s
    new_input
end

def check_seat_boundaries(input, current_row, current_seat, i)
    $empty_count = 0
    $occupied_count = 0
    $floor_count = 0
    check_front(input, current_row, current_seat, i)
    check_back(input, current_row, current_seat, i)
    check_left(input, current_row, current_seat, i)
    check_right(input, current_row, current_seat, i)
    check_nw(input, current_row, current_seat, i)
    check_ne(input, current_row, current_seat, i)
    check_sw(input, current_row, current_seat, i)
    check_se(input, current_row, current_seat, i)

   if input[current_row][current_seat] == 'L'
    if $occupied_count == 0
        new_seat = '#'
    end
   elsif input[current_row][current_seat] == '#'
    if $occupied_count >= 4
        new_seat = 'L'
    end
   elsif input[current_row][current_seat] == '.'
        new_seat = '.'
   end
   return new_seat
end

def check_front(input, current_row, current_seat, i)
    return if current_row == 0
    return if input[current_row - 1][i].nil?
    seat = input[current_row - 1][i]
    if seat == 'L'
        $empty_count += 1
    elsif seat == '#'
        $occupied_count += 1
    elsif seat == '.'
        $floor_count += 1
    end
end

def check_back(input, current_row, current_seat, i)
    return if current_row == 9
    return if input[current_row + 1][i].nil?
    seat = input[current_row + 1][i]
    if seat == 'L'
        $empty_count += 1
    elsif seat == '#'
        $occupied_count += 1
    elsif seat == '.'
        $floor_count += 1
    end
end

def check_left(input, current_row, current_seat, i)
    return if input[current_row][i - 1].nil?
    seat = input[current_row][i - 1]
    if seat == 'L'
        $empty_count += 1
    elsif seat == '#'
        $occupied_count += 1
    elsif seat == '.'
        $floor_count += 1
    end
end

def check_right(input, current_row, current_seat, i)
    return if input[current_row][i + 1].nil?
    seat = input[current_row][i + 1]
    if seat == 'L'
        $empty_count += 1
    elsif seat == '#'
        $occupied_count += 1
    elsif seat == '.'
        $floor_count += 1
    end
end

def check_nw(input, current_row, current_seat, i)
    return if current_row == 0
    return if input[current_row - 1][i - 1].nil?
    seat = input[current_row - 1][i - 1]
    if seat == 'L'
        $empty_count += 1
    elsif seat == '#'
        $occupied_count += 1
    elsif seat == '.'
        $floor_count += 1
    end
end

def check_ne(input, current_row, current_seat, i)
    return if current_row == 0
    return if input[current_row - 1][i + 1].nil?
    seat = input[current_row - 1][i + 1]
    if seat == 'L'
        $empty_count += 1
    elsif seat == '#'
        $occupied_count += 1
    elsif seat == '.'
        $floor_count += 1
    end
end

def check_sw(input, current_row, current_seat, i)
    return if current_row == 9
    return if input[current_row + 1][i - 1].nil?
    seat = input[current_row + 1][i - 1]
    if seat == 'L'
        $empty_count += 1
    elsif seat == '#'
        $occupied_count += 1
    elsif seat == '.'
        $floor_count += 1
    end
end

def check_se(input, current_row, current_seat, i)
    return if current_row == 9
    return if input[current_row + 1][i + 1].nil?
    seat = input[current_row + 1][i + 1]
    if seat == 'L'
        $empty_count += 1
    elsif seat == '#'
        $occupied_count += 1
    elsif seat == '.'
        $floor_count += 1
    end
end

round1 = star1($input)
round2 = star1(round1)