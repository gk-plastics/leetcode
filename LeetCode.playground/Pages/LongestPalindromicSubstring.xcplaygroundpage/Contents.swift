import Foundation

// Based on the solution: Approach 4: Expand Around Center
final class Solution {
    func longestPalindrome(_ s: String) -> String {
        let cnt = s.count
        if cnt == 0 { return "" }
        if cnt == 1 { return s }
        var maxPalindromeStart = 0
        var maxPalindromeCount = 0
        for i in 0 ..< cnt {
            //print("i: \(i)")
            let cnt1 = palindromeCount(s: s, cnt: cnt, leftOrigin: i, rightOrigin: i)
            let cnt2 = palindromeCount(s: s, cnt: cnt, leftOrigin: i, rightOrigin: i + 1)
            //print("cnt1: \(cnt1)")
            //print("cnt2: \(cnt2)")
            let cnt = max(cnt1, cnt2)
            if cnt > maxPalindromeCount {
                maxPalindromeCount = cnt
                maxPalindromeStart = i - ( (maxPalindromeCount - 1) / 2 )
            }
        }
        let fromIndex = s.index(s.startIndex, offsetBy: maxPalindromeStart)
        let toIndex = s.index(fromIndex, offsetBy: maxPalindromeCount)
        return String(s[fromIndex..<toIndex])
    }

    private func palindromeCount(s: String, cnt: Int, leftOrigin: Int, rightOrigin: Int) -> Int {
        var l = leftOrigin
        var r = rightOrigin
        var li = s.index(s.startIndex, offsetBy: l)
        var ri = s.index(s.startIndex, offsetBy: r)
        while l >= 0 && r < cnt && s[li] == s[ri] {
            //print("s[li]: \(s[li])")
            //print("s[ri]: \(s[ri])")
            if s[li] != s[ri] {
                break
            }
            l -= 1
            r += 1
            if l >= 0 { li = s.index(li, offsetBy: -1) }
            if r < cnt { ri = s.index(ri, offsetBy: 1) }
        }
        return r - l - 1
    }
}

/*
// TAKES TOO LONG
final class Solution {
    func longestPalindrome(_ s: String) -> String {
        let cnt = min(s.count, 1000)
        var longestPalindrome: String = ""
        var longestPalindromeCount = 0
        for i in 0 ..< cnt {
            let maxProspectedSubstrCnt = cnt - i
            //print("maxProspectedSubstrCnt: \(maxProspectedSubstrCnt)")
            if longestPalindromeCount >= maxProspectedSubstrCnt { break }

            var isUpdatingHomogeniousPalindrome = false
            for j in i + 1 ... cnt {
                let substrCnt = j - i
                //if longestParindromeCount >= substrCnt { break }
                //print("substrCnt: \(substrCnt)")
                let substr = s.substring(from: i, to: j)
                //print("substr: \(substr)")

                var isSubstrPalindrome: Bool = false
                if isUpdatingHomogeniousPalindrome == true {
                    isSubstrPalindrome = (substr.first == substr.last)
                } else {
                    isSubstrPalindrome = substr.isPalindrome
                }

                if isSubstrPalindrome {
                    if substr.count > longestPalindromeCount {
                        longestPalindrome = String(substr)
                        longestPalindromeCount = longestPalindrome.count
                    }
                    isUpdatingHomogeniousPalindrome = substr.isHomogenious
                } else {
                    isUpdatingHomogeniousPalindrome = false
                }
            }
        }
        return longestPalindrome
    }
}
extension String {
    func substring(from: Int, to: Int) -> Substring {
        if from == 0 {
            return self.prefix(to)
        } else if to == count {
            return self.suffix(to - from)
        } else {
            let s = index(startIndex, offsetBy: from)
            let e = index(startIndex, offsetBy: to)
            return self[s ..< e]
        }
    }
}
extension StringProtocol {
    var isPalindrome: Bool {
        let m = count / 2
        for i in 0 ..< m {
            //print("i: \(i)")
            let l = self.index(startIndex, offsetBy: i)
            let r = self.index(endIndex, offsetBy: -1 - i)
            let sl = self[l]
            let sr = self[r]
            //print("sl: \(sl)")
            //print("sr: \(sr)")
            if sl != sr { return false }
        }
        return true
    }
    var isHomogenious: Bool {
        guard let firstChar = first else { return false }
        let cnt = count
        for i in 1 ..< cnt {
            //print("i: \(i)")
            let index = self.index(startIndex, offsetBy: i)
            if self[index] != firstChar { return false }
        }
        return true
    }
}

// let str = "abcdefghi"
// let substr1 = str.substring(from: 0, to: 3)
// let substr2 = str.substring(from: 4, to: str.count)
// let substr3 = str.substring(from: 3, to: 7)

//let str = "cbbc"
//let isPalindrome = str.isPalindrome
//print("isPalindrome: \(isPalindrome)")

*/

let solution = Solution()
let ans = solution.longestPalindrome("abba")
print("ans: \(ans)")
