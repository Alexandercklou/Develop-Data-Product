
# The user-interface definition of the Shiny web app.
library(shiny)

shinyUI(
  fluidPage(
    titlePanel("App for Car Class Evaluation"),
    sidebarLayout(
      sidebarPanel(
        selectInput("buying","Buying Price",choices=c("vhigh","high","med","low"),selected = "0.95"),
        selectInput("maint","Maint. Price",choices=c("vhigh","high","med","low"),selected = "0.95"),
        selectInput("doors","No. of Doors",choices=c("2","3","4","5more"),selected = "0.95"),
        selectInput("persons","Person Capacity",choices=c("2","4","more"),selected = "0.95"),
        selectInput("lug_boot","Size of Luggage Boot",choices=c("small","med","big"),selected = "0.95"),
        selectInput("safety","Estimated Safety of the Car",choices=c("low","med","high"),selected = "0.95"),
        actionButton("Action","Submit and Predict"),
        actionButton("refresh","Clear")
        ),
      mainPanel(
        p("This app is mainly for evaluate the car class based based on the characteristic of the car."),
        p("The Client will input the criteria in the next and we will use those data to evaluate the car class."),
        p("Decision tree will be used as the model for the prediction in this app."),
        p("Please press the clear button before next evaluation"),
        wellPanel("The class of the car will be:",textOutput("prediction")),
        p("unacc=unacceptable, acc=acceptable, good=good, vgood=Very Good")
        )
    )
  )
)