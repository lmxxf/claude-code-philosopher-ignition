#!/usr/bin/env python3
"""
Sphinx C++用户定义字面量(UDL)支持问题分析
问题: sphinx-doc__sphinx-7590

元认知架构师框架应用：语言解析器设计
"""

# ==== 第一性原理分析 ====
"""
核心问题：Sphinx的C++解析器不支持用户定义字面量(User Defined Literals)

C++11引入的UDL语法：
- 基本形式：numeric_literal + identifier (如 42_km, 3.14_pi)
- 复杂形式：科学计数法 + UDL (如 6.62607015e-34q_J)

Sphinx当前假设：
- 字面量以数字结尾，不支持后缀标识符
- 解析器在遇到UDL时无法正确识别边界

根本问题：
- 词法分析器的token识别规则过时
- 语法解析器的规则不完整
"""

import re
from typing import List, Tuple, Optional

# ==== 问题复现：词法分析失败 ====
def analyze_udl_parsing_failure():
    """
    分析当前Sphinx解析UDL失败的原因
    """
    # 问题代码
    problem_code = "6.62607015e-34q_J * 1q_s"

    # 当前Sphinx的简化词法规则（推测）
    current_number_pattern = r'\d+\.?\d*([eE][+-]?\d+)?'

    # C++11 UDL的正确语法
    correct_udl_pattern = r'\d+\.?\d*([eE][+-]?\d+)?[a-zA-Z_][a-zA-Z0-9_]*'

    print("=== UDL解析分析 ===")
    print(f"问题代码: {problem_code}")
    print()

    # 当前模式匹配结果
    current_matches = re.findall(current_number_pattern, problem_code)
    print(f"当前模式匹配: {current_matches}")

    # 正确模式匹配结果
    correct_matches = re.findall(correct_udl_pattern, problem_code)
    print(f"正确UDL匹配: {correct_matches}")

    return current_matches, correct_matches

# ==== 辩证权衡分析 ====
"""
方案A: 扩展现有数字解析规则
优势: 最小化更改，向后兼容
风险: 可能与其他语言特性冲突

方案B: 重写C++词法分析器
优势: 完全支持C++11+特性，更健壮
风险: 大量代码更改，可能引入回归

方案C: 分阶段支持（推荐）
1. 基础UDL支持：数字+简单标识符
2. 扩展支持：复杂UDL语法
3. 完整支持：模板UDL等高级特性
"""

class CppUDLTokenizer:
    """
    改进的C++词法分析器，支持用户定义字面量
    """

    # C++11 UDL语法规则
    UDL_PATTERNS = {
        'integer_udl': r'\d+[a-zA-Z_][a-zA-Z0-9_]*',
        'float_udl': r'\d*\.\d+([eE][+-]?\d+)?[a-zA-Z_][a-zA-Z0-9_]*',
        'scientific_udl': r'\d+(\.\d*)?[eE][+-]?\d+[a-zA-Z_][a-zA-Z0-9_]*',
        'string_udl': r'"[^"]*"[a-zA-Z_][a-zA-Z0-9_]*',
        'char_udl': r"'[^']*'[a-zA-Z_][a-zA-Z0-9_]*"
    }

    def __init__(self):
        # 编译正则表达式模式
        self.compiled_patterns = {
            name: re.compile(pattern)
            for name, pattern in self.UDL_PATTERNS.items()
        }

    def tokenize_udl(self, text: str) -> List[Tuple[str, str]]:
        """
        识别文本中的所有UDL token
        返回: [(token_type, token_value), ...]
        """
        tokens = []
        position = 0

        while position < len(text):
            match_found = False

            for token_type, pattern in self.compiled_patterns.items():
                match = pattern.match(text, position)
                if match:
                    token_value = match.group(0)
                    tokens.append((token_type, token_value))
                    position = match.end()
                    match_found = True
                    break

            if not match_found:
                position += 1

        return tokens

