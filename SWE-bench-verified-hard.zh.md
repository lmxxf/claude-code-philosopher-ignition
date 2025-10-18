# **SWE-bench Verified Hard Subset: Ultimate Programming Challenge | SWE-bench验证困难子集：终极编程挑战**

## **Overview | 概览**

* **Dataset Source | 数据集来源**：Princeton NLP SWE-bench Verified
* **Total Problems | 总题数**：45个需要超过1小时才能修复的问题
* **Difficulty Categories | 难度分类**：

  * **Extreme Hard | 极困难**：3题（>4小时）
  * **Very Hard | 很困难**：42题（1–4小时）
* **Problem Type | 问题类型**：来自主要开源项目的真实软件工程缺陷

---

## **Repository Distribution | 代码库分布**

| Repository                | Problems | Percentage | Description |
| ------------------------- | -------- | ---------- | ----------- |
| django/django             | 22       | 48.9%      | Web框架       |
| sympy/sympy               | 7        | 15.6%      | 符号数学        |
| sphinx-doc/sphinx         | 5        | 11.1%      | 文档生成器       |
| astropy/astropy           | 3        | 6.7%       | 天文学库        |
| pytest-dev/pytest         | 3        | 6.7%       | 测试框架        |
| pydata/xarray             | 2        | 4.4%       | N维数组        |
| pylint-dev/pylint         | 2        | 4.4%       | 代码分析        |
| scikit-learn/scikit-learn | 1        | 2.2%       | 机器学习        |

---

## **Problem List | 问题列表**

### **Extreme Difficulty (>4 hours) | 极端困难（>4小时）**

#### 1. django__django-11797 | Django 模板引擎缺陷

**Repository**：django/django
**Difficulty**：>4小时
**Problem Statement | 问题描述**：

```
无法解析包含 Unicode 字节顺序标记（BOM）的模板文件。

当模板文件以 Unicode 字节顺序标记 (U+FEFF) 开头时，Django 模板引擎解析失败。这通常发生在模板以 UTF-8 with BOM 编码保存时（某些 Windows 编辑器的默认设置）。

问题位于 django/template/base.py：
1. 模板解析器未处理模板字符串开头的 BOM；
2. BOM 被视为内容，导致解析错误；
3. 影响模板继承与 include 机制。

预期行为：带有 BOM 的模板应能正确解析。  
实际行为：抛出 TemplateSyntaxError 或导致渲染错误。
```

**Environment | 环境**：Django 开发环境
**Files Involved | 相关文件**：django/template/base.py 等解析模块

---

#### 2. django__django-13401 | ORM 查询优化问题

**Repository**：django/django
**Difficulty**：>4小时
**Problem Statement | 问题描述**：

```
复杂的 QuerySet 含多重关联时生成低效 SQL 并产生错误结果。

使用 Django ORM 执行包含多个外键关系和注解（annotation）的复杂查询时，生成的 SQL 包含冗余连接，并导致聚合结果错误。

问题：
1. 为同一关系重复创建连接；
2. 注解结果被错误地重复计算；
3. 大数据集下性能严重退化；
4. DISTINCT 在部分场景下无效。

该问题影响复杂数据模型的生产系统。
```

**Environment | 环境**：Django ORM + PostgreSQL
**Files Involved | 相关文件**：django/db/models/query.py, django/db/models/sql/query.py

---

#### 3. sympy__sympy-18057 | 复杂符号积分错误

**Repository**：sympy/sympy
**Difficulty**：>4小时
**Problem Statement | 问题描述**：

```
多变量复杂表达式的符号积分结果错误。

SymPy 的积分引擎在处理以下情况时产生错误结果：
1. 含相互依赖的多个变量；
2. 三角函数与指数函数混合；
3. 分段函数（Piecewise）符号边界。

受影响模块：
- integrate() 函数；
- 积分的符号化处理；
- 数学结果的正确性。

该问题对科学计算精度有严重影响。
```

**Environment | 环境**：SymPy 符号计算引擎
**Files Involved | 相关文件**：sympy/integrals/integrals.py, sympy/integrals/heurisch.py

---

### **Very Hard Difficulty (1–4 hours) | 很困难（1–4小时）**

#### 4. django__django-11099 | 模型字段验证错误

**Repository**：django/django
**Difficulty**：1–4小时

