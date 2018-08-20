tabItem(tabName = "submenusTab",
  h2("SUBMENU: PRUEBA DE TABs ANIDADOS !!"), br(),
  fluidPage(

    titlePanel("Application Title"),

    navlistPanel(
      "Header A",
      tabPanel("Component 1", h3("CP1")),
      tabPanel("Component 2", h3("CP2")),
      "Header B",
      tabPanel("Component 3", h3("CP3")),
      tabPanel("Component 4", h3("CP4")),
      "-----",
      tabPanel("Component 5", h3("CP5"))
    )
  ),
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
