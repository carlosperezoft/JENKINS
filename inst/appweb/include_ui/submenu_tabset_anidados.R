tabItem(tabName = "submenusTab",
  h2("SUBMENU: Uso de Redes en Psicometria, paquete R: qgraph"), br(),
  fluidPage(

    titlePanel("Aplicar graficos de qgraph en SEM"),

    navlistPanel(
      "Analsis General",
      # NOTA: Es necesario especificar un ancho y un alto para el Plot,
      # ya sea en la UI o en el server. Aqui se ha usado "auto" en ambios.
      tabPanel("Person por Grupos", h3("Red de Analisis de Persionalidad Big5"),
               plotOutput("personBig5Plot",'auto','auto') %>% withSpinner()),

      # NOTA: Es necesario especificar un ancho y un alto para el Plot,
      # ya sea en la UI o en el server. Aqui se ha usado 100% en ancho, y 500 en alto.
      tabPanel("Person tipo cluster", h3("Red de Analisis tipo Cluster"),
               plotOutput("personClusterPlot",width = "100%", height = "500px") %>% withSpinner()),
      "Analsis Especifico",
      tabPanel("Componentes Principales", h3("RED de Analisis para Componentes Principales"),
               plotOutput("personPCAPlot",width = "100%", height = "500px") %>% withSpinner()),
      tabPanel("Factor Analisis", h3("RED para Factor Analisis"),
               plotOutput("personEFAPlot",width = "100%", height = "500px") %>% withSpinner()),
      "-----",
      tabPanel("Grafo PSICO: GLASSO", h3("RED PSICO: Synthetic Aperture Personality Assessment"),
             plotOutput("personPSICOPlot",width = "100%", height = "500px") %>% withSpinner()),
      tabPanel("Grafo PSICO: FACTOR",
             h3("RED PSICO-Centralidad: Synthetic Aperture Personality Assessment"),
             plotOutput("personPSICOFactorPlot",width = "100%", height = "500px") %>% withSpinner()),
      tabPanel("Grafo PSICO: Centralidad",
              h3("RED PSICO-Centralidad: Synthetic Aperture Personality Assessment"),
              plotOutput("personPSICOCentraPlot",width = "100%", height = "500px") %>% withSpinner()),
      tabPanel("Grafo Dirigido Basico", h3("RED de grafo dirigido Basico"),
               plotOutput("personGraDirPlot",width = "100%", height = "500px") %>% withSpinner())

    )
  ),
  # NOTA: el uso de navbarPage NO permite el uso interno de "tabsetPanel"
  # dentro un "tabPanel" que forme parte de dicha barra de navegacion.
  navbarPage("My Application",
     tabPanel("Component 1", icon = icon("credit-card"), h3("CP1")),
     tabPanel("Component 2", icon = icon("credit-card"),
        h3("CP2"),
        sidebarLayout(
          sidebarPanel(
            h3("CP2 sidebar")
          ),
          mainPanel(
            h3("CP2 mainpanel")
          )
        )
     ),
     navbarMenu("More",
        tabPanel("Sub-Component A", icon = icon("credit-card"), h3("CPA")),
        tabPanel("Sub-Component B", icon = icon("credit-card"), h3("CPB"))
     )
  )
)
