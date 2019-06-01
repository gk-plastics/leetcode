import Foundation

final class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sChars = Array(s)
        let sCount = sChars.count
        let pChars = Array(p)
        let pCount = pChars.count
        var s = 0, p = 0
        var pCarry: Character?
        while s < sCount {
            print("s: \(s)")
            print("p: \(p)")

            let sChar = sChars[s]
            print("sChar: \(sChar)")

            let pChar = pChars[p]
            print("pChar: \(pChar)")
            p += 1

            if pChar == "*" {
                let uPCarry = pCarry!
                s += 1
                print("uPCarry: \(uPCarry)")
                if uPCarry == "." {
                    continue
                } else if uPCarry == sChar {
                    continue
                } else {
                    pCarry = nil
                    guard p < pCount else { print("=== A ==="); return false }
                    print("pChars[p]: \(pChars[p])")
                    guard pChars[p] == sChar else { print("=== B ==="); return false }
                }
            } else {
                if p < pCount && pChars[p] == "*" {
                    pCarry = pChar
                    // s += 1 // NOT NEEDED
                    print("pCarry: \(pCarry!)")
                    continue
                } else {
                    s += 1
                    pCarry = nil
                    continue
                }
                if pChar == "." { s += 1; continue }
                else if sChar == pChar { s += 1; continue }
                else { print("=== C ==="); return false }
            }
        }
        return true
    }
}


let solution = Solution()
let ans = solution.isMatch("aaa", "ab*ac*a") // "mississippi" / "mis*is*ip*.", "aa" / "a*", "ab" / ".*c", "aaa" / "ab*ac*a"
print("ans: \(ans)")
