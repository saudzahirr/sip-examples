#!/usr/bin/perl

use strict;
use warnings;
use Cwd;
use File::Spec;

$ENV{"CFLAGS"} = "-Wmaybe-uninitialized -Wdiscarded-qualifiers";

my $cmd = "sip-install --build-dir build/ --scripts-dir scripts/ --target-dir .";
print "$cmd\n";

my $root_dir = getcwd();

opendir(my $dh, $root_dir) or die "Cannot open directory $root_dir: $!";

my @dirs = grep { -d $_ && !/^\.\.?$/ } readdir($dh);
closedir($dh);

foreach my $dir (@dirs) {
    my $pyproject = File::Spec->catfile($dir, 'pyproject.toml');

    if (-e $pyproject) {
        chdir $dir or die "Cannot chdir to $dir: $!";
        system($cmd) == 0 or die "Failed to run: $cmd\nExit code: $?";
        chdir $root_dir or die "Cannot chdir back to root: $!";
    }
    else {
        print "Skipping $dir (no pyproject.toml found)\n";
    }
}
