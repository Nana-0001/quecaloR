test_that("leer_estacion lee un archivo que ya existe", {
  ruta <- tempfile(fileext = ".csv")
  write.csv(
    data.frame(id = "NH0437", fecha = "2020-01-01", x = 1),
    ruta,
    row.names = FALSE
  )

  resultado <- suppressMessages(leer_estacion("NH0437", ruta))

  expect_s3_class(resultado, "data.frame")
  expect_equal(nrow(resultado), 1)
})

test_that("leer_estacion falla si el id no es texto", {
  expect_error(leer_estacion(123, tempfile(fileext = ".csv")))
})

test_that("leer_estacion descarga el archivo si no existe", {
  skip_if_offline()
  ruta <- tempfile(fileext = ".csv")

  resultado <- suppressMessages(leer_estacion("NH0437", ruta))

  expect_true(file.exists(ruta))
  expect_s3_class(resultado, "data.frame")
})
