library(shiny) #load shiny package
library(dplyr) #load dplyr for manipulating data based on inputs

#load fantasy data
dataurl <- "https://s3-us-west-1.amazonaws.com/fftiers/out/current/weekly-ALL.csv"
ffdata <- read.csv(dataurl, stringsAsFactors = FALSE)

ffdata$Pos <- gsub('[0-9]+', '', ffdata$Position) #creating column for just position and not ranking

shinyServer(
    function(input, output) {
        posi <- reactive({
           as.character(input$pos)
        })
        output$data <- 
            DT::renderDataTable({
            filter(ffdata, Pos == posi())
            })
        output$all <- DT::renderDataTable(
            DT::datatable(ffdata, options = list(paging = FALSE))
        )
    }
)