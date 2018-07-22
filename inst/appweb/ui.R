# autor -------------------------------------------------------------------
# carlos.perez7@udea.edu.co
# 21/07/2018 1:35:51 p. m.
#
source('include_ui/utils_ui.R', local=TRUE)

# Declaracion del encabezado para la aplicacion WEB:
header <- dashboardHeader(
  # El titulo usado aqui es el presentado en el menu de la app web:
  title = tagList(shiny::icon("gear"), "SEMVIZ \u00AE"),
  titleWidth = "200px", disable = FALSE
)

# menu_general ------------------------------------------------------------
sidebar <- dashboardSidebar(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css"),
    tags$script(src = "custom.js")
  ),
  sidebarMenu(id = "sidebar",
      menuItem("Inicio", tabName = "homeTab", icon = icon("credit-card")),
      menuItem("Coordenadas Paralelas", tabName = "coordParall", icon = shiny::icon("tasks")),
      menuItem("Predicciones", tabName = "predicciones", icon = shiny::icon("stats", lib = "glyphicon"))
    ), # /FIN sidebarMenu
    br(),
    tags$footer(tags$div(tags$b("* Carlos A. P\u00E9rez Moncada."),
        a(href= "https://www.linkedin.com/in/carlos-alberto-perez-moncada-07b6b630/",
        target="_blank",icon("linkedin-square", "fa-2x")),
        br(), "- GPLv3 Licence.", br(), "- Copyright \u00A9 2018 U. de A.", br(),
        "- Medell\u00EDn - Colombia.", br(),
        tags$button(id = 'closeApp', type = "button", class = "btn action-button",
          onclick = "setTimeout(function(){window.close();},500);",
          # close browser
          "Salir..."
        )
    ) # FIN DIV
  ) # FIN FOOTER
) # /dashboardSidebar


# TABS_APPWEB -------------------------------------------------------------
body <- dashboardBody(
  tabItems(
    # First tab content
    # SE USA LA FUNCION source(..) con el acceso especifico al $value; para evitar que se
    # procese el contenido, pues causa que se genere el codigo HTML respectivo...
    # Se debe incluir el tabItem completo, sino el include .R genera errores de validacion:
    source("include_ui/home_tab.R", local = TRUE)$value,
    tabItem(tabName = "coordParall",
      h2("Coordenadas Paralelas [Ejemplo: Datos Vehiculos e IRIS]"),
      br(),
      helpText("Clic y arrastar sobre los ejes verticales - ordenar o filtrar - brushing (doble clic para restaurar)."),
      fluidRow(
        # NOTA: withSpinner(), presenta el icono de LOADING... mientras procesa la imagen...
        box(
          title = "Parcoords Plot Example", width = NULL, status = "primary",
          plotOutput( "iris_pairs", width = "400px" ) %>% withSpinner()
        ),
        parcoordsOutput("paralCoordsPlot", width = "100%", height = "500px" ) %>% withSpinner()
      ), br(),
      streamgraphOutput("streamgraphPlot", width = "1000px", height = "500px" ) %>% withSpinner()
    ),
    # SE USA LA FUNCION source(..) con el acceso especifico al $value; para evitar que se
    # procese el contenido, pues causa que se genere el codigo HTML respectivo...
    # Se debe incluir el tabItem completo, sino el include .R genera errores de validacion:
    source("include_ui/series_contenido_tab.R", local = TRUE)$value
  ) # /tabItems
) # /dashboardBody

# INIT_DASHBOARD ----------------------------------------------------------
# El titulo usado aqui es el presentado en la pagina de Navegador WEB:
dashboardPage(title = "SEMVIZ MOCKUP", header, sidebar, body, skin = "blue")
