/*
 找零钱问题

 假设你开了间小店，不能电子支付，
 钱柜里的货币只有 25 分、10 分、5 分和 1 分四种硬币，
 如果你是售货员且要找给客户41分钱的硬币，
 如何安排才能找给客人的钱既正确且硬币的个数又最少？
 */

import Foundation

// 四种硬币
let coin25 = 25
let coin10 = 10
let coin5 = 5
let coin1 = 1
let coins = [coin25, coin10, coin5, coin1]

// 需要找零的总数
var total_conin = 41

// 选择的次数
var count = 0

print("需要\(total_conin)的硬币")

while total_conin > 0 {
    
    // 次数增加
    count += 1
    
    // 选择最合适且最大的硬币
    for coin in coins {
        if coin <= total_conin {
            print("第\(count)次，选择了\(coin)的硬币")
            total_conin -= coin
            print("剩余\(total_conin)")
            break;
        }
    }
}

print("共找了\(count)次")

