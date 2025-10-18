#!/bin/bash

# Claude Code Comparison Test Runner
# 半自动化对比测试工具

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
RESULTS_DIR="test_results_${TIMESTAMP}"
mkdir -p "$RESULTS_DIR"

echo "🚀 Claude Code Meta-Cognitive Architect Comparison Test"
echo "====================================================="
echo ""
echo "📁 Results will be saved to: $RESULTS_DIR"
echo ""

# Define the 10 hardest problems
declare -a PROBLEMS=(
    "Super Egg Drop|You are given k identical eggs and access to a building with n floors. Find the minimum number of moves to determine the critical floor f with certainty. Example: k=2, n=6 should return 3."

    "Brace Expansion II|Given a string expression with nested braces and comma-separated options, expand all possible combinations and return them in lexicographical order. Example: '{a,b}{c,{d,e}}' should return ['ac','ad','ae','bc','bd','be']"

    "Regular Expression Matching|Implement regular expression matching with support for '.' and '*' where '.' matches any single character and '*' matches zero or more of the preceding element. Example: s='aa', p='a*' should return true"

    "Burst Balloons|Given n balloons, each with a number, burst all balloons to maximize coins. When you burst balloon i, you get nums[left] * nums[i] * nums[right] coins. Example: nums=[3,1,5,8] should return 167"

    "Create Maximum Number|Given two arrays nums1 and nums2 of length m and n with digits 0-9, create the maximum number of length k ≤ m + n by taking elements from both arrays while maintaining relative order. Example: nums1=[3,4,6,5], nums2=[9,1,2,5,8,3], k=5 should return [9,8,6,5,3]"

    "Sliding Window Maximum|Given an array and sliding window of size k, return an array of maximum values in each window position. Example: nums=[1,3,-1,-3,5,3,6,7], k=3 should return [3,3,5,5,6,7]"

    "Minimum Window Substring|Given strings s and t, find the minimum window substring of s that contains all characters of t. Example: s='ADOBECODEBANC', t='ABC' should return 'BANC'"

    "N-Queens II|Given an integer n, return the number of distinct solutions to the n-queens puzzle. Example: n=4 should return 2"

    "Palindrome Partitioning II|Given a string, find the minimum cuts needed to partition it such that every substring is a palindrome. Example: s='aab' should return 1 (aa|b)"

    "Shortest Path in Binary Matrix|In an n x n binary matrix, find the length of the shortest clear path from top-left to bottom-right. You can move in 8 directions through cells with value 0. Example: grid=[[0,1],[1,0]] should return 2"
)

# Create scoring template
cat > "$RESULTS_DIR/scoring_template.txt" << 'EOF'
Claude Code Comparison Test - Scoring Template
=============================================

Rate each response on a scale of 1-10:

Problem: [PROBLEM_NAME]

DEFAULT CLAUDE CODE:
-------------------
Correctness (1-10): ___
Code Quality (1-10): ___
Analysis Depth (1-10): ___
Algorithm Efficiency (1-10): ___
Risk Assessment (1-10): ___

META-COGNITIVE ARCHITECT:
------------------------
Correctness (1-10): ___
Code Quality (1-10): ___
Analysis Depth (1-10): ___
Algorithm Efficiency (1-10): ___
Risk Assessment (1-10): ___

Notes:
______________________________________
______________________________________

EOF

