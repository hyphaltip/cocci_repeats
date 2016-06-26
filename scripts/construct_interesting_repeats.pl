use strict;
use warnings;

my $file = shift;
open(my $fh => "gunzip -c $file |" ) || die "$file: $!";
my $base = $file;
$base =~ s/\.gff\.gz//;   
open(my $ofh => ">$base.simple.gff") || die $!;
open(my $ofh2 => ">$base.simple.bed") || die $!;
my %uniq;
while(<$fh>) {
    next if /^\#/;
    chomp;
    my @cols = split(/\t/,$_,9);
    for my $tg ( split(/;/,pop @cols) ) {
	my ($tag,$val,@extra) = split(/\s+/,$tg);
	next if $val =~ /Motif:\([ACGT]+\)n/;
	if ($tag eq 'Target') {
	    $val =~ s/Motif://;
	    $val =~ s/\"//g;
	    $val =~ s/Supercontig_3\./SC_/;
	    my $uniq_val = sprintf("%s.%d",$val,++$uniq{$val});
	    print $ofh2 join("\t", $cols[0],$cols[3],$cols[4],
			     $uniq_val,
			     $cols[5],$cols[6]),"\n";
	    print $ofh join("\t",@cols, sprintf("Target=%s",$uniq_val)),"\n";
	}
    }
}
