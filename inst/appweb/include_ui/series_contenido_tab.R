tabItem(tabName = "predicciones",
  h2("Modelos de Predicción - Interactivos [Ejemplo: Muertes Pulmonares Reino Unido]"),
  tags$hr(),
  fluidRow(
    numericInput("months", label = "Meses a Predecir",
                 value = 72, min = 12, max = 144, step = 12),
    selectInput("interval", label = "Intervalo de Predicción",
                choices = c("0.80", "0.90", "0.95", "0.99"),
                selected = "0.95"),
    checkboxInput("showgrid", label = "Usar Grid", value = TRUE)
  ),
  helpText("Dstos Seleccionados del Gráfico de Fallecidos TODOS:"),
  div(strong("Desde: "), textOutput("dySerieFrom", inline = TRUE)),
  div(strong("Hasta: "), textOutput("dySerieTo", inline = TRUE)),
  div(strong("Fecha seleccionada: "), textOutput("dySerieClicked", inline = TRUE)),
  div(strong("Punto Seleccionado: "), textOutput("dySeriePoint", inline = TRUE)),
  br(),
  helpText("Clic y arrastrar para zoom in (doble clic para restaurar)."),
  dygraphOutput("dygraphPlot") %>% withSpinner(),
  dygraphOutput("dygraphPlotSyncHom") %>% withSpinner(),
  dygraphOutput("dygraphPlotSyncMuj") %>% withSpinner()
)
