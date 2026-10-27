library(dplyr)
library(lubridate)
library(ggplot2)

load("data/datos_estaciones.rda")

# 1. Temperatura de abrigo de la estación NH0437 con regresión lineal
datos_estaciones |>
  filter(id == "NH0437") |>
  ggplot(aes(fecha, temperatura_abrigo_150cm)) +
  geom_point(size = 0.5, alpha = 0.3) +
  geom_smooth(method = "lm")

# 2. Promedio mensual de la temperatura de abrigo para cada estación
datos_estaciones |>
  mutate(mes = floor_date(fecha, "month")) |>
  group_by(id, mes) |>
  summarise(
    promedio_temperatura = mean(temperatura_abrigo_150cm, na.rm = TRUE)
  ) |>
  ggplot(aes(mes, promedio_temperatura, color = id)) +
  geom_line()

# 3. Relación entre temperatura de abrigo y humedad
ggplot(datos_estaciones, aes(humedad_media_8_14_20, temperatura_abrigo_150cm)) +
  geom_point(alpha = 0.1) +
  geom_smooth(method = "lm")
