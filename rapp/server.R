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
      plt <- ggplot(data = sub, aes(x,y,color = Group))
      plt + geom_point(na.rm = TRUE)+ggtitle(paste("Scatterplot of", x,"and",y,"by", input$color, sep = " "))+scale_color_hue(c = input$slider)
  })
  output$summary <- renderPrint({
    summary(data.phenomds)
  })
#  output$box <- renderPlot({
#      sub <- data.phenomds[,c(input$ax1,input$ax2)]   # ax1 is discrete
#      plt <- ggplot(aes(x=input$ax1, y=input$ax2, color=input$ax1), data=sub)
#      plt <- plt + geom_boxplot()+ggtitle(paste("Box plot of", input$ax2,"by", input$ax1, sep = " "))+scale_color_hue(c = input$slider)
#  })
})
