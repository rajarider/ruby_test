require 'pry'
def word_method(input_arr)
	output_arr = main_method(input_arr)
	print output_arr
end

def main_method(input_arr)
	result_arr = []
	result_arr.push(input_arr.first)
	duplicate_count = 0
	duplicate_count_arr = []
	(1...input_arr.length).each do |i|
		previous_word = input_arr[i-1]
		current_word =  input_arr[i]

		for j in 0...current_word.length
			if !previous_word.include? current_word[0..j]
				result_arr.push(current_word[j...current_word.length])
				duplicate_count = current_word[0..j - 1].length == current_word.length ? 0 : current_word[0..j - 1].length
				break
			end
		end
		duplicate_count_arr.push(duplicate_count)
	end
	return [result_arr.join, duplicate_count_arr.min]
end

example1 = ["oven", "envier", "erase", "serious"]
example2 = ["move", "over", "very"]
example3 = ["to", "ops", "psy", "syllable"]
example4 = ["aaa", "bbb", "ccc", "ddd"]

word_method(example1)
word_method(example2)
word_method(example3)
word_method(example4)


