# autor -------------------------------------------------------------------
# carlos.perez7@udea.edu.co
# 21/07/2018 1:35:51 p. m.
#
source('include_server/utils_server.R', local=TRUE)

# INICIO SERVER
shinyServer(function(input, output, session) {


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

  ## FIN SERVER
})

