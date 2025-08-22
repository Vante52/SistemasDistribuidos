#!/usr/bin/perl
#**************************************************************
#         		Pontificia Universidad Javeriana
#     Autor: Valeria Catalina Caycedo Ramírez
#     Fecha: 15 de agosto
#     Materia: Intro. Distribuidos
#     Tema: Taller de EvaluaciÃ³n de Rendimiento
#     Fichero: script automatizaciÃ³n ejecuciÃ³n por lotes 
#****************************************************************/
#guarda en dónde está el archivo para guardar en el mismo lugar los archivos generados
$Path = `pwd`;
chomp($Path);
#le coloca el nombre al ejecutable
$Nombre_Ejecutable = "mmClasicaOpenMP";
#Tamaño de la matriz
@Size_Matriz = ("200","600","1500","8000", "9000", "10000","11000", "15000","20000", "19000", "5000", "3000");
#cantidad de hilos
@Num_Hilos = (1,2,4,8,16,20);
#cantidad de veces que se hacen los calculos
$Repeticiones = 30;
#por cada tamaño de la matriz y por cada hilo, se ejecuta y se repite el número de repeticiones
foreach $size (@Size_Matriz){
	foreach $hilo (@Num_Hilos) {
		$file = "$Path/$Nombre_Ejecutable-".$size."-Hilos-".$hilo.".dat";
		for ($i=0; $i<$Repeticiones; $i++) {
			#guarda en un archivo en el mismo fichero en el que uno está
			system("$Path/$Nombre_Ejecutable $size $hilo  >> $file");
			printf("$Path/$Nombre_Ejecutable $size $hilo \n");
		}
		close($file);
	$p=$p+1;
	}
}
