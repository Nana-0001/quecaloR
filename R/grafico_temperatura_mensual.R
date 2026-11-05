#' Grafica el promedio mensual de la temperatura
#'
#' Grafica el promedio mensual de la temperatura de abrigo a 150 cm, con una
#' línea para cada estación.
#'
#' @param datos Un data.frame con las columnas `id`, `fecha` y
#'   `temperatura_abrigo_150cm`. Puede tener una o más estaciones.
#' @param colores Un vector de colores, uno por estación, por ejemplo
#'   `c("red", "blue")`. Si es `NULL`, se usa la paleta por defecto de ggplot2.
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

  promedios <- datos |>
    dplyr::mutate(mes = lubridate::floor_date(.data$fecha, "month")) |>
    dplyr::group_by(.data$id, .data$mes) |>
    dplyr::summarise(
      promedio_temperatura = mean(.data$temperatura_abrigo_150cm, na.rm = TRUE),
      .groups = "drop_last"
    )

  grafico <- ggplot2::ggplot(
    promedios,
    ggplot2::aes(.data$mes, .data$promedio_temperatura, color = .data$id)
  ) +
    ggplot2::geom_line() +
    ggplot2::labs(title = titulo)

  if (!is.null(colores)) {
    grafico <- grafico + ggplot2::scale_color_manual(values = colores)
  }

  grafico
}
