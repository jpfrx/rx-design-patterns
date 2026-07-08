# Regular Expression Architectural Design Patterns

This repository serves as a research laboratory and production-grade catalog for advanced, non-standard regular expression design patterns. Instead of treating regular expressions as simple text-matching scripts, this project weaponizes regex engines to act as hardware-emulated **Programmable Logic Arrays (PLA)** and autonomous state machines.

---

## 👑 FEATURED PARADIGM: THE STATE-MATRIX ROUTER (SMR)

> ### 📝 ARCHITECTURAL NOTE: THE OBLITERATION OF THE `/g` FLAG
> Traditional stream tokenizers and log analyzers rely on a procedural procedural loop (`while ($text =~ m/.../g)`). This model forces the CPU to constantly context-switch between the runtime virtual machine and the regex compilation layer, inducing severe serialization overhead.
>
> The **State-Matrix Router (SMR-ISD)** paradigm completely nullifies the need for the global flag (`/g`). By leveraging parallel truth tables and continuous downstream possessive loop matrices (`)++`), the SMR executes infinite, multi-state text analysis **natively inside a single, monolithic, local regular expression match**. The engine is entered exactly once, locking its compiled execution context in mid-air across millions of characters with zero backtracking overhead.
>
> **Explore the Core implementation**: [`structures/state-matrix_router/`](structures/state-matrix_router/)

---

## 🏗️ Repository Ecosystem Layout

### 1. [`structures/`](structures/) — The Architectural Catalog
*   **[`state-matrix_router/`](structures/state-matrix_router/) (Active Production)**: Contains the flagship **SMR-ISD** 3-module pipeline engine (`input` (5) ➔ `stage` (5) ➔ `demux` (5)). Features flat, linear lookahead assertion grids `(?(<group>)(?=)|(?!))` executing real-time parallel boolean logic.
*   **`conditional_branching/` (Legacy Archive)**: Retained strictly as an educational baseline. Features old, flawed experimental structures (like `CB-FLAWED-1x1-gate`) to demonstrate the mechanics of catastrophic backtracking and stack memory explosions.

### 2. [`conventions/`](conventions/) — Universal Specifications
*   **[`FRPN-specification.md`](conventions/naming-conventions/FRPN-specification.md)**: The **Formulaic RPN Notation** protocol. A token-delimited Reverse Polish Notation grammar used to safely embed exact mathematical complexity equations (e.g., `O_D_N_1_D_d_e_x_x`) directly into valid, compiler-safe code variable names without parenthetical collisions.

### 3. [`benchmark/`](benchmark/) — Empirical Trace Metrics
*   Contains historical kernel compilation logs, performance trace assets, and raw Perl `rexdump` validation test runs comparing SMR speeds against legacy matching frameworks.

---

## 🚀 The Ultimate Frontier: Perl Core RFC Alignment

The monolithic text-analysis capabilities unlocked by the SMR paradigm serve as the empirical and mathematical justification for the **`PERL_STACK_RETURN_VARIABLE`** RFC.

Because SMR nullifies `/g` and locks execution inside a single matching pass, the architecture hits a rigid ceiling: captured memory registers are immutable across the match. This repository directly supports the core Perl modification proposal to introduce a native, mid-match stack return protocol, allowing regular expressions to dynamically clear memory stacks and alter evaluation topologies on the fly.
*   **Read the Core Specification**: [`codeberg.org/jpfrx/perl-stack-return-variable`](https://codeberg.org)

