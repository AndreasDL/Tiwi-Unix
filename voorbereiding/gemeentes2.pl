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

# print ? provincies{"Vlaanderen"}
my %h1;
while (($k,$v) = each %gewest){
 push @{$h1{$v}} , $k;
}

# print ? steden{"Vlaanderen"} ? {"West-Vlaanderen"} ?
my %h2;
while ( ($k,$v) = each %provincie){
  push @{$h2{$v}} , $k;
}

# print ? steden{"Vlaanderen"} ?
my %h3;
while ( ($k,$v) = each %provincie){
  push @{$h3{$gewest{$v}}} , $k;
}

while( ($k,$v) = each %h3){
  print $k , @{$v} , "\n";
}
