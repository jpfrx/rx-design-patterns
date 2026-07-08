#!/usr/bin/env perl
use strict;
use warnings;

# ============================================================================
# ARCHITECTURE: State-Matrix Router (SMR) Input Stage Demux (ISD) NxN Matrix Switch
# CONCEPT:      jpfrx
# PROGRAMMING:  jpfrx
# STRUCTURE:    input (5) ➔ stage (5) ➔ demux (5)
# LICENSE: MIT License (c) 2026 jpfrx - Full terms in root LICENSE file
# ============================================================================

# PERL_RE_DEBUG_FLAGS=255 $HOME/perl5-debug/bin/perl -Drv  SMR-ISD-NxN-matrix-switch.pl 2>SMR-ISD-NxN-matrix-switch.Drv-outputstream.txt 

# ----------------------------------------------------------------------------
# MODULE 1: input (Upstream State Resolver / Anchor)
# Mechanics: Captures the legal radix contexts. Drops state anchors (\2, \3, \4, \5)
#            into regex engine memory based on literal number configurations.
# ----------------------------------------------------------------------------
my(${input})=
	'(?<radix>'.                                                     # \1
		'(?:'.
			'(?<![0-9])'.
			'(?<binary>(?<![0-9])2(?![0-9]))?'.                      # \2
			'(?(?<=[0-9])\s*+)'.
			'(?<octal>(?<![0-9])8(?![0-9]))?'.                       # \3
			'(?(?<=[0-9])\s*+)'.
			'(?<decimal>(?<![0-9])10(?![0-9]))?'.                    # \4
			'(?(?<=[0-9])\s*+)'.
			'(?<hexadecimal>(?<![0-9])16(?![0-9]))?'.                # \5
			'(?(?<=[0-9])\s*+)'.
		')'.
		'(?![0-9])'.
	')'
;

# ----------------------------------------------------------------------------
# MODULE 2: stage (Pipeline Staging Area / Step Sequencer)
# Mechanics: Evaluates the upstream anchors using a context-free truth table.
#            Sets macro-execution states without backtracking into the source string.
# ----------------------------------------------------------------------------
my(${stage})=
	'(?<c_programming>'.                                             # \6
		'(?<c_integer_token_all>'.                                   # \7
			'(?(<binary>)'.
				'(?(<octal>)'.
					'(?(<decimal>)'.
						'(?(<hexadecimal>)'.
							'(?=)'. # always true
							'|'.
							'(?!)'. # always false
						')'.
						'|'.
						'(?!)'. # always false
					')'.
					'|'.
					'(?!)'. # always false
				')'.
				'|'.
				'(?!)'. # always false
			')'.
		')?'.
		'(?<c_integer_token_decimal_only>'.                          # \8
			'(?(<binary>)'.
				'(?!)'. # always false
				'|'.
				'(?(<octal>)'.
					'(?!)'. # always false
					'|'.
					'(?(<decimal>)'.
						'(?(<hexadecimal>)'.
							'(?!)'. # always false
							'|'.
							'(?=)'. # always true
						')'.
						'|'.
						'(?!)'. # always false
					')'.
				')'.
			')'.
		')?'.
	')'
;


my(${stage})=
	'(?<c_programming>'.                                             # \6
		'(?<c_integer_token_all>'.                                   # \7
			'(?(<binary>)(?=)|(?!))'.
			'(?(<octal>)(?=)|(?!))'.
			'(?(<decimal>)(?=)|(?!))'.
			'(?(<hexadecimal>)(?=)|(?!))'.
		')?'.
		'(?<c_integer_token_decimal_only>'.                          # \8
			'(?(<binary>)(?!)|(?=))'.
			'(?(<octal>)(?!)|(?=))'.
			'(?(<decimal>)(?=)|(?!))'.
			'(?(<hexadecimal>)(?!)|(?=))'.
		')?'.
	')'
;



# ----------------------------------------------------------------------------
# MODULE 3: demux (Downstream Multi-Gate Switcher)
# Mechanics: A blind, mechanical conditional tree. It reads the states locked
#            by 'stage' and evaluates the trailing source strings instantly.
# ----------------------------------------------------------------------------
my(${demux})=
	'(?(<c_programming>)'.
		'(?(<c_integer_token_decimal_only>)'.
			'(?(<decimal>)(?<![0-9a-zA-Z_])(?:[1-9][0-9]*+|0)(?![0-9a-zA-Z_]))'.
		')'.
		'(?(<c_integer_token_all>)'.
			'(?(<binary>)(?<![0-9a-zA-Z_])0b[01]++(?![0-9a-zA-Z_]))?'.
			'(?(<octal>)(?<![0-9a-zA-Z_])0[0-9]++(?![0-9a-zA-Z_]))?'.
			'(?(<decimal>)(?<![0-9a-zA-Z_])(?:[1-9][0-9]*+|0)(?![0-9a-zA-Z_]))?'.
			'(?(<hexadecimal>)(?<![0-9a-zA-Z_])0x[0-9A-Fa-f]++(?![0-9a-zA-Z_]))?'.
		')'.
	')'
;

my(${outer_scope})='';

# ----------------------------------------------------------------------------
# CORE REGINST ASSEMBLY
# Integrates input, stage, and demux across a processing line layout.
# ----------------------------------------------------------------------------
my(${regex})=
	# Capture the multiple input
	'(?>RADIX\()'.${input}.'(?>\):\n++)'.

	${stage}.

	'(?:'.
		'\s*+'. # spaces
		'(?>[a-zA-Z_])[a-zA-Z0-9_]*+'. # variable name
		'\s*+'.
		'(?>=)'.
		'\s*+'.
		${demux}.
		'\s*+'.
		'(?>;)'.
		'\s*+'.
	')++'.
	'';


# ============================================================================
# DIAGNOSTIC TEST RUNS VIA PROBES
# ============================================================================

# PROBE 1: All-format declaration (Should completely match and parse)
my(${probe_1})='
[BEGIN]
RADIX(2 8 10 16):
valiable_binary=0b101;
valiable_binary=0b1;
valiable_decimal=910;
valiable_binary=0b010;
variable_octal=056;
variable_octal=016;
valiable_decimal=910;
valiable_hexadecimal=0x91A0;
valiable_hexadecimal=0xA210;
[END]
';

# PROBE 2: Strict decimal-only constraint (Must fail instantly on binary entry)
my(${probe_2})='
[BEGIN]
RADIX(10):
valiable_decimal=8;
valiable_decimal=123;
valiable_decimal=101;
valiable_decimal=1456451231;
valiable_decimal=654;
valiable_binary=0b101;
[END]
';

#print "INPUT: ${input}\n\n";
#print "STAGE: ${stage}\n\n";
#print "DEMUX: ${demux}\n\n";
#print "REGEX: ${regex}\n\n";


# Execution Cycles

${probe_1}=~s/${regex}/[GOTIT]\n/;


print "--- SMR ENGINE EVALUATION ENGINE ---\n";
print "PROBE_1 MATRIX OUTPUT:\n${probe_1}\n\n";


${probe_2}=~s/${regex}/[GOTIT]\n/;

print "PROBE_2 MATRIX OUTPUT:\n${probe_2}\n\n";

# Output

#--- SMR ENGINE EVALUATION ENGINE ---
#PROBE_1 MATRIX OUTPUT:
#
#[BEGIN]
#[GOTIT]
#[END]
#
#
#PROBE_2 MATRIX OUTPUT:
#
#[BEGIN]
#[GOTIT]
#valiable_binary=0b101;
#[END]


