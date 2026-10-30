#' Lee los datos de una estación meteorológica.
#'
#' @param id_estacion Identificador de la estación, por ejemplo "NH0437".
#' @return Un data.frame con los datos de la estación seleccionada.
#' @export
leer_estacion <- function(id_estacion) {

  if (!is.character(id_estacion) ||
      length(id_estacion) != 1 ||
      is.na(id_estacion) ||
      trimws(id_estacion) == "") {
    cli::cli_abort("id_estacion debe ser un identificador válido.")
  }

  utils::data(
    "datos_estaciones",
    package = "quecaloR",
    envir = environment()
  )

  if (!id_estacion %in% unique(datos_estaciones$id)) {
    cli::cli_abort("No existe la estación {id_estacion}.")
  }

  dplyr::filter(datos_estaciones, .data$id == id_estacion)
}
