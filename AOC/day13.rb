$input = File.readlines("data/shuttle.txt").map { |line| line.chomp }
$timestamp = $input[0].to_i
$buses = $input[1].split(',')
$buses.reject! { |x| x=='x'}
$buses.map! { |x| x.to_i}
# puts $buses.to_s

def star1
    remainders = {}
    times = []
    $buses.each do |bus|
        remainder = $timestamp.to_f / bus.to_f
        rounded = remainder.round
        val = rounded - remainder
        remainders[bus] = val.to_f.abs
        next_timestamp = rounded * bus
        times.push next_timestamp
    end
    puts remainders.sort.to_s
    puts times.sort.to_s

    h = times.sort.group_by{ |e| e <=> $timestamp}
    puts h[1][0]
end

# star1

def star2
    
    lcm = 1
    time = 0    
    $buses.each_with_index do |x, i|
        next if $buses[i+1].nil?
        bus_id = x
        idx = $buses[i+1]
        lcm *= $buses[i+1]
        if (time + idx) % bus_id != 0
            time += lcm
        end
    end
    puts(time)
end

star2