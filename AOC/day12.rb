$directions = File.readlines("data/nav.txt").map { |line| line.chomp.insert(1, ',') }
$directions = $directions.map{ |line| line.split(',')}
$directions = $directions.map{ |line| [line[0],line[1].to_i]}

$westEast = ['E', 0]
$northSouth = ['N', 0]
$angle = 0
$currentDir = ''

def star1
    $directions.each_with_index do |d, i|

        if $angle >= 360
            $angle = $angle - 360
        elsif $angle <= -360
            $angle = $angle + 360
        end

        if $angle == 0 || $angle == 360 || $angle == -360
            $currentDir = 'E'
        elsif $angle == 90 || $angle == -270
            $currentDir = 'S'
        elsif $angle == 180 || $angle == -180
            $currentDir = 'W'
        elsif $angle == 270 || $angle == -90
            $currentDir = 'N'
        end

        if d[0] == 'F'
            if $currentDir == 'E'
                $westEast[1] += d[1]
            elsif $currentDir == 'W'
                $westEast[1] -= d[1]
            elsif $currentDir == 'N'
                $northSouth[1] -= d[1]
            elsif $currentDir == 'S'
                $northSouth[1] += d[1]
            end
        elsif d[0] == 'R'
            $angle += d[1]
        elsif d[0] == 'L'
            $angle -= d[1]

        elsif d[0] == 'E'
            $westEast[1] += d[1]
        elsif d[0] == 'W'
            $westEast[1] -= d[1]
        elsif d[0] == 'N'
            $northSouth[1] -= d[1]
        elsif d[0] == 'S'
            $northSouth[1] += d[1]
        end

    end

    puts $westEast.to_s
    puts $northSouth.to_s
    puts ($westEast[1].to_i + $northSouth[1].to_i )
end

star1

def star2
sin = {'0':0, '90':1, '180':0, '270':-1}
cos = {'0':1, '90':0, '180':-1, '270':0}
        
x = y = dir = 0
wx = 10
wy = 1
$directions.each do |d|
        if d[0] == 'N'
            wy += d[1]
        elsif d[0] == 'S'
            wy -= d[1]
        elsif d[0] == 'E'
            wx += d[1]
        elsif d[0] == 'W'
            wx -= d[1]
        elsif d[0] == 'R'
            nwx = wx*cos[-d[1]%360] - wy*sin[-d[1]%360]
            nwy = wx*sin[-d[1]%360] + wy*cos[-d[1]%360]
            wx, wy = nwx, nwy
        elsif d[0] == 'L'
            nwx = wx*cos[d[1]%360] - wy*sin[d[1]%360]
            nwy = wx*sin[d[1]%360] + wy*cos[d[1]%360]
            wx, wy = nwx, nwy
        else
            x += d[1]*wx
            y += d[1]*wy
        end
    end
    
    puts(abs(x)+abs(y))
end

star2