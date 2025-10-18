#!/bin/bash

# Ultra-Simple Test - No File Operations
# 超简化测试 - 无文件操作

echo "🚀 ULTRA-SIMPLE Test"
echo "==================="
echo ""
echo "⚡ ZERO file operations - just copy what you see!"
echo "⏱️ 10 problems, ~20 minutes total"
echo ""
echo "📋 SETUP: Open 2 Claude Code windows first:"
echo ""
echo "   Window A: Default Claude Code (do nothing)"
echo "   Window B: Enhanced Claude Code (load framework first)"
echo ""
echo "For Window B, first paste this framework:"
echo "────────────────────────────────────────────"
echo "Load the Meta-Cognitive Architect Framework from claude-code-philosopher-ignition-en.md"
echo "────────────────────────────────────────────"
echo ""
read -p "Ready? Both windows open and framework loaded in Window B? Press ENTER..."

# Create test directories for logging
mkdir -p test

# Top 10 hardest programming problems
declare -a PROBLEMS=(
    "Solve: Find minimum moves for k=2 eggs, n=6 floors"
    "Solve: Expand '{a,b}{c,{d,e}}' and return in lexicographical order"
    "Solve: Match regex pattern 'a*' with string 'aa'"
    "Solve: Burst balloons [3,1,5,8] to maximize coins"
    "Solve: Create max number from nums1=[3,4,6,5], nums2=[9,1,2,5,8,3], k=5"
    "Solve: Find sliding window maximum for nums=[1,3,-1,-3,5,3,6,7], k=3"
    "Solve: Find smallest window in 'ADOBECODEBANC' containing 'ABC'"
    "Solve: Count solutions for n=4 queens puzzle"
    "Solve: Minimum cuts for palindrome partition of 'aab'"
    "Solve: Shortest path in grid=[[0,1],[1,0]] from top-left to bottom-right"
)

declare -a ENHANCED_PROBLEMS=(
    "Use first principles thinking and analyze trade-offs. Solve: Find minimum moves for k=2 eggs, n=6 floors"
    "Use first principles thinking and analyze trade-offs. Solve: Expand '{a,b}{c,{d,e}}' and return in lexicographical order"
    "Use first principles thinking and analyze trade-offs. Solve: Match regex pattern 'a*' with string 'aa'"
    "Use first principles thinking and analyze trade-offs. Solve: Burst balloons [3,1,5,8] to maximize coins"
    "Use first principles thinking and analyze trade-offs. Solve: Create max number from nums1=[3,4,6,5], nums2=[9,1,2,5,8,3], k=5"
    "Use first principles thinking and analyze trade-offs. Solve: Find sliding window maximum for nums=[1,3,-1,-3,5,3,6,7], k=3"
    "Use first principles thinking and analyze trade-offs. Solve: Find smallest window in 'ADOBECODEBANC' containing 'ABC'"
    "Use first principles thinking and analyze trade-offs. Solve: Count solutions for n=4 queens puzzle"
    "Use first principles thinking and analyze trade-offs. Solve: Minimum cuts for palindrome partition of 'aab'"
    "Use first principles thinking and analyze trade-offs. Solve: Shortest path in grid=[[0,1],[1,0]] from top-left to bottom-right"
)

declare -a PROBLEM_NAMES=(
    "Super Egg Drop"
    "Brace Expansion II"
    "Regex Match"
    "Burst Balloons"
    "Create Max Number"
    "Sliding Window Max"
    "Window Substring"
    "N-Queens II"
    "Palindrome Partition II"
    "Shortest Path Matrix"
)

declare -a CORRECT_ANSWERS=(
    "3 (正确答案：3步)"
    "['ac','ad','ae','bc','bd','be'] (正确答案：6个组合)"
    "true (正确答案：true，a*匹配零个或多个a)"
    "167 (正确答案：167个硬币)"
    "[9,8,6,5,3] (正确答案：最大5位数)"
    "[3,3,5,5,6,7] (正确答案：每个窗口的最大值)"
    "BANC (正确答案：BANC，最小包含ABC的窗口)"
    "2 (正确答案：2种解法)"
    "1 (正确答案：1次切割，aa|b)"
    "2 (正确答案：2步路径)"
)

