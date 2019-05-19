import Foundation

// Based on one of the fastest solution in Swift submission
final class SolutionImproved2 {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { return false }
        var rvrsd = 0
        var input = x
        while input > 0 {
            rvrsd = (rvrsd * 10) + (input % 10)
            // print("rvrsed: \(rvrsd)")
            input /= 10
            //if result < Int32.min || result > Int32.max { return false } // NOT NECESSARY
        }
        return rvrsd == x
    }
}

// Based on one of the comments by https://leetcode.com/nickneuman in the discussion
final class SolutionImproved {
    func isPalindrome(_ x: Int) -> Bool {
        var mx = x, y = 0
        while mx > 0 {
            let z = mx % 10

            y *= 10
            y += z

            mx -= z
            mx /= 10

            //print("y: \(y)")
            //print("mx: \(mx)")
        }
        return x == y
    }
}

// My original soluion
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { return false }
        else if x < 10 { return true }
        let digits = self.digits(of: x)
        let n = digits.count
        let l = n - 1
        print("digits: \(digits)")
        let half = n/2
        var mx = x
        for i in 0..<half {
            guard digits[i] == digits[l - i] else { return false }
        }
        return true
    }

    // Assumes that positiveInt is a positive integer
    private func digits(of positiveInt: Int) -> [Int] {
        var mx = positiveInt
        var n = 0
        var digits = [Int]()
        while mx > 0 {
            digits.insert(mx % 10, at: 0)
            mx /= 10
        }
        return digits
    }
}

let solution = SolutionImproved2()
let int = 12121

let ans = solution.isPalindrome(int)
print("ans: \(ans)")



