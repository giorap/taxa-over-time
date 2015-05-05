## Load Shiny
library(shiny)
## Source and process .rds objects to generate taxon_table object
source('source-rds.R')
## Shiny app 
shinyServer(
        function(input, output) {                        
                output$taxon_plot <- renderPlot({
                # Subset taxon_table according to checklist and slider selection 
                selection_subset <- subset(taxon_table, taxon == input$show_taxon &
                                             year >= input$range[1] &
                                             year <= input$range[2])             
                # Table up subset data 
                selection_table <- table(selection_subset$taxon, selection_subset$year)
                # Keep nonzero rows
                selection_table <- selection_table[rowSums(selection_table) != 0,]
                # Define a set of six default colors 
                default_colors <- c("#3366cc", "#dc3912", "#ff9900", "#109618", "#990099", "#dd4477")
                names(default_colors) <- as.character(unique(taxon_table$taxon))
                # Define color subset based on checklist selection
                plot_colors <- default_colors[row.names(selection_table)]
                # Plot subset data
                barplot(selection_table, 
                        col = plot_colors)
                # Add legend based on selection
                legend("topright", 
                       input$show_taxon, 
                       fill = plot_colors, 
                       bty = "n", 
                       y.intersp = 0.7, 
                       cex = 1.4)   
                })
        }
)

