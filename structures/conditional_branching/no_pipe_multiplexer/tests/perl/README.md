# Perl Automated Test Suite: No-Pipe Multiplexer

This directory contains the industrial-grade functional test scripts written in Perl to validate the behavioral integrity and routing mechanisms of the **No-Pipe Multiplexer** pattern.

---

## 🔬 Test Suite Overview

Unlike naive regular expression tests, this suite relies on a modular architecture to verify dynamic layout state-tracking without token-matching alternation trees (`|`).

### 📦 1. Simple Linear Evaluation (`01_simple_multiplexer.pl`)
*   **Intent**: Demonstrates the raw mechanics of the pattern.
*   **Logics**: Maps a static set of lookaround-constrained targets directly to their linear conditional outcomes `(?(<name>)...)`.
*   **Key Behavior**: Evaluates linearly. Inactive branches are bypassed passively without triggers or memory stack allocation.

### 🎛️ 2. Advanced State Gate Routing (`02_advanced_gate.pl`)
*   **Intent**: Evaluates binary execution state forks for multi-token streaming (LISP-style syntax mapping).
*   **Logics**: Forwards tokens using a forward character state fork split. If a valid radix group is created, it streams into the linear evaluator. If a fallback character is found, the engine completely bypasses the multiplexer block to trigger a clean row-level default fallback (`[^\n]*`).

---

## 🚀 Execution & Verification

You can execute both test files natively from your terminal without any third-party CPAN dependencies.

### Running the Tests
```bash
# Execute the simple pattern layout test
perl 01_simple_multiplexer.pl

# Execute the advanced state-routing gate test
perl 02_advanced_gate.pl
```

### 📋 Expected Output Layout
Both scripts run a deterministic string substitution (`s///g`) against a clean valid matrix (`test_ok`) and a faulty matrix (`test_ko`).

*   **`Test OK Output`**: The entire multi-line string matrix must be cleanly consumed and converted into `[MATCH]` labels.
*   **`Test KO Output`**: Only structurally compliant fragments are altered. Lines containing mismatched index ranges or inner logic boundary issues **must remain unconsumed**, explicitly highlighting where the engine denied validation.

---

## 🛠️ Industrialization Note

These scripts use explicit extended layout notation `(?x)` to allow internal spacing and comments. To deploy these patterns directly in production parsers, you can strip whitespaces or load them dynamically as decoupled sub-modules.
