// 快排low版
func Quicksort(arr: [Int]) -> [Int] {
    // 结束条件
    if arr.count <= 1 {
        return arr
    }
    
    // 基准值下标
    let midIndex = arr.count/2
    // 基准值
    let mid = arr[midIndex]
    
    //
    var lowArr = [Int]()
    var heightArr = [Int]()
    var midArr = [Int]()
    
    // 如果数组里的数比基准值小，就放lowArr，相等就放入midArr，否则放heightArr
    for c in arr {
        if c < mid {
            lowArr.append(c)
        } else if c == mid {
            midArr.append(c)
        } else {
            heightArr.append(c)
        }
    }
    
    // 规模不断减小，分治法
    return Quicksort(arr: lowArr) + midArr + Quicksort(arr: heightArr)
}

// 测试
Quicksort(arr: [111,2,32,23,1,2,8,3,1,2,3,7,8,3,2,23,523,113])

