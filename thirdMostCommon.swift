
func thirdMostCommon(strings: [String]) -> String {
    var occurencesDict = [String: Int]()
    for s in strings {
        occurencesDict[s] = (occurencesDict[s] ?? 0) + 1
    }
    print(occurencesDict)
    
    let sortedOccurrenceCounts = occurencesDict.values.sorted(by: >)
    if sortedOccurrenceCounts.count < 3 {
        for o in occurencesDict {
            if o.value == sortedOccurrenceCounts.last {
                return o.key
            }
        }
    }
    
    let thirdMostOccurrence = sortedOccurrenceCounts[2]
    return occurencesDict.first(where: { $1 == thirdMostOccurrence })!.key
}

let strings = ["a", "a", "a", "a", "b", "b", "b", "c"]
thirdMostCommon(strings: strings)