# Function to run a single test
run_test() {
    local problem_num=$1
    local problem_name=$2
    local problem_desc=$3

    echo ""
    echo "🔥 PROBLEM $problem_num: $problem_name"
    echo "================================================"
    echo ""

    # Create prompts for copy-paste
    local default_prompt="$problem_desc"
    local enhanced_prompt="Load the Meta-Cognitive Architect Framework and solve using first principles thinking, dialectical trade-off analysis, and meta-cognitive risk assessment.

Problem: $problem_desc

Apply the framework:
1. First Principles Analysis: What is the fundamental nature of this problem?
2. Trade-off Evaluation: Generate 2-3 approaches and analyze trade-offs
3. Risk Assessment: Identify blind spots and validation needs
4. Implementation: Provide solution with defensive programming"

    # Save prompts to files
    echo "$default_prompt" > "$RESULTS_DIR/problem_${problem_num}_default_prompt.txt"
    echo "$enhanced_prompt" > "$RESULTS_DIR/problem_${problem_num}_enhanced_prompt.txt"

    echo "📋 STEP 1: Open TWO Claude Code sessions"
    echo ""
    echo "🔵 SESSION A (Default Claude Code):"
    echo "Copy and paste this prompt:"
    echo "----------------------------------------"
    echo "$default_prompt"
    echo "----------------------------------------"
    echo ""

    read -p "Press ENTER when you've submitted to Session A and got the response..."
    echo ""

    echo "🟢 SESSION B (Meta-Cognitive Architect):"
    echo "Copy and paste this prompt:"
    echo "----------------------------------------"
    echo "$enhanced_prompt"
    echo "----------------------------------------"
    echo ""

    read -p "Press ENTER when you've submitted to Session B and got the response..."
    echo ""

    # Scoring
    echo "📊 SCORING TIME!"
    echo "Rate both responses (1-10 scale):"
    echo ""

    # Default scores
    echo "🔵 SESSION A (Default) Scores:"
    read -p "Correctness (1-10): " default_correctness
    read -p "Code Quality (1-10): " default_quality
    read -p "Analysis Depth (1-10): " default_analysis
    read -p "Algorithm Efficiency (1-10): " default_efficiency
    read -p "Risk Assessment (1-10): " default_risk

    echo ""
    echo "🟢 SESSION B (Enhanced) Scores:"
    read -p "Correctness (1-10): " enhanced_correctness
    read -p "Code Quality (1-10): " enhanced_quality
    read -p "Analysis Depth (1-10): " enhanced_analysis
    read -p "Algorithm Efficiency (1-10): " enhanced_efficiency
    read -p "Risk Assessment (1-10): " enhanced_risk

    # Save scores
    cat >> "$RESULTS_DIR/scores.csv" << EOF
$problem_num,$problem_name,$default_correctness,$default_quality,$default_analysis,$default_efficiency,$default_risk,$enhanced_correctness,$enhanced_quality,$enhanced_analysis,$enhanced_efficiency,$enhanced_risk
EOF

    echo ""
    echo "✅ Problem $problem_num scored and saved!"
    echo ""
}

# Main execution
echo "Starting comparison test with 10 hardest programming problems..."
echo ""

# Create CSV header
echo "Problem,Name,Default_Correctness,Default_Quality,Default_Analysis,Default_Efficiency,Default_Risk,Enhanced_Correctness,Enhanced_Quality,Enhanced_Analysis,Enhanced_Efficiency,Enhanced_Risk" > "$RESULTS_DIR/scores.csv"

# Run all tests
problem_num=1
for problem in "${PROBLEMS[@]}"; do
    IFS='|' read -r name desc <<< "$problem"
    run_test $problem_num "$name" "$desc"
    ((problem_num++))
done

# Generate final report
echo ""
echo "🎉 ALL TESTS COMPLETED!"
echo "======================"
echo ""
echo "📊 Generating final report..."

python3 << EOF
import csv
import sys

# Read scores
scores = []
with open('$RESULTS_DIR/scores.csv', 'r') as f:
    reader = csv.DictReader(f)
    for row in reader:
        scores.append(row)

# Calculate averages
def avg(key):
    return sum(float(row[key]) for row in scores) / len(scores)

print("🏆 FINAL COMPARISON REPORT")
print("=" * 50)
print()
print("Average Scores (1-10 scale):")
print(f"{'Metric':<20} {'Default':<10} {'Enhanced':<10} {'Improvement':<12}")
print("-" * 55)

metrics = [
    ('Correctness', 'Default_Correctness', 'Enhanced_Correctness'),
    ('Code Quality', 'Default_Quality', 'Enhanced_Quality'),
    ('Analysis Depth', 'Default_Analysis', 'Enhanced_Analysis'),
    ('Algorithm Efficiency', 'Default_Efficiency', 'Enhanced_Efficiency'),
    ('Risk Assessment', 'Default_Risk', 'Enhanced_Risk')
]

total_default = 0
total_enhanced = 0

for name, default_key, enhanced_key in metrics:
    default_avg = avg(default_key)
    enhanced_avg = avg(enhanced_key)
    improvement = ((enhanced_avg - default_avg) / default_avg) * 100

    total_default += default_avg
    total_enhanced += enhanced_avg

    print(f"{name:<20} {default_avg:<10.1f} {enhanced_avg:<10.1f} {improvement:+.0f}%")

print("-" * 55)
overall_improvement = ((total_enhanced - total_default) / total_default) * 100
print(f"{'OVERALL':<20} {total_default/5:<10.1f} {total_enhanced/5:<10.1f} {overall_improvement:+.0f}%")
print()

# Winner determination
if total_enhanced > total_default:
    print("🥇 WINNER: Meta-Cognitive Architect Framework")
    print("📈 Recommendation: Significant upgrade justified")
else:
    print("🤔 Results inconclusive - may need more testing")

print()
print(f"📁 Detailed results saved in: $RESULTS_DIR/")
print("📊 Raw scores: scores.csv")
print("📝 Test prompts: problem_*_prompt.txt files")

EOF

echo ""
echo "🎯 Test completed! Check the results directory for detailed analysis."