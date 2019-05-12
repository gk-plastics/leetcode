import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let cnt = nums.count
        for i in 0 ..< cnt {
            let n1 = nums[i]
            for j in i + 1 ..< cnt {
                let n2 = nums[j]
                if n1 + n2 == target {
                    return [i, j]
                }
            }
        }
        preconditionFailure("Solution was NOT found.")
    }
}

class SolutionImproved {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for (i, num) in nums.enumerated() {
            dict[num] = i
        }
        print("dict: \(dict)")
        for (i, num) in nums.enumerated() {
            print("target - num : \(target - num)")
            guard let j = dict[target - num] else { continue }
            guard i != j else { continue }
            return [i, j]
        }
        preconditionFailure("Solution was NOT found.")
    }
}

do {
    let solution = Solution()
    let ans = solution.twoSum([3, 2, 4], 6)
    print("ans: \(ans)")
}

do {
    let solution = SolutionImproved()
    let ans = solution.twoSum([3, 2, 4], 6)
    print("ans: \(ans)")
}

