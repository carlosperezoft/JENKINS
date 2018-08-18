output$plotSM <- renderPlot({
  plot(cars, type=input$plotType)
})

output$summarySM <- renderPrint({
  summary(cars)
})

output$tableSM <- DT::renderDataTable({
  DT::datatable(cars)
})
