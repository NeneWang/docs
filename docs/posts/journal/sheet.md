


- In order 

```

if != nill:
    inorder(root.left)
    print(root.key)
    inorder(root.right)

Search:
def search(node, target)
    while(node ! Null and target != node.val):
        if node.right and node.val > target and node.right == target:
            node = node.right
        else: 
            node= node.left
    retunr node

```

inorder:

```
def inorder(node):
    inorder(node.left)
    print(node.key)
    inorder(node.right)

```


```
def query(node, target)
    if node.key == target:
        return node
    elif node.key > target:
        node = node.right
    elif 
        node = node.left
```

```
def inorder(node):
    inorder(node.left)
    print(node.key)
    inorder(node.right)
```

```
def minmax(arr):
    if arr.length == 1:
        return arr[0]
    
    max, min
    if arr[0] > arr[1]:
        max = arr[0]
        min = ...
    else...

    for x in arr:
        if x > max:
            ...
        if x < min
            ...

```

- It could be an integration with other things.

```
def treeInsert(node, tar):
    
    if tar > node.key
        if node.right:
            treeInsert(node.right, tar)
        else:
            node.right = tar
    elif tar < node.key:
        if node.left:
            treeInsert(node.left, tar)
        else:
            node.left = tar


```


```
def treeInsert(T, tar):
    parent = nil
    curr = T

    while(curr):
        parent = curr
        curr = curr.key > tar ? curr.right : curr.left
    
    tar.parent = parent
    if !curr:
        T.head = null
    if tar > curr.key:
        curr.right = tar
    else:
        curr.left = tar

```



```python
def treeInsert(T, tar):
    
    curr = T.root
    par = None
    while(curr):
        par = curr
        curr = tar.val > curr.val ?curr.right : curr.left
    
    tar.parent = parent

    if !curr:
        T.root = tar
    if curr.val > tar.val:
        curr.right = tar
    else:
        curr.left= tar

```














