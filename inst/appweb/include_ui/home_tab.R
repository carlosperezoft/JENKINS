tabItem(tabName = "homeTab",
  h2("Visualizaci\u00F3n de alto nivel para la interpretación de Modelos de Ecuaciones Estructurales"),
  helpText(tags$b("Autor:"),
           br(), "Carlos Alberto Pérez Moncada",
           br(), tags$b("Correo electr\u00F3nico:"),
           br(), tags$a("carlos.perez7@udea.edu.co"), br(),
           br(), tags$b("Director del Proyecto: John Freddy Duitama"),
           br(), tags$b("CO-Director del Proyecto: Juan Delgado Lastra"),
           hr(), tags$b("Grupo de Investigación: Ingeniería y Software"),
           br(), tags$b("Programa: Maestría en Ingeniería con énfasis en Informática")
  ),
  # La imagen se debe ubicar en una carpeta "/www",
  # al mismo nivel del archivo "ui.R". Alli se puede crear: "www/images"
  hr(), img(src = "images/UdeA_Escudo.jpg")
)
