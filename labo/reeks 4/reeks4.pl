%gewest=( "Antwerpen"      => "Vlaanderen", "Henegouwen"   => "Wallonie",
          "Limburg"        => "Vlaanderen", "Namen"        => "Wallonie",
          "Oost-Vlaanderen"=> "Vlaanderen", "Luik"         => "Wallonie",
          "Vlaams-Brabant" => "Vlaanderen", "Luxemburg"    => "Wallonie",
          "West-Vlaanderen"=> "Vlaanderen", "Waals-Brabant"=> "Wallonie");

%provincie=( "Aalst"       => "Oost-Vlaanderen", "Brugge"  => "West-Vlaanderen",
             "Dendermonde" => "Oost-Vlaanderen", "Ieper"   => "West-Vlaanderen",
             "Eeklo"       => "Oost-Vlaanderen", "Oostende"=> "West-Vlaanderen",
             "Oudenaarde"  => "Oost-Vlaanderen", "Kortrijk"=> "West-Vlaanderen",
             "Sint-Niklaas"=> "Oost-Vlaanderen", "Gent"    => "Oost-Vlaanderen",
             "Halle"       => "Vlaams-Brabant" , "Genk"    => "Limburg"        ,
             "Leuven"      => "Vlaams-Brabant" , "Hasselt" => "Limburg"        ,
             "Vilvoorde"   => "Vlaams-Brabant" , "Tongeren"=> "Limburg"        );

#hash 1 aanmaken
while( ($prov,$gew) = each %gewest){
  push @{$provincies{$gew}},$prov;
}

# print ? provincies{"Vlaanderen"}
#print @{$provincies{"Vlaanderen"}},"\n";

#hash 2 aanmaken
while( ($stad,$prov) = each %provincie){
  $gew = $gewest{$prov};
  push @{$steden{$gew}{$prov}}, $stad;
}

# print ? steden{"Vlaanderen"} ? {"West-Vlaanderen"} ?
#print @{$steden{"Vlaanderen"}{"West-Vlaanderen"}},"\n";

# print ? steden{"Vlaanderen"} ?
while ( ($prov,$stad) = each %{$steden{Vlaanderen}} ){
  print $prov , "\n";

  print "@{$steden{Vlaanderen}{$prov}}\n";
}
