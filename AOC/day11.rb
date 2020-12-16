# frozen_string_literal: true

$input = File.readlines('data/ferry.txt').map(&:chomp)
$input.map! {|line| line.split("") }

def star1
    $times = 0
    new_chart = []
    5.times do
        puts 'Round Begin'
        if $times > 0
            $chart = new_chart
        else
            $chart = $input
            $new_chart = []
        end
        $current_seat = 0

        $chart.each do |row|
            $current_row = row
            $count_occupied = 0
            new_row = []
            $current_row.each do |seat|
                $floor_count = 0
                if seat == '.'
                    new_row.push('.')
                elsif seat == 'L'
                    if adjacents_occupied?
                        new_row.push('L')
                    else
                        new_row.push('#')
                    end
                elsif seat == '#'
                    if occupied_and_four_or_more?
                        new_row.push('L')
                    else
                        new_row.push('#')
                    end
                end
                $current_seat += 1
            end
            new_chart.push(new_row)
        end

        puts new_chart.to_s
        $times += 1
    end
end

def check_left
    if $current_seat == 0
        $left = false
        return
    end
    if $current_row[$current_seat - 1] == 'L'
        $left = false
    elsif $current_row[$current_seat - 1] == '.'
        $floor_count += 1
    elsif $current_row[$current_seat - 1] == '#'
        $count_occupied += 1
    end
end

def check_right
    if $current_seat == 9
        $right = false
        return
    end
    if $current_row[$current_seat + 1] == 'L' || $current_row[$current_seat + 1] == '.'
        $right = false
    elsif $current_row[$current_seat + 1] == '#'
        $count_occupied += 1
    end
end

def check_front
    if $row_ahead.nil?
        $front = false
        return
    end
    if $row_ahead[$current_seat] == 'L' || $row_ahead[$current_seat] == '.'
        $front = false
    elsif $row_ahead[$current_seat] == '#'
        $count_occupied += 1
    end
end

def check_back
    if $row_behind.nil?
        $back = false
        return
    end
    if $row_behind[$current_seat] == 'L' || $row_behind[$current_seat] == '.'
        $back = false
    elsif $row_behind[$current_seat] == '#'
        $count_occupied += 1
    end
end

def check_nw
    if $row_ahead.nil? || $current_seat == 0
        $nw = false
        return
    end
    if $row_ahead[$current_seat - 1] == 'L' || $row_ahead[$current_seat - 1] == '.'
        $nw = false
    elsif $row_ahead[$current_seat - 1] == '#'
        $count_occupied += 1
    end
end

def check_ne
    if $row_ahead.nil? || $current_seat == 9
        $ne = false
        return
    end
    if $row_ahead[$current_seat + 1] == 'L' || $row_ahead[$current_seat + 1] == '.'
        $ne = false
    elsif $row_ahead[$current_seat + 1] == '#'
        $count_occupied += 1
    end
end

def check_sw
    if $row_behind.nil? || $current_seat == 0
        $sw = false
        return
    end
    if $row_behind[$current_seat - 1] == 'L' || $row_behind[$current_seat - 1] == '.'
        $sw = false
    elsif $row_behind[$current_seat - 1] == '#'
        $count_occupied += 1
    end
end

def check_se
    if $row_behind.nil? || $current_seat == 9
        $se = false
        return
    end
    if $row_behind[$current_seat + 1] == 'L' || $row_behind[$current_seat + 1] == '.'
        $se = false
    elsif $row_behind[$current_seat + 1] == '#'
        $count_occupied += 1
    end
end

def checks
    check_front
    check_back
    check_left
    check_right
    check_nw
    check_ne
    check_sw
    check_se
    return $count_occupied
end

def adjacents_occupied?
    if checks >= 1
        puts 'not all adjacent seats are empty'
        return false
    else
        puts 'all adjacent seats are empty'
        return true
    end
end

def occupied_and_four_or_more?
    c = checks
    c = c - $floor_count
    if c >= 4
        puts 'occupied seat has 4 or more seats filled around it'
        return true
    else
        puts 'occupied seat has less than 4 seats filled around it'
        return false
    end
end

star1
