class ExtractSchedulesService

    def initialize(schedulesArray)
        @timesheet = schedulesArray
        @costumeDuration = { 'lightning' => '05min' }
    end

    def extract
        extract_schedules
    end

    private

    def extract_schedules

        timesheetFormatted  = []

        # each the file uploaded
        @timesheet.each do |row|

            description  = row.gsub(/\s+/, " ").strip.match(/.*[\D]+?\s/).to_s
            minutesMatch = row.strip.match(/[\d]+min$|[\d]+(\s)min$/).to_s.delete(' ')            
            minutes      = minutesMatch.empty? ? @costumeDuration['lightning'] : minutesMatch

            timesheetFormatted.push({ 
                description: description, 
                minutes: minutes
            })
        end

        timesheetFormatted
    end
end