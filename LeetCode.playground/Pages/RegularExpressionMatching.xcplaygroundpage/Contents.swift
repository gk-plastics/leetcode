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
                s += 1
                let sCharX = sChar ?? sChars[sLast]
                if match(pChar: pCarry!, sChar: sCharX) {
                    print("matched with pCarry!")
                    p += 1
                } else {
                    print("matched with 0 char")
                }
                continue
            } else {
                s += 1
                pCarry = pChar
                //print("==== s: \(s)  p: \(p) ====")
                if match(pChar: pChar, sChar: sChar) {
                    print("matched!")
                    p += 1
                    continue
                } else if p < pCount && pChars[p] == "*" {
                    print("NextChar is * so skip. pCarry: \(pCarry)")
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
let ans = solution.isMatch("mississippi", "mis*is*ip*.") // "mississippi" / "mis*is*ip*.", "aa" / "a*", "ab" / ".*c", "aaa" / "ab*ac*a"
print("ans: \(ans)")
