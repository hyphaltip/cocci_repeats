module load bedtools
bedtools multicov -D -bams hyphae.bam spherules.bam -bed Cimmitis_RS_Genome.fasta.out.simple.bed > Cimmitis_RS_Genome.rpt.bedtools.mm.out

