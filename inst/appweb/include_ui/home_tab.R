tabItem(tabName = "homeTab",
  h2("semviz.mockup Aplicaci\u00F3n Shiny Dashboard WEB. v 1.0.0"), # Este titulo es para la seccion completa
  fluidRow(
    tabBox(title = tagList(shiny::icon("gear"), "HOME -- INICIO"), # Este titulo es solo para el TABSET
           width = "250px", height = "550px",
        # Lista de TABs:
        tabPanel(id="acerdaDeTab", title = "ACERCA DE", # Tutilo solo para la pestaña del TAB Panel
          h2("Visualizaci\u00F3n de alto nivel para la interpretaci\u00F3n de Modelos de Ecuaciones Estructurales"),
          helpText(tags$b("Autor:"),
             br(), "Carlos Alberto P\u00E9rez Moncada",
             br(), tags$b("Correo electr\u00F3nico:"),
             br(), tags$a("carlos.perez7@udea.edu.co", # NO usar el atributo "title=" impide que se active el link!
                          href= "https://www.linkedin.com/in/carlos-alberto-perez-moncada-07b6b630/",
                          # NO usar el atributo "icon=" explicitamente, impide que se active el icono!
                          target="_blank",icon("linkedin-square", "fa-2x")), br(),
             br(), tags$b("Director del Proyecto: John Freddy Duitama"),
             br(), tags$b("CO-Director del Proyecto: Juan Delgado Lastra"),
             hr(), tags$b("Grupo de Investigaci\u00F3n: Ingenier\u00EDa y Software"),
             br(), tags$b("Programa: Maestr\u00EDa en Ingenier\u00EDa con \u00E9nfasis en Inform\u00E1tica")
          ),
          # La imagen se debe ubicar en una carpeta "/www",
          # al mismo nivel del archivo "ui.R". Alli se puede crear: "www/images"
          hr(), img(src = "images/UdeA_Escudo.jpg")
       ),
       # NOTA: Se debe usar un tabPanel para elementos con contenido HTML para que sea procesado correctamente
       tabPanel(id="ayudaBasicTab", title = "AYUDA",
          h3("AYUDA BASICA"),
          wellPanel(# El wellPanel adiciona un "contorno Gris" a los elementos contenidos
            # la funcion helpText aplica estilos propios al texto HTML proporcionado
            helpText(title = "HELP dinamica server", htmlOutput("basicsHelpText"))
          )
          # Al adicionar elementos luego del wellPanel no se activaron, se envian entonces desde el "server.R"
       )
    ) # fin tabBox
  ) # fin fluidRow
)
