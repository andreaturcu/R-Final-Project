mg<-read.csv(file.choose())
is.data.frame(mg)
sr<-mg[mg$No. < 2, ]
sr2<-subset(mg, No.<2)
ordermg<-order(mg$Time_Bud,mg$Fl_Time, na.last = NA)
mg_ordered<-mg[ordermg,]
library(tidyverse)
summarize(mg_ordered, avg_st_hgt=mean(St_Height))

#Custom function:
mm_to_cm<-function(x){
  cm<-x/10
  return(cm)
}
mg_ordered$St_Diam_cm<-mm_to_cm(mg_ordered$St_Diam)


#Custom operator with if/else statement:
'%less.than%' <- function(x, y) {
  if (x<y) return (TRUE)
  else return (FALSE)
}

'%less.than%'(mg_ordered$Fl_Length,mg_ordered$Fl_Wid)#Only returns first value

#For loop:
for(i in 1:nrow(mg_ordered)){
  print('%less.than%'(mg_ordered$Fl_Length[i],mg_ordered$Fl_Wid[i]))
}#Returns all values of these columns

#ddply:
leaves <- tapply(X = mg_ordered$Leaf_No, INDEX = list(mg_ordered$Pop), FUN = sum)

#Histogram:
hist(mg_ordered$St_Height, 
     main="Stem Height", 
     xlab="Height (cm)",
     ylab="Number of Individuals",
     border="blue", 
     col="pink",
     las=1,
     breaks=30,
     xlim=c(0,25))

#Line Plot;
HOV<-mg_ordered[mg_ordered$Pop=="HOV",]
plot(x=HOV$Brnc_No, y=HOV$Leaf_No)

#ggplot:
library(ggplot2)
ggplot(data= mg_ordered, aes(x=Brnc_No, y=Leaf_No, colour=Pop)) + 
  geom_point() +
  scale_color_manual(values=c("purple","pink","black","green","yellow","orange","grey","red","brown","turquoise","white","tan"))+
  ggtitle("Relationship between Branch and Leaf Numbers by Population")+
  xlab("Number of Branches")+
  ylab("Number of Leaves")
  





 
