
struct NestedListElement {
    let int: Int?
    let nestedList: [NestedListElement]
}

var sum = 0
func nestedListWeightSum(nestedList: [NestedListElement], level: Int = 1) {
    for n in nestedList {
        if let x = n.int {
            sum += x * level
        } else {
            nestedListWeightSum(nestedList: n.nestedList, level: level+1)
        }
    }
}

let empty = [NestedListElement]()

let twosList = [NestedListElement(int: nil, nestedList: [NestedListElement(int: 2, nestedList: empty), NestedListElement(int: 2, nestedList: empty)])]
var list1 = twosList
list1.append(NestedListElement(int: 2, nestedList: empty))
list1.append(contentsOf: twosList)

nestedListWeightSum(nestedList: list1)
print(sum)
