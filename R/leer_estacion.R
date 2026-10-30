# Descarga (si hace falta) y lee los datos de una estación meteorológica.
# Argumentos:
#   id_estacion: texto con el id de la estación, por ejemplo "NH0437".
#   ruta: texto con la ruta donde se guarda el archivo, por ejemplo
#         "data-raw/NH0437.csv".
# Devuelve: un data.frame con los datos de la estación.
leer_estacion <- function(id_estacion, ruta) {

  if (!is.character(id_estacion)) {
    cli::cli_abort(c(
      "id_estacion debe ser texto, por ejemplo \"NH0437\".",
      "i" = "La variable ingresada es un {class(id_estacion)[1]}."
    ))
  }

  if (file.exists(ruta)) {
    cli::cli_inform("El archivo {ruta} ya existe, solo se lee.")
  } else {
    url <- paste0(
      "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/",
      id_estacion, ".csv"
    )
    download.file(url, ruta)
    cli::cli_inform("Se descargó la estación {id_estacion} en {ruta}.")
  }

  readr::read_csv(ruta)
}
