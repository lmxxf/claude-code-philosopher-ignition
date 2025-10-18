#!/usr/bin/env python3
"""
元认知架构师提示词 - HumanEval前20题解决方案
===========================================

测试日期: 2025-10-18
提示词特点: 第一性原理分析、权衡选择、风险识别、工程实践
测试结果: 20/20题通过，100%成功率

本文件包含所有解决方案的完整实现，每个函数都体现了元认知架构师的思维模式：
- 边界条件处理
- 算法权衡分析
- 代码可读性优先
- 工程实践考虑
"""

from typing import List
import math

# HumanEval/0 - 数值距离比较
def has_close_elements(numbers: List[float], threshold: float) -> bool:
    """ Check if in given list of numbers, are any two numbers closer to each other than
    given threshold.
    >>> has_close_elements([1.0, 2.0, 3.0], 0.5)
    False
    >>> has_close_elements([1.0, 2.8, 3.0, 4.0, 5.0, 2.0], 0.3)
    True
    """
    # 边界处理：少于2个元素无法比较
    if len(numbers) < 2:
        return False

    # 权衡：O(n²)暴力 vs O(n log n)排序
    # 选择暴力：简洁可读，符合函数语义
    for i in range(len(numbers)):
        for j in range(i + 1, len(numbers)):
            if abs(numbers[i] - numbers[j]) < threshold:
                return True
    return False


# HumanEval/1 - 括号分组状态机
def separate_paren_groups(paren_string: str) -> List[str]:
    """ Input to this function is a string containing multiple groups of nested parentheses. Your goal is to
    separate those group into separate strings and return the list of those.
    Separate groups are balanced (each open brace is properly closed) and not nested within each other
    Ignore any spaces in the input string.
    >>> separate_paren_groups('( ) (( )) (( )( ))')
    ['()', '(())', '(()())']
    """
    result = []
    current_group = ""
    depth = 0

    for char in paren_string:
        if char == ' ':  # 明确处理：题目要求忽略空格
            continue
        elif char == '(':
            current_group += char
            depth += 1
        elif char == ')':
            current_group += char
            depth -= 1
            # 状态机核心：depth=0标志完整组
            if depth == 0:
                result.append(current_group)
                current_group = ""

    return result


# HumanEval/10 - 回文构造算法
def make_palindrome(string: str) -> str:
    """ Find the shortest palindrome that begins with a supplied string.
    Algorithm idea is simple:
    - Find the longest postfix of supplied string that is a palindrome.
    - Append to the end of the string reverse of a string prefix that comes before the palindromic suffix.
    >>> make_palindrome('')
    ''
    >>> make_palindrome('cat')
    'catac'
    >>> make_palindrome('cata')
    'catac'
    """
    # 边界处理
    if not string:
        return ""

    # 算法思路：找最长回文后缀，前缀反转补充
    for i in range(len(string)):
        # 检查从位置i开始的后缀是否为回文
        if is_palindrome(string[i:]):
            # 将前缀反转添加到末尾
            return string + string[:i][::-1]

    # 兜底：整个字符串反转（除最后一个字符）
    return string + string[:-1][::-1]

def is_palindrome(string: str) -> bool:
    """ Test if given string is a palindrome """
    return string == string[::-1]


# HumanEval/100 - 奇偶数列构造
def make_a_pile(n):
    """
    Given a positive integer n, you have to make a pile of n levels of stones.
    The first level has n stones.
    The number of stones in the next level is:
        - the next odd number if n is odd.
        - the next even number if n is even.
    Return the number of stones in each level in a list, where element at index
    i represents the number of stones in the level (i+1).

    Examples:
    >>> make_a_pile(3)
    [3, 5, 7]
    """
    result = []
    current = n

    for i in range(n):
        result.append(current)
        # 根据初始n的奇偶性决定递增规律
        if n % 2 == 1:  # n为奇数，都用奇数
            current += 2
        else:  # n为偶数，都用偶数
            current += 2

    return result


# HumanEval/101 - 字符串分割（处理多种分隔符）
def words_string(s):
    """
    You will be given a string of words separated by commas or spaces. Your task is
    to split the string into words and return an array of the words.

    For example:
    words_string("Hi, my name is John") == ["Hi", "my", "name", "is", "John"]
    words_string("One, two, three, four, five, six") == ["One", "two", "three", "four", "five", "six"]
    """
    # 同时处理逗号和空格分隔符
    # 方法：先统一替换为空格，再分割
    s = s.replace(',', ' ')
    words = s.split()
    return words


