# SECCION PARA EL USO DE GRAFICOS DE SERIES, PREDICCION:
predicted <- reactive({
  hw <- HoltWinters(ldeaths)
  predict(hw, n.ahead = input$months,
          prediction.interval = TRUE,
          level = as.numeric(input$interval))
})

output$dygraphPlot <- renderDygraph({
  dygraph(predicted(), main = "Predicción TODOS Fallecidos/Mes", group = "lung-deaths") %>%
    dySeries(c("lwr", "fit", "upr"), label = "Fallecidos") %>%
    dyRangeSelector() %>%
    dyOptions(drawGrid = input$showgrid, colors = RColorBrewer::brewer.pal(3, "Set1"))
})

output$dygraphPlotSyncHom <- renderDygraph({
  dygraph(predicted(), main = "Predicción HOMBRES Fallecidos/Mes", group = "lung-deaths") %>%
    dySeries(c("lwr", "fit", "upr"), label = "Fallecidos") %>%
    dyRangeSelector() %>%
    dyOptions(drawGrid = input$showgrid, drawPoints = TRUE, pointSize = 5, pointShape = "triangle")
})

output$dygraphPlotSyncMuj <- renderDygraph({
  dygraph(predicted(), main = "Predicción MUJERES Fallecidas/Mes", group = "lung-deaths") %>%
    dySeries(c("lwr", "fit", "upr"), label = "Fallecidas") %>%
    dyRangeSelector() %>%
    dyOptions(drawGrid = input$showgrid,fillGraph = TRUE, fillAlpha = 0.4, stepPlot = FALSE)
})

output$dySerieFrom <- renderText({
  strftime(req(input$dygraphPlot_date_window[[1]]), "%d %b %Y")
})

output$dySerieTo <- renderText({
  strftime(req(input$dygraphPlot_date_window[[2]]), "%d %b %Y")
})

output$dySerieClicked <- renderText({
  strftime(req(input$dygraphPlot_click$x), "%d %b %Y")
})

output$dySeriePoint <- renderText({
  paste0('X = ', strftime(req(input$dygraphPlot_click$x_closest_point), "%d %b %Y"),
         '; Y = ', req(input$dygraphPlot_click$y_closest_point))
})

output$streamgraphPlot <- renderStreamgraph({
  # UBICACION DE LOS DATOS EN LA RAIZ DEL PROYECTO: (tipo dir /R)
  # Se cargan los datos con el procedimiento convencional en RStudio o linea de comandos
  dat <- read.csv("../../data/cre_transaction-data.csv")
  # Es posible dejar dicho sET de DATOS disponible para el paquete con:
  # devtools::use_data(cre_transaction_data) --> OJO EL NOMBRE CON SUBRAYADOS...
  dat2 <- load("../../data/cre_transaction_data.rda")

  dat %>%
    streamgraph("asset_class", "volume_billions", "year", interpolate="cardinal") %>%
    sg_axis_x(1, "year", "%Y") %>%
    sg_fill_brewer("PuOr")
})
