#' Grafica el promedio mensual de la temperatura
#'
#' Grafica el promedio mensual de la temperatura de abrigo a 150 cm, con una
#' línea para cada estación.
#'
#' @param datos Un data.frame con las columnas `id`, `fecha` y
#'   `temperatura_abrigo_150cm`. Puede tener una o más estaciones.
#' @param colores Un vector de colores, uno por estación, por ejemplo
#'   `c("red", "blue")`. Si es `NULL`, se eligen al azar.
#' @param titulo Texto con el título del gráfico. Por defecto, `"Temperatura"`.
#'
#' @returns Un gráfico de ggplot2.
#' @export
#'
#' @examples
#' grafico_temperatura_mensual(
#'   datos_estaciones,
#'   colores = c("red", "blue", "darkgreen", "orange", "purple"),
#'   titulo = "Temperatura mensual"
#' )
grafico_temperatura_mensual <- function(datos, colores = NULL, titulo = "Temperatura") {

  # Si no se indican colores, se eligen al azar (desafío extra)
  if (is.null(colores)) {
    colores <- sample(colors(), length(unique(datos$id)))
  }

  promedios <- datos |>
    dplyr::mutate(mes = lubridate::floor_date(fecha, "month")) |>
    dplyr::group_by(id, mes) |>
    dplyr::summarise(
      promedio_temperatura = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      .groups = "drop_last"
    )

  ggplot2::ggplot(promedios, ggplot2::aes(mes, promedio_temperatura, color = id)) +
    ggplot2::geom_line() +
    ggplot2::scale_color_manual(values = colores) +
    ggplot2::labs(title = titulo)
}
