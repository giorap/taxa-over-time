library(shiny)

shinyUI(fluidPage(
        title = 'Taxa over time',
        #  Application title
        titlePanel('Taxa over time'),
        p('Number of records in the Berkeley Ecoinformatics Engine  
          for six major taxa in California from 1900-present'),
        sidebarLayout(
                sidebarPanel(
                        # Specify taxon to show using checkbox
                        conditionalPanel(
                                'input.dataset === taxon_table',
                                checkboxGroupInput('show_taxon', 'Taxon to show:',
                                                   as.character(unique(taxon_table$taxon)), 
                                                   selected = 'Amphibians')
                                ),
                        # Specify year range within an interval
                        sliderInput("range", "Year range:",
                                    min = 1900, 
                                    max = 2015, 
                                    value = c(1900,2015))
                ),
                # Plot barplot for the desired year range. 
                # Values are stacked if multiple taxa are selected
                mainPanel(
                        plotOutput("taxon_plot")
                        )
                )
))
