tabItem(tabName = "predicciones",
  h2("Modelos de Predicci\u00F3n - Interactivos [Ejemplo: Muertes Pulmonares Reino Unido]"),
  tags$hr(),
  wellPanel( # El wellPanel adiciona un "contorno Gris" a los elementos contenidos
    fluidRow(
      numericInput("months", label = "Meses a Predecir",
                   value = 72, min = 12, max = 144, step = 12),
      selectInput("interval", label = "Intervalo de Predicci\u00F3n",
                  choices = c("0.80", "0.90", "0.95", "0.99"),
                  selected = "0.95"),
      checkboxInput("showgrid", label = "Usar Grid", value = TRUE)
    ),
    helpText("Datos Seleccionados del Gr\u00E1fico de Fallecidos TODOS:"),
    div(strong("Desde: "), textOutput("dySerieFrom", inline = TRUE)),
    div(strong("Hasta: "), textOutput("dySerieTo", inline = TRUE)),
    div(strong("Fecha seleccionada: "), textOutput("dySerieClicked", inline = TRUE)),
    div(strong("Punto Seleccionado: "), textOutput("dySeriePoint", inline = TRUE))
  ),
  br(),
  helpText("Clic y arrastrar para zoom in (doble clic para restaurar)."),
  dygraphOutput("dygraphPlot") %>% withSpinner(),
  dygraphOutput("dygraphPlotSyncHom") %>% withSpinner(),
  dygraphOutput("dygraphPlotSyncMuj") %>% withSpinner()
)
