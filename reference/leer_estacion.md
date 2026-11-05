# Lee los datos de una estación meteorológica

Lee un archivo csv con los datos de una estación del INTA. Si el archivo
no existe en la ruta indicada, lo descarga antes de leerlo.

## Usage

``` r
leer_estacion(id_estacion, ruta)
```

## Arguments

- id_estacion:

  Texto con el id de la estación, por ejemplo `"NH0437"`.

- ruta:

  Texto con la ruta donde se guarda el archivo, por ejemplo
  `"data-raw/NH0437.csv"`.

## Value

Un data.frame con los datos de la estación.

## Examples

``` r
# \donttest{
ruta <- tempfile(fileext = ".csv")
nh0437 <- leer_estacion("NH0437", ruta)
#> Se descargó la estación NH0437 en /tmp/Rtmpq7kVIr/file18aa14948eec.csv.
#> Warning: One or more parsing issues, call `problems()` on your data frame for details,
#> e.g.:
#>   dat <- vroom(...)
#>   problems(dat)
#> Rows: 18929 Columns: 35
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ","
#> chr   (2): id, direccion_viento_1000cm
#> dbl  (22): temperatura_abrigo_150cm, temperatura_abrigo_150cm_maxima, temper...
#> lgl  (10): temperatura_suelo_10cm_media, temperatura_inte_5cm, temperatura_i...
#> date  (1): fecha
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
# }
```
