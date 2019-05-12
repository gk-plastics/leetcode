import Foundation

final class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        let sCount = s.count
        guard s.count > 2 else { return s }
        guard numRows > 1 else { return s }
        guard numRows <= s.count else { return s }
        var curRow = 0
        var curCol = 0
        var currentIndexInt = 0
        var currentIndex: String.Index = s.startIndex
        var convertedCharacters: [Character] = [s[currentIndex]]
        convertedCharacters.reserveCapacity(sCount)
        while curRow < numRows {
            while let tuple = nextChar(s: s, sCount: sCount, numRows: numRows, curRow: curRow, curCol: curCol, currentIndexInt: currentIndexInt, currentIndex: currentIndex) {
                //print("char: \(tuple.char)")
                //print("currentIndexInt: \(currentIndexInt)")
                convertedCharacters.append(tuple.char)
                currentIndexInt = tuple.indexInt
                currentIndex = tuple.index
                curCol += 1
            }
            guard curRow < numRows - 1 else { break }
            curRow += 1
            curCol = 0
            currentIndexInt = curRow
            currentIndex = s.index(s.startIndex, offsetBy: currentIndexInt)
            convertedCharacters.append(s[currentIndex])
        }
        return String(convertedCharacters)
    }
    private func nextChar(s: String, sCount:Int, numRows: Int, curRow: Int, curCol: Int, currentIndexInt: Int, currentIndex: String.Index) -> (char: Character, indexInt: Int, index: String.Index)? {
        let interval: Int
        if curRow == 0 {
            interval = intervalA(numRows: numRows, curRow: curRow)
        } else if curRow == numRows - 1 {
            interval = intervalB(curRow: curRow)
        } else {
            if curCol % 2 == 0 {
                interval = intervalA(numRows: numRows, curRow: curRow)
            } else {
                interval = intervalB(curRow: curRow)
            }
        }
        let nextIndexInt = currentIndexInt + interval
        guard nextIndexInt < sCount else { return nil }
        let nextIndex = s.index(currentIndex, offsetBy: interval)
        let nextChar = s[nextIndex]
        return (char: nextChar, indexInt: nextIndexInt, index: nextIndex)
    }
    private func intervalA(numRows: Int, curRow: Int) -> Int {
        return (numRows - curRow - 1) * 2
    }
    private func intervalB(curRow: Int) -> Int {
        return curRow * 2
    }
}

let solution = Solution()
let ans = solution.convert("ABC", 4)
print("ans: \(ans)")

/*

DRAGONBALLZISAGREATANIMATIONSHOWITSAWESOMEYOUSHOULDSEE
---------------------
numRows = 3

 D O L A A I I H
 RGNAZSGETNMTOSO
 A B I R A A N W

 0 4 8 12              4      (numRows - row - 1) * 2, , (row) * 2
 135791113             2, 2..
 2 6 10                4
---------------------
numRows = 4

 D  B  S  A  A  H
 R NA IA ET MT SO
 AO LZ GA AI IN W
 G  L  R  N  O

 0 6 12 18              6      (numRows - row - 1) * 2, (row) * 2
 1 5 7 11 13            4, 2..
 2 4 8 10 14            2, 4..
 3 9 15                 6
---------------------
numRows = 5
 D   L   T   O
 R  AZ  AA  IN
 A B I R N T S
 GN  SG  IA  H
 O   A   M   O

 0 8 16 24               8      (numRows - row - 1) * 2, , (row) * 2
 1 7 9 15 17 23          6, 2..
 2 6 10 14 18            6
 3 5 11 13 19 21         2, 6..
 4 12 20 28              8
---------------------
numRows = 6
D    Z    M    I    E    S
R   LI   IA   WT   MY   DE
A  L S  N T  O I  O O  L E
G A  G A  I H  S S  U U
OB   RT   OS   AE   SO
N    A    N    W    H
0 10 20 30 40           10     (numRows - row - 1) * 2, , (row) * 2
1 9 11 19 21            8, 2..
2 8 12 18 22 28 32      6, 4..
3 7 13 17 23 27         4, 6..
4 6 14 16               2, 8..
5 15                    10
 */
