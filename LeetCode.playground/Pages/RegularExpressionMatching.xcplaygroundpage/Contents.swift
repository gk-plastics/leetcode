import Foundation

final class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sChars = Array(s)
        let pChars = Array(p)
        var pi = 0
        var prevPChar: Character?
        var pCarry: Character?
        for sChar in sChars {
            if let pCarryChar = pCarry {
                if pCarryChar == "." { continue }
                if sChar == pCarryChar {
                    continue
                } else {
                    pCarry = nil
                    pi += 1
                }
            } else {
                guard pi < pChars.count else { return false }
                let pChar = pChars[pi]
                if pChar == "." {
                    continue
                } else if pChar == "*" {
                    guard let prevPChar = prevPChar else {
                        print("No character to repeat. Returning.")
                        return false
                    }
                    pCarry = pChar
                    continue
                } else {
                    pi += 1
                    prevPChar = pChar
                    if sChar == pChar {
                        continue
                    } else {
                        guard pi < pChars.count else { return false }
                        guard pChars[pi] == "*" else { return false } // If next pChar is "*", do not terminate check
                    }
                }
            }
        }
        return true
    }
}

let solution = Solution()
let ans = solution.isMatch("mississippi", "mis*is*p*.") // "mississippi", "mis*is*p*."
print("ans: \(ans)")
