#Curso Visualizacion de datos con R - COMPASS and UIS
#2.Graficos con ggplot
#Instructores: Viviana Ortiz and Paulo Izquierdo
#Febrero 13, 2021


#Saving plots
pdf(file = "myplot.pdf")
plot(Sepal.Width~Sepal.Length, data = iris)
dev.off()

x <- seq(-3,3,0.01)
y <- dnorm(x=x, mean = 0, sd = 1)

pdf("fakeplot.pdf", width = 8, height = 8)
plot(x=x, y=y, type="l", lwd=2, col="blue")
plot(x=x, y=y, type="h", lwd=2, col="blue")
dev.off()


pdf(file = "hist_petalwidth.pdf")
hist(iris$Petal.Width, col= "green")
dev.off()

###Multiple panels

par(mfrow=c(1,2))
boxplot(Sepal.Width~Species, data = iris,
        col = "olivedrab")
boxplot(Petal.Width~Species, data = iris,
        col = "papayawhip")
plot(Petal.Width~Petal.Length, data = iris)

par(mfrow=c(1,1))

##
?ToothGrowth
head(ToothGrowth)
par(mfrow=c(3,1))
hist(ToothGrowth$len, col = "wheat")
boxplot(ToothGrowth$len~ToothGrowth$supp, col = "tomato")
plot(ToothGrowth$len~ToothGrowth$dose)

#To modify margins areound EACH plot
par(mar = c(bottom, left, top, right))

#To modify margins around whole figure
par(oma = c(bottom, left, top, right))


par(mfrow=c(3,1))
par(mar=c(4,4,2,2))

hist(ToothGrowth$len,
     col="wheat")

boxplot(ToothGrowth$len~
	ToothGrowth$supp, 	col="tomato")

plot(ToothGrowth$len~
	ToothGrowth$dose,
	col="forestgreen")


#To eliminate x and/or y axes, add to each plot :
  plot(..., xaxt="n", yaxt="n")
  
#To add text to the outside of an individual plot, use
#standalone funct mtext after a single plot 
  mtext(text="Foot length (cm)", side=2, line=3)
#To add text to the outside of multiple figures, use mtext with the outer=T option
  mtext(text="Year", side=1, line=3, outer=T)

#Values for side of the plot refer to 1=bottom, 2=left, 3=top, 4=right
  
###Customized layouts
  mat <- matrix(1:15, nrow = 3, ncol = 5, byrow = T)
  layout(mat = mat, widths = c(1,3,5,1,3),
         heights = c(2,2,1))
  layout.show(n=15)  

#Complex arrangement  
  mat <- matrix(c( 1, 1, 3, 4, 5,
                   1, 1, 3, 6, 7,
                   2, 2, 2, 2, 7), 
                nrow=3, ncol=5, byrow=T)
  
  
  layout(mat=mat, widths = c(1,3,5,1,3),
         heights = c(2,2,1) )
  
  
  layout.show(n=7)
  
#Zeros for empty plots
  mat <- matrix(c( 2, 0, 
                   1, 3), 
                nrow=2, ncol=2, byrow=T)
  
  
  layout(mat=mat, widths = c(2,1),
         heights = c(1,2) )
  
  
  layout.show(n=3)
  
  
library(ggplot2)

x <- ggplot(data = iris, aes(x=Sepal.Length, y=Sepal.Width,
                             color=Species, shape= Species))
x
x + geom_point() +  stat_smooth(method="lm")


head(midwest)
g <- ggplot(data = midwest, aes(x=area, y=poptotal))
g <- g + geom_point() + 
  geom_smooth(method = "lm") 

g+
  xlim(c(0, 0.1)) + #delete outside points
  ylim(c(0, 1000000))
g
#or just zoom in keeping the points
g + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000))
ggsave("plot.png", width = 5, height = 5)

g + ggtitle("Area Vs Population", subtitle="From midwest dataset") + 
  xlab("Area") + ylab("Population")


