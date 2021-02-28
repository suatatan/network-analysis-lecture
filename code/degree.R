library(igraph)
mydata <- read_csv("Belgeler/mydata.csv")
g <- graph_from_data_frame(mydata)
lay <- layout.fruchterman.reingold(g)
plot(g, edge.arrow.size=.1, vertex.color="gold", vertex.size=15, 
     
     vertex.frame.color="gray", vertex.label.color="black", 
     
     vertex.label.cex=0.8, vertex.label.dist=2, edge.curved=0,layout=lay) 

deg <- degree(g)
x = names(deg)
y = deg
df = data.frame(x,y)
# Barplot
library(ggplot2)
ggplot(df, aes(x=reorder(x,y), y=y)) + 
  geom_bar(stat = "identity") +
  coord_flip()
