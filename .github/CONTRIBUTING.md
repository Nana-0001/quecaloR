# Cómo contribuir a quecaloR

¡Gracias por tu interés en contribuir! Toda ayuda es bienvenida: reportar
errores, sugerir mejoras, mejorar la documentación o proponer nuevas funciones.

## Reportar un error o hacer una pregunta

- Antes de empezar, buscá en los [issues](https://github.com/Nana-0001/quecaloR/issues)
  si alguien ya lo reportó.
- Si no, abrí un issue nuevo. Incluí un ejemplo mínimo que reproduzca el
  problema, el resultado que esperabas y el que obtuviste.

## Proponer cambios

1. Hacé un fork del repositorio y clonalo en tu computadora.
2. Creá una rama nueva para tu cambio.
3. Cargá el paquete con `devtools::load_all()`.
4. Si cambiás una función, actualizá su documentación y corré
   `devtools::document()`.
5. Agregá tests con `testthat` y corré `devtools::test()` y `devtools::check()`.
6. Hacé commits pequeños con mensajes claros y abrí un pull request que
   explique qué cambia y por qué.

## Estilo

Usamos español para los nombres de funciones, argumentos, mensajes y
documentación, y `snake_case` para los nombres.

## Código de conducta

Al participar en este proyecto aceptás respetar nuestro
[código de conducta](../CODE_OF_CONDUCT.md).
