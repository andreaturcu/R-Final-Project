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
mm_to_cm(mg_ordered$St_Diam)
#Custom operator:
'%less.than%' <- function(x, y) {
  if (x<y) return (TRUE)
  else return (FALSE)
}
'%less.than%'(mg_ordered$Fl_Length,mg_ordered$Fl_Wid)






#Later?
#Below: maybe in ddply section:
leaves <- tapply(X = mg_ordered$Leaf_No, INDEX = list(mg_ordered$Pop), FUN = sum)
leaves  
