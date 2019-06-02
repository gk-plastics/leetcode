import Foundation

final class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        guard p.isEmpty == false else { return false }

        let sChars = Array(s)
        let sCount = sChars.count
        let sLast = sCount - 1
        let pChars = Array(p)
        let pCount = pChars.count
        let pLast = pCount - 1
        var s = 0, p = 0
        var pCarry: Character?
        var isCarrying: Bool = false
        while s < sCount || p < pCount {
            print("s: \(s)")
            print("p: \(p)")

            let sChar: Character? = s < sCount ? sChars[s] : nil
            print("sChar: \(String(describing: sChar))")

            let pChar: Character?
            if p < pCount { pChar = pChars[p] }
            else if pChars[pLast] == "*" { pChar = "*" }
            else { pChar = nil }
            print("pChar: \(String(describing: pChar))")

            if p >= pLast { print("p is at the last") }
            if s >= sLast { print("s is at the last") }

            if pChar == "*" || isCarrying {
                guard sChars.isEmpty == false else { return true } // Prevent crach in case of "" / ".*"
                let sCharX = sChar ?? sChars[sLast]
                if match(pChar: pCarry!, sChar: sCharX) {
                    print("matched with pCarry \(pCarry!)!")
                    if s >= sLast { p += 1 } // To prevent infinite loop in case of "aa" / "a*"
                    s += 1
                    isCarrying = true
                } else {
                    print("matched with 0 char")
                    p += 1
                    isCarrying = false
                }
                continue
            } else if let pChar = pChar {
                pCarry = pChar
                if match(pChar: pChar, sChar: sChar) {
                    print("matched!")
                    s += 1
                    p += 1
                    continue
                } else {
                    let pNext = p + 1
                    // pNext < pLast is needed to avoid infinite loop with case where "abcd" / "d*"
                    if pNext < pCount && pChars[pNext] == "*" && pNext < pLast {
                        print("NextChar is * so skip. pCarry: \(pCarry!)")
                        p = pNext
                        isCarrying = true
                        continue
                    } else {
                        return false
                    }
                }
            } else {
                return false
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
let ans = solution.isMatch("aaa", "a*a") // "mississippi" / "mis*is*ip*.", "ab" / ".*c", "aaa" / "ab*ac*a"
print("ans: \(ans)")
