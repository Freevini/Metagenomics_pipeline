use strict;
use warnings;

my ($def, $seq);

while (<>) {
    if (/^DEFINITION\s+(\S+.*)$/) {   
	$def = $1;
    }
    if (/^ORIGIN/) {   
	while (<>) {
	    chomp;
	    last if /^\/\//;
	    s/^\s+?\d+\s|^\d+\s//;
	    s/\s//g;
	    $seq .= $_;
	}
    }
}

die "\nERROR: No sequence in this record." unless $seq;
$seq =~ s/(.{60})/$1\n/gs;
print join "\n", ">".$def, "$seq\n";
