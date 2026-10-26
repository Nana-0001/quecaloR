library(dplyr)
library(lubridate)

load("data/datos_estaciones.rda")

# 1. Observaciones de temperatura por estación
datos_estaciones |>
  group_by(id) |>
  summarise(
    observaciones_temperatura = sum(!is.na(temperatura_abrigo_150cm))
  )

# 2. Temperatura mínima y máxima por estación
datos_estaciones |>
  group_by(id) |>
  summarise(
    temperatura_minima = min(temperatura_abrigo_150cm, na.rm = TRUE),
    temperatura_maxima = max(temperatura_abrigo_150cm, na.rm = TRUE)
  )

# 3. Promedio y desvío estándar de la temperatura de abrigo a 150 cm
datos_estaciones |>
  group_by(id) |>
  summarise(
    promedio = mean(temperatura_abrigo_150cm, na.rm = TRUE),
    desvio_estandar = sd(temperatura_abrigo_150cm, na.rm = TRUE)
  )

# 4. Proporción de NA en la temperatura de abrigo a 150 cm
datos_estaciones |>
  group_by(id) |>
  summarise(
    proporcion_na = sum(is.na(temperatura_abrigo_150cm)) / n()
  )

# 5. Promedio anual de la temperatura de abrigo a 150 cm
datos_estaciones |>
  mutate(anio = year(fecha)) |>
  group_by(id, anio) |>
  summarise(
    promedio_temperatura = mean(temperatura_abrigo_150cm, na.rm = TRUE)
  )

# 6. Precipitación acumulada mensual
datos_estaciones |>
  mutate(mes = floor_date(fecha, "month")) |>
  group_by(id, mes) |>
  summarise(
    precipitacion_acumulada = sum(precipitacion_pluviometrica, na.rm = TRUE)
  )
