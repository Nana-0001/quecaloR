test_that("grafico_temperatura_mensual devuelve un grafico de ggplot2", {
  datos <- data.frame(
    id = c("A", "A", "B", "B"),
    fecha = as.Date(c("2020-01-01", "2020-02-01", "2020-01-01", "2020-02-01")),
    temperatura_abrigo_150cm = c(10, 12, 20, 22)
  )

  sin_colores <- grafico_temperatura_mensual(datos)
  con_colores <- grafico_temperatura_mensual(
    datos,
    colores = c("red", "blue"),
    titulo = "Mi titulo"
  )

  expect_s3_class(sin_colores, "ggplot")
  expect_s3_class(con_colores, "ggplot")
  expect_equal(nrow(sin_colores$data), 4)
})
