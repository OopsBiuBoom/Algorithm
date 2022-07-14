import UIKit

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
    
    /// 先序遍历（根，左，右）
    func firstTraverse(node: Node<T>?) {
        guard let node = node else { return }
        print(node.data ?? "")
        firstTraverse(node: node.left)
        firstTraverse(node: node.right)
    }
    
    /// 中序遍历（左，根，右）
    func midTraverse(node: Node<T>?) {
        guard let node = node else { return }
        midTraverse(node: node.left)
        print(node.data ?? "")
        midTraverse(node: node.right)
    }
    
    /// 后序遍历（左，右，根）
    func lastTraverse(node: Node<T>?) {
        guard let node = node else { return }
        lastTraverse(node: node.left)
        lastTraverse(node: node.right)
        print(node.data ?? "")
    }
    
    /// 层序遍历
    func layerTraverse() {
        guard let root = root else { return }
        var queue = [Node<T>]()
        // 加入根节点
        queue.append(root)
        while (!queue.isEmpty) {
            // 出队
            let node = queue.removeFirst()
            // 输出
            print(node.data ?? "")
            // 如果当前节点有左节点，就添加
            if let leftNode = node.left { queue.append(leftNode) }
            // 如果当前节点有右节点，就添加
            if let rightNode = node.right { queue.append(rightNode) }
        }
    }
    
    /// 先序遍历：迭代
    func firstTraverseIterate() {
        var stack = [Node<T>]()
        var node = root
        guard let pNode = node else { return }
        // 加入根节点
        stack.append(pNode)
        while !stack.isEmpty {
            // 出栈
            node = stack.removeLast()
            print("\(String(describing: node?.data))")
            // 如果当前节点有右节点，就添加
            if let rightNode = node?.right { stack.append(rightNode) }
            // 如果当前节点有左节点，就添加
            if let leftNode = node?.left { stack.append(leftNode) }
        }
    }
    
    /// 中序遍历：迭代
    func midTraverseIterate() {
        var stack = [Node<T>]()
        var pNode = root
        // 只有遍历到最后一个节点 或者 栈为空时，才停止遍历
        while pNode != nil || !stack.isEmpty {
            if let tNode = pNode {
                // 持续遍历左子树
                stack.append(tNode)
                pNode = tNode.left
            } else {
                // 输出，并遍历右子树
                let tNode = stack.removeLast()
                print("\(String(describing: tNode.data))")
                pNode = tNode.right
            }
        }
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
print("先序遍历-递归")
tree.firstTraverse(node: tree.root)
print("先序遍历-遍历")
tree.firstTraverseIterate()
print("中序遍历-递归")
tree.midTraverse(node: tree.root)
print("中序遍历-迭代")
tree.midTraverseIterate()
//print("后序遍历")
//tree.lastTraverse(node: tree.root)
//print("层序遍历")
//tree.layerTraverse()


