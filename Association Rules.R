install.packages("arules")
install.packages("arulesViz")
library("arules")
library("arulesViz")
data("Groceries")
Groceries
Groceries@itemInfo
rules<-apriori (Groceries, parameter=list(support=0.001, confidence=0.5))
subrules<-rules[quality(rules)$confidence>0.8]
plot(subrules, control=list(jitter=2))
inspect(subrules)
RulesHighLift <- head(sort(rules,by="lift"),3)
inspect(RulesHighLift)
plot(RulesHighLift, method="graph", control=list(type="items"))
