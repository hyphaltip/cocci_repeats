tbl <- read.table("Cimmitis_RS_Genome.rpt.bedtools.tab",header=F,sep="\t")
len <- abs(tbl$V3-tbl$V2) 
# hyphae numbers, lib ssize is 43.3M
tbl[,9] <- (10^9 * tbl$V7) / (43323438 * len)
# spherule numbers, lib size is 36.7M
tbl[,10] <- (10^9 * tbl$V8) / (36703973 * len)
# feature length
tbl[,11] <- len
summary(tbl)
tbl<-subset(tbl,tbl$V11 > 10)
colnames(tbl) <- c("Scaffold","ChrStart","ChrEnd","TE_name_instance","RepeatMasker Score","Strand","Hyphae Expression", "Spherule Expression","Hyphae Expression (FPKM)","Spherule Expression (FPKM)","Feature Length (bp)")
tbl <- tbl[order(-tbl[,10],-tbl[,9]),]
write.csv(tbl,file="Cimmitis_RS_Genome.rpt.bedtools.csv",row.names=FALSE)
