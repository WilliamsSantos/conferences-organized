class OrganizeTracksService
    include ::DateHelper 

	def initialize(schedules)
        @schedules      = schedules
        @alphabetIndex  = [ 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M' ]
        @minutesInHours = { '9h'  => 540, '12h' => 720, '13h' => 780, '15h' => 900 , '16h' => 960, '17h' => 1020 }
        @coffeeBreak = { 
            'lunch'     => { 'hour' => '12h', 'description' => 'almoço', 'minutes' => '' },
            'network'   => { 'hour' => '17h', 'description' => 'Evento de netWork', 'minutes' => '' }
        }
    end

    def assemble_timesheet
        organize_tracks(ExtractSchedulesService.new( @schedules ).extract)
    end

    private 

    def organize_tracks(timesheetToOrganize)

        # In problem expecification is describe that the schedules start at 09h
        currentMinutes = @minutesInHours['9h']

		t = Track.create(session: 'A')

        countTrack = 0
        schedulesArray = []
        timesheetToOrganize.map do | item |

			# if the document have something space e jumps the iteration
			if item[:description] == ""
				next
			end

			schedules = formatted_duration(currentMinutes)
			onlyNumbersfromMinutes = item[:minutes].split('min')[0].to_i

			# Check if is Lunch CoffeBreak
			if  currentMinutes >= @minutesInHours['12h'] && currentMinutes <= @minutesInHours['13h']

				oldSchedules    = schedules
				oldDescription  = item[:description]
				oldMinutes      = item[:minutes]
				newSchedules    = @coffeeBreak['lunch']['hour']
				newDescription  = @coffeeBreak['lunch']['description']
				newMinutes      = @coffeeBreak['lunch']['minutes']

				# record de Launch
				e = Event.create(schedule: newSchedules, 
												description: newDescription, 
												minutes: newMinutes)

				t.eventsTrackRelation.create(event: e )
				schedulesArray.push({schedule: newSchedules, 
									description: newDescription,
									minutes: newMinutes})

				currentMinutes =  @minutesInHours['13h']

				# record de Old value
				e = Event.create(schedule: formatted_duration(currentMinutes), 
								description: oldDescription, 
								minutes: oldMinutes)

				t.eventsTrackRelation.create(event: e )

				schedulesArray.push({schedule: formatted_duration(currentMinutes), 
														description: oldDescription, 
														minutes: oldMinutes})

				currentMinutes = currentMinutes + onlyNumbersfromMinutes
			elsif currentMinutes >=  @minutesInHours['17h']

				oldMinutes      = item[:minutes]
				oldDescription  = item[:description]
				newSchedules    = @coffeeBreak['network']['hour']
				newDescription  = @coffeeBreak['network']['description']  
				newMinutes      = @coffeeBreak['network']['minutes']

				# record de Network
				e = Event.create(schedule: newSchedules, 
						description: newDescription, 
						minutes: newMinutes)

				t.eventsTrackRelation.create(event: e )
				schedulesArray.push({schedule: newSchedules, 
									description: newDescription, 
									minutes: newMinutes})

				# Create a new Track
				t = Track.create(session: @alphabetIndex[countTrack])

				currentMinutes = @minutesInHours['9h']

				# record de Old value
				e = Event.create(schedule: formatted_duration(currentMinutes), 
								description: oldDescription, 
								minutes: oldMinutes)

				t.eventsTrackRelation.create(event: e )
				schedulesArray.push({schedule: formatted_duration(currentMinutes), 
									description: oldDescription, 
									minutes: oldMinutes})

				currentMinutes = currentMinutes + onlyNumbersfromMinutes

				countTrack = countTrack + 1 
			else
				e = Event.create(schedule: schedules, 
								description: item[:description], 
								minutes: item[:minutes])

				t.eventsTrackRelation.create(event: e )
				schedulesArray.push({schedule: schedules, 
									description: item[:description], 
									minutes: item[:minutes]})

				currentMinutes = currentMinutes + onlyNumbersfromMinutes
			end
        end

		# get the schedules
        lastItem = schedulesArray.reverse[0][:schedule].split('h')[0].to_i

        # check if the last hash its close the network conferences
        if lastItem >= 15 && lastItem != 17
            e = Event.create(schedule: @coffeeBreak['network']['hour'], 
							description: @coffeeBreak['network']['description'], 
							minutes: @coffeeBreak['network']['minutes'])

			t.eventsTrackRelation.create(event: e)
			schedulesArray.push({schedule: @coffeeBreak['network']['hour'], 
								description: @coffeeBreak['network']['description'], 
								minutes: @coffeeBreak['network']['minutes']})
		end
	end
end