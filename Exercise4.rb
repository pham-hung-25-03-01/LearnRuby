def solve(array, target_sum)
    hash = Hash.new
    (0...array.length).each { |i| hash[target_sum - array[i]].nil? ? (hash[array[i]] = i) : (return hash.key(hash[target_sum - array[i]]), array[i]) }
    []
end

array = [3, 5, -4, 8, 11, 1, -1, 6]
target_sum = 10
p solve(array, target_sum)