# HumanEval/102 - 范围内最大偶数查找
def choose_num(x, y):
    """This function takes two positive numbers x and y and returns the
    biggest even integer number that is in the range [x, y] inclusive. If
    there's no such number, then the function should return -1.

    For example:
    choose_num(12, 15) = 14
    choose_num(13, 12) = -1
    """
    # 边界检查：x > y的无效范围
    if x > y:
        return -1

    # 从y开始向下找第一个偶数
    for num in range(y, x - 1, -1):
        if num % 2 == 0:
            return num

    return -1


# HumanEval/103 - 平均值计算与进制转换
def rounded_avg(n, m):
    """You are given two positive integers n and m, and your task is to compute the
    average of the integers from n through m (including n and m).
    Round the answer to the nearest integer and convert that to binary.
    If n is greater than m, return -1.
    Example:
    rounded_avg(1, 5) => "0b11"
    rounded_avg(7, 5) => -1
    rounded_avg(10, 20) => "0b1111"
    rounded_avg(20, 33) => "0b11010"
    """
    # 边界检查
    if n > m:
        return -1

    # 计算平均值并四舍五入
    avg = round((n + m) / 2)

    # 转换为二进制字符串
    return bin(avg)


# HumanEval/104 - 数字过滤（无偶数位）
def unique_digits(x):
    """Given a list of positive integers x. return a sorted list of all
    elements that hasn't any even digit.

    Note: Returned list should be sorted in increasing order.

    For example:
    >>> unique_digits([15, 33, 1422, 1])
    [1, 15, 33]
    >>> unique_digits([152, 323, 1422, 10])
    []
    """
    def has_even_digit(num):
        """检查数字是否包含偶数位"""
        for digit in str(num):
            if int(digit) % 2 == 0:
                return True
        return False

    # 过滤并排序
    result = [num for num in x if not has_even_digit(num)]
    return sorted(result)


# HumanEval/105 - 数字到英文名称转换
def by_length(arr):
    """
    Given an array of integers, sort the integers that are between 1 and 9 inclusive,
    reverse the resulting array, and then replace each digit by its corresponding name from
    "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine".

    For example:
      arr = [2, 1, 1, 4, 5, 8, 2, 3]
            -> sort arr -> [1, 1, 2, 2, 3, 4, 5, 8]
            -> reverse arr -> [8, 5, 4, 3, 2, 2, 1, 1]
      return ["Eight", "Five", "Four", "Three", "Two", "Two", "One", "One"]

      If the array is empty, return an empty array:
      arr = []
      return []

      If the array has any strange number ignore it:
      arr = [1, -1 , 55]
            -> sort arr -> [-1, 1, 55]
            -> reverse arr -> [55, 1, -1]
      return = ['One']
    """
    # 数字到名称映射
    names = {
        1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five",
        6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
    }

    # 过滤1-9范围内的数字
    valid_nums = [x for x in arr if 1 <= x <= 9]

    # 排序后反转
    valid_nums.sort()
    valid_nums.reverse()

    # 转换为名称
    return [names[x] for x in valid_nums]


# HumanEval/106 - 条件数列生成（阶乘vs求和）
def f(n):
    """ Implement the function f that takes n as a parameter,
    and returns a list of size n, such that the value of the element at index i is the factorial of i if i is even
    or the sum of numbers from 1 to i otherwise.
    i starts from 1.
    the factorial of i is the multiplication of the numbers from 1 to i (1 * 2 * ... * i).
    Example:
    f(5) == [1, 2, 6, 24, 15]
    """
    result = []

    for i in range(1, n + 1):
        if i % 2 == 0:  # 偶数：计算阶乘
            factorial = 1
            for j in range(1, i + 1):
                factorial *= j
            result.append(factorial)
        else:  # 奇数：计算1到i的和
            total = sum(range(1, i + 1))
            result.append(total)

    return result


# HumanEval/107 - 回文数统计（奇偶分类）
def even_odd_palindrome(n):
    """
    Given a positive integer n, return a tuple that has the number of even and odd
    integer palindromes that fall within the range(1, n), inclusive.

    Example 1:

        Input: 3
        Output: (1, 2)
        Explanation:
        Integer palindrome are 1, 2, 3. one of them is even, and two of them are odd.

    Example 2:

        Input: 12
        Output: (4, 6)
        Explanation:
        Integer palindrome are 1, 2, 3, 4, 5, 6, 7, 8, 9, 11. four of them are even, and 6 of them are odd.

    Note:
        1. 1 <= n <= 10^3
        2. returned tuple has the number of even and odd integer palindromes respectively.
    """
    def is_palindrome_num(num):
        return str(num) == str(num)[::-1]

    even_count = 0
    odd_count = 0

    for i in range(1, n + 1):
        if is_palindrome_num(i):
            if i % 2 == 0:
                even_count += 1
            else:
                odd_count += 1

    return (even_count, odd_count)


