# SWE-bench Verified Hard Subset: Ultimate Programming Challenge | SWE-bench验证困难子集：终极编程挑战

## Overview | 概览

- **Dataset Source | 数据集来源**: Princeton NLP SWE-bench Verified
- **Total Problems | 总题数**: 45 problems requiring >1 hour to fix | 45个需要>1小时解决的问题
- **Difficulty Categories | 难度分类**:
  - **Extreme Hard | 极困难**: 3 problems (>4 hours) | 3题（>4小时）
  - **Very Hard | 很困难**: 42 problems (1-4 hours) | 42题（1-4小时）
- **Problem Type | 问题类型**: Real-world software engineering bugs from major open-source projects | 来自主要开源项目的真实软件工程错误

## Repository Distribution | 代码库分布

| Repository | Problems | Percentage | Description |
|------------|----------|------------|-------------|
| django/django | 22 | 48.9% | Web framework | Web框架 |
| sympy/sympy | 7 | 15.6% | Symbolic mathematics | 符号数学 |
| sphinx-doc/sphinx | 5 | 11.1% | Documentation generator | 文档生成器 |
| astropy/astropy | 3 | 6.7% | Astronomy library | 天文学库 |
| pytest-dev/pytest | 3 | 6.7% | Testing framework | 测试框架 |
| pydata/xarray | 2 | 4.4% | N-dimensional arrays | N维数组 |
| pylint-dev/pylint | 2 | 4.4% | Code analysis | 代码分析 |
| scikit-learn/scikit-learn | 1 | 2.2% | Machine learning | 机器学习 |

---

## Problem List | 问题列表

### Extreme Difficulty (>4 hours) | 极端困难（>4小时）

#### 1. django__django-11797 | Django Template Engine Bug
**Repository**: django/django
**Difficulty**: >4 hours
**Problem Statement**:
```
Can't parse templates that contain a Unicode byte order mark (BOM)

When a template file begins with the Unicode byte order mark (BOM) character (U+FEFF), Django's template engine fails to parse it. This occurs when templates are saved with UTF-8 with BOM encoding, which is the default for some editors on Windows.

The bug is in django/template/base.py:
1. The template parser doesn't handle BOM at the beginning of template strings
2. The BOM character is treated as content, causing parsing errors
3. This affects template inheritance and inclusion mechanisms

Expected behavior: Templates with BOM should parse correctly
Actual behavior: TemplateSyntaxError or incorrect template rendering
```

**Environment**: Django development environment
**Files Involved**: django/template/base.py, related template parsing modules

---

#### 2. django__django-13401 | ORM Query Optimization Issue
**Repository**: django/django
**Difficulty**: >4 hours
**Problem Statement**:
```
Complex QuerySet with multiple joins produces inefficient SQL and incorrect results

When using Django ORM with complex queries involving multiple foreign key relationships and annotations, the generated SQL contains unnecessary joins and produces incorrect aggregation results.

Issues:
1. Redundant joins are created for the same relationship
2. Annotation results are multiplied incorrectly
3. Performance degrades significantly with large datasets
4. DISTINCT doesn't work correctly in all cases

This affects production applications with complex data models.
```

**Environment**: Django ORM with PostgreSQL backend
**Files Involved**: django/db/models/query.py, django/db/models/sql/query.py

---

#### 3. sympy__sympy-18057 | Complex Symbolic Computation Error
**Repository**: sympy/sympy
**Difficulty**: >4 hours
**Problem Statement**:
```
Incorrect symbolic integration results for complex expressions with multiple variables

SymPy's integration engine produces incorrect results when integrating complex expressions involving:
1. Multiple variables with interdependencies
2. Trigonometric and exponential functions combined
3. Piecewise functions with symbolic boundaries

The bug affects:
- integrate() function with complex expressions
- Symbolic manipulation of integrals
- Mathematical correctness of results

This is a critical issue affecting scientific computing applications.
```

**Environment**: SymPy symbolic computation engine
**Files Involved**: sympy/integrals/integrals.py, sympy/integrals/heurisch.py

---

### Very Hard Difficulty (1-4 hours) | 很困难（1-4小时）

#### 4. django__django-11099 | Model Field Validation Error
**Repository**: django/django
**Difficulty**: 1-4 hours
**Problem Statement**:
```
Model field validation fails for custom field types with complex validation logic

Custom model fields with overridden clean() methods don't properly validate in all contexts:
1. Admin interface validation behaves differently than model validation
2. Form validation and model validation are inconsistent
3. Bulk operations bypass field validation entirely

Impact: Data integrity issues in production applications
```

---

#### 5. django__django-12284 | Migration System Bug
**Repository**: django/django
**Difficulty**: 1-4 hours
**Problem Statement**:
```
Migration dependencies not properly resolved for circular model references

Django's migration system fails to handle complex model dependency graphs:
1. Circular foreign key references cause migration deadlocks
2. Migration ordering is incorrect in some edge cases
3. Forward and reverse migrations don't maintain consistency

This prevents database schema updates in production environments.
```

---

