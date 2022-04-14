library("UScensus2010")
library(UScensus2000tract)

data("oregon.tract")


#median age = oregon.tract$med.age

choropleth(oregon.tract,"med.age",
           color = list(fun = "rainbow",
                        attr = list(4)),
           main="2000 US Counties \n Oregon",type="plot")
