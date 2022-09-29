def solve(first_array, second_array)
    j = 0
    (0...first_array.length).each { |i| j += 1 if first_array[i] == second_array[j] }
    j == second_array.length ? true : false
end

first_array = [5, 1, 22, 26, 6, -1, 8, 10]
second_array = [1, 6, -1, 10]
p solve(first_array, second_array)