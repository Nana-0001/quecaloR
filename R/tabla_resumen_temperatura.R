# Resume la temperatura de abrigo a 150 cm de una o más estaciones.
# Argumentos:
#   datos: data.frame con las columnas id y temperatura_abrigo_150cm
#          (puede tener una o más estaciones).
# Devuelve: una tabla en formato largo con el promedio y el desvío estándar
#           de cada estación.
tabla_resumen_temperatura <- function(datos) {

  if (!is.data.frame(datos)) {
    cli::cli_abort(c(
      "datos debe ser un data.frame.",
      "i" = "La variable ingresada es un {class(datos)[1]}."
    ))
  }

  if (!all(c("id", "temperatura_abrigo_150cm") %in% names(datos))) {
    cli::cli_abort("datos debe tener las columnas id y temperatura_abrigo_150cm.")
  }

  resumen <- datos |>
    dplyr::group_by(id) |>
    dplyr::summarise(
      promedio = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      desvio_estandar = stats::sd(temperatura_abrigo_150cm, na.rm = TRUE)
    )

  tidyr::pivot_longer(
    resumen,
    cols = c(promedio, desvio_estandar),
    names_to = "estadistico",
    values_to = "valor"
  )
}
