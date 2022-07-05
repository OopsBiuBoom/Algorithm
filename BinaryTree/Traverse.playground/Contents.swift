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
        queue.append(root)
        while (!queue.isEmpty) {
            let node = queue.removeFirst()
            print(node.data ?? "")
            if let leftNode = node.left {
                queue.append(leftNode)
            }
            if let rightNode = node.right {
                queue.append(rightNode)
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
print("先序遍历")
tree.firstTraverse(node: tree.root)
print("中序遍历")
tree.midTraverse(node: tree.root)
print("后序遍历")
tree.lastTraverse(node: tree.root)
print("层序遍历")
tree.layerTraverse()


