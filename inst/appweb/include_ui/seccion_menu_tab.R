tabItem(tabName = "seccionMenusTab",
  h2("Secci\u00F3n Men\u00FAs [PRUEBAS DE ELEMENTOS - LAYOUTs]"),
  br(),
  ##==============
  navbarPage("BARRA DE MENUS!", # Este titulo de ubica a la izquierda de la barra de menus!
     tabPanel("Plot",
        sidebarLayout(
          sidebarPanel(
            radioButtons("plotType", "Plot type",
                         c("Scatter"="p", "Line"="l")
            )
          ),
          mainPanel(
            plotOutput("plotSM")
          )
        )
     ),
     tabPanel("Summary",
          verbatimTextOutput("summarySM")
     ),
     navbarMenu("More",
        tabPanel("Table",
           DT::dataTableOutput("tableSM")
        ),
        tabPanel("About",
           fluidRow(
             column(6,
                # las inclusiones son relativas a la ubicion del archivo. "ui.R"
                includeMarkdown("include_ui/README.md"), br(),
                includeHTML("www/ayuda/rmarkdown_test.html")
             ),
             column(3,
                  img(class="img-polaroid",
                      src=paste0("http://upload.wikimedia.org/",
                                 "wikipedia/commons/9/92/",
                                 "1919_Ford_Model_T_Highboy_Coupe.jpg")),
                  tags$small(
                    "Source: Photographed at the Bay State Antique ",
                    "Automobile Club's July 10, 2005 show at the ",
                    "Endicott Estate in Dedham, MA by ",
                    a(href="http://commons.wikimedia.org/wiki/User:Sfoskett",
                      "User:Sfoskett")
                  )
             )
           )
        )
     )
  )
  ##==============
)
