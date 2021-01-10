// returns the nth fibonacci number using one-based numbering
func fibonacciRecursive(n: Int) -> Int {
    guard n > 0 else {
        return 0
    }
    if n <= 2 {
        return n-1
    }
    return fibonacciRecursive(n: n-1) + fibonacciRecursive(n: n-2)
}

func fibonacciDynamic(n: Int) -> Int {
    var f = [0, 1]
    f.reserveCapacity(n)
    
    guard n > 0 else {
        return 0
    }
    if n <= 2 {
        return n-1
    }
    
    for i in 2..<n {
        print(i)
        f.append(f[i-1] + f[i-2])
    }
    return f[n-1]
}

// optimize space...
func fibonacciOptimized(n: Int) -> Int {
    var f = [0, 1]
    
    guard n > 1 else {
        return 0
    }
    for _ in 2..<n {
        let lastFib = f.reduce(0, +)
        f[0] = f[1]
        f[1] = lastFib
    }
    return f[1]
}

let eleventh = 11

fibonacciRecursive(n: eleventh)
fibonacciDynamic(n: eleventh)
fibonacciOptimized(n: eleventh)

