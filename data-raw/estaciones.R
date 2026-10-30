library(readr)

# Descargar
download.file(
  "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/metadatos_completos.csv",
  "data-raw/metadatos_completos.csv"
)

download.file(
  "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0472.csv",
  "data-raw/NH0472.csv"
)

download.file(
  "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0910.csv",
  "data-raw/NH0910.csv"
)

download.file(
  "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0046.csv",
  "data-raw/NH0046.csv"
)

download.file(
  "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0098.csv",
  "data-raw/NH0098.csv"
)

download.file(
  "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0437.csv",
  "data-raw/NH0437.csv"
)

# Leer
metadatos <- read_csv("data-raw/metadatos_completos.csv")
nh0472 <- read_csv("data-raw/NH0472.csv")
nh0910 <- read_csv("data-raw/NH0910.csv")
nh0046 <- read_csv("data-raw/NH0046.csv")
nh0098 <- read_csv("data-raw/NH0098.csv")
nh0437 <- read_csv("data-raw/NH0437.csv")

# Unir las estaciones
datos_estaciones <- rbind(
  nh0472,
  nh0910,
  nh0046,
  nh0098,
  nh0437
)

# Guardar en data/ para usarlo en el paquete
usethis::use_data(datos_estaciones, overwrite = TRUE)

