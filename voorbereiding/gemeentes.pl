open(INPUT,"<regios.csv");
my %data;
while ($line = <INPUT>){
  $line =~ /^([^;]*);([^;]*);([0-9]*);(.*)$/;#info uit een lijn

  #info => hash
#  if ($3 eq ""){$a = 0;}else{$a = $3;}
#  if ($4 eq ""){$b = 0;}else{$b = $4;}
  $data{$1} = { "naam" => $1,
		"ouder" => $data{$2},
		"population" => $3,
		"area" => $4,
		"kinderen" => []
		};
  push @{$data{$2} -> {"kinderen"}} , $data{$1};#kinderen aanpassen

  #population en area aanpassen
  $huidig = $2;
  while (exists $data{$huidig}{"ouder"}){
     ${$data{$huidig}{"population"}} += $3;
     ${$data{$huidig}{"area"}} += $4;
     $huidig = $data{$huidig}{"ouder"}{"naam"};
     print $huidig , "\n";#dit werkt :)
  }

  #afdrukken om te zien of het werkt
  print $line;
  print "naam: " , ${$data{$1}}{"naam"} , "\n";
  print "ouder: " ,${$data{$1}{"ouder"}}{"naam"}, "\n";
  print "population: " ,${$data{$1}}{"population"} , "\n";
  print "area: " , ${$data{$1}}{"area"} , "\n\n";
}
close(INPUT);

print "aantal kinderen van belgie: ";
for ($i = 0 ; $i < @{$data{"Belgie"}{"kinderen"}} ; $i++){
    print $i , " ", ${$data{"Belgie"}{"kinderen"}[$i]}{"naam"} , "\n";
}

#hierarchie
