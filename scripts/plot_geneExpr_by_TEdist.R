
library(ggplot2)

geneTEDist<- read.table("Genes_expression_closest_TE.tab",header=F)

dat<- data.frame(geneTEDist$V1,geneTEDist$V4,geneTEDist$V6,geneTEDist$V7,
		geneTEDist$V11,geneTEDist$V12,geneTEDist$V14)
colnames(dat) <- c("Chr","Gene","HyphalExpr","SpheruleExpr",
		     "Repeat","RepeatExpr","Distance")
pdf("Expr_vs_TEdist.pdf")
dat<-subset(dat,dat$HyphalExpr < 100)
dat<-subset(dat,dat$SpheruleExpr < 100)
ggplot(dat,aes(y=HyphalExpr,x=Distance))+geom_point(shape=1)

ggplot(dat,aes(y=SpheruleExpr,x=Distance))+geom_point(shape=1)


dat<-subset(dat,dat$Distance < 2500)
ggplot(dat,aes(y=HyphalExpr,x=Distance))+geom_point(shape=1)
ggplot(dat,aes(y=SpheruleExpr,x=Distance))+geom_point(shape=1)


dat<-subset(dat,dat$Distance < 2500)
ggplot(dat,aes(y=HyphalExpr,x=Distance))+geom_point(shape=1)
ggplot(dat,aes(y=SpheruleExpr,x=Distance))+geom_point(shape=1)