run_test() {
    local num=$1
    local name=$2
    local default_prompt=$3
    local enhanced_prompt=$4
    local correct_answer=$5

    echo ""
    echo "🎯 TEST $num/10: $name"
    echo "====================="
    echo ""
    echo "📝 标准答案: $correct_answer"
    echo ""

    echo "🔵 STEP 1: Copy this to Window A (Default Claude Code):"
    echo ""
    echo "────────────────────────────────────"
    echo "$default_prompt"
    echo "────────────────────────────────────"
    echo ""

    read -p "Got the response? Press ENTER..."

    echo ""
    echo "🟢 STEP 2: Copy this to Window B (Enhanced Claude Code):"
    echo ""
    echo "────────────────────────────────────"
    echo "$default_prompt"
    echo "────────────────────────────────────"
    echo ""

    read -p "Got the response? Press ENTER..."

    echo ""
    echo "🤔 EVALUATION:"
    echo ""
    echo "Consider: Which response would you prefer if you were:"
    echo "• A student learning programming"
    echo "• A senior engineer solving complex problems"
    echo "• Someone who needs to understand edge cases and risks"
    echo ""
    echo "   A) Window A response (default)"
    echo "   B) Window B response (enhanced)"
    echo "   C) DRAW (both equally good)"
    echo ""

    while true; do
        read -p "Choose A, B, or C: " choice
        case $choice in
            [Aa]* )
                echo "default" >> test/votes.txt
                echo "   ✅ Recorded: Default wins"
                break;;
            [Bb]* )
                echo "enhanced" >> test/votes.txt
                echo "   ✅ Recorded: Enhanced wins"
                break;;
            [Cc]* )
                echo "draw" >> test/votes.txt
                echo "   ✅ Recorded: Draw"
                break;;
            * ) echo "   Just type A, B, or C...";;
        esac
    done
}

# Initialize
echo "" > test/votes.txt

echo "Starting test..."
echo ""

# Run all tests
for i in {0..9}; do
    run_test $((i+1)) "${PROBLEM_NAMES[i]}" "${PROBLEMS[i]}" "${ENHANCED_PROBLEMS[i]}" "${CORRECT_ANSWERS[i]}"
done

# Calculate results
echo ""
echo "🎉 ALL TESTS COMPLETE!"
echo "====================="
echo ""

default_wins=$(grep -c "default" test/votes.txt 2>/dev/null || echo "0")
enhanced_wins=$(grep -c "enhanced" test/votes.txt 2>/dev/null || echo "0")
draws=$(grep -c "draw" test/votes.txt 2>/dev/null || echo "0")

echo "📊 FINAL RESULTS:"
echo ""
echo "   Default Claude Code: $default_wins wins"
echo "   Enhanced Framework:  $enhanced_wins wins"
echo "   Draws:               $draws"
echo ""

if [ "$enhanced_wins" -gt "$default_wins" ] && [ "$enhanced_wins" -gt "$draws" ]; then
    echo "🏆 WINNER: Meta-Cognitive Architect Framework!"
    echo "✅ Enhanced version shows clear preference"
elif [ "$default_wins" -gt "$enhanced_wins" ] && [ "$default_wins" -gt "$draws" ]; then
    echo "🤔 Default won - users prefer simplicity"
    echo "   This suggests our framework may be too verbose"
elif [ "$draws" -ge "$enhanced_wins" ] && [ "$draws" -ge "$default_wins" ]; then
    echo "🤝 MOSTLY DRAWS - Both approaches have merit"
    echo "   Framework provides depth without clear user preference"
else
    echo "📊 MIXED RESULTS - No clear winner"
    echo "   May need more testing or different problems"
fi

echo ""
echo "🎯 Test completed! Results saved in test/votes.txt"