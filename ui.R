#rsconnectliblibrary(shiny)

shinyUI(fluidPage(
    titlePanel(title = "NFL Fantasy Tiers / Rankings 2016 ver 0.01"),
        mainPanel(
            tabsetPanel(type = "tab",
                tabPanel("Top 200", DT::dataTableOutput('all')),    
                    tabPanel("By Position",
                             selectInput("pos", "Position", 
                                         choices = c("Running Back" = "RB",
                                                     "Wide Receiver" = "WR",
                                                     "Quarterback" = "QB",
                                                     "Tight End" = "TE",
                                                     "Defense" = "DST")) 
                             , DT::dataTableOutput("data")),
                    tabPanel("About", "Rankings of top 200 Fantasy Football Players for the 2016 season.",
                                tags$br(),
                                tags$ul(),
                                    tags$li("First tab has rankings of all 200 players"),
                                    tags$li("Second tab has a dropdown menu to filter by posistion"),
                                    tags$li("All data is from borischen.co and Fantasypros.com."),
                                    tags$li("Good luck to all in the 2016 Fantasy Football Season.")
                            )
                        )
                )
            )
)