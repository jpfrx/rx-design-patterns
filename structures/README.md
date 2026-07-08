# Regex Structural Architecture Catalog

This directory serves as the primary repository for advanced, non-standard regular expression design patterns and architectural frameworks.

---

## ⚠️ Repository Refactoring Notice (Active Phase)

The structural hierarchy of this directory is undergoing an intensive reorganization:
*   **`conditional_branching/` (Legacy Archive)**: This folder is scheduled for deprecation and comprehensive restructuring in the coming days. The raw, early experimental patterns located here (such as the legacy `CB-FLAWED-1x1-gate`) are preserved strictly as baseline benchmarks to demonstrate performance limitations like catastrophic backtracking.
*   **Target State**: All upcoming production-grade design patterns are transitioning to decoupled, state-machine architectures.

---

## 👑 Featured Paradigm: State-Matrix Router (SMR)

The current core focus of this repository is the development and documentation of the **State-Matrix Router (SMR)** ecosystem located in the **`state-matrix_router/`** directory.

The SMR pattern represents a complete departure from traditional sequential text-matching. It treats the regular expression engine as a hardware-emulated **Programmable Logic Array (PLA)**, decoupling state initialization from execution routing.

### The SMR-ISD Pipeline Matrix
Our flagship production implementation utilizes the highly optimized 3-module **SMR-ISD** pipeline layout:

1.  **`input` (Optional / Removable)**: A peripheral terminal utility to initialize state flags. The engine is entirely pluggable; these flags can be instantly populated by any arbitrary named capture groups residing anywhere within a wider application-layer regex routine.
2.  **`stage` (Mandatory - Parallel Truth Compiler)**: An unprecedented, flat logical matrix that intercepts active memory registers. By chaining atomic lookahead assertions (`(?(<group>)(?=)|(?!))`), it compiles raw flags into stabilized execution macros sequentially without nested visual recursion or engine backtracking.
3.  **`demux` (Mandatory - Downstream Switcher)**: A blind, mechanical multi-gate engine that reacts to the compiled state of the `stage` across an infinite processing loop (`)++`), routing complex input combinations to continuous valid outputs (\(N \times N\)).

### Directory Navigation
*   To explore the global nomenclature and math-variable syntax rules, see the core **`conventions/`** repository.
*   To view the foundational \(N \times N\) crossbar switch implementation file, navigate directly to **`state-matrix_router/0001-matrix_switch/SMR-ISD_NxN-matrix-switch.pl`**.

