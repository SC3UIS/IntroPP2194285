#!/bin/bash
#SBATCH --partition=normal
#SBATCH --job-name=CUDA

#SBATCH --output=output_summaSimple.txt%j.out
#SBATCH --partition=normal
#SBATCH --gres=gpu:1

# Cargar Modulos
module load devtools/cuda/8.0

# Se compila el archivo "cuda_summaSimple.cu" y se genera el ejecutable "cuda_summaSimple"
nvcc cuda_summaSimple.cu -o cuda_summaSimple

# Ejecución del programa, ingresando el número 245 como entrada y exportando la salida a un archivo de texto
echo "245" | ./cuda_summaSimple >>  output_summaSimple.txt
