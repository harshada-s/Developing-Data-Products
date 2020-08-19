#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    model<-lm(mpg~cyl+hp+wt+am,data=mtcars)
    pred<-reactive({
        cylinput<-input$slide1
        hpinput<-input$slide2
        wtinput<-input$slide3
        aminput<-ifelse(input$check1,1,0)
        predict(model,newdata=data.frame(cyl=cylinput,hp=hpinput,wt=wtinput,am=aminput))
    })
    output$text1<-renderText({pred()})
    output$plot1<-renderPlot({
        
        p<-switch(input$radio,"1"=mtcars$cyl,"2"=mtcars$hp,"3"=mtcars$wt,
                  "4"=mtcars$am)
        name<-switch(input$radio,"1"="mtcars$cyl","2"="mtcars$hp","3"="mtcars$wt",
                  "4"="mtcars$am")
        qplot(p,mtcars$mpg,xlab = name,method="lm",geom=c("point","smooth"))
    })
    

})
