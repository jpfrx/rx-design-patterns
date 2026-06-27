# Design Pattern: No-Pipe Multiplexer

An advanced execution layout bypassing the traditional token-matching alternation tree (`|`).

## 📐 Logic Layout

Instead of evaluating an entire tree of choices linked by pipes, this pattern aligns independent conditional blocks `(?(<name>)...)` with implicit empty fallbacks. The engine glides through unselected branches linearly without consuming backtracking cycles.

## 🛠️ Implementation

*   [multiplexer_perl.regex](./SHORT_multiplexer_perl.regex): Optimized implementation for Perl and PCRE2 engines.
*   [multiplexer_perl.regex](./SHORT_multiplexer-advancedgate_perl.regex): Optimized implementation for Perl and PCRE2 engines with else pattern.
*   [multiplexer_perl.regex](./multiplexer_perl.regex): Optimized implementation for Perl and PCRE2 engines capturing integer according to a radix.
