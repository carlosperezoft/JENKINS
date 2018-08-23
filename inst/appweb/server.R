# autor -------------------------------------------------------------------
# carlos.perez7@udea.edu.co
# 21/07/2018 1:35:51 p. m.
#
# NOTA: las inclusiones son relativas a la ubicion del archivo. "server.R"
source('include_server/utils_server.R', local=TRUE)

# INICIO SERVER
shinyServer(function(input, output, session) {
  #
  # NOTA1: Inicializa los listeners del paquete shinyhelper, para
  # asociar ayura en linea con ".md" files. Esto en la ubicacion
  # relativa al "server.R"; en el directorio: "/helpfiles/" (nombre por defecto).
  # El nombre del directorio puede cambiarse, y especificar en la invocacion.
  # --> La invocacion a "observe_helpers" debe hacerse en el archivo "server.R",
  # --> siempre dentro de la funcion "shinyServer(..)".
  #
  # NOTA2: Es posible crear el directorio por defecto de archivos de ayuda con
  # la fincion propia del paquete shinyhelper:
  # create_help_files(files = c("controls_help", "plot_help"), help_dir = "helpfiles")
  # Esto crea el dir "helpfiles" por defecto en el directorio actual de la consola de $R>.
  # Debe quedar o ser movido al mismo nivel del archivo "server.R", ya que el acceso en
  # tiempo de ejecucion de relativo dicho elemento.
  #
  observe_helpers(help_dir = "helpfiles")

  # COORDENADAS PARALELAS ---------------------------------------------------
  output$iris_pairs <- renderPlot({
    rows <- rownames(iris)

    # example from ?pairs
    pairs(
      iris[rows,-5]
      , main = "Anderson's Iris Data -- 3 species"
      , pch = 21
      , bg = RColorBrewer::brewer.pal(3,'Set1')[unclass(iris[rows,]$Species)]
    )
  })

  output$paralCoordsPlot <- renderParcoords({
    tryCatch({
      pc <- parcoords(
        iris[,c(5,1:4)]  # order columns so species first
        , rownames=F
        , brushMode="1d"
        , color = list(
          colorScale = htmlwidgets::JS(sprintf(
            'd3.scale.ordinal().range(%s).domain(%s)'
            ,jsonlite::toJSON(RColorBrewer::brewer.pal(3,'Set1'))
            ,jsonlite::toJSON(as.character(unique(iris$Species)))
          ))
          ,colorBy = "Species"
        )
      )
    },
    error = function(e) {
      print(sprintf("Inner error: %s", e))
    },
    warning = function(e) {
      print(sprintf("Inner warning: %s", e))
    },
    finally = {
      print(sprintf("Inner tryCatch all done, result is %s", "EJECUCION EXITOSA!"))
    })
  })

# GRAFICOS DE SERIES - SINCRONIZADOS --------------------------------------
  # SE USA LA FUNCION source(..) con el acceso especifico al codigo fuente (tipo include de java)
  # es posible usar el acceso especifico $value, pero no afecta; funciona igual. En la interfaz
  # grafica UI si es necesario.
  source('include_server/graficos_series.R', local=TRUE)

# FINALIZACION DE SESION WEB ----------------------------------------------
  # Finaliza la ejecucion de la APP en R-Studio al cerrar la Ventana PPAL:
  session$onSessionEnded(function() {
    stopApp()
  })

  ## ELEMENROS DE AYUDA:
  output$basicsHelpText <- renderText( # La funcion renderText entrega el texto HTML, renderPrint tambien aplica
    paste0(tags$b("Autor:"), # la funcion paste0, concatena cada renglon, sin espacios entre cada cadena
       br(), "Carlos Alberto Pérez Moncada",
       br(), tags$b("Correo electr\u00F3nico:"),
       br(), tags$a("carlos.perez7@udea.edu.co", # NO usar el atributo "title="impide que se active el link!
                    href= "https://www.linkedin.com/in/carlos-alberto-perez-moncada-07b6b630/",
                    target="_blank",icon("linkedin-square", "fa-2x")), br(),
       br(), tags$b("Director del Proyecto: John Freddy Duitama"),
       br(), tags$b("CO-Director del Proyecto: Juan Delgado Lastra"),
       hr(), tags$b("Grupo de Investigaci\u00F3n: Ingeniería y Software"),
       br(), tags$b("Programa: Maestría en Ingeniería con énfasis en Informática"),
       hr(), tags$a(tags$b("AYUDA localhost..."), # NO usar el atributo "title="impide que se active el link!
                    href = "/ayuda/rmarkdown_test.html", target = "_blank",
                    # NO usar el atributo "icon=" explicitamente, impide que se active el icono!
                    icon("question-circle")),
       br() # Es necesario agregar un elemento HTML final para que el link sea presentado!
    )
  )
  ## FIN AYUDA

  ## ELEMENTOS DE SECCION MENUS
  source('include_server/seccion_menus_server.R', local=TRUE)
  ## FIN SECCION MENUS

  # ELEMENTOS FLUID PAGE
  source('include_server/seccion_fluidpage_server.R', local=TRUE)
  # FIN FLUID PAGE

  # Elementos graficos en SEM con qgraph (redes en psicometria)
  source('include_server/qgraph_sem_basic_server.R', local=TRUE)
  # FIN QGRAPH

  # USO DE MENSAJE MODAL (popup a usuario)
  observeEvent(input$msgModalBtn, {
    showModal(modalDialog(
      title = "Mensaje Importante",
      "Ventana emergente de mensaje modal!",
      easyClose = TRUE
    ))
  })
  # FIN USO MODAL

  ## FIN SERVER
})

