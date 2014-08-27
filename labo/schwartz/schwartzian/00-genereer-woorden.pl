#!/usr/bin/perl

use strict;
use warnings;

my $aantal_woorden = 500_000;
my $min_lengte = 8;
my $max_lengte = 32;
my @alfabet = ('A'..'Z', 'a'..'z');

open my $fh, '>', 'woorden.txt' or die "woorden.txt: $!";
for (1..$aantal_woorden) {
	my $karakters = $min_lengte + int rand($max_lengte - $min_lengte + 1);
	my $woord = '';
	$woord .= $alfabet[int rand @alfabet] for (1..$karakters);
	print $fh "$woord$/";
}
close $fh;
