import Foundation

final class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sChars = Array(s)
        let sCount = sChars.count
        let sLast = sCount - 1
        let pChars = Array(p)
        let pCount = pChars.count
        let pLast = pCount - 1
        var s = 0, p = 0
        var pCarry: Character?
        while s < sCount || p < pCount {
            print("s: \(s)")
            print("p: \(p)")

            let sChar: Character? = s < sCount ? sChars[s] : nil
            print("sChar: \(String(describing: sChar))")

            let pChar = pChars[p]
            print("pChar: \(pChar)")

            if p >= pLast {
                print("p is at the last")
                if pChar == "*" || pChar == "." { return true }
                else if pChar == sChar  { return true }
                else { return false }
            }

            if s >= sLast {
                print("s is at the last")
            }

            if pChar == "*" {
                let sCharX = sChar ?? sChars[sLast]
                if match(pChar: pCarry!, sChar: sCharX) {
                    print("matched with pCarry!")
                    s += 1
                    p += 1
                } else {
                    print("matched with 0 char")
                    p += 1
                }
                continue
            } else {
                pCarry = pChar
                if match(pChar: pChar, sChar: sChar) {
                    print("matched!")
                    s += 1
                    p += 1
                    continue
                } else if p + 1 < pCount && pChars[p + 1] == "*" {
                    print("NextChar is * so skip. pCarry: \(pCarry)")
                    p += 1
                    continue
                } else {
                    return false
                }
            }
        }
        return true
    }

    private func match(pChar: Character, sChar: Character?) -> Bool {
        if pChar == "." { return true }
        else if pChar == sChar { return true }
        return false
    }
}


let solution = Solution()
let ans = solution.isMatch("aab", "c*a*b") // "mississippi" / "mis*is*ip*.", "aa" / "a*", "ab" / ".*c", "aaa" / "ab*ac*a"
print("ans: \(ans)")
