library(ggplot2)
library(grid)
library(xlsx)
library(plyr)

# mytheme <- theme_bw() +
#   theme(plot.margin=unit(c(0.2, 2, 0.2, 0.2), "cm"), 
#         panel.background=element_blank(), 
#         panel.border = element_blank(),
#         panel.grid.major = element_blank(), 
#         axis.title=element_text(size=12), 
#         axis.text = element_text(size=12), 
#         axis.line = element_line(), 
#         legend.position=c(0.95,1), 
#         legend.justification=c(0,1), 
#         legend.text=element_text(size=12))
# theme_set(mytheme)

mytheme <- theme_bw() +
  theme(axis.title = element_text(size=16), 
        axis.text = element_text(size=16, color="black"), 
        legend.text = element_text(size=16))
theme_set(mytheme)

file_names = Sys.glob("*.csv")
n_file = length(file_names)
i = 1
dataset = data.frame()
while (i <= n_file) {
  data_i = read.csv(file_names[i], sep = "\t")
  names(data_i) = c("t", "px", "x", "fx")
  n = nrow(data_i)
  data_i$Group = rep(sprintf("#%d", i), nrow(data_i))
  dataset = rbind(data_i, dataset)
  i = i + 1
}

# Plot absolute resistance change
# ggplot(dataset, aes(x=Time, y=Resistance, colour=Group, shape=Group)) + geom_line() + geom_smooth(colour="black", size=1) + xlab('Time (s)') + ylab('Resistance (Ohms)')  + guides(color=guide_legend(title=NULL))

# plot relative resistance change
ggplot(dataset, aes(x=t, y=fx, colour=Group, shape=Group)) + geom_line() + xlab('Time (min)') + ylab('Force (uN)')  + guides(color=guide_legend(title=NULL))

