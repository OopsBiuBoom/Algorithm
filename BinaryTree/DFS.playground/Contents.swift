import Cocoa

/// 节点
class Node<T> {
    /// 左指针
    var left: Node?
    /// 右指针
    var right: Node?
    /// 数据
    var data: T?
    
    /// 创建节点
    class func creat(left: Node? = nil, right:Node? = nil, data: T?) -> Node {
        let node = Node()
        node.left = left
        node.right = right
        node.data = data
        
        return node
    }
}

/// 二叉树
class BTree<T> {
    
    var root: Node<T>?
    
    ///  树的最大深度
    func maxDepth(node: Node<T>?) -> Int {
        guard let node = node else {
            return 0
        }
        return max(maxDepth(node: node.left), maxDepth(node: node.right)) + 1
    }
}


/// 创建并赋值二叉树
func creatTree() -> BTree<Int> {
    let tree = BTree<Int>()
    let root = Node.creat(data: 1)
    let left1 = Node.creat(data: 2)
    let left11 = Node.creat(data: 4)
    let left12 = Node.creat(data: 5)
    let left21 = Node.creat(data: 7)
    let left22 = Node.creat(data: 8)
    let right1 = Node.creat(data: 3)
    let right11 = Node.creat(data: 6)
    
    // 左子树
    root.left = left1
    left1.left = left11
    left1.right = left12
    left12.left = left21
    left12.right = left22

    // 右子树
    root.right = right1
    right1.right = right11
    
    tree.root = root
    
    return tree
}



let tree = creatTree()
let depth = tree.maxDepth(node: tree.root)
print("树的最大深度 = \(depth)")
