bedtools window -a repeats/Cimmitis_RS_Genome.repeats_updateid.bed -b expression/Cimmitis_genes_expression.bed -w 1000 > repeats/genes_1kb_repeats.txt
bedtools window -a repeats/Cimmitis_RS_Genome.repeats_updateid.bed -b expression/Cimmitis_genes_expression.bed -w 2500 > repeats/genes_2.5kb_repeats.txt
bedtools window -a repeats/Cimmitis_RS_Genome.repeats_updateid.bed -b expression/Cimmitis_genes_expression.bed -w 5000 > repeats/genes_5kb_repeats.txt

