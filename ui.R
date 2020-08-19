#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyWidgets)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    setBackgroundColor(c("pink","lavender"),gradient ="linear",direction = c("bottom","right")),
    # Application title
    titlePanel(h2("MPG Prediction")),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("slide1","Select Cylinder type",min=4,max=8,step=2,value = 4),
            sliderInput("slide2","Select Horsepower",min=50,max=400,value = 100),
            sliderInput("slide3","Select Weight",min=1,max=6,step=0.5,value = 3),
            checkboxInput("check1","Manual Transmission (Default:Automatic)",value=FALSE),
            radioButtons("radio",h4("Regression models:"),choices = list("mpg~cyl" = "1", "mpg~hp" = "2",
                                                "mpg~wt" = "3","mpg~am" = "4"),selected = "1")),

        # Show a plot of the generated distribution
        mainPanel(
            h4("This application works on 'mtcars' dataset. It takes input for four predictors('cyl','hp','wt','am') shown in the sidebar panel and predicts the value of outcome 'mpg'.
               It also shows plots for four regression models each having one particular predictor and 'mpg' as outcome."),
            h5("1. Select the predictor values from the sidebar panel and you'll see the predicted mpg value below."),
            h5("2. Choose any of the four radio buttons to view that regression model plot."),
            br(),
            h4("Predicted MPG value:"),
            h4(strong(textOutput("text1"))),
            h4("Plot"),
            plotOutput("plot1")
        )
    )
))