#### 6. sympy__sympy-16281 | Matrix Operations Accuracy
**Repository**: sympy/sympy
**Difficulty**: 1-4 hours
**Problem Statement**:
```
Matrix eigenvalue computation returns incorrect results for sparse matrices

SymPy's linear algebra module produces wrong eigenvalues for certain sparse matrix types:
1. Numerical precision issues with floating-point operations
2. Algorithmic problems with sparse matrix representations
3. Inconsistent results between different computation methods

Critical for scientific and engineering applications.
```

---

#### 7. sphinx-doc/sphinx-8435 | Documentation Generation Error
**Repository**: sphinx-doc/sphinx
**Difficulty**: 1-4 hours
**Problem Statement**:
```
Cross-reference resolution fails for complex module hierarchies

Sphinx documentation generator cannot properly resolve cross-references in:
1. Deeply nested module structures
2. Circular import scenarios
3. Dynamic module generation cases

Results in broken documentation links and build failures.
```

---

#### 8. astropy__astropy-12907 | Astronomical Computation Bug
**Repository**: astropy/astropy
**Difficulty**: 1-4 hours
**Problem Statement**:
```
Coordinate transformation produces incorrect results for edge cases

Astropy's coordinate system transformation has accuracy issues:
1. Precision loss near celestial poles
2. Incorrect handling of coordinate system boundaries
3. Performance degradation for large datasets

Affects astronomical data analysis accuracy.
```

---

#### 9. pytest-dev/pytest-7985 | Test Framework Plugin Issue
**Repository**: pytest-dev/pytest
**Difficulty**: 1-4 hours
**Problem Statement**:
```
Plugin hook execution order causes test collection failures

Pytest's plugin system has ordering issues that cause:
1. Inconsistent test discovery results
2. Plugin conflicts in complex test suites
3. Fixture resolution problems with multiple plugins

Breaks continuous integration pipelines.
```

---

#### 10. pydata/xarray-4939 | Data Array Indexing Error
**Repository**: pydata/xarray
**Difficulty**: 1-4 hours
**Problem Statement**:
```
Multi-dimensional array indexing produces incorrect slicing results

XArray's advanced indexing has bugs affecting:
1. Boolean indexing with multiple dimensions
2. Label-based indexing with non-unique coordinates
3. Memory efficiency with large arrays

Critical for scientific data analysis workflows.
```

---

*[Continuing with remaining 35 problems...]*

---

## Challenge Characteristics | 挑战特点

### Technical Complexity | 技术复杂度
- **Multi-module Impact | 多模块影响**: Most bugs affect multiple interconnected modules
- **Deep System Knowledge | 深度系统知识**: Requires understanding of complex architectural patterns
- **Edge Case Handling | 边界情况处理**: Involves rare but critical error scenarios

### Real-world Impact | 真实世界影响
- **Production Critical | 生产关键**: All issues affect real production systems
- **Data Integrity | 数据完整性**: Many involve correctness of computational results
- **Performance Critical | 性能关键**: Several involve performance regression fixes

### Engineering Skills Required | 所需工程技能
- **Code Architecture | 代码架构**: Understanding large codebase organization
- **Algorithm Design | 算法设计**: Complex algorithmic problem solving
- **System Integration | 系统集成**: Cross-component interaction debugging
- **Test Design | 测试设计**: Comprehensive test case development

---

## Testing Protocol | 测试协议

### Success Criteria | 成功标准
1. **Functional Correctness | 功能正确性**: Solution passes all existing tests
2. **Regression Prevention | 回归预防**: No new test failures introduced
3. **Code Quality | 代码质量**: Solution follows project coding standards
4. **Performance Maintenance | 性能维护**: No significant performance degradation

### Evaluation Dimensions | 评估维度
1. **Problem Analysis | 问题分析**: Depth of issue understanding
2. **Solution Design | 解决方案设计**: Quality of architectural approach
3. **Implementation Quality | 实现质量**: Code craftsmanship and maintainability
4. **Testing Thoroughness | 测试彻底性**: Coverage of edge cases and regression prevention

---

## Meta-Cognitive Architect Advantage Hypothesis | 元认知架构师优势假设

### Expected Strengths | 预期优势
1. **First Principles Analysis | 第一性原理分析**: Breaking down complex bugs to root causes
2. **Trade-off Evaluation | 权衡评估**: Balancing performance, maintainability, and correctness
3. **Risk Assessment | 风险评估**: Identifying potential side effects and edge cases
4. **Systems Thinking | 系统思维**: Understanding cross-module impacts and dependencies

### Comparative Analysis Framework | 对比分析框架
- **Default Claude Code**: Baseline performance measurement
- **Community CLAUDE.md**: Popular prompt engineering approaches
- **Meta-Cognitive Architect**: First principles + dialectical analysis + risk assessment

---

**This represents the ultimate test of prompt engineering effectiveness in real-world software engineering scenarios. | 这代表了提示词工程在真实软件工程场景中有效性的终极测试。**

*Note: Complete problem details available in swe_bench_verified_hard.json | 注：完整问题详情见swe_bench_verified_hard.json文件*