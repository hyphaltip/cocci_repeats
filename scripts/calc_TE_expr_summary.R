genesTE5kb <- read.table("repeats/genes_5kb_repeats.txt",header=F)
genesTE25kb <- read.table("repeats/genes_2.5kb_repeats.txt",header=F)
genesTE1kb <- read.table("repeats/genes_1kb_repeats.txt",header=F)
allgenes <- read.table("expression/Cimmitis_genes_expression.bed",header=F)

TEall <- c(length(allgenes$V1),mean(allgenes$V6),
      sd(allgenes$V6),mean(allgenes$V7),sd(allgenes$V7))

TE1 <- c(length(genesTE1kb$V1),mean(genesTE1kb$V12),
    sd(genesTE1kb$V12),mean(genesTE1kb$V13),sd(genesTE1kb$V13))


TE2 <- c(length(genesTE25kb$V1),mean(genesTE25kb$V12),
    sd(genesTE25kb$V12),mean(genesTE25kb$V13),sd(genesTE25kb$V13))

TE5 <- c(length(genesTE5kb$V1),
    mean(genesTE5kb$V12),sd(genesTE5kb$V12),
	mean(genesTE5kb$V13),sd(genesTE5kb$V13))

expTable = data.frame(TEall,TE1,TE2,TE5)

rownames(expTable) <- c("Gene count",  "Hyphae mean Expr", "Hyphae SD Expr",
		   "Spherule mean Expr", "Spherule SD Expr")
colnames(expTable) <- c("All Genes", "Genes w/ TEs < 1kb",
		   "Genes w/ TEs < 2.5kb", "Genes w/ TEs < 5kb")
write.csv(t(expTable),file="gene_expression_by_TE_location.csv")
