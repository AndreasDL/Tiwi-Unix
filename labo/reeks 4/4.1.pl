@mat = ([1,2,3],[4,5,6]);
@tapijt = ([1,2],[3,4],[5,6]);

for ($i = 0 ; $i < 2 ; $i++){
  for($j = 0 ; $j < 2 ; $j++){
    $som =0;
    for($k = 0 ; $k < 3; $k++){
      $som += $mat[$i][$k] * $tapijt[$k][$i];
#      print "som" , $k , " " , $som , "\n" , $mat[$i][$k] , "\t" , $tapijt[$k][$i];
    }
    @{$result[$i]}[$j] = $som;
  }
}

print @{$result[0]}, "\n" , @{$result[1]} , "\n";

for ($i = 0 ; $i < 2 ; $i++){
  for($j=0; $j < 2 ; $j++){
    print $result[$i][$j] , "\t";
  }
  print "\n";
}



#oef 2

@array =(0,1,2,3,4,5,6,7,8,9);
$a = \@array;
#print @{$a}[5..9,0];
#print ${$a}[6];
print scalar @{$a};
