use LWP::Simple;

#site in een variabale steken
my $url = "http://educatie-en-school.infonu.nl/wereldorientatie/29453-de-landen-van-de-wereld-en-algemene-informatie.html";
my $content = get $url;

#lijst van landen,hoofdstad maken
my @lijst = ($content =~ /<TR><TD>([^<]*)<\/TD><TD>[^<]*<\/TD><TD>[^<]*<\/TD><TD>[^<]*<\/TD><TD>[^<]*<\/TD><TD>([^<]*)<\/TD><TD>[^<]*<\/TD><\/TR>/gm);
for (0..@lijst/2){
  $lijst[$_] =~ s/\$euml\;/ë/gm;
  print $lijst[2*$_] , "\t" , $lijst[2*$_+1] , "\n";
}

#lijst opslaan

#in hash steken


#wat we doen
<TR><TD>Belgi&euml;</TD><TD>Europa</TD><TD>10,5 miljoen</TD><TD>30.158 km2</TD><TD>Constitutionele monarchie</TD><TD>Brussel</TD><TD>Euro</TD></TR>
=>
(Belgi$euml; => België),Brussel;
