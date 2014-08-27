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

	my %aantal_klinkers_per_woord;
	my @geordend = sort
		{ ($aantal_klinkers_per_woord{$a} //= aantal_klinkers($a))
			<=> ($aantal_klinkers_per_woord{$b} //= aantal_klinkers($b)) }
		@woorden;

	# --- Einde ordenen ---

});

sub aantal_klinkers {
	my $woord = shift;
	my $klinkers = 0;
	$klinkers++ while $woord =~ /[aeiou]/ig;
	$klinkers;
}
