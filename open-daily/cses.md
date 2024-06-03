


```js
class ContainerWithMostWater {
    maxArea(height) {


	    // Returns the heigths of the left and right given the arr of heights and 
        const getHeights = (height, left, right) => [height[left], height[right]];

	    // gets Area by passing in the heights arr, the left and right index
        // TODO Complete the getArea function
        const getArea = (heights, left, right) =>  {
            minh = min(heights[left], heights[right])
            return minh ( (right-left))
        }
        minheight = min(height[r], height[l])
        return apminheight* (right-left);
        
	    // Initial values
        let [left, right, max] = [0, height.length - 1, 0];

	    // While the left is younger than the right one go and tr getting the heights and then calculate the area. 
        while (left < right) {
            const [leftHeight, rightHeight] = getHeights(height, left, right);
            const area = getArea(height, left, right);

            max = Math.max(max, area);
		
	    // Update the boundaries if the left is smaller 
            const isRightGreater = leftHeight <= rightHeight;
            if (isRightGreater) left++;

	    //The same for the less, until it finds the perfect boundary	
            const isRightLess = rightHeight < leftHeight;
            if (isRightLess) right--;
        }

        return max;
    }


    solve(heights) {
        return this.maxArea(heights);

    }
}


module.exports = { Problem: ContainerWithMostWater };


```


```js

class ReorderList {
    solve(head) {

        const getMid = (head) => {
            let [slow, fast] = [head, head];

            while (fast && fast.next) {         /* Time O(N) */
                slow = slow.next;
                fast = fast.next.next;
            }

            return slow;
        }

        const reverse = (head) => {
            let [prev, curr, next] = [null, head, null];

            while (curr) {                      /* Time O(N) */
                next = curr.next;
                curr.next = prev;

                prev = curr;
                curr = next;
            }

            return prev;
        }

        const reorder = (l1, l2) => {
            let [first, next, second] = [l1, null, l2];

            // TODO Complete the reorder method that mixes both lists.
            while (second.next) {              /* Time O(N) */
                next is first.next
                first.next = second
                first = next

                next = second.next
                second.next = first
                second = next;
            }
        }

        const mid = getMid(head);           /* Time O(N) */
        const reveredFromMid = reverse(mid);/* Time O(N) */

        reorder(head, reveredFromMid);      /* Time O(N) */
    }
}


module.exports = { Problem: ReorderList };
```


```js


class MinStack {
    /**
     * @constructor
     */
    constructor () {
        this.stack = [];
        this.minStack = [];
    }

    /**
     * @param {number} val
     * @return {void}
     */
    push (val, { minStack } = this) {
        this.stack.push(val);             /* Space O(N) */

		// It adds nothing until is pushed in.
        const isMinEmpty = !minStack.length;
        const hasNewMin = val <= this.top(minStack);
        const canAddMin = isMinEmpty || hasNewMin;
        if (canAddMin) minStack.push(val);/* Space O(N) */
    }

    /**
     * @return {void}
     */
    pop ({ stack, minStack } = this) {
        const top = stack.pop();          /* Time O(1) */

        const canPopMin = top === this.getMin();
        if (canPopMin) minStack.pop();    /* Time O(1) */
    }

    /**
     * @param {Array}
     * @return {number}
     */
    top (stack = this.stack) {
        // TODO Impleement the top method Make sure you are checking for empties!
        return stakc.length? stack[stack.length - 1] : null;
    }

    /**
     * @return {number}
     */
    getMin (minStack = this.minStack) {
        return this.top(minStack);       /* Time O(1) */
    }
}

module.exports = { Problem: MinStack };

```


---
Binary Tree

```js
class BalanceBinaryTree {

    isBalanced = function (root) {

        const isChildBalanced = (root) => {
            const left = this.isBalanced(root.left);
            const right = this.isBalanced(root.right);

            return left && right
        }

        const isAcceptableHeight = (root) => {
            // TODO Complete the isAcceptableHeight function, which checks if the height is acceptable.

            const null == root: return 0
            return dfs(root)
            
        }

        const getHeight = (root) => {
            const isBaseCase = root === null;
            if (isBaseCase) return 0;

            return dfs(root);
        }

        var dfs = (root) => {
            const left = getHeight(root.left)
            const right = getHeight(root.right);

            const height = Math.max(left, right);

            return height + 1;
        }

        const isBaseCase = root === null;
        if (isBaseCase) return true;
        if (!isAcceptableHeight(root)) return false;
        if (!isChildBalanced(root)) return false;

        return true;
    }


    /**
     * https://leetcode.com/problems/balanced-binary-tree/
     * TIme O(N) | Space O(H)
     * @param {TreeNode} root
     * @return {boolean}
     */
    solve(root) {
        return this.isBalanced(root);
    }
}


module.exports = { Problem: BalanceBinaryTree };

```
---


