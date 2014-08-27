#oef 10
@ARGV = "regios.csv";
#open file, "regios.csv" or die "mislukt";
#%regios;
while(<>){
chomp;
($naam, $ouder, $pop, $area) = split /;/, $_;
	#$regios{$naam} = {} unless $regios{$naam}; #anonieme hashmap
$regios{$naam} = { Naam => $naam,
Ouder => $regios{$ouder},
Kinderen => [],
Nummer => 0,
Niveau => 0,
Pop => $pop,
Area => $area };
push @{$regios{$ouder}->{Kinderen}}, $regios{$naam};
$refouder = $regios{$ouder};
$regios{$naam}{Niveau}=$refouder->{Niveau}+1;
next unless $population;
while($refouder){
$refouder->{Number} += 1;
$refouder->{Pop} += $pop;
$refouder->{Area} += $area;
$refouder = $refouder->{Ouder};
}
}
$refknoop = $regios{Belgie}; # initialisatie voor controle 1
@refqueue = ($refknoop); # initialisatie voor controle 2
%regios = (); # hash niet meer nodig !
while ($refknoop=shift @refqueue) {
printf "%-41s %8d %6d\n",((" "x($refknoop->{Niveau}-1)).$refknoop->{Naam}),$refknoop->{Pop},$refknoop->{Area};
unshift @refqueue,sort { $b->{Pop} <=> $a->{Pop} } @{ $refknoop->{Kinderen} };
}
