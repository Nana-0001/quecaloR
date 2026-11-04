test_that("tabla_resumen_temperatura calcula promedio y desvio por estacion", {
  datos <- data.frame(
    id = c("A", "A", "B", "B"),
    temperatura_abrigo_150cm = c(10, 20, 30, 50)
  )
  resultado <- tabla_resumen_temperatura(datos)

  expect_s3_class(resultado, "data.frame")
  expect_equal(names(resultado), c("id", "estadistico", "valor"))
  expect_equal(nrow(resultado), 4)
  expect_equal(
    resultado$valor[resultado$id == "A" & resultado$estadistico == "promedio"],
    15
  )
})

test_that("tabla_resumen_temperatura falla con entradas incorrectas", {
  expect_error(tabla_resumen_temperatura("hola"))
  expect_error(tabla_resumen_temperatura(data.frame(x = 1)))
})
