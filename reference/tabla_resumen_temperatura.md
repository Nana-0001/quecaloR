# Resume la temperatura de abrigo a 150 cm

Calcula el promedio y el desvío estándar de la temperatura de abrigo a
150 cm de una o más estaciones.

## Usage

``` r
tabla_resumen_temperatura(datos)
```

## Arguments

- datos:

  Un data.frame con las columnas `id` y `temperatura_abrigo_150cm`.
  Puede tener una o más estaciones.

## Value

Una tabla en formato largo con el promedio y el desvío estándar de cada
estación.

## Examples

``` r
tabla_resumen_temperatura(datos_estaciones)
#> # A tibble: 10 × 3
#>    id     estadistico     valor
#>    <chr>  <chr>           <dbl>
#>  1 NH0046 promedio        17.3 
#>  2 NH0046 desvio_estandar  5.90
#>  3 NH0098 promedio        18.6 
#>  4 NH0098 desvio_estandar  5.98
#>  5 NH0437 promedio        20.2 
#>  6 NH0437 desvio_estandar  5.77
#>  7 NH0472 promedio        18.0 
#>  8 NH0472 desvio_estandar  5.94
#>  9 NH0910 promedio        17.7 
#> 10 NH0910 desvio_estandar  6.12
```
