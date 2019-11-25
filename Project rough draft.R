mg<-read.csv(file.choose())
is.data.frame(mg)
sr<-mg[mg$No. < 2, ]
sr2<-subset(mg, No.<2)
ordermg<-order(mg$Time_Bud,mg$Fl_Time, na.last = NA)
mg_ordered<-mg[ordermg,]

