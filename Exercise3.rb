def runExercise
    begin
        puts "Please, enter number of elements for array:"
        numOfElements = Integer(gets.chomp,10)
        raise RangeError unless (1..99).include?(numOfElements)
        rescue ArgumentError
            puts "The number of elements of the array must is a integer"
            retry
        rescue RangeError
            puts "The number of elements of the array must satisfy the condition: 0 < numOfElements <= 99"
            retry
    end
    array = Array.new(numOfElements) { rand(1..9) }
    puts "Array ramdom is " + array.to_s
    incrementSubarray = [array[0]]
    count = 1
    for i in 1...array.size
        if array[i] > array[i-1]
            incrementSubarray.push(array[i])
        else
            puts "Increment subarray #{count}: " + incrementSubarray.to_s
            incrementSubarray.clear
            incrementSubarray.push(array[i])
            count += 1
        end
    end
    puts "Increment subarray #{count}: " + incrementSubarray.to_s
end

runExercise