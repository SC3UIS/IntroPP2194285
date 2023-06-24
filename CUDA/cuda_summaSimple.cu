// From https://www.programiz.com/c-programming/c-for-loop 
// Modified by Fabian Sanchez and Wilmer Farfan for learning purposes 2023
// Simple Program to calculate the sum of first n natural numbers parallelized with CUDA
// Positive integers 1,2,3...n are known as natural numbers

#include <stdio.h>
#include <time.h>

// Incluir la biblioteca de CUDA
#include <cuda_runtime.h>
// Definir la función de kernel
__global__ void sumNumbers(int *sum, int num)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (idx <= num)
    {
        atomicAdd(sum, idx);
    }
}
int main()
{
    int num, sum = 0;
    int *d_sum; // Puntero para la suma en el dispositivo

    // Contabilizar el tiempo    
    clock_t startTime, endTime;
  
    // Se empieza a contabilizar el tiempo
    startTime = clock();
    
    printf("\nSuma de los primeros n numeros naturales (Paralelizado con CUDA)\n");
    printf("Ingrese un Entero Positivo: ");
    scanf("%d", &num);

    // Reservar memoria en el dispositivo para la suma
    cudaMalloc((void **)&d_sum, sizeof(int));
    // Copiar la suma inicial al dispositivo
    cudaMemcpy(d_sum, &sum, sizeof(int), cudaMemcpyHostToDevice);

    // Definir el tamaño de los bloques y la cantidad de bloques
    int blockSize = 256;
    int gridSize = (num + blockSize - 1) / blockSize;

    // Lanzar el kernel en la GPU
    sumNumbers<<<gridSize, blockSize>>>(d_sum, num);

    // Copiar la suma resultante desde el dispositivo al host
    cudaMemcpy(&sum, d_sum, sizeof(int), cudaMemcpyDeviceToHost);

    // Liberar memoria en el dispositivo
    cudaFree(d_sum);

    // Se termina de contabilizar el tiempo
    endTime = clock(); 

    printf("Suma Total = %d\n", sum);    
    printf("La ejecucion tardo %lf segundos\n", (double)(endTime - startTime) / CLOCKS_PER_SEC);

    return 0;
}
