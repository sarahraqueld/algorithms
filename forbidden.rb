def my_function(forbidden, down, upper)
  interval = (down..upper).to_a  

  biggest_general = 0
  current_biggest = 0

  interval.each_with_index do |item, index|
    is_forbidden = forbidden.include?(item)
    next if is_forbidden
    current_biggest = current_biggest + 1
    current = item
    next_index = index+1
    next_element =  interval[next_index]
    next_is_forbidden = forbidden.include?(next_element)
    biggest_general = current_biggest if (next_is_forbidden && current_biggest > biggest_general)
    current_biggest = 0 if next_is_forbidden
  end

  puts ("biggest"+biggest_general.to_s)

  return biggest_general
end

# Given an array of forbidden numbers, one bottom and one top, 
# return the count of numbers in the biggest interval between the bottom and the top which does not include any of
# the forbidden numbers.

def test_one
  forbidden = [5, 4]
  forbidden_2 = [2, 7, 15, 16]

  two = my_function(forbidden_2, 1, 20)

  expected_two =  [[1,1], [3,6], [8, 14], [17,20]]
  
  expected_final = 7  
  
  puts (two == expected_final)   
end

test_one


