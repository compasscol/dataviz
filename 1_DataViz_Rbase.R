#Curso Visualizacion de datos con R - COMPASS and UIS
#1.Graficos con R base
#Instructores: Viviana Ortiz and Paulo Izquierdo
#Febrero 13, 2021


setwd("./GraphicsFun")
primates <- read.csv("primates.csv", header = T)
head(primates)
class(primates)
primates

?plot
plot( x = primates$Bodywt, y = primates$Brainwt, 
      xlab = "Body weight (kg)",
      ylab = "Brain weight (g)")

plot(primates$Brainwt ~ primates$Bodywt)

plot(Brainwt ~Bodywt, data = primates)

plot( x = primates$Bodywt, y = primates$Brainwt, 
      xlim = c(0,300),
      ylim = c(0, 1400))

#Colors
col #default color
col.axis # tick mark labels
col.lab #x label and y label
col.main #tittle of the plot

#Default palette
palette()

plot( x = primates$Bodywt, y = primates$Brainwt, 
      xlim = c(0,300),
      ylim = c(0, 1400), col = "thistle", col.axis = "red")

plot( x = primates$Bodywt, y = primates$Brainwt,
      cex = 2, pch = "3", col = "10")

plot( x = primates$Bodywt, y = primates$Brainwt,
      cex = 2, pch = 19, col = c(3,8))

colors()
colors()[143]


point.colors <- c("red", "orange", "green", "blue", "magenta")
plot( x = primates$Bodywt, y = primates$Brainwt,
      cex = 2, pch = 19, col = point.colors)

?points

#pch=21, col = color circlw, bg = fill color
plot( x = primates$Bodywt, y = primates$Brainwt,
      cex = 2, pch = 21, col = "black", bg = "salmon")


#full list of all parameters for plotting
par() #current par settings
par #apply the parameterd to multiple graphs
?par

old.par <- par()

par(col.axis = "red")
par(old.par)
#or clear all with broomm in plot window

?legend
legend(x = "topright", legend = primates[,1],
       pt.bg = 1:5, pch = 21:25, bty = "n")


plot( x = primates$Bodywt, y = primates$Brainwt, 
      xlab = "Body weight (kg)",
      ylab = "Brain weight (g)",
      cex = (sqrt(primates$Bodywt))/5, 
      pch = 19, 
      col = 1:5,
      main = "Primate body and brain weights",
      xlim = c(0,300))

legend(x = "topright", legend = primates[,1],
             pt.cex = 2, pch = 19, col = 1:5)

text(x = primates$Bodywt, y = primates$Brainwt,
     labels = primates[,1], pos=4)

text(x=207, y=306, label="Gorilla")
locator() #get coordinates to place text, exc to exit

plot( x = primates$Bodywt, y = primates$Brainwt, 
      type = "s")

hist(iris$Sepal.Width, col = "aquamarine")

str(InsectSprays)
boxplot(count ~ spray, data = InsectSprays, col = "purple")      

barplot(USPersonalExpenditure, legend = T, ylab = "Amount Expended",
        beside=T)
