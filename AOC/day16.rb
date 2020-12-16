
def nearby
    $input = File.readlines("AOC/data/ticket.txt").map { |line| line.chomp }
    $input.map! { |line| line.split(':')}
    $nearb = []
    $nt = nil
    $input.each_with_index do |x,i|
        if x == ["nearby tickets"]
            $nt = i
        end
        next if $nt.nil?
        if i > $nt
            $nearb.push x
        end
    end
    near = []
    $nearb.each_with_index do |x,i|
        a = x[0].split(",")
        a.map! { |m| m.to_i }
        near.push a
    end
    return near
end

$nearby = nearby

$ranges = [ 35..796, 811..953, 25..224, 248..952, 47..867, 885..959, 44..121, 127..949, 49..154, 180..960, 35..532, 546..971, 41..700, 706..953, 25..562, 568..968, 31..672, 680..969, 43..836, 852..961, 38..291, 304..968, 31..746, 755..956, 46..711, 719..971, 35..584, 608..955, 39..618, 640..950, 25..308, 334..954, 26..901, 913..957, 33..130, 142..965, 34..395, 405..962, 46..358, 377..969 ]

def invalid
    $invalid = []
    $nearby.each do |ticket|
        ticket.each do |n|
            is_valid = false
            $ranges.each do |range|
                if range.include?(n)
                    is_valid = true
                end
            end
            if is_valid == false
                $invalid.push n
            end
        end
    end
    # puts $invalid.to_s
    error = 0
    $invalid.each do |x|
        error += x
    end
    puts "Error rate: " + error.to_s
end

invalid

def gather_columns
    $new_nearby = []
    $nearby.each do |ticket|
        nticket = []
        is_valid = true
        ticket.each do |n|
            if $invalid.include? n
                is_valid = false
            else
                nticket.push n
            end
        end
        $new_nearby.push nticket if is_valid
    end
    # puts $new_nearby.size.to_s
    # puts $new_nearby.to_s
 
    $column1 = []
    $column2 = []
    $column3 = []
    $column4 = []
    $column5 = []
    $column6 = []
    $column7 = []
    $column8 = []
    $column9 = []
    $column10 = []
    $column11 = []
    $column12 = []
    $column13 = []
    $column14 = []
    $column15 = []
    $column16 = []
    $column17 = []
    $column18 = []
    $column19 = []
    $column20 = []

    $new_nearby.each do |ticket|
        ticket.each_with_index do |x, i|
            case i
            when 0
                $column1.push x
            when 1
                $column2.push x
            when 2
                $column3.push x
            when 3
                $column4.push x
            when 4
                $column5.push x
            when 5
                $column6.push x
            when 6
                $column7.push x
            when 7
                $column8.push x
            when 8
                $column9.push x
            when 9
                $column10.push x
            when 10
                $column11.push x
            when 11
                $column12.push x
            when 12
                $column13.push x
            when 13
                $column14.push x
            when 14
                $column15.push x
            when 15
                $column16.push x
            when 16
                $column17.push x
            when 17
                $column18.push x
            when 18
                $column19.push x
            when 19
                $column20.push x
            else
                puts "bad column"
            end
        end
    end
    # puts $column1.to_s
end

gather_columns

$columns = [ $column1,
$column2,
$column3,
$column4,
$column5,
$column6,
$column7,
$column8,
$column9,
$column10,
$column11,
$column12,
$column13,
$column14,
$column15,
$column16,
$column17,
$column19,
$column20]

$r = {}
$c = 1
$ranges.each_slice(2) do |slice|
    $r[$c] = slice
    $c += 1
end

def star2
    $r.each do |k,v|
        r1 = v[0]
        r2 = v[1]
        count = 0
        $columns[0].each do |n|
            if r1.include?(n) || r2.include?(n)
                count += 1
            end
        end
        if count == 190
            puts "found match " + k.to_s
        end
    end
end

star2