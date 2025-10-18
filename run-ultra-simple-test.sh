#!/bin/bash

# Ultra-Simple Test - Maximum Simplification
# 超简化测试 - 最大化简化

echo "🚀 ULTRA-SIMPLE Test"
echo "==================="
echo ""
echo "💡 We'll create test files for you to copy-paste"
echo "📁 Results go in: test/origin/ and test/ignition/"
echo ""

# Create test directories
mkdir -p test/origin test/ignition

# Simple test problems
declare -a PROBLEMS=(
    "Egg Drop: k=2 eggs, n=6 floors, find minimum moves"
    "Regex: Match 'a*' pattern with 'aa' string"
    "Window: Find smallest window in 'ADOBECODEBANC' containing 'ABC'"
)

# Create all prompts upfront
echo "📝 Creating test prompts..."

for i in {1..3}; do
    problem="${PROBLEMS[$((i-1))]}"

    # Default prompt
    echo "Solve: $problem" > "test/origin/problem${i}_prompt.txt"

    # Enhanced prompt
    echo "Use first principles thinking and analyze trade-offs. Solve: $problem" > "test/ignition/problem${i}_prompt.txt"
done

echo ""
echo "✅ All prompts created!"
echo ""
echo "🎯 Now just follow these steps:"
echo ""

for i in {1..3}; do
    echo "PROBLEM $i:"
    echo "  1. Copy: test/origin/problem${i}_prompt.txt → Paste to Claude Code"
    echo "  2. Copy: test/ignition/problem${i}_prompt.txt → Paste to NEW Claude Code"
    echo "  3. Save responses to: test/origin/problem${i}_response.txt"
    echo "                        test/ignition/problem${i}_response.txt"
    echo ""
done

echo "🤔 After all tests, answer these simple questions:"
echo ""

# Run simple comparison
for i in {1..3}; do
    problem_name=$(echo "${PROBLEMS[$((i-1))]}" | cut -d: -f1)

    echo "Problem $i ($problem_name):"
    echo "Which response was better? (A=origin, B=ignition)"

    while true; do
        read -p "A or B? " choice
        case $choice in
            [Aa]* )
                echo "origin" >> test/votes.txt
                break;;
            [Bb]* )
                echo "ignition" >> test/votes.txt
                break;;
            * ) echo "Just type A or B...";;
        esac
    done
done

# Quick results
echo ""
echo "📊 RESULTS:"
echo "==========="

origin_wins=$(grep -c "origin" test/votes.txt 2>/dev/null || echo "0")
ignition_wins=$(grep -c "ignition" test/votes.txt 2>/dev/null || echo "0")

echo "Origin (Default): $origin_wins wins"
echo "Ignition (Enhanced): $ignition_wins wins"
echo ""

if [ "$ignition_wins" -gt "$origin_wins" ]; then
    echo "🏆 WINNER: Meta-Cognitive Architect (Ignition)!"
elif [ "$origin_wins" -gt "$ignition_wins" ]; then
    echo "🤔 Origin won - unexpected result"
else
    echo "🤝 Tie"
fi

echo ""
echo "📁 All files saved in test/ folder"
echo "🎯 Test complete!"