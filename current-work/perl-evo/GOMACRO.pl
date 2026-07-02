#!/usr/bin/env perl
# ==============================================================================
# ORIGINAL CONCEPT & LOGIC: jpfr (jpfrx)
# LICENSE: MIT License (c) 2026 jpfrx - Full terms in the root LICENSE file
# NOTE: This example demonstrates the need to introduce a new regex node type 
#       (opcode), "GOMACRO", in Perl. This allows a GOSUB-like behavior that 
#       does not push captured states onto the regex engine stack during the jump.
#       For instance, the syntax for this call could be (?&{name}) or 
#       (?&{router}), as seen in this specific program.
#       This program is expected to fail because calling (?&router)
#       triggers node type "155:GOSUB1[-154:1] 'router'(158)", which accumulates 
#       captured states on the stack, preventing the multiplexer from verifying 
#       the router's captured groups.
#       Modifying Perl v5.44.0-RC1-10-g65b9c18886 to implement GOMACRO.
#       Objective: To parse multi-gigabyte streams using jpfrx multiplexers
#                  without the /g modifier, while keeping the 65534 stack limit
#                  manageable. More importantly, this enables redefining the
#                  router's configuration anywhere within the parsed string,
#                  allowing the multiplexer to react dynamically.
# ==============================================================================

use strict;
use warnings;


# PERL_RE_DEBUG_FLAGS=255 $HOME/perl5-debug/bin/perl -Dr GOMACRO.pl 2>GOMACRO-Dr.txt
# PERL_RE_DEBUG_FLAGS=255 $HOME/perl5-debug/bin/perl -Drv  GOMACRO.pl 2>GOMACRO-Drv.txt
# PERL_RE_DEBUG_FLAGS=255 $HOME/perl5-debug/bin/perl -Mre=Debug,COMPILE,EXTRA  GOMACRO.pl 2>GOMACRO-Debug-COMPILE-EXTRA.txt
# https://perldoc.perl.org/perldebguts



my(${test})="d3c2b1a0d3c2b1a0";

my(${router})=
	# router
	'(?<router>'. # GROUP1
		'(?<got_ab>'. # GROUP2
			'(?<![a-z])'.
			'(?<a>a)?'. # GROUP3
			'(?<b>b)?'. # GROUP4
			'(?![a-z])'.
		')?'.
		'(?<got_cd>'. # GROUP5
			'(?<![a-z])'.
			'(?<c>c)?'. # GROUP6
			'(?<d>d)?'. # GROUP7
			'(?![a-z])?'.
		')?'.
	')';
my(${multiplexer})=
	# multiplexer
	'(?(<got_ab>)'.
		'(?(<a>)0|'.     
		'(?(<b>)1))'.
		'|'.
		'(?(<got_cd>)'.
			'(?(<c>)2|'.     
			'(?(<d>)3))'.     
		')'.
	')';

my(${regex})=
		${router}.${multiplexer}.
		'(?&router)'.${multiplexer}.
		'(?&router)'.${multiplexer}.
		'(?&router)'.${multiplexer}.
		'(?&router)'.${multiplexer}.
		'(?&router)'.${multiplexer}.
		'(?&router)'.${multiplexer}.
		'(?&router)'.${multiplexer}
	;

${test}=~s/${regex}/[GOTIT]/;
print "OUTPUT:${test}\n";
print "REGEX:${regex}\n";

