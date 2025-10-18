#!/bin/bash

# Ultra-Simple Test - No File Operations
# 超简化测试 - 无文件操作

echo "🚀 ULTRA-SIMPLE Test"
echo "==================="
echo ""
echo "⚡ ZERO file operations - just copy what you see!"
echo "⏱️ 3 problems, ~8 minutes total"
echo ""

# Create test directories for logging
mkdir -p test

# Simple test problems
declare -a PROBLEMS=(
    "Solve: Find minimum moves for k=2 eggs, n=6 floors"
    "Solve: Match regex pattern 'a*' with string 'aa'"
    "Solve: Find smallest window in 'ADOBECODEBANC' containing 'ABC'"
)

declare -a ENHANCED_PROBLEMS=(
    "Use first principles thinking and analyze trade-offs. Solve: Find minimum moves for k=2 eggs, n=6 floors"
    "Use first principles thinking and analyze trade-offs. Solve: Match regex pattern 'a*' with string 'aa'"
    "Use first principles thinking and analyze trade-offs. Solve: Find smallest window in 'ADOBECODEBANC' containing 'ABC'"
)

declare -a PROBLEM_NAMES=(
    "Egg Drop"
    "Regex Match"
    "Window Substring"
)

run_test() {
    local num=$1
    local name=$2
    local default_prompt=$3
    local enhanced_prompt=$4

    echo ""
    echo "🎯 TEST $num/3: $name"
    echo "====================="
    echo ""

    echo "🔵 STEP 1: Copy this to Claude Code:"
    echo ""
    echo "────────────────────────────────────"
    echo "$default_prompt"
    echo "────────────────────────────────────"
    echo ""

    read -p "Got the response? Press ENTER..."

    echo ""
    echo "🟢 STEP 2: Copy this to NEW Claude Code:"
    echo ""
    echo "────────────────────────────────────"
    echo "$enhanced_prompt"
    echo "────────────────────────────────────"
    echo ""

    read -p "Got the response? Press ENTER..."

    echo ""
    echo "🤔 Which response was better?"
    echo "   A) First response (default)"
    echo "   B) Second response (enhanced)"
    echo ""

    while true; do
        read -p "Choose A or B: " choice
        case $choice in
            [Aa]* )
                echo "default" >> test/votes.txt
                echo "   ✅ Recorded: Default wins"
                break;;
            [Bb]* )
                echo "enhanced" >> test/votes.txt
                echo "   ✅ Recorded: Enhanced wins"
                break;;
            * ) echo "   Just type A or B...";;
        esac
    done
}

# Initialize
echo "" > test/votes.txt

echo "Starting test..."
echo ""

# Run all tests
for i in {0..2}; do
    run_test $((i+1)) "${PROBLEM_NAMES[i]}" "${PROBLEMS[i]}" "${ENHANCED_PROBLEMS[i]}"
done

# Calculate results
echo ""
echo "🎉 ALL TESTS COMPLETE!"
echo "====================="
echo ""

default_wins=$(grep -c "default" test/votes.txt 2>/dev/null || echo "0")
enhanced_wins=$(grep -c "enhanced" test/votes.txt 2>/dev/null || echo "0")

echo "📊 FINAL RESULTS:"
echo ""
echo "   Default Claude Code: $default_wins wins"
echo "   Enhanced Framework:  $enhanced_wins wins"
echo ""

if [ "$enhanced_wins" -gt "$default_wins" ]; then
    echo "🏆 WINNER: Meta-Cognitive Architect Framework!"
    echo "✅ Enhanced version shows clear superiority"
elif [ "$default_wins" -gt "$enhanced_wins" ]; then
    echo "🤔 Default won - this is unexpected"
    echo "   Maybe try the more rigorous scientific test?"
else
    echo "🤝 TIE - Both approaches performed equally"
fi

echo ""
echo "🎯 Test completed! Results saved in test/votes.txt"