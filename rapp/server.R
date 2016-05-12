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
load("~/Shiny_Weston-Smia-Miranda/SNP_lab_data.Rdata")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$scatter <- renderPlot({
      x <- input$ax1
      y <- input$ax2
      Group <- input$color
      sub <- data.phenomds[,c(x,y,Group)]
      plt <- ggplot(data = sub, aes_string(x,y,color = Group))
      plt + geom_point(na.rm = TRUE)+ggtitle(paste("Scatterplot of", x,"and",y,"by", input$color, sep = " "))+scale_color_hue(c = input$slider)
  })
  output$summary <- renderPrint({
    summary(data.phenomds)
  })
  output$box <- renderPlot({
      #x <- input$ax1
      #y <- input$ax2
      sub <- data.phenomds[,c(input$ab1,input$ab2)]   # ax1 is discrete
      plt <- ggplot(aes_string(x=input$ab1, y=input$ab2, color=input$ab1), data=sub)
      plt + geom_boxplot()+ggtitle(paste("Box plot of", input$ab2,"by", input$ab1, sep = " "))
  })
})
