#broncode inlezen van source.txt
open(INPUT,"<source.txt");
while ($line = <INPUT>){
  if ($line =~ /.*(<i style="background-image:[^>]*>).*/gm){
    print $1 , "\n";
  }
  #print $line;
}
close (INPUT);

use LWP::Simple;
getstore("https://fbcdn-sphotos-a-a.akamaihd.net/hphotos-ak-ash3/p206x206/578404_10151941037335752_2061252463_n.jpg","test.jpg");


<i style="background-image: url(https://fbcdn-sphotos-a-a.akamaihd.net/hphotos-ak-ash3/p206x206/578404_10151941037335752_2061252463_n.jpg);" class="uiMediaThumbImg"></i>
=>
https://fbcdn-sphotos-a-a.akamaihd.net/hphotos-ak-ash3/578404_10151941037335752_2061252463_n.jpg

<i style="background-image: url(https://fbcdn-sphotos-f-a.akamaihd.net/hphotos-ak-ash3/p206x206/644761_4574489639643_646722846_n.jpg);" class="uiMediaThumbImg"></i>
=>
https://fbcdn-sphotos-f-a.akamaihd.net/hphotos-ak-ash3/644761_4574489639643_646722846_n.jpg
