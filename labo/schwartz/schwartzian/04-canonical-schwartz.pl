#!/usr/bin/perl

use strict;
use warnings;

use Benchmark qw(timethis);

open my $fh, '<', 'woorden.txt' or die "woorden.txt: $!";
my @woorden = <$fh>;
close $fh;
chomp @woorden;

timethis(5, sub {

	# --- Begin ordenen ---

	my @geordend = map { $_->[0] }
		sort { $a->[1] <=> $b->[1] }
		map { [ $_, aantal_klinkers($_) ] }
			@woorden;

	# --- Einde ordenen ---

});

sub aantal_klinkers {
	my $woord = shift;
	my $klinkers = 0;
	$klinkers++ while $woord =~ /[aeiou]/ig;
	$klinkers;
}
