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

# 10 Programming trap problems with clear correct answers
declare -a PROBLEMS=(
    "Calculate: a = 2147483647, b = 1. What is a + b in 32-bit signed integer?"
    "Evaluate: Does 0.1 + 0.2 == 0.3 in most programming languages?"
    "Find: Maximum value index in empty array []"
    "Calculate: Length of string '👨‍👩‍👧‍👦' (family emoji) as user perceives"
    "Predict: arr1=[1,2], arr2=[3,4]. After swap_arrays(arr1,arr2), what is arr1?"
    "Analyze: result = True or side_effect(). Does side_effect() execute?"
    "Time complexity: i=1; while i<n: for j in range(i): count+=1; i*=2"
    "Memory: Can largeArray be garbage collected in JavaScript closure?"
    "Hash: keys=['Aa','BB'] have same hashCode. How many unique keys?"
    "String: Reverse 'hello' with O(1) space in Java/Python - possible?"
)

declare -a ENHANCED_PROBLEMS=(
    "Use first principles thinking and analyze trade-offs. Calculate: a = 2147483647, b = 1. What is a + b in 32-bit signed integer?"
    "Use first principles thinking and analyze trade-offs. Evaluate: Does 0.1 + 0.2 == 0.3 in most programming languages?"
    "Use first principles thinking and analyze trade-offs. Find: Maximum value index in empty array []"
    "Use first principles thinking and analyze trade-offs. Calculate: Length of string '👨‍👩‍👧‍👦' (family emoji) as user perceives"
    "Use first principles thinking and analyze trade-offs. Predict: arr1=[1,2], arr2=[3,4]. After swap_arrays(arr1,arr2), what is arr1?"
    "Use first principles thinking and analyze trade-offs. Analyze: result = True or side_effect(). Does side_effect() execute?"
    "Use first principles thinking and analyze trade-offs. Time complexity: i=1; while i<n: for j in range(i): count+=1; i*=2"
    "Use first principles thinking and analyze trade-offs. Memory: Can largeArray be garbage collected in JavaScript closure?"
    "Use first principles thinking and analyze trade-offs. Hash: keys=['Aa','BB'] have same hashCode. How many unique keys?"
    "Use first principles thinking and analyze trade-offs. String: Reverse 'hello' with O(1) space in Java/Python - possible?"
)

declare -a PROBLEM_NAMES=(
    "Integer Overflow"
    "Float Precision"
    "Array Boundary"
    "Unicode Length"
    "Reference vs Value"
    "Short Circuit"
    "Time Complexity"
    "Memory Leak"
    "Hash Collision"
    "String Immutable"
)

declare -a CORRECT_ANSWERS=(
    "-2147483648"
    "false"
    "-1"
    "1"
    "[1,2]"
    "No"
    "O(n)"
    "No"
    "2"
    "No"
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
    echo "📝 Correct Answer: $correct_answer"
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