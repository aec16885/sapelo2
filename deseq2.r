#set input and output dirs
datapath <- "/scratch/aec16885/nsd1/traditional_alignment"
resultdir <- "/scratch/aec16885/nsd1/traditional_alignment"
setwd(resultdir)

countdata<- read.delim("repeat_alignment_gene.txt", header=TRUE, row.names=1, comment.char="#")
countdata<-countdata[ ,6:ncol(countdata)]
colnames(countdata)<- gsub("\\.[sb]am$","",colnames(countdata))
countdata<-as.matrix(countdata)
(condition<-factor(c(rep("nsd1MZKO",3),rep("WT",3))))

library(DESeq2)
(coldata<-data.frame(row.names=colnames(countdata),condition))
dds <- DESeqDataSetFromMatrix(countData=countdata,colData=coldata,design=~condition)
dds
dds<-DESeq(dds)
png("qc-dispersions_0511.png",1000,1000,pointsize = 20)
plotDispEsts(dds, main="Dispersion Plot")
dev.off()
rld <- rlogTransformation(dds)
hist(assay(rld))

library(RColorBrewer)
(mycols <- brewer.pal(8, "Set1")[1:length(unique(condition))])
sampleDists <- as.matrix(dist(t(assay(rld))))

library(gplots)
png("qc-heatmap-samples_0511.png", w=1000, h=1000, pointsize=20)
heatmap.2(as.matrix(sampleDists), key=F, trace="none",col=colorpanel(100, "black", "white"),ColSideColors=mycols[condition], RowSideColors=mycols[condition],margin=c(10, 10), main="Sample Distance Matrix")
dev.off()

png("qc-pca_0511.png", 1000, 1000, pointsize=20)
DESeq2::plotPCA(rld, intgroup="condition")
dev.off()

res <- results(dds)
table(res$padj<0.05)
res <- res[order(res$padj), ]
esdata <- merge(as.data.frame(res), as.data.frame(counts(dds, normalized=TRUE)), by="row.names", sort=FALSE)
names(resdata)[1] <- "Gene"
write.csv(resdata, file="diffexpr-results.csv")

png("hist_adjustpvalue_0511.png",w=1000,h=1000,pointsize=20)
hist(res$pvalue, breaks=200, col="grey")
dev.off()

png("MA_plot_0511.png",w=1000,h=1000,pointsize=15)
DESeq2::plotMA(dds, ylim=c(-1,1))

volcanoplot <- function (res, lfcthresh=2, sigthresh=0.05, main="Volcano Plot", legendpos="bottomright", labelsig=TRUE, textcx=1, ...) {
  with(res, plot(log2FoldChange, -log10(pvalue), pch=20, main=main, ...))
  with(subset(res, padj<sigthresh ), points(log2FoldChange, -log10(pvalue), pch=20, col="black", ...))
  with(subset(res, abs(log2FoldChange)>lfcthresh), points(log2FoldChange, -log10(pvalue), pch=20, col="grey", ...))
  with(subset(res, padj<sigthresh & abs(log2FoldChange)>lfcthresh), points(log2FoldChange, -log10(pvalue), pch=20, col="red", ...))
  if (labelsig) {
    require(calibrate)
    with(subset(res, padj<sigthresh & abs(log2FoldChange)>lfcthresh), textxy(log2FoldChange, -log10(pvalue), labs=Gene, cex=textcx, ...))
  }
  legend(legendpos, xjust=1, yjust=1, legend=c(paste("FDR<",sigthresh,sep=""), paste("|LogFC|>",lfcthresh,sep=""), "both"), pch=20, col=c("black","grey","red"))
}
png("diffexpr-volcanoplot_0511.png", 1200, 1000, pointsize=10)
volcanoplot(resdata, lfcthresh=1, sigthresh=0.05, textcx=.8, xlim=c(-15, 15))
dev.off()
