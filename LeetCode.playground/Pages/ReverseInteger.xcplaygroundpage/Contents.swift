import Foundation

final class Solution {
    //let min: Int = Int(truncating: NSDecimalNumber(decimal: pow(-2, 31)))
    //let max: Int = Int(truncating: NSDecimalNumber(decimal: pow(2, 31) - 1))
    func reverse(_ x: Int) -> Int {
        guard x < Int32.max else { return 0 }
        guard x > Int32.min else { return 0 }
        var n = 1
        var p10 = 1, p10X = 1
        var a = [Int]()
        while true {
            let t = p10.multipliedReportingOverflow(by: 10)
            guard t.overflow == false else { return 0 }
            let p10New = t.partialValue
            guard p10New < Int32.max else { return 0 }
            guard p10New > Int32.min else { return 0 }
            p10 = p10New
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
            let t1 = p10X.multipliedReportingOverflow(by: n)
            guard t1.overflow == false else { return 0 }
            let p10n = t1.partialValue
            guard p10n < Int32.max else { return 0 }
            guard p10n > Int32.min else { return 0 }
            let t2 = ret.addingReportingOverflow(p10n)
            guard t2.overflow == false else { return 0 }
            let newRet = t2.partialValue
            guard newRet < Int32.max else { return 0 }
            guard newRet > Int32.min else { return 0 }
            ret = newRet
            p10X /= 10
        }
        return ret
    }

    // Experimental
    func numberOfDigits(_ x: Int) -> Int {
        var n = 1
        var p10 = 1
        while true {
            p10 *= 10
            if x / p10 < 1 { break }
            n += 1
        }
        return n
    }
}

let solution = Solution()

let x = 120
let ans = solution.reverse(x)
print("ans: \(ans)")

//let nd = solution.numberOfDigits(x)
//print("nd: \(nd)")

// 123
// 1111011
// 0000000001111011

// 321
// 101000001
// 0000000101000001
