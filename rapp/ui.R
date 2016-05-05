#
# This is the user-interface definition of a our app 'rapp'. You can
# run the application by clicking 'Run App' above.
#




library(markdown)

shinyUI(navbarPage("RAPP",
                   tabPanel("Scatter Plot",
                            sidebarLayout(
                              sidebarPanel(
                                radioButtons("ax1", "Select your first trait", c("Alu.Tol", "Plant.height", "Seed.number.per.panicle"),
                                radioButtons("ax2", "Select your Second trait", c("Alu.Tol", "Plant.height", "Seed.number.per.panicle"),
                                radioButtons("color", "Select your feature", c("popID", "Region"),
                                sliderInput("slider", "Select your color scheme", min=1, max=360, value=360)
                                )
                              ),
                              mainPanel(
                                plotOutput("scatter")
                              )
                            )
                   ),
                   tabPanel("Summary",
                            verbatimTextOutput("summary")
                   ),
                   navbarMenu("More",
                              tabPanel("Table",
                                       DT::dataTableOutput("table")
                              ),
                              tabPanel("About",
                                       fluidRow(
                                         column(6,
                                                includeMarkdown("about.md")
                                         ),
                                         column(3,
                                                img(class="img-polaroid",
                                                    src=paste0("http://upload.wikimedia.org/",
                                                               "wikipedia/commons/9/92/",
                                                               "1919_Ford_Model_T_Highboy_Coupe.jpg")),
                                                tags$small(
                                                  "Source: Photographed at the Bay State Antique ",
                                                  "Automobile Club's July 10, 2005 show at the ",
                                                  "Endicott Estate in Dedham, MA by ",
                                                  a(href="http://commons.wikimedia.org/wiki/User:Sfoskett",
                                                    "User:Sfoskett")
                                                )
                                         )
                                       )
                              )
                   )
))

