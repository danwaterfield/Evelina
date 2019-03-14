library(ggplot2)
#histogram
wf=data.frame(term=names(freqr),occurrences=freqr)
p <- ggplot(subset(wf, freqr>100), aes(term, occurrences))

