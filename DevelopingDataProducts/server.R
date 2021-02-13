library(shiny)
library(datasets)
data(AirPassengers)

shinyServer(function(input, output) {
    
    
    output$TimePlot <- renderPlot({
        month<-input$month
        year1<-input$time[1]
        year2<-input$time[2]
        x=year1:year2
        if(month=="all"){
            start<-12*(year1-1949)+1
            end<-start+(year2-year1)*12+11
            tt=AirPassengers[start:end]
            yy=ts(tt,start=year1,frequency=12)
            plot(yy,ylab="Passenger Numbers")
            
        }else{
            dat<-matrix(AirPassengers,12,12)
            month=as.numeric(month)
            y=dat[month,(year1-1948):(year2-1948)]
            plot(x,y,ylab="Passenger Numbers",ylim=c(100,650))
            abline(lm(y~x),col="red")
            
        }
    }
    
    )
    
})

