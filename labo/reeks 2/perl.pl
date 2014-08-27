#oef 1
$x=3;
$x ||= "5";#als x nog niet gedefinieerd is steek er 5 in
#print "$x\n";

#oef 2
$x = 1;
$y = 2;
($x,$y)=($y,$x);
#print "$x $y\n";
#t[0..2] => een slice van een array van element 0 tot 2

#oef 3
$x = ord a;
#print $x;

#oef 4
$x="ik ben cool";
#print scalar reverse $x;
#print join " ", reverse split " ",$x;
#oef 5
$x = "Een Willekeurige Zin";
#print uc $x;
#print lc $x;
#print "\U$x";

++#oef 6
#print sprintf("%.2f",rand);

#oef 7
$x=rand;
$y=rand;
#print "$x\n$y";
if (sprintf("%.2f",$x) eq sprintf("%.2f",$y)){
#  print "true";
}else{
#  print "false";
}

#oef 8
@x = 4..18;
#print @x;

#oef 9
$x="";
for ($i = 0;$i < 10; $i++){
  $x = join $x,chr(97+ int(rand(26)));
  #print $x;
}

#oef 10
srand 5;
for ($i=0;$i<10;$i++){
 #print rand,"\n";
}

#oef 11
print oct "0b10110";
print "\n";
print oct "010";
print "\n";
print oct "0x55";

#oef 12
#($a,undef,$c)=func();
#($a,$c)=func()[0,2];

#oef 13
($d,$m,$y)=(localtime)[3,4,5];
$m+=1;
#print "$d-$m-$y";

#oef 14
$x=time();
print "$x\n";
$x+=500;
print scalar localtime($x),"\n";

#oef 15
#gezever

#oef 16
@x = ("hallo","ik","ben","andreas","de","lille");
@y = qw(hallo ik ben andreas de lille);
@z = ();
open(FH,"<myinfo.txt") or die "coundn''t open this shit $!";
while (<FH>){
    chomp;
    push(@z,$_);
}
close(FH);

#print "@x\n";
#print "@y\n";
#print "@z";

#oef 17
@x = qw(ik ben andreas de lille ben super cool);
#print @x[0]," ",x[1..4],",",@x[5..7],"\n";
#you get the point

#oef 18
@x = qw(a b c d e f g h i j k l m n o p q r s t u v w x y z);
print "@x\n";
$#x = 5;
print "@x\n";

#oef 19
foreach $a(@x){
    print "$a\n";
}

#oef 20
@x = qw(a b c d e f g h i j k l m n o p q r s t u v w x y z);
@y;
for (0..10){
    push(@y,@x[$_]);
}
print "@y\n";

#oef 21
@x = qw(a b c d e f g h i j k l m n o p q r s t u v w x y z);
@y = reverse @x;
print "@x\n@y\n";

#oef 22
@x = qw(a b c d e f g h i j k l m n o p q r s t u v w x y z);
@y = splice @x,10,15;
print "@y\n";

#oef 23
@x = qw(a b c d e f g h i j k l m n o p q r s t u v w x y z);
for ($i = 0 ; $i < 104 ; $i++){
    print "@x[$i%($#x+1)]\n";
}

#oef 24
@x = qw(a b c d e f g h i j k l m n o p q r s t u v w x y z);
use List::Util 'first';
$y = first {/a/} @x;
use List::MoreUtils 'first_index';
$z = first_index{/a/} @x;
print "$y\n$z";
#of met while lus of grep en enkel eerste afdrukken

#oef 25
@x = qw(red green blue yellow orange purple black white silver gold);
@y = grep {/.*e.*/} @x;
print "@y\n";


#oef 26
@x = qw(1 2 3 2 5 8 7 4 3 1 8 5 12 3 6 8 4 2 2 3 56 23 4 5 6 7 8 9 );
@y = sort {$a <=> $b} @x;
print "@y\n";

#oef 27
#gebruik maken van hash => enkel de indexen die je nodig hebt opslaan als sleutel :)

#oef 28
@x = qw(1 2 3 2 5 8 7 4 3 1 8 5 12 3 6 8 4 2 2 3 56 23 4 5 6 7 8 9 );
%hash = map{$_,1} @x;
@y = sort{$a <=> $b}keys %hash;
print "@y\n";

#oef 29 elementen moeten in elke rij uniek zijn
@x = qw(aarde maan mars jupiter venus zon);
@y = qw(aarde mars venus hallo andreas);
#in map steken
%hx = map{$_,undef} @x;
%hy = map{$_,undef} @y;
#shit uitsmijten
foreach $s (@x){
    delete $hy{$s};
}
foreach $s (@y){
    delete $hx{$s};
}
#shit afdrukken
print join("\n" , keys %hy), "\n", join("\n", keys %hx);

#oef 30
@x= qw(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20);
@y= qw(0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30);
#intersect=> geen dubbels in elke lijst :)
print "intersectie lijst, in beide lijsten\n";
%i = map{$_,"1"} @x;#nul gebruiken mag niet want dan is ++ overal 1 :p
foreach $s(@y){
  $i{$s}++;
}
foreach $s(sort keys %i){
  if ($i{$s}>1){
    print "$s\n";
  }
}

