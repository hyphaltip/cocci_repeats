#!/usr/bin/perl

use strict;
use warnings;

if ( ! @ARGV ) {
    die("usage: perl make_gene_expr_bedtable.pl GENEGFF EXPRESSIONFILE\n");
}

my $gff = shift;
my $expr = shift;

open(my $fh => $gff) || die $!;
my %genes;
#GFF from FungiDB
while(<$fh>) {
    chomp;
    my @row = split(/\t/,$_);
    next unless $row[2] eq 'gene';
    my %group = map { split(/=/,$_) } split(/;/,pop @row);
    if( ! exists $group{ID} ) {
	warn("no gene ID for this GFF: @row\n");
	next;
    }
    $genes{$group{ID}} = { Description => $group{description},
			   ID    => $group{ID},
			   chr   => $row[0],
			   start => $row[3],
			   end   => $row[4],
			   strand=> $row[6]};
			      
}
open($fh => $expr) || die $!;
my $hdr = <$fh>;
while(<$fh>) {
    my ($id,$hyphae,$spherule) = split;
    if( $genes{$id} ) {
	$genes{$id}->{Exp} = [ $hyphae, $spherule ];
    }
}

for my $gene ( sort keys %genes ) {
    print join("\t", (map { $genes{$gene}->{$_} } qw(chr start end ID strand)),
	       @{$genes{$gene}->{Exp} || [0,0] }), "\n";
}
