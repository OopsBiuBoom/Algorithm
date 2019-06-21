func Quicksort<T: Comparable>(arr: [T]) -> [T] {
    // 结束条件
    guard arr.count > 1 else { return arr }
    // 取一个字作为基准值
    let pivot = arr[arr.count/2]
    // 小于基准值
    let lowArr = arr.filter( { $0 < pivot } )
    // 等于基准值
    let equalArr = arr.filter( { $0 == pivot } )
    // 高于基准值
    let hightArr = arr.filter( { $0 > pivot } )
    
    /// 让分离出来的两边的数组再去执行以上步骤，直到排序成功。最后合并起来就是排序好的数组
    return Quicksort(arr: lowArr) + equalArr + Quicksort(arr: hightArr)
}

// 测试
Quicksort(arr: [111.1,2,32,23.3,1.4,2.8,8,3,1,2,3,7,8,3,2,23,523.2,113])

