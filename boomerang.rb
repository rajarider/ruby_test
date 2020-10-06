require 'pry'
def boomerang_method(input_arr)

	loop_count = input_arr.length - 2
	first_index = 0
	last_index = 2
	middle_index = 1
	boomerang_count = 0

	loop_count.times do |index| 
		first = input_arr[first_index]
		last = input_arr[last_index]
		middle = input_arr[middle_index]

		if first == last && first != middle
			boomerang_count = boomerang_count + 1
		end
		first_index = first_index + 1
		last_index =  last_index + 1
		middle_index = middle_index + 1
	end
	puts boomerang_count	

end

a = [4, 4, 4, 9, 9, 9, 9]
boomerang_method(a)