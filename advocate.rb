require 'pry'

class AdvocateProgram

	def main_function
		advocates = []
		static_data = "    1. Add an advocate
    2. Add junior advocates
    3. Add states for advocate
    4. Add cases for advocate
    5. Reject a case.
    6. Display all advocates
    7. Display all cases under a state
    0. exit"

		while true do
			proceed = true
			puts "Press the key which function do you want to use"
			puts "#{static_data}"
			client_input = gets.chomp
			case client_input.to_i
			when 1
				puts "Enter the advocate Id"
				advocate_id = gets.chomp
				@advocate = Advocate.new(advocate_id)
			when 2
				puts "Enter the junior advocate id"
				junior_id = gets.chomp
				@advocate.add_junior_advocate(junior_id)
			when 3
				puts "Enter the state"
				state_name = gets.chomp
				@advocate.add_state(state_name)
			when 4
				puts "Enter the cases"
				advo_cases = gets.chomp
				@advocate.add_cases(advo_cases)
			when 5
				puts "Enter the blocked cases"
				blocked_cases = gets.chomp
				@advocate.add_blocked_cases(blocked_cases)
			when 6
				puts "All Advocates #{advocates}"
			when 7
				puts "Display all cases under a state"
				state = gets.chomp
				if !advocates.empty?
					all_advocates = advocates.select { |advocate| advocate.practising_state == state }
					if !all_advocates.empty?
						all_cases  = all_advocates.map {|adv| adv.practising_cases}
						puts all_cases.flatten
					else
						puts "no cases depends on your state"
					end
					
				else
					puts "advocates are not present, please add the advocate first"
				end
			when 0
				 advocates.push(@advocate)
				 puts "Thank you"
				 proceed = false
			else
				proceed = false
				puts "You have enetered the incorrect key."
            end
            existing_advocate = advocates.select { |advocate| advocate.advocate_id == @advocate.advocate_id }
            if !existing_advocate.empty?
            	ex = existing_advocate.first
            	advocates.delete(ex)
            	advocates.push(@advocate)
            else
            	advocates.push(@advocate)
            end            
 			if !proceed
 				break
 			end
		end
	end
	
end

class Advocate

	attr_accessor :advocate_id, :practising_state, :junior_advocate, :practising_cases, :blocked_cases

	def initialize(advocate_id)
		@advocate_id = advocate_id
		@practising_cases = []
		@blocked_cases = []
		@junior_advocate = 0
		@practising_state = '0'
	end

	def add_junior_advocate(junior_id)
		@junior_advocate = junior_id
	end

	def add_state(state)
		@practising_state = state
	end

	def add_cases(advo_cases)
		@practising_cases.push(advo_cases)
	end

	def add_blocked_cases(blocked_case)
		@blocked_cases.push(blocked_case)
	end
    

end

inst_obj = AdvocateProgram.new
inst_obj.main_function