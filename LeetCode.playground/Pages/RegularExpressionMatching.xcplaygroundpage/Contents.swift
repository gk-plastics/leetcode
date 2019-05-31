import Foundation

final class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sChars = Array(s)
        let pChars = Array(p)
        var i = 0
        var prevPChar: Character?
        var pCarry: Character?
        for sChar in sChars {
            print("sChar: \(sChar)")
            guard i < pChars.count else {
                if let pCarryChar = pCarry {
                    if pCarryChar == "." {
                        continue
                    } else if sChar == pCarryChar {
                        continue
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            }

            let pChar = pChars[i]
            i += 1

            if let pCarryChar = pCarry {
                print("pCarryChar: \(pCarryChar)")
                if pCarryChar == "." {
                    continue
                } else if sChar == pCarryChar {
                    continue
                }
            } else {
                print("pChar: \(pChar)")
                if pChar == "*" {
                    guard let prevPChar = prevPChar else {
                        print("No character to repeat. Returning.")
                        return false
                    }
                    pCarry = prevPChar
                    continue
                } else {
                    prevPChar = pChar
                    if pChar == "." {
                        continue
                    } else if sChar == pChar {
                        continue
                    } else {
                        guard i < pChars.count else { return false }
                        guard pChars[i] == "*" else { return false } // If next pChar is "*", do not terminate check
                    }
                }
            }
        }
        return true
    }
}

let solution = Solution()
let ans = solution.isMatch("mississippi", "mis*is*ip*.")
print("ans: \(ans)")
