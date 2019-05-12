import UIKit

final class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let c1 = nums1.count
        let c2 = nums2.count
        let c = c1 + c2
        let isEven = (c % 2) == 0
        let kMax: Int = c / 2
        var nums = Array<Int>(repeating: 0, count: kMax + 1)
        //print("isEven: \(isEven)")
        //print("kMax: \(kMax)")
        var i = 0, j = 0, k = 0
        while i < c1 && j < c2 {
            print("nums1[\(i)]: \(nums1[i])  nums2[\(j)]: \(nums2[j])")
            if nums1[i] <= nums2[j] {
                nums[k] = nums1[i]
                i += 1
            } else {
                nums[k] = nums2[j]
                j += 1
            }
            print("nums: \(nums)")
            k += 1
            if k > kMax { break }
        }
        while i < c1 && k <= kMax {
            print("nums1[\(i)]: \(nums1[i])")
            nums[k] = nums1[i]
            print("nums: \(nums)")
            i += 1
            k += 1
            if k > kMax { break }
        }
        while j < c2 && k <= kMax {
            print("nums2[\(j)]: \(nums2[j])")
            nums[k] = nums2[j]
            print("nums: \(nums)")
            j += 1
            k += 1
            if k > kMax { break }
        }
        print("nums: \(nums)")
        if isEven {
            return (Double(nums[kMax]) + Double(nums[kMax - 1])) * 0.5
        } else {
            return Double(nums[kMax])
        }
    }
}

let solution = Solution()

//do {
//    let nums1 = [1, 3]
//    let nums2 = [2]
//    let ans = solution.findMedianSortedArrays(nums1, nums2)
//}

//do {
//    let nums1 = [1, 2]
//    let nums2 = [3, 4]
//    let ans = solution.findMedianSortedArrays(nums1, nums2)
//}

do {
    let nums1 = [1, 2, 4]
    let nums2 = [3, 5, 6]
    let ans = solution.findMedianSortedArrays(nums1, nums2)
    print("ans: \(ans)")
}
