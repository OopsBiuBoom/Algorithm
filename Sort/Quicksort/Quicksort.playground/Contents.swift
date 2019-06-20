// 快排low版
func Quicksort(arr: [Int]) -> [Int] {
    if arr.count <= 1 {
        return arr
    }
    
    let midIndex = arr.count/2
    let mid = arr[midIndex]
    var lowArr = [Int]()
    var heightArr = [Int]()
    
    var beSortedArr = arr
    beSortedArr.remove(at: midIndex)
    
    for c in beSortedArr {
        if c < mid {
            lowArr.append(c)
        } else {
            heightArr.append(c)
        }
    }
    
    return Quicksort(arr: lowArr) + [mid] + Quicksort(arr: heightArr)
}

// 测试
Quicksort(arr: [111,2,32,23,1,2,8,3,1,2,3,7,8,3,2,23,523,113])

