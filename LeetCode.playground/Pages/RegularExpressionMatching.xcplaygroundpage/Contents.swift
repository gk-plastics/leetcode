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
        var sCharCarryingStartIndex: Int = 0

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

//            if p >= pLast {
//                print("p is at the last")
//            }
//            if s >= sLast {
//                print("s is at the last")
//            }

            if pChar == "*" || isCarrying {
                guard sChars.isEmpty == false else { return true } // Prevent crach in case of "" / ".*"

                if p > pLast {
                    if s < sLast {
                        print("p has been expired but s is still remaining. Returning false.")
                        return false
                    }
                }
                if s > sLast { // Same as sChar == nil
                    if p < pLast {
                        print("p is still remaining. Set s back to sCharCarryingStartIndex and continue")
                        s = sCharCarryingStartIndex
                        isCarrying = false
                        continue
                    }
                }

                print("=== sChar: \(sChar) ===")
                print("=== pChar: \(pChar) ===")
                print("=== pCarry: \(pCarry!) ===")

                // Handle case with "ab" / ".*c" (false) AND "bbbba" / ".*a*a" (true)
                // if sChar == nil && pCarry == "." && sCharX != pChar && pChar != "*" && pChar != "." { return false }

                if match(pChar: pCarry!, sChar: sChar!) {
                    print("matched with pCarry \(pCarry!)!")
                    if s >= sLast { p += 1 } // Prevent infinite loop in case of "aa" / "a*"
                    s += 1
                    isCarrying = true
                } else {
                    print("matched with 0 char")
                    p += 1
                    isCarrying = false
                }
                continue
            } else if let pChar = pChar, let sChar = sChar {
                isCarrying = false
                pCarry = pChar
                sCharCarryingStartIndex = s
                if match(pChar: pChar, sChar: sChar) {
                    print("matched!")
                    s += 1
                    p += 1
                    continue
                } else {
                    let pNext = p + 1
                    if pNext < pCount && pChars[pNext] == "*" {
                        print("NextChar is * so skip. pCarry: \(pCarry!)")
                        p = pNext
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

    private func match(pChar: Character, sChar: Character) -> Bool {
        if pChar == "." { return true }
        else if pChar == sChar { return true }
        return false
    }
}

// "mississippi", "mis*is*ip*." (true)
// "ab", ".*c" (false)
// "aaa", "ab*ac*a" (true)
// "a", "ab*" (true)
// "abcd", "d*" (false)
// "a", "d*" (false)
// "ab", ".*.." (true)
// "ab", ".*c" (false) / "bbbba", ".*a*a" (true) / "ab", ".*.." (true) / "a", ".*..a*" (false)
//
let solution = Solution()
let ans = solution.isMatch("ab", ".*..")

print("ans: \(ans)")
