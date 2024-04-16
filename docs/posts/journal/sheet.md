


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


```
def deleteNode(T, node)
    # search
    curr = T.root
    while (curr != node)
        if curr.key > node.key:
            curr = curr.right
        else:
            curr = curr.left
    
    # Found and start deletion
    if curr.right == null:
        transplant(T, curr.left, curr)
    elif curr.left == null:
        transplant(T, curr.right, curr)
    
    # Delete  worstcase
    else: 
        succ = succ.right
        while succ.left:
            succ = succ.left
        
        root = transplant(T, curr, succ)
        succ.left = node.left
        succ.left.parent = succ

def transplant(root, node_to_replace, replacement_node):
    if node_to_replace.parent is None:
        root = replacement_node
    elif node_to_replace == node_to_replace.parent.left:
        node_to_replace.parent.left = replacement_node
    else:
        node_to_replace.parent.right = replacement_node
    if replacement_node is not None:
        replacement_node.parent = node_to_replace.parent
    return root
```

```

def transplant(root, node_to_replace, replacement_node):
    if node_to_replace.parent is None:
        # Funny how root is only used here.
        root = replacement_node
        
    if node_to_replace == ntr.parent.left:
        ntr.parent.left = rn
    elif ntr == ntr.parent.right:
        ntr.parent.right = rn
    
    if rn is not None:
        rn.parent = ntr.parent

    return root



```



```

def deleteN(root node, ntr):
    # search

    curr = #search
    # Deletes the node by replace right or left.
    if not ntr.right: transplant(curr, ntr, left)
    else if not ntr.left: transplant(curr, ntr, ntr.right)

    # else
    else:
        succ = ntr.right
        #find min.
        while...succ=.left

        # if cases. if ntr.parent != root
        if succ.parent != curr:
            transplant(root, succ, succ.right)
            succ.right = root.right
            succ.right.parent = succ
        
        transplant(root, succ, left)
        succ.left = root.left
        succ.left.parent = succ

```

```

transplant(root, ntr, nr):
    if ntr.parent == null: root = nr
    if ntr == ntr.p.right: ntr.parent.right = nr
    if ntr == ntr.p.left: ntr.parent.left = nr

    if nr is leaf of something: nr.parent = ntr.parent


delnode(root, nd):
    curr = #search

    if curr.left is none: replace with right
    elseif curr.right is none: replace with left

    else:
        succ = curr.right
        while succ.left: succ.=left

        if succ.p != curr:
            transplant(node, succ, succ.right)
            succ.right = curr.right
            succ.right.p = succ


    if succ.p != curr:
        transplant(node, succ, succ.right)
        succ.right = curr.right
        succ.right.p = succ
    
    transplant(node, succ, succ.left)
    succ.left = curr.left
    succ.left.p = succ

```



```

delnode(root, nd):
    curr = #search

    if curr.left is none:replace with right
    elseif curr.right is none; replace with left.

    else:
        succ = succ.right; while succ.left: succ.=left

        if (succ.p != curr):
            trans(root, succ, curr.right)
            succ.right = curr.right
            succ.r.p = succ

        trans(root, succ, curr.left)
        succ.left = curr.left
        succ.left.parent =  succ


```


```
def transp(root, ntr, nr): 
    if ntr is null: replace root with nr
    if ntr.p.left = ntr: ntr.p.left = nr
    "" same with right

    if nr is not None:
        nr.p = ntr.parent
```

































- Allow me this small chapter and I will be yrs for ever.























