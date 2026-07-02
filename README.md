# Regex Design Patterns

A curated catalog of advanced, multi-engine regular expression architectural patterns. This repository focuses on non-traditional logic layouts, linear execution flows, and structural optimizations for highly complex string validation.

## Deterministic Variable Architecture (RPN)
To safely bind structural complexities directly into compiler variables without parenthetical overhead, this engine strictly enforces a context-free Reverse Polish Notation (RPN) scalar convention. 

See the formal specification in [standards/variable_naming_rpn.md](./standards/variable_naming_rpn.md).


## 📐 Repository Structure

The architectural patterns are classified by logical capabilities:

*   **`structures/conditional_branching/`** : Advanced control flow, routing, and selection mechanisms without performance overhead.

---

## 💎 Featured Pattern: No-Pipe Multiplexer
The very first pattern of this repository demonstrates how to implement a high-performance dynamic router (e.g., a base 2 to 36 radix validator) using sequential named conditional blocks, completely eliminating standard choice alternations (`|`) and their associated backtracking costs.

## 📜 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
