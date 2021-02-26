## 贪心算法介绍
一种寻找最优解或近似最优解的方法。

在求解过程中，会把问题分成若干部分，每部分都取最优的解，直到解决问题。


## 特点
#### 优点
易实现、速度快、接近最优解
#### 缺点
这种解法的缺点是，不会从宏观看问题，只看局部最优。就好比只看眼前的利益而不是从全局的角度去看问题。

## 具体步骤
1. 减小问题规模，使用最优解。即解决问题的每一步都使用一个当前最优解策略
    - 所谓最优策略其实是你制定的一个标准
2. 使用制定的标准直到结束得出答案

比如，在找硬币问题里。每次都选择面额最大且不超出剩余金额的硬币，这叫做最优策略。每一次剩余总额都减去选择的金额，这叫做减小问题规模。直到余额为0，这样就得出了答案。

## 应用场景
1. 解决如何在满足情况下使用最小成本，比如找零问题、背包最大价值问题

## 例子
### 1.找零
假设你开了间小店，不能电子支付，钱柜里的货币只有25 分、10分、5分和1分四种硬币，如果你是售货员且要找给客户41分钱的硬币，如何安排才能找给客人的钱既正确且硬币的个数又最少？

#### 思路
1. 每次都找符合条件的硬币数
2. 最后统计一下选择的钱币

## 2.背包最大价值问题
 有一个背包，最多能承载重量为150的物品，现在有7个物品（物品不能分割成任意大小），编号为 1~7，重量分别是 [35,30,60,50,40,10,25]，价值分别是[10,40,30,50,35,40,30]，现在从这 7 个物品中选择一个或多个装入背包，每个物品只能选择一次，要求在物品总重量不超过 C 的前提下，所装入的物品总价值最高。
 
#### 思路
1. 每次都寻找价值最高的物品
2. 在背包承重允许的情况下放入找到的物品，直到放不下