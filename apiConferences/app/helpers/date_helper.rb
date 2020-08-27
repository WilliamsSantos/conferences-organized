module DateHelper
    def formatted_duration(total_minute)
        hours       = total_minute / 60
        minutes     = "#{(total_minute) % 60}"
        formatHours = hours.to_s.length < 2 ? "0#{hours}" : hours
        formatMinutes = minutes.split('min')[0].to_i == 0 ? '00' : minutes

        "#{ formatHours }:#{ formatMinutes }".strip
    end
end