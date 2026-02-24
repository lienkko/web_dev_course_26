require 'date'

def build_calendar() 
    args = ARGV
    file_content = File.read(args[0]).split(pattern="\n")
    teams = Array(nil)
    for value in file_content do
        str = value.split(pattern=". ")[1].split(pattern=" — ")
        teams.push(str)
    end

    first_day_str = args[1].split(pattern=".")
    day = Date.new(first_day_str[2].to_i, first_day_str[1].to_i, first_day_str[0].to_i)

    last_day_str = args[2].split(pattern=".")
    last_day = Date.new(last_day_str[2].to_i, last_day_str[1].to_i, last_day_str[0].to_i)

    game_days = Array(nil)
    while day != last_day+1 do
        puts day
        if day.wday == 0 || day.wday == 5 || day.wday == 6 then
            game_days.push(day)
        end
        day += 1
    end
    puts game_days.length
end

build_calendar