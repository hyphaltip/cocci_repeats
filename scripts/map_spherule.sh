#PBS -l nodes=1:ppn=8,mem=12gb,walltime=24:00:00 -j oe
module load bowtie2
module load tophat

tophat -G FungiDB-28_Cimmitis_RS.gff -p 8 -o spherules_tophat_out Cimmitis_RS fq/Spherules_rep1,fq/Spherules_rep2,fq/Spherules_rep3
