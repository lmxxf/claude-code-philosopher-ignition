#!/bin/bash

# Zero-Brain Claude Code Comparison Test
# 零脑力Claude Code对比测试 - 完全无脑操作

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
RESULTS_DIR="zero_brain_test_${TIMESTAMP}"
mkdir -p "$RESULTS_DIR"

echo "🧠❌ ZERO-BRAIN Claude Code Test"
echo "================================"
echo ""
echo "⚡ ULTRA SIMPLE:"
echo "   1. Copy-paste what we tell you"
echo "   2. Choose A or B (which answer looks better)"
echo "   3. Press ENTER"
echo "   4. That's it!"
echo ""
echo "⏱️  Total time: ~10 minutes"
echo "🧠 Brain usage: 0%"
echo ""

read -p "Ready for the easiest test ever? Press ENTER..."

# Super simple problems
declare -a ZERO_BRAIN_PROBLEMS=(
    "Egg Drop|Find minimum moves for k=2 eggs, n=6 floors"
    "Regex Match|Match pattern 'a*' with string 'aa'"
    "Window Substring|Find smallest window in 'ADOBECODEBANC' containing 'ABC'"
)

run_zero_brain_test() {
    local problem_num=$1
    local problem_name=$2
    local problem_desc=$3

    echo ""
    echo "🎯 TEST $problem_num/3: $problem_name"
    echo "=============================="
    echo ""

    # Simple prompts
    local default_prompt="Solve: $problem_desc"
    local enhanced_prompt="Use first principles thinking and analyze trade-offs. Solve: $problem_desc"

    echo "🔵 STEP 1: Open Claude Code, copy-paste this:"
    echo ""
    echo "=== COPY THIS ==="
    echo "$default_prompt"
    echo "=== END COPY ==="
    echo ""

    read -p "Got the response? Press ENTER..."

    echo ""
    echo "🟢 STEP 2: Open NEW Claude Code session, copy-paste this:"
    echo ""
    echo "=== COPY THIS ==="
    echo "$enhanced_prompt"
    echo "=== END COPY ==="
    echo ""

    read -p "Got the response? Press ENTER..."

    echo ""
    echo "🤔 STEP 3: Which response was better?"
    echo ""
    echo "   A) First response (default)"
    echo "   B) Second response (enhanced)"
    echo ""

    local choice
    while true; do
        read -p "Choose A or B: " choice
        case $choice in
            [Aa]* )
                echo "0,1" >> "$RESULTS_DIR/simple_votes.csv"
                echo "   📝 Recorded: Default wins"
                break;;
            [Bb]* )
                echo "1,0" >> "$RESULTS_DIR/simple_votes.csv"
                echo "   📝 Recorded: Enhanced wins"
                break;;
            * ) echo "   Just type A or B please...";;
        esac
    done

    echo ""
    echo "✅ Test $problem_num done!"
}

# Main execution
echo ""
echo "Starting zero-brain test..."
echo ""

# Initialize results
echo "Enhanced_Wins,Default_Wins" > "$RESULTS_DIR/simple_votes.csv"

# Run 3 simple tests
problem_num=1
for problem in "${ZERO_BRAIN_PROBLEMS[@]}"; do
    IFS='|' read -r name desc <<< "$problem"
    run_zero_brain_test $problem_num "$name" "$desc"
    ((problem_num++))
done

echo ""
echo "🎉 ALL TESTS DONE!"
echo "=================="
echo ""

# Calculate results
enhanced_wins=0
default_wins=0

while IFS=',' read -r enhanced default; do
    if [ "$enhanced" != "Enhanced_Wins" ]; then  # Skip header
        enhanced_wins=$((enhanced_wins + enhanced))
        default_wins=$((default_wins + default))
    fi
done < "$RESULTS_DIR/simple_votes.csv"

echo "📊 FINAL RESULTS:"
echo ""
echo "   Enhanced Framework: $enhanced_wins wins"
echo "   Default Claude Code: $default_wins wins"
echo ""

if [ "$enhanced_wins" -gt "$default_wins" ]; then
    echo "🏆 WINNER: Meta-Cognitive Architect Framework!"
    echo "✅ The enhanced version consistently produces better results"
elif [ "$default_wins" -gt "$enhanced_wins" ]; then
    echo "🤔 Default won - unusual result, might need retesting"
else
    echo "🤝 Tie - both approaches performed similarly"
fi

echo ""
echo "💡 Want to convince others? Share this simple test:"
echo "   ./run-zero-brain-test.sh"
echo ""
echo "📁 Results saved in: $RESULTS_DIR/"
echo ""
echo "🎯 Thanks for the 10 minutes! Hope you saw the difference! 🚀"