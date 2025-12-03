import Foundation

func getFileItems(fileName: String) -> [[Int]] {
    let url = URL(fileURLWithPath: fileName)
    let contents = try! String(contentsOf: url)
    return contents
        .split(separator: "\n")
        .map { line in line.map { Int(String($0))! }}
}

let arr = getFileItems(fileName: "day3.input")
func part1Solution(arr: [[Int]]) {
    var joltage = 0
    for a in arr {
        var prefix = a[0]
        var total = 0
        for idx in 1 ..< a.count {
            let calculated = prefix * 10 + a[idx]
            if calculated > total {
                total = calculated
            }
            if a[idx] > prefix {
                prefix = a[idx]
            }
        }
        joltage += total
    }

    print(joltage)
}

func part2Solution(arr _: [[Int]]) {}
