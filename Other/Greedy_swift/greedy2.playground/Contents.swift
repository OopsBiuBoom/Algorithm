/*
 背包最大价值问题
 
 有一个背包，最多能承载重量为150的物品，
 现在有7个物品（物品不能分割成任意大小），
 编号为 1~7，
 重量分别是 [35,30,60,50,40,10,25]，
 价值分别是 [10,40,30,50,35,40,30]，
 现在从这 7 个物品中选择一个或多个装入背包，
 每个物品只能选择一次，
 要求在物品总重量不超过 C 的前提下，
 所装入的物品总价值最高。
 */

import Foundation

/// 物品类
class Item {
    /// 编号
    var id: Int = 0
    /// 重量
    var weight: Float = 0
    /// 价值
    var worth: Float = 0
    
    convenience init(id: Int, weight: Float, worth: Float) {
        self.init()
        self.id = id
        self.weight = weight
        self.worth = worth
    }
}

/// 初始化物品
var items = [
    Item(id: 1, weight: 35, worth: 10),
    Item(id: 2, weight: 30, worth: 40),
    Item(id: 3, weight: 60, worth: 30),
    Item(id: 4, weight: 55, worth: 50),
    Item(id: 5, weight: 40, worth: 35),
    Item(id: 6, weight: 10, worth: 40),
    Item(id: 7, weight: 25, worth: 30)
]

/// 背包
class Bag {
    /// 背包最大重量
    var weight: Float = 150
    
    /// 背包装载的物品
    var items = [Item]()
    
    /// 背包物品总价值
    var worth: Float = 0
}

// 初始化背包
let bag = Bag()

// 次数
var count = 0;

// 以价值为标准的逻辑
while true {
    
    count += 1
    
    // 找出价值最大的物品
    // 默认选择第一个作为价值最高的物品
    var maxworthItemIndex = 0
    for (index, item) in items.enumerated() {
        
        // 当临时变量存储的物品价值小于新的物品价值时，替换临时变量
        if items[maxworthItemIndex].worth < item.worth {
            maxworthItemIndex = index
        }
    }
    
    // 判断背包是否还能装入
    if (bag.weight > items[maxworthItemIndex].weight) {
        // 装入背包
        bag.items.append(items[maxworthItemIndex])
        bag.weight -= items[maxworthItemIndex].weight
        // 计入总价值
        bag.worth += items[maxworthItemIndex].worth
        
        print("第\(count)次，选择了编号\(items[maxworthItemIndex].id)的物品，价值为\(items[maxworthItemIndex].worth)")
        
        // 从剩余物品中移除
        items.remove(at: maxworthItemIndex)
    } else {
        
        // 背包已经不能再装了
        break
    }
}

// 统计
// 选择的物品编号
var ids = ""

for item in bag.items {
    ids += "\(item.id)，"
}
print("选择了\(bag.items.count)个物品，总价值为\(bag.worth),他们分是\(ids)背包剩余重量\(bag.weight)")




