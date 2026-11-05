# Datos meteorológicos diarios de cinco estaciones del INTA

Datos diarios de cinco estaciones meteorológicas del Instituto Nacional
de Tecnología Agropecuaria (INTA), disponibilizados a través del Sistema
de Información y Gestión Agropecuaria (SIGA). Reúne las estaciones
NH0046, NH0098, NH0437, NH0472 y NH0910.

## Usage

``` r
datos_estaciones
```

## Format

Un data.frame con 95681 filas y 35 columnas. Algunas de ellas:

- id:

  Identificador de la estación.

- fecha:

  Fecha de la observación.

- temperatura_abrigo_150cm:

  Temperatura de abrigo a 150 cm (°C).

- precipitacion_pluviometrica:

  Precipitación pluviométrica.

- humedad_media_8_14_20:

  Humedad media calculada con las observaciones de las 8, 14 y 20 horas.

Las demás columnas son otras variables meteorológicas medidas por las
estaciones (temperaturas, viento, radiación, etc.).

## Source

<https://siga.inta.gob.ar/>
