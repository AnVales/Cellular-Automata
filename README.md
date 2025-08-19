# 🐞✨ Simulación de luciérnagas parpadeantes

Este proyecto implementa un autómata celular para estudiar cómo luciérnagas coordinan sus destellos de luz en el espacio. 🌌💡

Se basa en un modelo simple donde cada luciérnaga puede estar encendida (1) o apagada (0), y su comportamiento depende del estado de sus vecinos y de su nivel de influenciabilidad.

## 🔹 Conceptos clave

Estado de la luciérnaga

0: apagada ⚪

1: parpadeando ⚫

Influenciabilidad (th)

Determina qué tan probable es que una luciérnaga cambie su estado si sus vecinos están parpadeando. 🎯

Vecinos

Cada luciérnaga observa a sus 8 vecinos más cercanos (arriba, abajo, izquierda, derecha y diagonales) 🧩

Cambia su estado según la mediana del grupo (mayoría).

Coordinación

Las luciérnagas tienden a sincronizar sus parpadeos formando clusters visibles en la matriz. 🌟

## ⚙️ Cómo funciona la simulación

Inicialización

Creamos una matriz espacial de 25×25 donde ubicamos las luciérnagas de forma aleatoria. 🎲

Cada luciérnaga tiene un estado inicial (0 o 1).

Iteraciones en el tiempo

Para cada paso de tiempo (t de 1 a 50):

Se actualiza el estado de cada luciérnaga según los vecinos y su influenciabilidad. 🔄

Se muestra la matriz usando colores: blanco ⚪ = apagada, negro ⚫ = parpadeando.

Se puede observar la formación de patrones y clusters de coordinación.

Reglas principales

Si la mayoría de los vecinos parpadean y la luciérnaga es influenciable, puede cambiar su estado. 🔄

Esto simula cómo las luciérnagas sincronizan sus destellos en la naturaleza. 🌌

## 📊 Observaciones

Pocos individuos → riesgo de que el grupo se extinga 🐞💨

Muchos individuos → formación de clusters sincronizados 🐞🐞🐞

La influenciabilidad (th) controla qué tan rápido se sincronizan los flashes ⚡

## 🏃‍♂️ Cómo ejecutar

Instala la librería necesaria:

install.packages("plot.matrix")


Ejecuta el script:

source("fireflies.R")


Presiona Enter para avanzar en cada paso de tiempo y observar la coordinación en acción. ⏳

## 🌟 Extensiones posibles

Modificar el tamaño de la matriz y el número de luciérnagas 🧮

Ajustar el parámetro th para estudiar sincronización rápida o lenta ⚡🐌

Visualizar clusters usando otros colores o animaciones 🎨