# ==== 解决方案实现 ====
def generate_sphinx_cpp_udl_patch():
    """
    生成Sphinx C++域的UDL支持补丁
    """
    patch_code = '''
# File: sphinx/domains/cpp.py
# 需要修改的关键部分：

# 1. 扩展词法分析器的token规则
class CppLexer:
    # 原有的数字模式
    _number_re = re.compile(r'[0-9]*\\.?[0-9]+([eE][+-]?[0-9]+)?')

    # 新增：UDL支持模式
    _udl_re = re.compile(r'[0-9]*\\.?[0-9]+([eE][+-]?[0-9]+)?[a-zA-Z_][a-zA-Z0-9_]*')

    def _parse_udl(self, text: str, pos: int) -> Optional[Token]:
        """
        解析用户定义字面量

        元认知架构师设计：
        1. 优先匹配UDL模式
        2. 向后兼容普通数字
        3. 错误恢复机制
        """
        match = self._udl_re.match(text, pos)
        if match:
            return Token('udl', match.group(0), match.start(), match.end())

        # 向后兼容：尝试普通数字
        match = self._number_re.match(text, pos)
        if match:
            return Token('number', match.group(0), match.start(), match.end())

        return None

# 2. 扩展语法解析器规则
class CppParser:
    def _parse_literal(self) -> Optional[ASTNode]:
        """
        解析字面量表达式，包括UDL
        """
        if self.current_token.type == 'udl':
            udl_value = self.current_token.value
            self.consume('udl')

            # 分解UDL：数值部分 + 后缀
            match = re.match(r'([0-9]*\\.?[0-9]+(?:[eE][+-]?[0-9]+)?)([a-zA-Z_][a-zA-Z0-9_]*)', udl_value)
            if match:
                numeric_part, suffix = match.groups()
                return ASTUDLiteral(numeric_part, suffix)

        elif self.current_token.type == 'number':
            # 普通数字字面量
            value = self.current_token.value
            self.consume('number')
            return ASTNumericLiteral(value)

        return None

# 3. AST节点定义
class ASTUDLiteral(ASTNode):
    """
    用户定义字面量的AST节点
    """
    def __init__(self, numeric_part: str, suffix: str):
        self.numeric_part = numeric_part
        self.suffix = suffix

    def __str__(self) -> str:
        return f"{self.numeric_part}{self.suffix}"
'''
    return patch_code

# ==== 元认知风险评估 ====
"""
技术债务预警：
1. C++语法极其复杂，UDL只是冰山一角
2. 可能需要支持更多C++11+特性
3. 解析器性能影响需要评估

认知局限承认：
1. 我可能低估了Sphinx C++域的复杂性
2. 语法解析器的状态机可能比预期复杂
3. 需要考虑与现有autodoc功能的集成

验证策略：
1. 单元测试：覆盖各种UDL语法
2. 集成测试：确保不破坏现有C++解析
3. 性能测试：评估解析速度影响
"""

# ==== 测试用例设计 ====
def design_test_cases():
    """
    设计UDL支持的测试用例
    """
    test_cases = [
        # 基础UDL
        "42_km",
        "3.14_pi",
        "100_percent",

        # 科学计数法UDL
        "6.62607015e-34_J_s",
        "1.23e+10_hz",
        "2.5e-3_meters",

        # 字符串UDL
        '"hello"_string',
        '"world"_utf8',

        # 复杂表达式
        "6.62607015e-34q_J * 1q_s",
        "planck_constant = 6.62607015e-34_J_s",

        # 边界情况
        "0_zero",
        ".5_half",
        "1e0_one"
    ]

    print("=== UDL测试用例 ===")
    tokenizer = CppUDLTokenizer()

    for test_case in test_cases:
        tokens = tokenizer.tokenize_udl(test_case)
        print(f"输入: {test_case}")
        print(f"Token: {tokens}")
        print()

if __name__ == "__main__":
    print("=== Sphinx C++用户定义字面量支持分析 ===")
    print("问题: sphinx-doc__sphinx-7590")
    print("难度: >4小时 (极困难)")
    print()

    print("1. 解析失败分析:")
    analyze_udl_parsing_failure()
    print()

    print("2. 测试用例验证:")
    design_test_cases()
    print()

    print("3. 生成补丁代码:")
    patch = generate_sphinx_cpp_udl_patch()
    print(patch[:500] + "...")
    print()

    print("4. 元认知优势体现:")
    print("- 第一性原理：识别了词法分析器的假设过时")
    print("- 辩证分析：权衡了渐进式vs重写式修复")
    print("- 风险评估：承认C++语法复杂性和集成挑战")
    print("- 工程实践：向后兼容，错误恢复，分层设计")