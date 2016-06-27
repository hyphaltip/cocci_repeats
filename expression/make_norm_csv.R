tbl <- read.table("Cimmitis_RS_Genome.rpt.bedtools.tab",header=F,sep="\t")
len <- abs(tbl$V3-tbl$V2) 
# hyphae numbers, lib ssize is 43.3M
tbl$V9 <- (10^9 * tbl$V7) / (43323438 * len) 
# spherule numbers, lib size is 36.7M
tbl$V10 <- (10^9 * tbl$V8) / (36703973 * len)
# feature length
tbl$V11 <- len
tbl<-subset(tbl,tbl$V11 > 10)
colnames(tbl) <- c("Scaffold","ChrStart","ChrEnd","TE_name_instance","RepeatMasker Score","Strand","Hyphae Expression", "Spherule Expression","Hyphae Expression (FPKM)","Spherule Expression (FPKM)","Feature Length (bp)")

write.csv(tbl,file="Cimmitis_RS_Genome.rpt.bedtools.csv")
