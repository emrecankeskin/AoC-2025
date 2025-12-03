import Foundation

func getFileItems(fileName: String) -> [[Int64]] {
    let url = URL(fileURLWithPath: fileName)
    let contents = try! String(contentsOf: url).trimmingCharacters(in: .newlines)
    return contents
        .split(separator: ",")
        .map { String($0) }
        .map { part in
            let numbers = part.split(separator: "-").compactMap { Int64($0) }
            return numbers
        }
}

func checkIfInvalid(number: String) -> Bool {
    let mid = number.count / 2
    let left = String(number.prefix(mid))
    let right = String(number.suffix(number.count - mid))
    return left == right
}

var invalid: Int64 = 0

let arr = getFileItems(fileName: "day2.input")
for item in arr {
    let left = item[0]
    let right = item[1]
    for num in left ... right {
        if String(num).count % 2 == 0 {
            if checkIfInvalid(number: String(num)) {
                invalid += num
            }
        }
    }
}

print(invalid)
