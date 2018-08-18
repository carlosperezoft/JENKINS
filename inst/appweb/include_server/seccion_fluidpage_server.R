# Reactive expression to generate the requested distribution ----
# This is called whenever the inputs change. The output functions
# defined below then use the value computed from this expression
dFP <- reactive({
  dist <- switch(input$dist,
                 norm = rnorm,
                 unif = runif,
                 lnorm = rlnorm,
                 exp = rexp,
                 rnorm)

  dist(input$n)
})

# Generate a plot of the data ----
# Also uses the inputs to build the plot label. Note that the
# dependencies on the inputs and the data reactive expression are
# both tracked, and all expressions are called in the sequence
# implied by the dependency graph.
output$plotFP <- renderPlot({
  dist <- input$dist
  n <- input$n

  hist(dFP(),
       main = paste("r", dist, "(", n, ")", sep = ""),
       col = "#75AADB", border = "white")
})

# Generate a summary of the data ----
output$summaryFP <- renderPrint({
  summary(dFP())
})

# Generate an HTML table view of the data ----
output$tableFP <- renderDT({
  # customize the length drop-down menu; display 5 rows per page by default
  DT::datatable(data.frame(dFP()), options = list(orderClasses = TRUE,
                                                  lengthMenu = c(5, 10, 50), pageLength = 5))
})
