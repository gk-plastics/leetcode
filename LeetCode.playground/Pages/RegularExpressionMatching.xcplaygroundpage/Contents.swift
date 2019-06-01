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
                print("i is smaller than pChars.count")
                if let pCarryChar = pCarry {
                    print("pCarryChar: \(pCarryChar)")
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
            print("pChar: \(pChar)")
            i += 1
            if pChar == "*" {
                guard let pCarryChar = pCarry else { print("Invalid Operation: pCarry is nil."); return false }
                print("pCarryChar: \(pCarryChar)")
                if pCarryChar == "." {
                    continue
                } else if pCarryChar == sChar {
                    continue
                } else {
                    pCarry = nil
                    guard i < pChars.count else { return false }
                    print("pChars[i]: \(pChars[i])")
                    guard pChars[i] == sChar else { return false }
                }
            } else {
                if i < pChars.count && pChars[i] == "*" {
                    pCarry = pChar
                    continue
                } else {
                    pCarry = nil
                }
                if pChar == "." { continue }
                else if sChar == pChar { continue }
                else { return false }
            }
        }
        return true
    }
}

let solution = Solution()
let ans = solution.isMatch("aa", "a") // "mississippi", "mis*is*ip*."
print("ans: \(ans)")
