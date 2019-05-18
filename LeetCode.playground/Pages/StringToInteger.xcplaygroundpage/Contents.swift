import Foundation

final class Solution {
    // Int32.min: -2147483648
    // Int32.max: 2147483647
    func myAtoi(_ str: String) -> Int {
        guard str.isEmpty == false else { return 0 }
        let max = Int(Int32.max)
        let min = Int(Int32.min)
        let cnt = str.count
        var index: String.Index = str.startIndex
        var isNegative: Bool?
        var digitChars = [Character]()
        digitChars.reserveCapacity(cnt)
        for _ in 0 ..< cnt {
            let c = str[index]
            index = str.index(after: index)
            //print("c: \(c)")
            if let isNegative = isNegative {
                if c.isDigit == false {
                    // Handle case such as "0-1"
                    guard digitChars.isEmpty else { break }
                    let prevIndex = str.index(before: index)
                    let prevChar = str[index]
                    if prevChar == "0" { digitChars.append(prevChar) }
                    break
                }
                // Handle case such as "-000000000000001"
                if digitChars.isEmpty && c == "0" {
                    continue
                }
                digitChars.append(c)
                // Check range of expected integer
                if digitChars.count > 10 {
                    return isNegative ? min : max
                }
            } else {
                if c == " " {
                    continue
                } else if c == "-" {
                    isNegative = true
                } else if c == "+" {
                    isNegative = false
                } else if c == "0" {
                    isNegative = false
                } else if c.isDigit {
                    isNegative = false
                    digitChars.append(c)
                } else {
                    return 0
                }
            }
        }
        let str = String(digitChars)
        let abs = Int(str) ?? 0
        let ret = (isNegative ?? false) ? -abs : abs
        if ret < min { return min }
        else if ret > max { return max }
        else { return ret }
    }
}
extension Character {
    static let digitsCharacterSet = CharacterSet(charactersIn: "0123456789")
    var isDigit: Bool {
        guard let unicodeScalar = unicodeScalars.first else { return false }
        return Character.digitsCharacterSet.contains(unicodeScalar)
    }
}

let solution = Solution()
let str = "0-1" // "42", "   -42", "4193 with words", "words and 987", "-91283472332"

print("Int32.min: \(Int32.min)")
print("Int32.max: \(Int32.max)")

let ans = solution.myAtoi(str)
print("ans: \(ans)")