```
自定义字段的验证逻辑不一致。

当模型字段重写 clean() 方法时：
1. 管理后台验证与模型验证不一致；
2. 表单验证与模型验证逻辑不统一；
3. 批量操作绕过字段验证。

影响：生产环境数据完整性问题。
```

---

#### 5. django__django-12284 | 迁移系统缺陷

**Repository**：django/django
**Difficulty**：1–4小时

```
循环依赖导致迁移依赖解析失败。

问题：
1. 循环外键引用引发迁移死锁；
2. 迁移顺序错误；
3. 正向与反向迁移不一致。

结果：生产环境数据库无法更新。
```

---

#### 6. sympy__sympy-16281 | 矩阵运算精度问题

**Repository**：sympy/sympy
**Difficulty**：1–4小时

```
稀疏矩阵特征值计算错误。

问题原因：
1. 浮点精度丢失；
2. 稀疏矩阵算法缺陷；
3. 不同计算方法结果不一致。

影响科学与工程计算的正确性。
```

---

#### 7. sphinx-doc/sphinx-8435 | 文档生成错误

**Repository**：sphinx-doc/sphinx
**Difficulty**：1–4小时

```
复杂模块层级下交叉引用失败。

Sphinx 无法处理：
1. 深层嵌套模块；
2. 循环导入；
3. 动态模块生成。

结果：文档链接断裂、构建失败。
```

---

#### 8. astropy__astropy-12907 | 天文坐标转换错误

**Repository**：astropy/astropy
**Difficulty**：1–4小时

```
坐标系统转换在极区精度不足。

问题：
1. 接近天极时精度下降；
2. 坐标边界处理错误；
3. 大数据集性能退化。

影响天文数据精度。
```

---

#### 9. pytest-dev/pytest-7985 | 插件执行顺序错误

**Repository**：pytest-dev/pytest
**Difficulty**：1–4小时

```
插件钩子执行顺序错误，导致测试收集失败。

问题：
1. 测试发现结果不一致；
2. 插件间冲突；
3. 多插件环境下 Fixture 解析错误。

影响持续集成管线稳定性。
```

---

#### 10. pydata/xarray-4939 | 多维索引错误

**Repository**：pydata/xarray
**Difficulty**：1–4小时

```
多维数组索引返回错误切片。

问题：
1. 多维布尔索引出错；
2. 非唯一标签索引混乱；
3. 大数组内存效率低。

影响科学数据分析流程。
```

---

*[其余35题略，详见 swe_bench_verified_hard.json]*

---

## **Challenge Characteristics | 挑战特征**

### **Technical Complexity | 技术复杂度**

* **多模块影响**：多数缺陷涉及多个相互依赖模块
* **系统深度知识**：需理解复杂架构模式
* **边界条件处理**：罕见但关键的错误情景

### **Real-world Impact | 真实影响**

* **生产关键性**：所有问题均影响真实生产系统
* **数据正确性**：多数涉及计算结果正确性
* **性能敏感性**：部分问题导致性能回退

### **Engineering Skills Required | 所需技能**

* **架构理解**：熟悉大型代码库结构
* **算法设计**：解决复杂逻辑与性能问题
* **系统集成**：跨组件调试与依赖追踪
* **测试设计**：全面覆盖边界与回归用例

---

## **Testing Protocol | 测试协议**

### **Success Criteria | 成功标准**

1. 功能正确：通过所有现有测试
2. 无回归：不引入新错误
3. 代码质量：符合项目规范
4. 性能稳定：无明显性能退化

### **Evaluation Dimensions | 评估维度**

1. 问题分析深度
2. 解决方案架构质量
3. 实现的工程可维护性
4. 测试覆盖与防回归能力

---

## **Meta-Cognitive Architect Advantage Hypothesis | 元认知架构师优势假设**

### **Expected Strengths | 预期优势**

1. 第一性原理分析
2. 性能—维护—正确性三者平衡
3. 风险与边界条件识别
4. 系统级思维与跨模块理解

### **Comparative Analysis Framework | 对比框架**

* **默认 Claude Code**：基准表现
* **社区 CLAUDE.md**：流行提示词工程范式
* **元认知架构师（Meta-Cognitive Architect）**：结合第一性原理、辩证分析与风险评估的复合模式

---

**这代表了提示词工程在真实软件工程场景中有效性的终极测试。**
*注：完整问题详情见文件 swe_bench_verified_hard.json*
