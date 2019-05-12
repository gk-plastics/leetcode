import UIKit

final class BubbleSort {
    func sort(array: [Int]) -> [Int] {
        print("==== Beginning bubbleSort ====")
        var ret = array
        let len = array.count
        for i in 0..<len {
            var hasSwapped = false
            for j in 0..<(len - 1 - i) {
                if ret[j] > ret[j + 1] {
                    let temp = ret[j]
                    // print("swapping \(ret[j]) and \(ret[j + 1]) ")
                    ret[j] = ret[j + 1]
                    ret[j + 1] = temp
                    hasSwapped = true
                }
            }
            if hasSwapped == false { break }
        }
        return ret
    }
}

final class QuickSort {
    func sort(array: [Int]) -> [Int] {
        print("==== Beginning quicksort ====")
        var mutableArray = array
        quickSort(array: &mutableArray, low: 0, high: array.count - 1)
        return mutableArray
    }
    private func quickSort(array: inout [Int], low: Int, high: Int) {
        //print("quickSort")
        guard low < high else { return }
        let p = partition(array: &array, low: low, high: high)
        quickSort(array: &array, low: low, high: p - 1)
        quickSort(array: &array, low: p + 1, high: high)
    }
    private func partition(array: inout [Int], low: Int, high: Int) -> Int{
        //print("partition")
        let pivot = array[high] // array[low + (high - low) / 2]
        var i = low - 1
        // If current element is less than or equal to the pivot, proceed i by 1 and swap array[i] and array[j]
        for j in low..<high {
            if array[j] > pivot { continue }
            i += 1
            // print("swapping \(array[i]) and \(array[j]) ")
            let temp = array[j]
            array[j] = array[i]
            array[i] = temp
        }
        // Swap array[i + 1] and pivot
        let p = i + 1
        let temp = array[p]
        array[p] = pivot
        array[high] = temp
        return p
    }
}

final class MergeSort {
    func sort(array: [Int]) -> [Int] {
        print("==== Beginning mergeSort ====")
        var mutableArray = array
        mergeSort(array: &mutableArray)
        return mutableArray
    }
    private func mergeSort(array: inout [Int]) {
        let n = array.count
        if n < 2 { return }
        let mid = n / 2
        var l = Array(repeating: 0, count: mid)
        var r = Array(repeating: 0, count: n - mid)
        for i in 0..<mid {
            l[i] = array[i]
        }
        for i in mid..<n {
            r[i - mid] = array[i]
        }
        mergeSort(array: &l)
        mergeSort(array: &r)
        merge(a: &array, l: l, r: r)
    }
    private func merge(a: inout [Int], l: [Int], r: [Int]) {
        let lc = l.count
        let rc = r.count
        var i = 0, j = 0, k = 0
        while i < lc && j < rc {
            if l[i] <= r[j] {
                a[k] = l[i]
                i += 1
            } else {
                a[k] = r[j]
                j += 1
            }
            k += 1
        }
        while i < lc {
            a[k] = l[i]
            i += 1
            k += 1
        }
        while j < rc {
            a[k] = r[j]
            j += 1
            k += 1
        }
    }
}

let array = [1, 8, 4, 6, 0, 3, 5, 2, 7, 9]
var startTime: TimeInterval

let bubbleSort = BubbleSort()
startTime = CACurrentMediaTime()
let bubbleSorted = bubbleSort.sort(array: array)
print("bubbleSorted: \(bubbleSorted)")
print("timeElapsed: \(CACurrentMediaTime() - startTime)")

let quickSort = QuickSort()
startTime = CACurrentMediaTime()
let quickSorted = quickSort.sort(array: array)
print("quickSorted: \(quickSorted)")
print("timeElapsed: \(CACurrentMediaTime() - startTime)")

let mergeSort = MergeSort()
startTime = CACurrentMediaTime()
let mergeSorted = mergeSort.sort(array: array)
print("mergeSorted: \(mergeSorted)")
print("timeElapsed: \(CACurrentMediaTime() - startTime)")
