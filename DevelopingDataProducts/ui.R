
# time series plot

shinyUI(
    fluidPage(
    headerPanel("Monthly Airline Passenger Numbers"),    
    sidebarPanel(
        #introduction
        p("This application is used to display the time series plot of 
          the Monthly Airline Passenger Numbers from 1949 to 1960"),
        p("You can use the silder to select the Year and Month of the Passenger numbers"),
        p("the app will help you plot the number on the main panel"),
        
        
        sliderInput("time", "Year:",min =1949, max =1960, value = c(1950,1960)),
        ## month
        selectInput("month","Month",
                choices=c("all","1","2","3","4","5","6","7","8","9","10","11","12"),
                multiple = F)
        #submitButton('Go!')
    ),
    
    mainPanel(
        h3('Time serial plot'),
        plotOutput("TimePlot")
    )

    )
)