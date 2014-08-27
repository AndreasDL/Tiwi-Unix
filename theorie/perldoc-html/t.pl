undef $/;
$^I=".bak";
$a=<>;

while ($a=~m/(.*?)(href="[^"#]*?#[^"#]*?")/gcs) {
  $x=$1;
  $y=$2;
  $y=~s/%/0x/g;
  $b.=$x.$y;
}
$a=~m/(.*)/gs;
$b.=$1;

while ($b=~m/(.*?)(name="[^"]*?")/gcs) {
  $x=$1;
  $y=$2;
  $y=~s/%/0x/g;
  $c.=$x.$y;
}
$b=~m/(.*)/gs;
$c.=$1;

print $c;
