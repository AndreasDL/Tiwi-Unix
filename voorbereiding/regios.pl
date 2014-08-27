@ARGV = "regios.csv";
my %data;
while (<>){
  chomp;
  ($naam,$ouder,$pop,$opp) = split(';', $_);
  $data{$naam}= {"naam" => $naam,
		 "ouder" => $data{$ouder},
		 "pop" => $pop,
		 "opp" => $opp,
		 "kids" => [],
		 "niveau" => 0
		};
  push @{$data{$ouder}{"kids"}} , $data{$naam};#kinderen aanpassen
  $data{$name}{"niveau"} = $data{$ouder}{"niveau"} + 1;

  $refOuder = $data{$ouder};
  while($refOuder){
    $refOuder -> {"pop"} += $pop;
    $refOuder -> {"opp"} += $opp;

    $refOuder = $refOuder->{"ouder"};
  }
}
close($ARGV[0]);

#oef1
$ref = $data{"Belgie"};
while ( $ref->{"kids"} ){
  ($ref) = sort{ $b->{"pop"} <=> $a->{"pop"} } @{$ref->{"kids"}};
  print $ref->{"naam"} , "\n";
}
