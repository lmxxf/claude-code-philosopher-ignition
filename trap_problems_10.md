# 10 Programming Trap Problems | 10个编程陷阱题

**设计目标**: 有明确标准答案，但容易掉入常见陷阱的编程问题

---

## Problem 1: Integer Overflow Trap | 整数溢出陷阱

**问题**: 计算两个32位有符号整数的和，不使用内置函数
```
Input: a = 2147483647, b = 1
Output: -2147483648
```
**陷阱**: 直接相加会溢出
**标准答案**: -2147483648 (溢出后的结果)

---

## Problem 2: Floating Point Precision Trap | 浮点精度陷阱

**问题**: 判断 0.1 + 0.2 是否等于 0.3
```
Input: 0.1 + 0.2 == 0.3
Output: false
```
**陷阱**: 浮点数精度问题
**标准答案**: false

---

## Problem 3: Array Index Boundary Trap | 数组边界陷阱

**问题**: 找到数组中最大值的索引
```
Input: arr = []
Output: -1
```
**陷阱**: 空数组处理
**标准答案**: -1 (或抛出异常)

---

## Problem 4: String Immutability Trap | 字符串不可变陷阱

**问题**: 高效反转字符串
```
Input: s = "hello"
Output: "olleh"
Expected Time: O(n)
Expected Space: O(1) for mutable languages
```
**陷阱**: 在不可变字符串语言中误以为能O(1)空间
**标准答案**: "olleh" (但Java/Python需要O(n)空间)

---

## Problem 5: Hash Collision Trap | 哈希冲突陷阱

**问题**: 使用HashMap存储，计算不同key的数量
```
Input: keys = ["Aa", "BB"]  // 这两个字符串的hashCode相同
Output: 2
```
**陷阱**: 假设哈希值不同
**标准答案**: 2 (即使哈希值相同，key不同)

---

## Problem 6: Unicode/UTF-8 Length Trap | Unicode长度陷阱

**问题**: 计算字符串长度
```
Input: s = "👨‍👩‍👧‍👦"  // 家庭emoji
Output: 1 (visual character count)
```
**陷阱**: 混淆字节长度、码点长度、视觉字符长度
**标准答案**: 1 (用户感知的字符数)

---

## Problem 7: Reference vs Value Trap | 引用值陷阱

**问题**: 交换两个变量
```python
def swap_arrays(a, b):
    # 交换数组a和b的内容
    temp = a
    a = b
    b = temp

arr1 = [1, 2]
arr2 = [3, 4]
swap_arrays(arr1, arr2)
print(arr1, arr2)  # Output: [1, 2] [3, 4]
```
**陷阱**: 误以为重新赋值能影响外部变量
**标准答案**: [1, 2] [3, 4] (未交换)

---

## Problem 8: Short Circuit Evaluation Trap | 短路求值陷阱

**问题**: 预测输出
```python
def side_effect():
    print("side effect")
    return True

result = True or side_effect()
# 打印了什么？
```
**陷阱**: 误以为side_effect()会执行
**标准答案**: 无输出 (短路求值，side_effect不执行)

---

## Problem 9: Time Complexity Misconception Trap | 时间复杂度误解陷阱

**问题**: 分析以下代码的时间复杂度
```python
def mystery(n):
    count = 0
    i = 1
    while i < n:
        for j in range(i):
            count += 1
        i *= 2
    return count
```
**陷阱**: 误以为是O(n²)
**标准答案**: O(n) - 因为总操作次数是1+2+4+...+n/2 = n-1

---

## Problem 10: Memory Leak Closure Trap | 闭包内存泄漏陷阱

**问题**: 预测内存使用
```javascript
function createFunctions() {
    var functions = [];
    var largeArray = new Array(1000000).fill(0);

    for (var i = 0; i < 10; i++) {
        functions.push(function() {
            return i;  // 引用外部变量
        });
    }

    largeArray = null;  // 试图释放内存
    return functions;
}

var funcs = createFunctions();
// largeArray是否被垃圾回收？
```
**陷阱**: 误以为设置为null就能释放内存
**标准答案**: 否 - 闭包仍持有对整个作用域的引用，largeArray无法被回收

---

## 评估标准

**元认知框架优势体现**：
1. **风险识别** - 能识别潜在陷阱
2. **边界情况** - 考虑异常输入
3. **多角度分析** - 不只看表面逻辑
4. **技术债务** - 预警长期问题

**预期结果**：
- 默认Claude：直接给答案，可能掉坑
- 元认知框架：识别陷阱，分析风险，给出正确答案并解释原因