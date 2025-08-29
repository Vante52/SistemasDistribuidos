# Multiplicación de Matrices Clásica con OpenMP

Proyecto académico para medir rendimiento del **algoritmo clásico de multiplicación de matrices** (triple bucle `i-j-k`) paralelizado con **OpenMP**.

El programa principal (`mmClasicaOpenMP`) recibe el **tamaño de la matriz cuadrada** y el **número de hilos** a usar. Mide el **tiempo de cómputo** con `gettimeofday` y lo imprime en **microsegundos**.

---

## ¿Qué hace?

- Genera tres matrices cuadradas \\(N \\times N\\): `A`, `B`, `C`.
- (Intención) Inicializa `A` y `B` con valores aleatorios y calcula `C = A × B`.
- Paraleliza los bucles con OpenMP (`#pragma omp parallel` + `#pragma omp for`).
- Imprime:
  - Las matrices si \\(N < 9\\) (modo “debug/inspección”).
  - **El tiempo total** del producto en **microsegundos** (una sola línea).
---

## Compilación

Para ejecutar el Makefile en donde se encuentran las reglas para la compilación

```bash
make
```
En caso de querer hacerlo de manera manual y directamente con gcc
```bash
gcc -O3 -fopenmp mmClasicaOpenMP.c -o mmClasicaOpenMP -lm
```
## Ejecución manual
Para una matriz 2000x2000 con 8 hilos

```bash
./mmClasicaOpenMP 2000 8
```
Para una matriz 6000x6000 con 16 hilos

```bash
./mmClasicaOpenMP 6000 16
```
## Ejecución por lotes (Perl)
Hay un script en Perl para automatizar barridos de tamaños y número de hilos, guardando resultados en archivos .dat.

En este segmento del lanzador se configuran los tamaños de la matriz (```@Size_Matriz```), el número de hilos (```@Num_Hilos```) y la cantidad de repeticiones (```$Repeticiones```) para obtener diferentes métricas que generará los archivos .dat.

```
@Size_Matriz = ("200","600","1500","3000","5000","8000","9000","10000","11000","15000","19000","20000");
@Num_Hilos   = (1,2,4,8,16,20);
$Repeticiones = 30;
```
y para correrlo: 
```bash
chmod +x correr_lotes.pl
./correr_lotes.pl
```
Los datos obtenidos de la anterior configuración se pueden detallar en la carpeta de ```datos```.
