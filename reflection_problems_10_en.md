# 10 Reflection-Required Problems

**Design Philosophy**: First reactions are guaranteed to be wrong. Only through deep reflection, questioning assumptions, and rethinking can the correct answer be found.

---

## Problem 1: The Meeting Room Allocation

**Question**: Company has 100 employees and needs to arrange meeting rooms. Each meeting room seats 10 people maximum. How many meeting rooms are needed minimum?

**First Reaction Answer**: 10 rooms (100÷10=10)
**Why It's Wrong**: Ignores actual operational constraints
**Reflection Points**:
- Do all employees meet simultaneously?
- Do meeting times overlap?
- Is meeting room utilization rate considered?
**Correct Thinking**: Need more information to answer; blind calculation is wrong

---

## Problem 2: The Code Review Dilemma

**Question**: A 10-million-line codebase requires review. Each line takes 1 minute to review on average. A programmer works 8 hours per day. How many days are needed to complete the code review?

**First Reaction Answer**: 208 days (100,000÷(8×60)≈208)
**Why It's Wrong**: Mechanical calculation ignoring real-world complexity
**Reflection Points**:
- Do all lines of code need equal review?
- Can reviewer attention be sustained?
- Is decreasing review quality considered?
**Correct Thinking**: This linear calculation is impractical in reality; smarter strategies needed

---

## Problem 3: The Database Query Optimization

**Question**: Database table has 10 million records, query time is 10 seconds. After adding an index, query time theoretically reduces by 90%. What is the optimized query time?

**First Reaction Answer**: 1 second (10 seconds×10%=1 second)
**Why It's Wrong**: Ignores system complexity
**Reflection Points**:
- Does indexing increase write overhead?
- What about memory and storage costs?
- Do all queries benefit equally?
**Correct Thinking**: Need comprehensive evaluation, not simple math

---

## Problem 4: The Load Balancer Design

**Question**: 5 servers each handle 1000 QPS, now need to handle 6000 QPS total. How many servers are needed?

**First Reaction Answer**: 6 servers (6000÷1000=6)
**Why It's Wrong**: Ignores failure redundancy and performance fluctuation
**Reflection Points**:
- What if one server goes down?
- How to handle traffic spikes?
- Is load evenly distributed?
**Correct Thinking**: Need fault tolerance; actually need 8-9 servers

---

## Problem 5: The Cache Strategy

**Question**: Application has 1GB memory for caching, each cache item is 10KB on average. How many items can be cached maximum?

**First Reaction Answer**: 100,000 items (1GB÷10KB≈100,000)
**Why It's Wrong**: Ignores cache mechanism complexity
**Reflection Points**:
- How much space do cache metadata occupy?
- How to handle memory fragmentation?
- What's the overhead of cache eviction policies?
**Correct Thinking**: Actual cacheable items will be much fewer

---

## Problem 6: The API Rate Limiting

**Question**: API can handle maximum 1000 requests per second. Each user can call maximum 100 times per minute. Can the system work normally when 100 users use it simultaneously?

**First Reaction Answer**: Yes (100 users×100 times÷60 seconds≈167 < 1000)
**Why It's Wrong**: Ignores uneven request distribution
**Reflection Points**:
- Are user requests evenly distributed?
- How to handle burst traffic?
- Are there loopholes in rate limiting strategy?
**Correct Thinking**: May actually experience momentary overload

---

## Problem 7: The Microservice Communication

**Question**: System has 10 microservices, each service calls 3 other services on average. How many service-to-service call relationships exist in total?

**First Reaction Answer**: 30 relationships (10×3=30)
**Why It's Wrong**: Confuses call frequency with call relationships
**Reflection Points**:
- Are call relationships bidirectional?
- Do circular dependencies exist between services?
- How to avoid overly complex service dependencies?
**Correct Thinking**: Need clear definition of "relationships" and consider architecture design

---

## Problem 8: The Security Vulnerability Assessment

**Question**: Application has 100 security checkpoints, security team can check 5 checkpoints per day. How many days are needed for complete security audit?

**First Reaction Answer**: 20 days (100÷5=20)
**Why It's Wrong**: Ignores iterative nature of security checks
**Reflection Points**:
- Do discovered vulnerabilities require re-checking?
- Are there dependencies between checkpoints?
- Will security standards change?
**Correct Thinking**: Security is continuous process, not one-time task

---

## Problem 9: The Team Productivity Calculation

**Question**: 1 senior engineer equals 3 junior engineers in work output. Current team has 2 senior engineers and 4 junior engineers. What's the equivalent junior engineer count?

**First Reaction Answer**: 10 engineers (2×3+4=10)
**Why It's Wrong**: Oversimplifies complex team dynamics
**Reflection Points**:
- Does team collaboration have additional overhead?
- Do senior engineers have mentoring responsibilities?
- Do different tasks require different skills?
**Correct Thinking**: Team efficiency is not simple linear addition

---

## Problem 10: The Cloud Migration ROI

**Question**: Cloud migration costs $50K, saves $5K/month in hosting. What's the break-even timeline?

**First Reaction Answer**: 10 months ($50K÷$5K=10)
**Why It's Wrong**: Ignores migration risks and hidden costs
**Reflection Points**:
- What are migration risks and hidden costs?
- What's the business impact during migration?
- What about training and maintenance costs?
- How to analyze opportunity costs?
**Correct Thinking**: Need to consider risks, opportunity costs, and long-term strategy

---

## Evaluation Criteria

### Expected Default Claude Response:
- 🚫 **Direct calculation** - Gives mathematical answer without questioning premises
- 🚫 **Surface analysis** - No deep thinking about hidden assumptions
- 🚫 **Linear thinking** - Ignores non-linear characteristics of complex systems

### Meta-Cognitive Framework Advantages:
- ✅ **Question assumptions** - Identifies hidden premises in problems
- ✅ **Systems thinking** - Considers complexity and interactions
- ✅ **Risk awareness** - Foresees potential problems and pitfalls
- ✅ **Multi-perspective analysis** - Re-examines problems from different angles
- ✅ **Acknowledge limitations** - Points out potential inadequacies in problem itself

### Key Differentiators:
1. **Whether first reaction misleads**
2. **Whether actively questions problem premises**
3. **Whether considers real-world complexity**
4. **Whether demonstrates genuine critical thinking**

These problems are designed to test AI's **meta-cognitive reflection capability**, not just computational and memory abilities.