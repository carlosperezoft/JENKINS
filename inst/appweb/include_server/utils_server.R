# autor -------------------------------------------------------------------
# carlos.perez7@udea.edu.co
# 21/07/2018 1:35:51 p. m.
#
## Cargar las funciones propias del paquete semviz.mockup ubicadas en /R dir base:
for (file in list.files("../../R", pattern = "\\.(r|R)$", full.names = TRUE)) {
  source(file, local = TRUE)
}
