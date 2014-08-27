#oef 1
$datum = "11/10/2012";
if ($datum=~ /(\d\d)\/(\d\d)\/(\d\d\d\d)/){
  print "de dag is ",$1," de maand is ",$2," het jaar is ",$3;
}
print "stuff done";

#oef 2
$_ = "hallo ik ben andreas de lille";
while(/(.*)\ /){
  print join $1, "\n";
}

#oef 3
$t = "    whitespace moet weg    ";
$t =~ s/^\s+|\s+$//g;
print $t , ':';

#oef 4
$n ="123456";
$g ="-14578";
$d = "547.256";
if($n =~ /^\d*$/){
  print "natuurlijk getal";
}
if($g =~ /^[-]?[0-9]*$/){
 print "geheel getal";
}
if($d =~ /^[-]?\d+[.]\d*$/){
  print "decimaal getal";
}

#oef 5
$tekst = "andreas de lille is ::";
$tekst =~ s/([^:]*)[:]{2}/$1geweldig/;
print $tekst;

#oef 6
$tekst = "dedfdqeafdjqdmflk jqmlkjgmtgibjkgvjqmdkfjvq mdfjmedijfmck abcdefghijklmnopqrstuvwxyz";
@letters = sort{$a cmp $b} split('',$tekst);
%hash;
foreach $element(@letters){
  $hash{$element} = 1;
}
print sort keys %hash;
#letters die meer dan een keer voor komen elimineren => via map

print @letters;

