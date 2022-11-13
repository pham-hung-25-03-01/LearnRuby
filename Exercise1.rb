# def runExercise
#     begin
#         puts "Please, enter number of elements for array:"
#         numOfElements = Integer(gets.chomp,10)
#         raise RangeError unless (1..99).include?(numOfElements)
#         rescue ArgumentError
#             puts "The number of elements of the array must is a integer"
#             retry
#         rescue RangeError
#             puts "The number of elements of the array must satisfy the condition: 0 < numOfElements <= 99"
#             retry
#     end
#     array = Array.new()
#     puts "Enter the elements of the array:"
#     min = Float::INFINITY
#     catch(:stop) do
#         numOfElements.times do |i|
#             begin
#                 print "Element " + (i + 1).to_s + ": "
#                 value = Integer(gets.chomp,10)
#                 throw :stop if value == -1
#                 raise RangeError if value < -1
#                 array.push(value)
#                 min = value if value < min
#                 rescue ArgumentError
#                     puts "The number of elements of the array must is a integer"
#                     retry
#                 rescue RangeError
#                     puts "Value must is a natural number"
#                     retry
#                 rescue Exception => e
#                     puts "Error during processing: #{$!}"
#                     puts "Backtrace:\n\t#{e.backtrace.join("\n\t")}"
#                     retry
#             end
#         end
#     end
#     puts "Array: " + array.to_s
#     array.empty? ? (puts "The array is empty") : (puts "Minimum value: #{min}")
# end

# #run exercise
# runExercise


def runExercise(number_of_elements, array)
    raise ArgumentError unless number_of_elements.kind_of?(Integer)
    raise RangeError unless (1..99).include?(array.length)
    raise ArgumentError unless number_of_elements == array.length
    min = Float::INFINITY
    array.each do |element|
        raise ArgumentError unless element.kind_of?(Integer)
        raise RangeError if element < -1
        break if element == -1
        min = element if element < min
    end
    min
end