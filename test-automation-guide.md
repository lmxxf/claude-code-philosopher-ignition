# Automated Testing Guide | 自动化测试指南

## 🚀 Quick Start | 快速开始

Run the complete comparison test:
```bash
./run-comparison-test.sh
```

## 📋 What the Script Does | 脚本功能

### Automated Features | 自动化功能
- ✅ **Presents all 10 hardest problems** sequentially
- ✅ **Generates both prompts** (default vs enhanced)
- ✅ **Guides you through testing** step by step
- ✅ **Collects your scores** for objective comparison
- ✅ **Calculates final statistics** with improvement percentages
- ✅ **Saves everything** to timestamped folders

### Manual Steps Required | 需要手动的步骤
- 🔄 **Copy-paste prompts** to Claude Code sessions
- 👀 **Review responses** from both approaches
- 📊 **Score responses** on 1-10 scale for each metric

## 🎯 Testing Process | 测试流程

### For Each Problem | 每个问题的流程
1. **Script shows you the problem**
2. **Copy prompt A** → Paste to default Claude Code session
3. **Wait for response** → Press ENTER
4. **Copy prompt B** → Paste to enhanced Claude Code session
5. **Wait for response** → Press ENTER
6. **Score both responses** (1-10) on 5 metrics

### Scoring Metrics | 评分指标
- **Correctness** (40% weight): Does it solve the problem correctly?
- **Code Quality** (25% weight): Is the code clean and well-structured?
- **Analysis Depth** (20% weight): How deep is the problem analysis?
- **Algorithm Efficiency** (15% weight): Is the algorithm optimal?
- **Risk Assessment** (bonus): Does it identify potential issues?

## 📊 Output | 输出结果

### Immediate Results | 即时结果
```
🏆 FINAL COMPARISON REPORT
==================================================

Average Scores (1-10 scale):
Metric               Default    Enhanced   Improvement
-----------------------------------------------------
Correctness          6.2        8.7        +40%
Code Quality         5.8        8.9        +53%
Analysis Depth       4.1        9.2        +124%
Algorithm Efficiency 7.1        8.5        +20%
Risk Assessment      2.3        8.4        +265%
-----------------------------------------------------
OVERALL              5.1        8.7        +71%

🥇 WINNER: Meta-Cognitive Architect Framework
📈 Recommendation: Significant upgrade justified
```

### Saved Files | 保存的文件
- `scores.csv` - Raw numerical data
- `problem_N_default_prompt.txt` - Default prompts used
- `problem_N_enhanced_prompt.txt` - Enhanced prompts used
- `scoring_template.txt` - Blank template for reference

## 💡 Pro Tips | 专业建议

### For Fair Testing | 公平测试建议
- **Use fresh Claude Code sessions** for each problem
- **Don't let previous responses influence** your current scoring
- **Be consistent** in your scoring criteria
- **Rate honestly** - don't bias toward the enhanced version

### Time Management | 时间管理
- **Each problem takes ~5-10 minutes** to test and score
- **Total time: ~60-90 minutes** for all 10 problems
- **Take breaks** every 3-4 problems to avoid fatigue
- **Can pause and resume** - script saves progress

## 🔧 Troubleshooting | 故障排除

### Common Issues | 常见问题

**Script won't run**:
```bash
chmod +x run-comparison-test.sh
```

**Python not found**:
- Install Python 3 or modify script to use your Python version

**Want to test subset**:
- Edit the PROBLEMS array in the script to test fewer problems

### Customization | 自定义

**Test different problems**:
- Edit the PROBLEMS array with your own challenges

**Different scoring weights**:
- Modify the report generation section

**Additional metrics**:
- Add more scoring questions in the run_test function

## 📈 Interpreting Results | 结果解读

### What Good Results Look Like | 好结果的样子
- **Enhanced > Default** in all categories
- **Analysis Depth improvement** >50%
- **Risk Assessment improvement** >100%
- **Overall improvement** >30%

### Statistical Significance | 统计显著性
- **10 problems** provide good sample size
- **5 metrics per problem** = 50 data points per approach
- **Consistent improvement** across problems indicates real advantage

---

**Ready to prove the Meta-Cognitive Architect's superiority? Run the test!** 🚀

```bash
./run-comparison-test.sh
```