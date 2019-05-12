import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let len = s.count
        var dict = [Character: Int]()
        var i = 0, j = 0
        var ret = 0
        while j < len {
            let c = s[j]
            if let idx = dict[c] {
                i = max(idx + 1, i)
            }
            dict[c] = j
            j += 1
            ret = max(ret, j - i)
            //print("i: \(i)  j: \(j) ret: \(ret)")
            //let from = s.index(s.startIndex, offsetBy: i)
            //let to = s.index(from, offsetBy: ret)
            //print(s[from...to])
            if i + ret > len { break }
        }
        return ret
    }
}
extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

let solution = Solution()
let ans = solution.lengthOfLongestSubstring("pwwkew")
print("ans: \(ans)")
