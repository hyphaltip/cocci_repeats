tbl <- read.table("Cimmitis_RS_Genome.rpt.bedtools.tab",header=F,sep="\t")
len <- abs(tbl$V3-tbl$V2) / 1000
# hyphae numbers, lib ssize is 43.3M
tbl$V9 <- (tbl$V7 / len) * 43.3
# spherule numbers, lib size is 36.7
tbl$V10 <- (tbl$V8 / len) * 36.7
colnames(tbl) <- c("Scaffold","ChrStart","ChrEnd","TE_name_instance","RepeatMasker Score","Strand","Hyphae Expression", "Spherule Expression","Hyphae Expression Normalized","Spherule Expression Normalized")
write.csv(tbl,file="Cimmitis_RS_Genome.rpt.bedtools.csv")
