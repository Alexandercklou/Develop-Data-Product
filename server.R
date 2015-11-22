library(caret)
library(rpart)
library(rpart.plot)
library(shiny)
library(httr)

car <- read.csv("http://archive.ics.uci.edu/ml/machine-learning-databases/car/car.data", header=FALSE)
names(car)<-c("buying","maint","doors","seat","lug_boot","safety","carclass")
set.seed(820910)
inTrain<-createDataPartition(y=car$carclass,p=0.9,list=FALSE)
Train<-car[inTrain,]
Testing<-car[-inTrain,]
DecisionTree<-rpart(carclass ~ ., data=Train, method="class")
shinyServer(
function(input, output) 
    {
  Result<-reactive({
      buying=input$buying
      maint= input$maint
      doors= input$doors
      seat=input$persons
      lug_boot=input$lug_boot
      safety=input$safety
      predict(DecisionTree,data.frame(buying,maint,doors,seat,lug_boot,safety),type="class")
  })

  observe({
    if(input$refresh == 0) return()
    output$prediction <- renderText({" "})
  })

  observe({
    if(input$Action == 0) return()
    output$prediction <- renderText({as.character(Result()[1])})
  })
  }
)

 