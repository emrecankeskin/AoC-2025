import Foundation

func getFileItems(fileName: String) -> [String] {
    let url = URL(fileURLWithPath: fileName)

    let contents = try! String(contentsOf: url)

    return contents.split(separator: "\n").map { String($0) }
}

let arr = getFileItems(fileName: "day1.input")

var counts: Int = 0

var dial = 50

for item in arr {
    let parsed = Int(item.suffix(from: item.index(item.startIndex, offsetBy: 1)))!

    let number = item.first == "L" ? -parsed : parsed

    dial = ((dial + number) % 100 + 100) % 100

    if dial == 0 {
        counts += 1
    }
}

print(counts)