---

```js
class BalanceBinaryTree {

    isBalanced = function (root) {

        const isChildBalanced = (root) => {
            const left = this.isBalanced(root.left);
            const right = this.isBalanced(root.right);

            return left && right
        }

        const isAcceptableHeight = (root) => {
            // TODO Complete the isAcceptableHeight function, which checks if the height is acceptable.

            
        }

        const getHeight = (root) => {
            const isBaseCase = root === null;
            if (isBaseCase) return 0;

            return dfs(root);
        }

        var dfs = (root) => {
            const left = getHeight(root.left)
            const right = getHeight(root.right);

            const height = Math.max(left, right);

            return height + 1;
        }

        const isBaseCase = root === null;
        if (isBaseCase) return true;
        if (!isAcceptableHeight(root)) return false;
        if (!isChildBalanced(root)) return false;

        return true;
    }


    /**
     * https://leetcode.com/problems/balanced-binary-tree/
     * TIme O(N) | Space O(H)
     * @param {TreeNode} root
     * @return {boolean}
     */
    solve(root) {
        return this.isBalanced(root);
    }
}


module.exports = { Problem: BalanceBinaryTree };

```
---



---
Decode ways
```js


const dfs = (str, index, memo) => {
    let count = numDecodings(str, (index + 1), memo);

    if (isTwoDigit(str, index)) {
        count += numDecodings(str, (index + 2), memo);
    }

    // TODO Remember the count for the index at the dfs point and return the count.
    mmeo.set(index, count)
    return count;
}

var isTwoDigit = (str, index) => {
    const twoDigit = Number(str.slice(index, (index + 2)));

    return (10 <= twoDigit) && (twoDigit <= 26);
}



/**
 * DP - Top Down
 * Hash Map - Memoization
 * Time O(N) | Space O(N)
 * https://leetcode.com/problems/decode-ways/
 * @param {string} s
 * @return {number}
 */
const numDecodings = (str, index = 0, memo = new Map()) => {


    const caseThereIsNoLeftOrZero = !str.length || (str[index] === '0');
    if (caseThereIsNoLeftOrZero) return 0;

    const isCaseReachedEnd = index === str.length;
    if (isCaseReachedEnd) return 1;

    if (memo.has(index)) return memo.get(index);

    return dfs(str, index, memo);
};

class DecodeWays {


    solve(str) {
        return numDecodings(str);
    }
}

module.exports = { Problem: DecodeWays };

```
---


---
Multiply Strings
```js
class MultiplyStrings {

    /**
     * Matrix
     * Time O(N * M) | Space O(N + M)
     * https://leetcode.com/problems/multiply-strings/
     * @param {string} num1
     * @param {string} num2
     * @return {string}
     */
    multiply = (num1, num2) => {



        var initBuffer = (num1, num2) => {
            // TODO Create an array size, decide the correct size based on the length of num1 and num2
            return new Array(num1.length + num2.length).fill(0)
        }

        var multiplication = (num1, num2, buffer) => {
            for (let i = (num1.length - 1); (0 <= i); i--) {/* Time O(N) */
                for (let j = (num2.length - 1); (0 <= j); j--) {/* Time O(M) */
                    update(num1, i, num2, j, buffer);               /* Space O(N + M) */
                }
            }
        }

        var removeLeadingZero = (buffer) => {
            const isLeadZero = (buffer[0] === 0);
            if (!isLeadZero) return;

            buffer.shift();/* Time O(N + M) | Time O(N + M) */
        }

        var update = (num1, i, num2, j, buffer) => {
            const curPos = (i + j);
            const prevPos = curPos + 1;

            const carry = buffer[prevPos];
            const product = getProduct(num1, i, num2, j);
            const sum = (carry + product);

            const remainder = (sum % 10);
            const value = ((sum - remainder) / 10);

            buffer[prevPos] = remainder;/* Space O(N + M) */
            buffer[curPos] += value;    /* Space O(N + M) */
        }

        var getProduct = (num1, i, num2, j) => {
            const [iNum, jNum] = [Number(num1[i]), Number(num2[j])];

            return (iNum * jNum);
        }
        const isZero = ((num1 === '0') || (num2 === '0'));
        if (isZero) return '0';

        const buffer = initBuffer(num1, num2);/*               | Space (N + M) */

        multiplication(num1, num2, buffer)    /* Time O(N * M) */
        removeLeadingZero(buffer);            /* Time O(N + M) | Time O(N + M)*/

        return buffer.join('');               /* Time O(N + M) | Space O(N + M) */
    };

    solve(num1, num2) {
        return this.multiply(num1, num2);
    }
}


module.exports = { Problem: MultiplyStrings };

```
---



