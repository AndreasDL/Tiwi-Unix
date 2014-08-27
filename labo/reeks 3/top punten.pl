#top 5 maken van punten lijst

open(lijst,"<lijst.csv");
#skip eerste 8 rijen
for (0..7){
  <lijst>;
}
#nuttige lijnen overhouden
%punten;
while(<lijst>){
  chomp($_);
  @lijn = split(';',$_);
  $punten{$lijn[0]}=$lijn[16];
}

#sorteren op punten
@result = sort{$punten{$b} <=> $punten{$a}}keys %punten;
print "@result[0]  $punten{@result[0]}\n@result[1]  $punten{@result[1]}\n@result[2]  $punten{@result[2]}\n";
