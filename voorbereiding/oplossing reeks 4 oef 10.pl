@ARGV = "regios.csv";
while (<>) {
    chomp;
    ( $regio, $ouder, $population, $area ) = split ";";
    $hash{$regio} = { regio      => $regio,
                      ouder      => $hash{$ouder},
                      kinderen   => [],
                      number     => 0,
                      niveau     => 0,
                      population => $population,
                      area       => $area };
    push @{ $hash{$ouder}->{kinderen} }, $hash{$regio};
    $refouder = $hash{$regio}->{ouder};
    $hash{$regio}{niveau}=$refouder->{niveau}+1;
    next unless $population;

    while ($refouder) {
        $refouder->{number}     += 1;
        $refouder->{population} += $population;
        $refouder->{area}       += $area;
        $refouder = $refouder->{ouder};
    }
}

$refknoop = $hash{Belgie}; # initialisatie voor controle 1
@refqueue = ($refknoop);   # initialisatie voor controle 2
%hash = ();                # hash niet meer nodig !

# controle 1: hierarchielijn vanaf Belgie, met telkens kind met grootste population

while ($refknoop) {
    print "knoop:      ", $refknoop->{regio}, "\n";
    print "kinderen:   ", join( " ", map { $_->{regio} }
                                     sort { $a->{regio} cmp $b->{regio} }
                                     @{ $refknoop->{kinderen} } ), "\n";
    print "#gemeenten: ", $refknoop->{number},     "\n";
    print "population: ", $refknoop->{population}, "\n";
    print "area:       ", $refknoop->{area},       "\n";
    print "\n";
    ($refknoop) = sort { $b->{population} <=> $a->{population} } @{ $refknoop->{kinderen} };
}

# controle 2: volledige hierarchie vanaf Belgie

while ($refknoop=shift @refqueue) {
    printf "%-41s %8d %6d\n",(("    "x($refknoop->{niveau}-1)).$refknoop->{regio}),$refknoop->{population},$refknoop->{area};
    unshift @refqueue,sort { $b->{population} <=> $a->{population} } @{ $refknoop->{kinderen} };
}
Here's part of the family tree from the Bible:

%father = ( 'Cain'      => 'Adam',
            'Abel'      => 'Adam',
            'Seth'      => 'Adam',
            'Enoch'     => 'Cain',
            'Irad'      => 'Enoch',
            'Mehujael'  => 'Irad',
            'Methusael' => 'Mehujael',
            'Lamech'    => 'Methusael',
            'Jabal'     => 'Lamech',
            'Jubal'     => 'Lamech',
            'Tubalcain' => 'Lamech',
            'Enos'      => 'Seth' );
This lets us, for instance, easily trace a person's lineage:

while (<>) {
    chomp;
    do {
        print "$_ ";        # print the current name
        $_ = $father{$_};   # set $_ to $_'s father
    } while defined;        # until we run out of fathers
    print "\n";
}
We can already ask questions like "Who begat Seth?" by checking the %father hash. By inverting this hash, we invert the relationship. This lets us use reeks 2 vraag 35 to answer questions like "Whom did Lamech beget?"

while ( ($k,$v) = each %father ) {
    push( @{ $children{$v} }, $k );
}

$" = ', ';                  # separate output with commas
while (<>) {
    chomp;
    if ($children{$_}) {
        @children = @{$children{$_}};
    } else {
        @children = "nobody";
    }
    print "$_ begat @children.\n";
}
Hashes can also represent relationships such as the C language #include s. A includes B if A contains #include B. This code builds the hash (it doesn't look for files in /usr/include as it should, but that's a minor change):

foreach $file (@ARGV) {
    local *FH;
    unless (open(FH, " < $file")) {
        warn "Couldn't read $file: $!; skipping.\n";
        next;
    }

    while (<FH>) {
        next unless /^\s*#\s*include\s*<([^>]+)>/;
        push(@{$includes{$1}}, $file);
    }
    close FH;
}
This shows which files with include statements are not included in other files:

@include_free = ( );                 # list of files that don't include others
@uniq{map { @$_ } values %includes} = undef;
foreach $file (sort keys %uniq) {
        push( @include_free , $file ) unless $includes{$file};
}
The values of %includes are anonymous arrays because a single file can (and often does) include more than one other file. We use map to build up a big list of the included files and remove duplicates using a hash.

Referenties

reeks 2 vraag 21; the more complex data structures in vraag 12 and vraag 13