#unie
print "unie lijst, de 2 lijsten tesamen\n";
%u = map{$_,undef} @x;
foreach $s (@y){
  $u{$s}=undef;
}
print join ("\n" , keys %u);
#verschil
print "verschil lijsten , komt voor in een lijst, niet in de andere\n";
#in map steken
%hx = map{$_,undef} @x;
%hy = map{$_,undef} @y;
#shit uitsmijten
foreach $s (@x){
    delete $hy{$s};
}
foreach $s (@y){
    delete $hx{$s};
}
#shit afdrukken
print join("\n" , keys %hy), "\n", join("\n", keys %hx);

#oef 31
exists $books{"dino"};
$books{"dino"}; #=> boolean

#oef 32
delete $books{"dino"};
#geen idee hoe dit moet voor meerdere elementen

#oef 33
foreach $s(keys %books){}
foreach $s(sort keys %books){}

#oef 34
foreach $key (sort keys %hash) {
$value = $hash{$key};
print "$key => $value\n";
# Or, we could have avoided the extra $value variable:
# print "$key => $hash{$key}\n";
}

#oef 35
%a = reverse %b;

#oef 36
foreach $s (sort keys %hash){
  #doe stuff $s => key $hash{$s} => value
}
%hashreverse = reverse %hash;
foreach $s (sort keys %hashreverse){
  #see above
}

#oef 37
%hash1en2 = (%hash1,%hash2);

#of met lus
while( ($k,$v) = each(%hash1) ){
  $hash1en2{$k} = $v;
}
while( ($k,$v) = each(%hash2) ){
  $hash1en2{$k} = $v;
}


#oef 38
#komen in beide hashes voor
foreach (keys %hash1){
  push(@common ; $_) if exists $hash2{$_};
}

#komt maar in 1 van beide voor
foreach (keys %hash1){
  push (@onlyone ; $_) unless exists $hash2{$_};
}
foreach (keys %hash2){
  push (@onlyone; $_) unless exists $hash2{$_};
}

#oef 39
%count;
foreach $element(@array){
  $count{$element}++;
}

#oef 40 zie onderaan => __DATA__ onderaan toevoegen en dan while(<DATA>){}

#oef 41 zie onderaan => @argv opvullen met argumenten

#oef 42 Read from the original file, write changes to a temporary file, and then rename the temporary back to the original:
open(OLD, "<", $old)        or die "can't open $old: $!";
open(NEW, ">", $new)        or die "can't open $new: $!";
while (<OLD>) {
    # change $_, then...
    print NEW $_            or die "can't write $new: $!";
}
close(OLD)                  or die "can't close $old: $!";
close(NEW)                  or die "can't close $new: $!";
rename($old, "$old.orig")   or die "can't rename $old to $old.orig: $!";
rename($new, $old)          or die "can't rename $new to $old: $!";

#oef 43
#i => zorgt voor een backup waar je op werkt

#oef 44
#Many systems have a wc program to count lines in a file:

$count = `wc -l < $file`;
die "wc failed: $?" if $?;
chomp($count);
#You could also open the file and read line-by-line until the end, counting lines as you go:

open(FILE, "<", $file) or die "can't open $file: $!";
$count++ while <FILE>;
#$count now holds the number of lines read

#oef 45
@lines = <FILE>;
while ($line = pop @lines) {
    # do something with $line
}

@lines = reverse <FILE>;
foreach $line (@lines) {
    # do something with $line
}

#oef 46
#The simplest solution is to read the lines until you get to the one you want:

# looking for line number $DESIRED_LINE_NUMBER
$. = 0;
do { $LINE = <HANDLE> } until $. == $DESIRED_LINE_NUMBER || eof;
#If you are going to be doing this a lot and the file fits into memory, read the file into an array:

@lines = <HANDLE>;
$LINE = $lines[$DESIRED_LINE_NUMBER];

#oef 47
srand;
rand($.) < 1 && ($line = $_) while <>;
# $line is the random line
























#varia
#@ARGV = glob("[PATH]")
#glob + *.extensie => alle bestanden in die map met die extensie
# => tabel die je kan opvullen met de argumenten die je normaal meegeeft via cmd 
#kan je meer dan een keer doen in een programma
while(<>){
    print $_;#=      >lijn afdrukken
    print $argv($.); #=> bestandsnaam van het bestand dat op dit ogenblik gebruikt wordt $. => lijnnummer,maar blijft doortellen tenzij je het bestand sluit
    if(eof(ARGV)){#=> argv is default argument dus mag eigenlijk ook eof zijn (zonder haken)
	close{ARGV}; #                        ar+


gv =>filehandler 
    }
    close(ARGV) if eof;#fancy way to do it
}

while(<>){
  chomp;#=> werkt op de default var (_) en doet de return tekens weg
  #print$_,"\n";#=> geen scheidingsteken nodig want zit al in de data
}
$/ => aantal lijnen per keer inlezen met <> als $/ undef is(undef($/)) dan krijg je heel het bestand in gelezen
$/ = " " => een paragraaf inlezen 
__DATA__
aap
noot
mier
mus
maan
roos
vis

+++
