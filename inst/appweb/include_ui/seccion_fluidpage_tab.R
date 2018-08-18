tabItem(tabName = "seccionFluidPageTab",
  h2("Secci\u00F3n FLUID PAGE [PRUEBAS DE ELEMENTOS - LAYOUTs]"),
  br(),
  ## ===========
  fluidPage(# en dashboard, NO usar los atributos "title" y "theme"; para evitar coflictos
    # App title ----
    titlePanel("Secuencia de Tabs"),
    # Uso tipo funcion para el "helper", al recibir explicitamente el "objeto grafico":
    wellPanel(
      helper(actionButton("msgModalBtn", "[Clic] Mensaje Modal!"),
           type = "markdown", icon = "question",                                                                 colour = "green", content = "plot_help")
    ),
    hr(),
    # Sidebar layout with input and output definitions ----
    sidebarLayout(

      # Sidebar panel for inputs ----
      sidebarPanel(

        # Input: Select the random distribution type ----
        radioButtons("dist", "Tipo de Distribuci\u00F3n:",
           c("Normal" = "norm",
             "Uniform" = "unif",
             "Log-normal" = "lnorm",
             "Exponential" = "exp"))
             %>% helper(icon = "exclamation", colour = "red", # Para este si aplica el color
                        type = "markdown", content = "controls_help", size = "l"),

        # br() element to introduce extra vertical spacing ----
        br(),

        # Input: Slider for the number of observations to generate ----
        sliderInput("n", "N\u00FAmero de Observaciones:",
            value = 500, min = 1, max = 1000)
            # Para la ayuda con el icono por defecto se puede aplicar el atributo "colour",
            # o se puede usar el atributo "style":
            %>% helper(type = "inline", title = "Ayuda contextual!", style = "color: red;",
                       content = "This helpfile is defined entirely in the UI!", size = "s")
      ), # fin sidebarPanel

      # Main panel for displaying outputs ----
      mainPanel(

        # Output: Tabset w/ plot, summary, and table ----
        tabsetPanel(type = "tabs",
            tabPanel("Gr\u00E1fico",
                     plotOutput("plotFP") %>%
                     # Usa la invocacion markdown adecuado. No ejecura Rcm (que es dinamico
                     # y soportado por la plataforma RStudio para reportes avanzados.
                     helper(type = "markdown", colour = "green", content = "plotFP")),
            tabPanel("Resumen", verbatimTextOutput("summaryFP") %>%
                       helper(type = "markdown",
                              colour = "green", content = "plot_help")),
            tabPanel("Tabla", DTOutput("tableFP") %>%
                  # La ayuda en linea NO  procesa los TAGS HTML, usa texto plano, o un ".md"
                  helper(type = "inline", title = "Ayuda DT contextual!",
                        content = helpText(tags$b("Autor:"),
                                  br(), "Carlos Alberto P\u00E9rez Moncada"), size = "m"))
        )
      ) # fin main panel
    ) # fin sidebarLayout
  ) ## fin fluidPage ===========
)
