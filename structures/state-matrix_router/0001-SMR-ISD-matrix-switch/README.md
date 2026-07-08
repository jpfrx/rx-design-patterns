# State-Matrix Router (SMR) Architecture

The **State-Matrix Router (SMR)** is an advanced, non-local regular expression orchestration paradigm designed to route multi-state inputs to multi-state outputs (M × N). By establishing a zero-backtracking, blind state-transfer channel across physical distances within a single compiled pattern, the SMR completely decouples state resolution from final execution branching.

---

## 🏗️ Core Architectural Modules

To maintain strict structural alignment and eliminate cognitive friction, the SMR architecture enforces a rigid nomenclature layout for its pipeline phases. 

### The Core Engine (Mandatory Foundation)

The true innovation of the SMR pattern relies entirely on the decoupled relationship between these two processing layers. They operate independently of how state flags are initialized:

1. **`stage` (5)**
   * **Role**: Parallel Validation Table / Step Sequencer.
   * **Mechanics**: This is the brain of the routing matrix. It intercepts arbitrary named capture groups residing *anywhere* in the broader application memory and evaluates them using a flat sequence of atomic assertions. It translates chaotic application states into clear, stabilized execution macros without introducing nested recursion or pointer backtracking.

2. **`demux` (5)**
   * **Role**: Downstream Multi-Gate Switcher.
   * **Mechanics**: Lives deep within the trailing pattern layout. It operates as a blind, mechanical switcher executing local, sequential boolean tests. It remains ignorant of *how* or *where* a state was captured; it merely evaluates the flattened token configurations passed by the `stage` and opens the matched execution gate.

### Peripheral / Boundary Components (Optional)

3. **`input` (5)** 
   * **Role**: Upstream State Initialization Utility (**Optional / Removable**).
   * **Mechanics**: A localized utility block used to initialize state flags (e.g., parsing a specific structural header like `RADIX(...)`). **This module can be completely removed from the pipeline** without breaking the system, provided that the target named groups (e.g., `<binary>`, `<octal>`) are captured by external application code, pre-parsers, or other distinct regex routines upstream.

4. **`outer_scope` (11)** 
   * **Role**: Application-Layer Bystander (Context Boundary).
   * **Mechanics**: A fully functional, independent application-layer regex pattern block sitting between the state compilation and the final execution switch. While mandatory for consuming data strings across multi-line physical distances, it remains completely neutral and agnostic to the SMR routing state machine.

---

## 🎛️ Architecture Pipeline Topology

```text
  [ External App Regex States ] ──┐
  [ Multiples Instructions     ] ──┼─► [ Populates Named Groups ]
  [ Local Header (Optional input) ] ──┘                │
                                                       ▼
                                              ┌─────────────────┐
                                              │ outer_scope(11) │ ───► Consumes application data gap
                                              └─────────────────┘
                                                       │
                                                       ▼
                                              ┌─────────────────┐
                                              │    stage (5)    │ ───► Compiles states into parallel table
                                              └─────────────────┘
                                                       │
                                                       ▼
                                              ┌─────────────────┐
                                              │    demux (5)    │ ───► Executes blind conditional loops
                                              └─────────────────┘
                                                       │
                                                       ▼
                                             [ Continuous N×N Outputs ]
```

---

## ⚡ The Flattened Parallel Truth Table Optimization

Legacy state-routing implementations introduce significant cognitive overhead and compiler engine stress due to deeply nested conditional stairs (`(?(<A>)(?(<B>)...|...)|...)`). 

The SMR architecture bypasses this structural fragility by flattening the **`stage`** module into a **linear matrix of parallel, atomic boolean gates**. By leveraging non-consuming lookahead assertions (`(?=)`) and zero-backtracking failure gates (`(?!)`), the pipeline executes pure logical **AND** and **NOT** masks natively inside the regex engine.

### 1. The Parallel AND Gate Grid (`c_integer_token_all`)
Asserts true *only* if every single named anchor is verified sequentially. If any flag fails, it hits the negative barrier instantly without backtracking.
```perl
'(?<c_integer_token_all>' .
    '(?(<binary>)(?=)|(?!))' .      # If binary active: PASS, else: ABORT
    '(?(<octal>)(?=)|(?!))' .       # If octal active: PASS, else: ABORT
    '(?(<decimal>)(?=)|(?!))' .     # If decimal active: PASS, else: ABORT
    '(?(<hexadecimal>)(?=)|(?!))' . # If hex active: PASS, else: ABORT
')?'
```

### 2. The Inversion Mask / Exclusive Gate (`c_integer_token_decimal_only`)
Combines logical **NOT** boundaries (`(?(<group>)(?!)|(?=))`) with a mandatory target assertion to isolate a singular operational state.
```perl
'(?<c_integer_token_decimal_only>' .
    '(?(<binary>)(?!)|(?=))' .      # NOT binary
    '(?(<octal>)(?!)|(?=))' .       # NOT octal
    '(?(<decimal>)(?=)|(?!))' .     # MUST BE decimal
    '(?(<hexadecimal>)(?!)|(?=))' . # NOT hexadecimal
')?'
```

---

## 📋 Compliance & Directory Rules

1. **Asset Prefix**: All files residing inside this directory tree must explicitly use the **`SMR-`** prefix token (e.g., `SMR-ISD_NxN-matrix-switch.pl`).
2. **Casing Grammar**: Maintain **UPPERCASE** characters for global system contexts, configurations, or mathematical operands, and **lowercase** characters for discrete structural modules, structural items, or processing operators.
3. **Complexity Benchmarks**: Performance metrics tracked in the adjacent `/benchmark` folder must strictly utilize variable tracking tokens declared in the universal **Formulaic RPN Notation (FRPN)** specification file.

