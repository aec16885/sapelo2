suppressMessages({
 library("sleuth")
})

#set input and output dirs
datapath <- "/home/aec16885/nsd1/5dpf_RNAseq/kallisto"
resultdir <- "/home/aec16885/nsd1/5dpf_RNAseq/sleuth"
setwd(resultdir)

#create a sample to condition metadata description
sample_id <- dir(file.path(datapath))
kallisto_dirs <- file.path(datapath, sample_id)
print(kallisto_dirs)
sample <- c("ab_1", "ab_2", "ab_3","nsd1mzko_1", "nsd1mzko_2", "nsd1mzko_3")
condition <- c("WT", "WT", "WT", "nsd1mzko", "nsd1mzko", "nsd1mzko")
samples_to_conditions <- data.frame(sample,condition)
samples_to_conditions <- dplyr::mutate(samples_to_conditions, path = kallisto_dirs)
print(samples_to_conditions)

#run sleuth on the data
sleuth_object <- sleuth_prep(samples_to_conditions, extra_bootstrap_summary = TRUE) # read data into sleuth_object
sleuth_object <- sleuth_fit(sleuth_object, ~condition, 'full') # estimate parameters for the full linear model that includes the conditions as factors
sleuth_object <- sleuth_fit(sleuth_object, ~1, 'reduced') # estimate parameters for the reduced linear model that assumes equal transcript abundances in both conditions
sleuth_object <- sleuth_lrt(sleuth_object, 'reduced', 'full') # perform likelihood ratio test to identify transcripts whose fit is significantly better under full model relative to reduced model
models(sleuth_object)
