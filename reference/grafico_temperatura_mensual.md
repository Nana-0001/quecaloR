# Grafica el promedio mensual de la temperatura

Grafica el promedio mensual de la temperatura de abrigo a 150 cm, con
una línea para cada estación.

## Usage

``` r
grafico_temperatura_mensual(datos, colores = NULL, titulo = "Temperatura")
```

## Arguments

- datos:

  Un data.frame con las columnas `id`, `fecha` y
  `temperatura_abrigo_150cm`. Puede tener una o más estaciones.

- colores:

  Un vector de colores, uno por estación, por ejemplo
  `c("red", "blue")`. Si es `NULL`, se usa la paleta por defecto de
  ggplot2.

- titulo:

  Texto con el título del gráfico. Por defecto, `"Temperatura"`.

## Value

Un gráfico de ggplot2.

## Examples

``` r
grafico_temperatura_mensual(
  datos_estaciones,
  colores = c("red", "blue", "darkgreen", "orange", "purple"),
  titulo = "Temperatura mensual"
)
#> Warning: Removed 1 row containing missing values or values outside the scale range
#> (`geom_line()`).
```
