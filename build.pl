#!/bin/perl

use strict;
use warnings;

$ENV{"CFLAGS"} = "-Wmaybe-uninitialized -Wdiscarded-qualifiers";

my $cmd = "sip-install --build-dir build/ --scripts-dir scripts/ --target-dir .";
print($cmd);
system($cmd) == 0 or die "Failed to run: $cmd\nExit code: $?";
