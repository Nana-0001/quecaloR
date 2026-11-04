#' Lee los datos de una estación meteorológica
#'
#' Lee un archivo csv con los datos de una estación del INTA. Si el archivo
#' no existe en la ruta indicada, lo descarga antes de leerlo.
#'
#' @param id_estacion Texto con el id de la estación, por ejemplo `"NH0437"`.
#' @param ruta Texto con la ruta donde se guarda el archivo, por ejemplo
#'   `"data-raw/NH0437.csv"`.
#'
#' @returns Un data.frame con los datos de la estación.
#' @export
#'
#' @examples
#' \donttest{
#' ruta <- tempfile(fileext = ".csv")
#' nh0437 <- leer_estacion("NH0437", ruta)
#' }

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