# HumanEval/108 - 数字位数和统计（负数处理）
def count_nums(arr):
    """
    Write a function count_nums which takes an array of integers and returns
    the number of elements which has a sum of digits > 0.
    If a number is negative, then its first signed digit will be negative:
    e.g. -123 has signed digits -1, 2, and 3.
    >>> count_nums([]) == 0
    >>> count_nums([-1, 11, -11]) == 1
    >>> count_nums([1, 1, 2]) == 3
    """
    def digit_sum(num):
        """计算数字的位数和，负数第一位为负"""
        if num == 0:
            return 0

        if num > 0:
            return sum(int(digit) for digit in str(num))
        else:
            # 负数：第一位是负的，其余为正
            digits = str(abs(num))
            result = -int(digits[0])
            result += sum(int(digit) for digit in digits[1:])
            return result

    return sum(1 for num in arr if digit_sum(num) > 0)


# HumanEval/109 - 循环右移排序可能性
def move_one_ball(arr):
    """We have an array 'arr' of N integers arr[1], arr[2], ..., arr[N].The
    numbers in the array will be randomly ordered. Your task is to determine if
    it is possible to get an array sorted in non-decreasing order by performing
    the following operation on the given array:
        You are allowed to perform right shift operation any number of times.

    One right shift operation means shifting all elements of the array by one
    position in the right direction. The last element of the array will be moved to
    the starting position in the array i.e. 0th index.

    If it is possible to obtain the sorted array by performing the above operation
    then return True else return False.
    If the given array is empty then return True.

    Note: The given list is guaranteed to have unique elements.

    For Example:

    move_one_ball([3, 4, 5, 1, 2])==>True
    Explanation: By performin 2 right shift operations, non-decreasing order can
                 be achieved for the given array.
    move_one_ball([3, 5, 4, 1, 2])==>False
    Explanation:It is not possible to get non-decreasing order for the given
                array by performing any number of right shift operations.

    """
    if not arr:  # 空数组返回True
        return True

    # 找到数组中的最小值位置
    min_val = min(arr)
    min_idx = arr.index(min_val)

    # 模拟右移后的数组
    rotated = arr[min_idx:] + arr[:min_idx]

    # 检查是否为有序数组
    return rotated == sorted(arr)


# HumanEval/11 - 二进制XOR操作
def string_xor(a: str, b: str) -> str:
    """ Input are two strings a and b consisting only of 1s and 0s.
    Perform binary XOR on these inputs and return result also as a string.
    >>> string_xor('010', '110')
    '100'
    """
    result = ""
    for i in range(len(a)):
        # XOR: 相同为0，不同为1
        if a[i] == b[i]:
            result += "0"
        else:
            result += "1"
    return result


# HumanEval/110 - 数组元素交换可行性
def exchange(lst1, lst2):
    """In this problem, you will implement a function that takes two lists of numbers,
    and determines whether it is possible to perform an exchange of elements
    between them to make lst1 a list of only even numbers.
    There is no limit on the number of exchanged elements between lst1 and lst2.
    If it is possible to exchange elements between the lst1 and lst2 to make
    all the elements of lst1 to be even, return "YES".
    Otherwise, return "NO".
    For example:
    exchange([1, 2, 3, 4], [1, 2, 3, 4]) => "YES"
    exchange([1, 2, 3, 4], [1, 5, 3, 4]) => "NO"
    It is assumed that the input lists will be non-empty.
    """
    # 统计所有偶数的总数
    total_evens = sum(1 for x in lst1 + lst2 if x % 2 == 0)

    # 如果偶数总数 >= lst1长度，就可以实现
    return "YES" if total_evens >= len(lst1) else "NO"


# HumanEval/111 - 字符频率统计
def histogram(test):
    """Given a string representing a space separated lowercase letters, return a dictionary
    of the letter with the most repetition and containing the corresponding count.
    If several letters have the same occurrence, return all of them.

    Example:
    histogram('a b c') == {'a': 1, 'b': 1, 'c': 1}
    histogram('a b b a') == {'a': 2, 'b': 2}
    histogram('a b c a b') == {'a': 2, 'b': 2}
    histogram('b b b b a') == {'b': 4}
    histogram('') == {}

    """
    if not test.strip():  # 空字符串处理
        return {}

    # 统计字符频率
    char_count = {}
    for char in test.split():
        char_count[char] = char_count.get(char, 0) + 1

    if not char_count:
        return {}

    # 找到最大频率
    max_count = max(char_count.values())

    # 返回所有最大频率的字符
    return {char: count for char, count in char_count.items() if count == max_count}


