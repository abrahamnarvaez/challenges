struct Point {
    let x: Int
    let y: Int
}

struct Rect {
    let topLeft: Point
    let topRight: Point
    let bottomLeft: Point
    let bottomRight: Point
}

struct HorizontalLine {
    let leftPoint: Point
    let rightPoint: Point
}

struct VerticalLine {
    let topPoint: Point
    let bottomPoint: Point
}

// if rects intersect, at least two pairs of lines will intersect
func rectsAreOverlapping(rect1: Rect, rect2: Rect) -> Bool {
    var intersections = 0

    let horizontalLines = [
        HorizontalLine(leftPoint: rect1.topLeft, rightPoint: rect1.topRight),
        HorizontalLine(leftPoint: rect1.bottomLeft, rightPoint: rect1.bottomRight),
        HorizontalLine(leftPoint: rect2.topLeft, rightPoint: rect2.topRight),
        HorizontalLine(leftPoint: rect2.bottomLeft, rightPoint: rect2.bottomRight)
    ]
    
    let verticalLines = [
        VerticalLine(topPoint: rect1.topLeft, bottomPoint: rect1.bottomLeft),
        VerticalLine(topPoint: rect1.topRight, bottomPoint: rect1.bottomRight),
        VerticalLine(topPoint: rect2.topLeft, bottomPoint: rect2.bottomLeft),
        VerticalLine(topPoint: rect2.topRight, bottomPoint: rect2.bottomRight)
    ]
    
    for h in horizontalLines {
        for v in verticalLines {
            if linesOverlap(horizontalLine: h, verticalLine: v) {
                intersections += 1
                if intersections >= 2 {
                    return true
                }
            }
        }
    }
    return false
}

func linesOverlap(horizontalLine: HorizontalLine, verticalLine: VerticalLine) -> Bool {
    if (horizontalLine.leftPoint.x < verticalLine.bottomPoint.x && horizontalLine.rightPoint.x > verticalLine.bottomPoint.x) && (verticalLine.bottomPoint.y < horizontalLine.leftPoint.y && verticalLine.topPoint.y > horizontalLine.leftPoint.y) {
        return true
    }
    return false
}

let rect1 = Rect(topLeft: Point(x: -3, y: 3), topRight: Point(x: 0, y: 3), bottomLeft: Point(x: -3, y: 0), bottomRight: Point(x: 0, y: 0))
let rect2 = Rect(topLeft: Point(x: -2, y: 2), topRight: Point(x: 1, y: 2), bottomLeft: Point(x: -2, y: -4), bottomRight: Point(x: 1, y: -4))

let rect3 = Rect(topLeft: Point(x: 6, y: 6), topRight: Point(x: 8, y: 6), bottomLeft: Point(x: 6, y: 0), bottomRight: Point(x: 8, y: 0))

let rect12 = rectsAreOverlapping(rect1: rect1, rect2: rect2)
if rect12 {
    print("rect1 and rect2 overlap")
} else {
    print("rect1 and rect2 don't overlap")
}

let rect23 = rectsAreOverlapping(rect1: rect2, rect2: rect3)
if rect23 {
    print("rect2 and rect3 overlap")
} else {
    print("rect2 and rect3 don't overlap")
}
