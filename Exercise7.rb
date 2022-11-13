def solve(arr, target_sum)
    result = []
    (arr.length - 2).times do |i|
        hash = Hash.new
        subsum = target_sum - arr[i]
        for j in i+1...arr.length
            hash[subsum - arr[j]].nil? ? (hash[arr[j]] = true) : (result << [arr[i], arr[j], subsum - arr[j]])
        end
    end
    result
end

arr = [12, 3, 1, 2, -6, 5, -8, 6]
target_sum = 0

p solve arr, target_sum