library(dplyr)
library(tidyr)
library(readr)

load("data/datos_estaciones.rda")

# ---- Pivots ----

# Recordatorio del ejercicio 3 de dplyr (5.5): promedio y desvío por estación
resumen <- datos_estaciones |>
  group_by(id) |>
  summarise(
    promedio = mean(temperatura_abrigo_150cm, na.rm = TRUE),
    desvio_estandar = sd(temperatura_abrigo_150cm, na.rm = TRUE)
  )

# 1. Alargar: la media y el desvío quedan en la misma columna
resumen_largo <- pivot_longer(
  resumen,
  cols = c(promedio, desvio_estandar),
  names_to = "estadistico",
  values_to = "valor"
)
resumen_largo

# 2. Ensanchar el resultado anterior: una columna por estación,
#    y una fila para la media y otra para el desvío
resumen_ancho <- pivot_wider(
  resumen_largo,
  names_from = id,
  values_from = valor
)
resumen_ancho


# ---- Uniones ----

# 1. Leer los metadatos
metadatos <- read_csv("data-raw/metadatos_completos.csv")

# 2. Identificar las variables clave: comparar los nombres de columnas
names(datos_estaciones)
names(metadatos)
glimpse(metadatos)

# 3. Unir los datos con joins
datos_con_metadatos <- left_join(datos_estaciones, metadatos, by = "id")
datos_con_metadatos

nrow(datos_estaciones)
nrow(datos_con_metadatos)   # tienen que ser iguales
anti_join(datos_estaciones, metadatos, by = "id")   # tiene que quedar con 0 filas
