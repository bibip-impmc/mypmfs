# Copyright (C) 2017 Guillaume Postic (guillaume.postic@upmc.fr)

args = commandArgs(trailingOnly=TRUE)

if (length(args) < 5) {
  stop("Missing argument(s)
        Arguments:
        - args[1]    The *.nrg file
        - args[2]    Bin width (Å)
        - args[3]    Upper limit of the distances (Å)
        - args[4]    Name of the residue pair
        - args[5]    Output dir
        \n", call.=FALSE)
}

mydata = read.table(args[1], h=F)

halfbin = as.numeric(args[2])/2
mylimit = as.numeric(args[3])-halfbin
outfile = paste(args[5], '/', args[4], '.svg', sep="")
svg(outfile)
plot(seq(from=halfbin, to=mylimit, by=as.numeric(args[2])), mydata$V1, type="l", xlab="Distance (Å)", ylab="Pairwise score")
abline(h=0, col="red", lwd=2, lty=2)
dev.off()
