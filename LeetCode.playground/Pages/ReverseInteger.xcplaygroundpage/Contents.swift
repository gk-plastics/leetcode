import Foundation

final class Solution {
    func reverse(_ x: Int) -> Int {
        var n = 1
        var p10X = 1
        var a = [Int]()
        while true {
            let p10 = Int(truncating: NSDecimalNumber(decimal: pow(10, n)) )
            //print("p10: \(p10)")
            let m = (x % p10)
            //print("m: \(m)")
            let d = m / p10X
            //print("d: \(d)")
            a.append(d)
            if x / p10 < 1 { break }
            n += 1
            p10X = p10
        }
        var ret = 0
        for n in a {
            ret += n * p10X
            p10X /= 10
        }
        return ret
    }

    // Experimental
    func numberOfDigits(_ x: Int) -> Int {
        var n = 1
        while true {
            let p10 = Int(truncating: NSDecimalNumber(decimal: pow(10, n)) )
            if x / p10 < 1 { break }
            n += 1
        }
        return n
    }
}

let solution = Solution()

let x = 123456789

// let nd = solution.numberOfDigits(x)
// print("nd: \(nd)")

let r = solution.reverse(x)
print("r: \(r)")


// 123
// 1111011
// 0000000001111011

// 321
// 101000001
// 0000000101000001
