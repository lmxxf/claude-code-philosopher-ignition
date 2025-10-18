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

# 10 Reflection-required problems that need error-correction thinking
declare -a PROBLEMS=(
    "Company has 100 employees, each meeting room seats 10 people. How many meeting rooms are needed minimum?"
    "10M-line codebase, 1 min per line review, 8h workday. How many days to complete code review?"
    "Database: 10M records, 10s query time. Index reduces 90% time. New query time?"
    "5 servers handle 1000 QPS each, need 6000 QPS total. How many servers needed?"
    "1GB cache memory, 10KB per item. Maximum cache items possible?"
    "API: 1000 req/s max, users 100 req/min each. Can 100 users work simultaneously?"
    "10 microservices, each calls 3 others on average. Total service call relationships?"
    "100 security checkpoints, team checks 5/day. Days needed for complete security audit?"
    "1 senior = 3 junior developers. Team: 2 senior + 4 junior. Equivalent junior count?"
    "Module refactor: 100h cost, saves 10h/month waste. Break-even point in months?"
)

declare -a ENHANCED_PROBLEMS=(
    "Use first principles thinking and analyze trade-offs. Company has 100 employees, each meeting room seats 10 people. How many meeting rooms are needed minimum?"
    "Use first principles thinking and analyze trade-offs. 10M-line codebase, 1 min per line review, 8h workday. How many days to complete code review?"
    "Use first principles thinking and analyze trade-offs. Database: 10M records, 10s query time. Index reduces 90% time. New query time?"
    "Use first principles thinking and analyze trade-offs. 5 servers handle 1000 QPS each, need 6000 QPS total. How many servers needed?"
    "Use first principles thinking and analyze trade-offs. 1GB cache memory, 10KB per item. Maximum cache items possible?"
    "Use first principles thinking and analyze trade-offs. API: 1000 req/s max, users 100 req/min each. Can 100 users work simultaneously?"
    "Use first principles thinking and analyze trade-offs. 10 microservices, each calls 3 others on average. Total service call relationships?"
    "Use first principles thinking and analyze trade-offs. 100 security checkpoints, team checks 5/day. Days needed for complete security audit?"
    "Use first principles thinking and analyze trade-offs. 1 senior = 3 junior developers. Team: 2 senior + 4 junior. Equivalent junior count?"
    "Use first principles thinking and analyze trade-offs. Module refactor: 100h cost, saves 10h/month waste. Break-even point in months?"
)

declare -a PROBLEM_NAMES=(
    "Meeting Room Allocation"
    "Code Review Time"
    "Database Optimization"
    "Load Balancer Design"
    "Cache Strategy"
    "API Rate Limiting"
    "Microservice Communication"
    "Security Assessment"
    "Team Productivity"
    "Technical Debt"
)

declare -a CORRECT_ANSWERS=(
    "Need more info (depends on meeting schedule)"
    "Unrealistic (attention fatigue, quality issues)"
    "Not 1s (index overhead, complexity)"
    "8-9 servers (need redundancy)"
    "Less than 100K (metadata overhead)"
    "Risk of burst overload"
    "Need definition (bidirectional?)"
    "Continuous process (not one-time)"
    "Not 10 (team dynamics complexity)"
    "Not 10 months (debt compounds)"
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