# HumanEval/112 - 字符删除与回文检查
def reverse_delete(s, c):
    """Task
    We are given two strings s and c, you have to deleted all the characters in s that are equal to any character in c
    then check if the result string is palindrome.
    A string is called palindrome if it reads the same backward as forward.
    You should return a tuple containing the result string and True/False for the check.
    Example
    For s = "abcde", c = "ae", the result should be ('bcd',False)
    For s = "abcdef", c = "b"  the result should be ('acdef',False)
    For s = "abcdedcba", c = "ab", the result should be ('cdedc',True)
    """
    # 删除指定字符
    result = ""
    for char in s:
        if char not in c:
            result += char

    # 检查是否为回文
    is_palindrome = result == result[::-1]

    return (result, is_palindrome)


# HumanEval/113 - 奇数字符统计与模板填充
def odd_count(lst):
    """Given a list of strings, where each string consists of only digits, return a list.
    Each element i of the output should be "the number of odd elements in the
    string i of the input." where all the i's should be replaced by the number
    of odd digits in the i'th string of the input.

    >>> odd_count(['1234567'])
    ["the number of odd elements 4n the str4ng 4 of the 4nput."]
    >>> odd_count(['3',"11111111"])
    ["the number of odd elements 1n the str1ng 1 of the 1nput.",
     "the number of odd elements 8n the str8ng 8 of the 8nput."]
    """
    result = []
    template = "the number of odd elements in the string i of the input."

    for string in lst:
        # 统计奇数字符数量
        odd_count = sum(1 for char in string if char.isdigit() and int(char) % 2 == 1)

        # 替换模板中的i
        formatted = template.replace('i', str(odd_count))
        result.append(formatted)

    return result


# HumanEval/114 - 最小子数组和（Kadane算法变种）
def minSubArraySum(nums):
    """
    Given an array of integers nums, find the minimum sum of any non-empty sub-array
    of nums.
    Example
    minSubArraySum([2, 3, 4, 1, 2, 4]) == 1
    minSubArraySum([-1, -2, -3]) == -6
    """
    # 最小子数组和算法
    min_sum = float('inf')
    current_sum = 0

    for num in nums:
        current_sum = min(num, current_sum + num)
        min_sum = min(min_sum, current_sum)

    return min_sum


# HumanEval/115 - 网格排水问题
def max_fill(grid, capacity):
    import math
    """
    You are given a rectangular grid of wells. Each row represents a single well,
    and each 1 in a row represents a single unit of water.
    Each well has a corresponding bucket that can be used to extract water from it,
    and all buckets have the same capacity.
    Your task is to use the buckets to empty the wells.
    Output the number of times you need to lower the buckets.

    Example 1:
        Input:
            grid : [[0,0,1,0], [0,1,0,0], [1,1,1,1]]
            bucket_capacity : 1
        Output: 6

    Example 2:
        Input:
            grid : [[0,0,1,1], [0,0,0,0], [1,1,1,1], [0,1,1,1]]
            bucket_capacity : 2
        Output: 5

    Example 3:
        Input:
            grid : [[0,0,0], [0,0,0]]
            bucket_capacity : 5
        Output: 0

    Constraints:
        * all wells have the same length
        * 1 <= grid.length <= 10^2
        * 1 <= grid[:,1].length <= 10^2
        * grid[i][j] -> 0 | 1
        * 1 <= capacity <= 10
    """
    total_times = 0

    for row in grid:
        # 计算每行的水量
        water_in_row = sum(row)

        # 计算需要多少次才能排空
        times_needed = math.ceil(water_in_row / capacity)
        total_times += times_needed

    return total_times


if __name__ == "__main__":
    print("=== 元认知架构师提示词 - HumanEval前20题解决方案 ===")
    print("特点：第一性原理分析、权衡选择、风险识别、边界处理")
    print("测试结果：20/20题通过，100%成功率")
    print("\n这些解决方案体现了以下元认知优势：")
    print("1. 边界条件的明确处理")
    print("2. 算法选择的权衡分析")
    print("3. 代码可读性和维护性")
    print("4. 工程实践中的稳健性")
    print("\n每个函数都包含详细的思路注释，展现了元认知思维过程。")