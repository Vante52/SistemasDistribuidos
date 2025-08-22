/*#######################################################################################
 #* Fecha: 15 de agosto
 #* Autor: Valeria Catalina Caycedo Ramirez
 #* Tema: Taller 1
 #* 	- Programa Multiplicación de Matrices algoritmo clásico
 #* 	- Paralelismo con OpenMP
######################################################################################*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <sys/time.h>
#include <omp.h>

//crea una estructura que consta del tiempo inicio y final
struct timeval inicio, fin; 
//función que obtiene la hora de inicio de la muestra
void InicioMuestra(){
	gettimeofday(&inicio, (void *)0);
}
//Función que con la hora de inicio y fin del cálculo, calcula el tiempo que tardó en ejecutarse
void FinMuestra(){
	gettimeofday(&fin, (void *)0);
	fin.tv_usec -= inicio.tv_usec;
	fin.tv_sec  -= inicio.tv_sec;
	double tiempo = (double) (fin.tv_sec*1000000 + fin.tv_usec); 
	printf("%9.0f \n", tiempo);
}
//Función encargada de imprimir la matriz siempre y cuando su tamaño sea menor a 9*9
void impMatrix(double *matrix, int D){
	printf("\n");
	if(D < 9){
		for(int i=0; i<D*D; i++){
			if(i%D==0) printf("\n");
			printf("%f ", matrix[i]);
		}
		printf("\n**-----------------------------**\n");
	}
}
// Llena la matriz del tamaño seleccionado y la llena de números random double entre 0 y 100
void iniMatrix(double *m1, double *m2, int D){
	for(int i=0; i<D*D; i++, m1++, m2++){
		(double) (rand()%100);	
		(double) (rand()%100);	
	}
}
// calcula el producto de la matriz
void multiMatrix(double *mA, double *mB, double *mC, int D){
	double Suma, *pA, *pB;
	#pragma omp parallel
	{
	#pragma omp for
	for(int i=0; i<D; i++){
		for(int j=0; j<D; j++){
			//el producto punto a punto
			pA = mA+i*D;	
			pB = mB+(j*D);	
			Suma = 0.0;
			//calcula la suma de cada uno de los puntos de la matriz que genera el producto
			for(int k=0; k<D; k++, pA++, pB+=D){
				Suma += *pA * *pB;
			}
			//almacena la suma
			mC[i*D+j] = Suma;
		}
	}
	}
}
// main que en caso de que los argumentos para correr el programa no sean suficientes, manda el mensaje de los parametros requeridos
int main(int argc, char *argv[]){
	if(argc < 3){
		printf("\n Use: $./clasicaOpenMP SIZE Hilos \n\n");
		exit(0);
	}

	//pasa la entrada a enteros en caso de que no esté en enteros
	int N = atoi(argv[1]);
	int TH = atoi(argv[2]);
	//genera la matriz con los tamaños que se especificaron
	double *matrixA  = (double *)calloc(N*N, sizeof(double));
	double *matrixB  = (double *)calloc(N*N, sizeof(double));
	double *matrixC  = (double *)calloc(N*N, sizeof(double));
	srand(time(NULL));
	//crea los hilos con el número de hilos seleccionado por parametro
	omp_set_num_threads(TH);
	//Llamado de ls funciones
	iniMatrix(matrixA, matrixB, N);

	impMatrix(matrixA, N);
	impMatrix(matrixB, N);

	InicioMuestra();
	multiMatrix(matrixA, matrixB, matrixC, N);
	FinMuestra();

	impMatrix(matrixC, N);

	/*Liberación de Memoria*/
	free(matrixA);
	free(matrixB);
	free(matrixC);
	
	return 0;
}
