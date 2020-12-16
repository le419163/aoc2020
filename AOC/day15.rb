$input = File.readlines("AOC/data/memory.txt").map { |line| line.chomp.to_i }

def star1
    has_been_spoken = []
    trimmed_spoken = []
    last_spoken = 0
    2020.times do |i|
        
        if i < $input.length
            # puts("Turn #{i + 1}: " + $input[i].to_s)
            last_spoken = $input[i]
            has_been_spoken.push last_spoken
            # trimmed_spoken.push last_spoken
        end

        if i >= $input.length
            if has_been_spoken.count(last_spoken) == 1
                # puts("Turn #{i + 1}: 0")
                last_spoken = 0
                has_been_spoken.push last_spoken
            elsif has_been_spoken.count(last_spoken) >= 2
                p = i - 1
                last = find_previous(last_spoken, has_been_spoken)
                last_spoken = p - last
                # puts("Turn #{i + 1}: " + last_spoken.to_s)
                has_been_spoken.push last_spoken
                has_been_spoken = trim_array(last_spoken, has_been_spoken)

            end
        end
    end
    puts(last_spoken)
    puts "Final array length: " + has_been_spoken.length.to_s
end

def trim_array(number, has_been_spoken)
    list = has_been_spoken.reverse
    count = 0
    list.each_with_index do |x, i|
        if x == number
            count += 1
            if count > 2
                list.delete_at(i)
            end
        end
    end
    return list.reverse
end

def find_previous(number, has_been_spoken)
    list = has_been_spoken.reverse
    spots = []
    # count = 0
    list.each_with_index do |x, i|
        # next if count > 2
        spots.push i if x == number
        # count += 1 if x == number
    end
    n1 = (has_been_spoken.length - 1) - spots[0]
    n2 = (has_been_spoken.length - 1) - spots[1]
    # puts("Found spots: " + n1.to_s + ", " + n2.to_s + " for number " + number.to_s)
    return n2
end

star1

