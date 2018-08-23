# NOTA: Es necesario especificar un ancho y un alto para el Plot,
# ya sea en la UI o en el server. Aqui se ha sado 500 en ambos.
output$personBig5Plot <- renderPlot({
  data("big5")
  data("big5groups")
  qG <- qgraph(cor(big5), minimum = 0.25, cut = 0.4, vsize = 1.5, layout = "circular",
              groups = big5groups, legend = TRUE, borders = FALSE)
  title("Big 5 correlations - ESTRELLA", line = 2.5)

}, width = 800, height = 600)

# NOTA: Es necesario especificar un ancho y un alto para el Plot,
# ya sea en la UI o en el server. Aqui se especificado desde la UI.
output$personClusterPlot <- renderPlot({
  data("big5")
  data("big5groups")
  Q <- qgraph(cor(big5), minimum = 0.25, cut = 0.4, vsize = 1.5, DoNotPlot = TRUE,
              groups = big5groups, legend = TRUE, borders = FALSE)

  # Layout Spring es tipo nube-cluster
  Q <- qgraph(Q, layout = "spring", overlay = TRUE, DoNotPlot = FALSE,
              posCol = "green", negCol = "red")
  title("Big 5 correlations - CLUSTER (Venn diagram overlay)", line = 2.5)
})

output$personPCAPlot <- renderPlot({
  data(big5)
  data(big5groups)

  qgraph.pca(big5, factors = 5, groups = big5groups, rotation = "promax",
             minimum = 0.2, cut = 0.4, vsize = c(1, 15), borders = FALSE,
             asize = 0.07, esize = 4, vTrans = 200)
    title("Big 5 Componentes Principales", line = 2.5)

}, width = 500, height = 500)

output$personEFAPlot <- renderPlot({
  data(big5)
  data(big5groups)

  qgraph.efa(big5, 5, groups = big5groups, rotation = "promax", minimum = 0.2,
             cut = 0.4, vsize = c(1, 7), borders = FALSE, vTrans = 200)
  title("Big 5 Factor Analisis", line = 2.5)

}, width = 500, height = 500)

output$personPSICOPlot <- renderPlot({
  data("bfi")

  cor_bfi <- cor_auto(bfi)
  Groups <- rep(c('A','C','E','N','O'),each=5)
  graph_glas <- qgraph(cor_bfi, graph = "glasso", sampleSize = nrow(bfi),
                       layout = "spring", legend.cex =0.6, groups = Groups) # ok: util con grupos

  # NOTA: El titulo debe AGREGARSE luego de generar el grafico, para que sea visualizado!
  title("Synthetic Aperture Personality Assessment (GLASSO)", line = 2.5)
  #
}, width = 500, height = 500)

output$personPSICOFactorPlot <- renderPlot({
  data("bfi")

  cor_bfi <- cor_auto(bfi)
  Groups <- rep(c('A','C','E','N','O'),each=5)
  graph_factor <- qgraph(cor_bfi, graph = "factorial", sampleSize = nrow(bfi),
                       layout = "spring", legend.cex =0.6, groups = Groups) # ok: util con grupos

  # NOTA: El titulo debe AGREGARSE luego de generar el grafico, para que sea visualizado!
  title("Synthetic Aperture Personality Assessment (FACTOR)", line = 2.5)
  #
}, width = 500, height = 500)

output$personPSICOCentraPlot <- renderPlot({
  data("bfi")

  cor_bfi <- cor_auto(bfi)
  Groups <- rep(c('A','C','E','N','O'),each=5)
  graph_glas <- qgraph(cor_bfi, graph = "glasso", sampleSize = nrow(bfi),
                       groups = Groups, DoNotPlot = TRUE)
  # usar graph = "factorial" o graph = "cor"
  graph_cor <- qgraph(cor_bfi, graph = "cor", groups = Groups, DoNotPlot = TRUE)

  # Se visualiza el utilmo grafico generado...
  centralityPlot(list(correlation = graph_cor, glasso = graph_glas))
  #
}, width = 500, height = 500)


output$personGraDirPlot <- renderPlot({
  # Trivial example of manually specifying edge color and widths:
  E <- as.matrix(data.frame(from = rep(1:3, each = 3), to = rep(1:3, 3), width = 1:9))
  qB <- qgraph(E, mode = "direct", edge.color = rainbow(9))

  # NOTA: El titulo debe AGREGARSE luego de generar el grafico, para que sea visualizado!
  title("Grafo Dirigido Basico", line = 2.5)
  #

}, width = 500, height = 500)
