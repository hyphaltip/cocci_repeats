

library(FSA)

library(dplyr)

read.csv("C_pos_loci_TE.csv")-> C_pos_TE_l2


anova_results_C_pos_TE_l2 <-aov(Sph_exp ~ TE, data = C_pos_TE_l2)
summary(anova_results_C_pos_TE_l2)



dunn_C_pos_TE_l2 = dunnTest(Sph_exp ~ TE,
               data = C_pos_TE_l2,
method="bh")


print(dunn_C_pos_TE_l2)
