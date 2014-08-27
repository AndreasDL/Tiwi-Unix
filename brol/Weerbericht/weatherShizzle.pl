use LWP::Simple;
#my $content = get "http://dutch.wunderground.com/global/stations/06428.html";
my $content = get "http://dutch.wunderground.com/global/stations/06428.html?MR=1";

#opslaan in tekst bestand voor debugging
open (OUTPUT, '>weersite.txt');
print OUTPUT $content;
close (OUTPUT);

#eruit filteren
@gegevens = ($content =~ /<div id="fct_day[^\"]*" class="[^>]*>
		<div class="fctDayDate">([^<]*)<\/div>
		<[^>]*>
		<div class="[^"]*"><a href="" class=[^>]*><img src="[^"]*" alt="([^"]*)" [^>]*\/><\/a><\/div>
		<[^>]*>
		<span class="b">([^<]*)<\/span> | 14 &deg;C
		<\/div>"/gm);

#UitSchrijven + opslaan
open (WEB, '>weerbericht.txt');

for ($i = 0;$i<7;$i++){#dagen aflopen
  print $gegevens[3*$i], "\nTemperatuur: ", $gegevens[3*$i+2] , "\nNeerslag: " , $gegevens[3*$i+1], "\n\n";
  print WEB $gegevens[3*$i], "\nTemperatuur: ", $gegevens[3*$i+2] , "\nNeerslag: " , $gegevens[3*$i+1], "\n\n";
}
close (WEB);
