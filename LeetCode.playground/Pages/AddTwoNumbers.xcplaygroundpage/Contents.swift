import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

final class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var c = 0
        var v = 0
        var n1: ListNode? = l1
        var n2: ListNode? = l2
        var n0: ListNode?
        var n: ListNode?
        while true {
            v = c
            c = 0
            if let n = n1 {
                v += n.val
                n1 = n.next
            }
            if let n = n2 {
                v += n.val
                n2 = n.next
            }
            if v >= 10 {
                v -= 10
                c = 1
            }
            if let un = n {
                let nn = ListNode(v)
                un.next = nn
                n = nn
            } else {
                n0 = ListNode(v)
                n = n0
            }
            if n1 == nil && n2 == nil {
                if c > 0 { n?.next = ListNode(1) }
                break
            }
        }
        return n0
    }
}

let l1 = ListNode(2)
l1.next = ListNode(4)
l1.next?.next = ListNode(3)

let l2 = ListNode(5)
l2.next = ListNode(6)
l2.next?.next = ListNode(4)

let solution = Solution()
let ans = solution.addTwoNumbers(l1, l2)
var node: ListNode? = ans
while let n = node {
    print("val: \(n.val)")
    node = n.next
}
