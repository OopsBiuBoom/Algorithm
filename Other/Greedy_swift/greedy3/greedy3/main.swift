/*
 有100枚硬币，其中1枚重量与众不同，是假币，略轻一些。如果用天平秤，请问至少称几次一定能找到这枚假币。
 */

import Foundation

/// 硬币
class Coin {
    // 编号
    var id: Int = 0
    // 重量
    var weigth: Float = 10
    
    convenience init(id: Int) {
        self.init()
        self.id = id
    }
}

/// 硬币集合
var coins = [Coin]()

let totalCoinCount: Int = 100

// MARK: - 功能函数

// 初始化
func setup() {
    
    // 随机数，用于随机假币
    let randomNumber:Int = Int(arc4random() % UInt32(totalCoinCount)) + 1
    
    for i in 1...totalCoinCount {
        
        let coin = Coin(id: i)
        
        // 制造假币
        if randomNumber == i {
            coin.weigth = 9
        }
        
        // 添加集合
        coins.append(coin)
    }
}

/// 获取总重量
func totalWeigth(arr: [Coin]) -> Float {
    
    var sum: Float = 0
    
    for item in arr {
        sum += item.weigth
    }
    
    return sum
}


/// 拆分数组
func splitArr() -> [[Coin]]{
    // 获取拆分后总数
    let splitCount = Int(coins.count/3)
    
    // 拆分成3份
    let coins1 = coins[0..<splitCount]
    let coins2 = coins[splitCount..<splitCount+splitCount]
    let coins3 = coins[splitCount+splitCount..<coins.count]
        
    return [Array(coins1), Array(coins2), Array(coins3)]
}

// 打印结果
func print(coin: Coin) {
    print("总共执行了\(count)次")
    print("劣质硬币编号为\(coin.id)，重量为\(coin.weigth)")
}

// MARK: - 主要逻辑

/* 思路（ 这一题的解题方法是属于分治法呢？还是贪婪算法？）
 - 分成3份，编号1、2、3
 - 编号1和编号2比较
    - 如果相等，把编号3继续拆分
    - 如果不相等，把轻的部分取出，继续拆分成3份
 - 重复上面的步骤最后找出轻的硬币编号
 */

// 初始化
setup()

// 执行次数
var count = 0

// 主要逻辑，可以使用while或递归实现
while true {

    // 结束条件
    if coins.count == 1 {
        // 当只剩最后一个时，不需要计算次数，因为已经找到了
        print(coin: coins.last!)
        break
    } else if coins.count == 2 {
        // 次数计算
        count += 1
        
        let coin1 = coins.first!
        let coin2 = coins.last!
        
        if coin1.weigth < coin2.weigth {
            print(coin: coin1)
            break
        } else {
            print(coin: coin2)
            break
        }
    }
    
    // 次数计算
    count += 1
    
    // 拆分数组
    let arrs = splitArr()
    
    let weight1 = totalWeigth(arr: arrs[0])
    let weight2 = totalWeigth(arr: arrs[1])
    
    // 编号1和编号2比较
    if weight1 == weight2 {
        // 如果相等，把编号3继续拆分
        coins = arrs[2]
    } else if weight1 < weight2  {
        // 如果编号1小于编号2，拆分编号1
        coins = arrs[0]
    } else if weight1 > weight2 {
        // 如果编号2小于编号1，拆分编号2
        coins = arrs[1]
    }
}





