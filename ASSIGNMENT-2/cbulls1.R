library(Quandl)
library(ggplot2)



cbulls = Quandl("BBALL/NBA_CHICAGOBULLS" authcode="p58gxzoFqVzMLY7jVgPS")



cbulls


head(cbulls)

cbulls.new <-cbulls[, -3:-5]

cbulls.new
cbulls.new1 <- cbulls.new[, -5:-5]
cbulls.new1 

colnames (cbulls.new1)[3] <-"PS"
colnames (cbulls.new1)[4] <-"PG"
cbulls.new1

#code for converting data into csv format
write.csv(cbulls.new1, "cbulls.new1.csv",row.names=FALSE )


ggplot(data=cbulls.new1, aes(Year))+
geom_line(aes(y=Wins, color="Wins"))+geom_line(aes(y=PS, color="points scored per game  "))+
geom_line(aes(y=PG, color="points against per game "))



class(cbulls.new1)

#class(cbulls.new1) <- c("PS", "PG")


str(cbulls.new1)

summary(cbulls.new1)

ggplot(cbulls.new1,aes(x = Year,y = Wins)) + 
  geom_bar(aes(fill = variable),position = "dodge") + 
  scale_y_log10()

# Bar graph, time on x-axis, color fill grouped by sex -- use position_dodge()
ggplot(data=cbulls.new1, aes(x=Year, y=Wins, fill=PS)) + 
  geom_bar(stat="identity", position=position_dodge(), colour="black")

