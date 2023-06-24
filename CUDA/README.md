## Tercer Taller - Grupo3: Wilmer Farfán y Fabian Sánchez

Los tres códigos presentados utilizan diferentes tecnologías para paralelizar el cálculo de la suma de los primeros n números naturales. A continuación, se analizarán las diferencias entre cada enfoque y se discutirá cuál podría considerarse mejor en función de ciertos criterios.

#### **OpenMP:**
OpenMP es una API (Interfaz de Programación de Aplicaciones) para programación paralela en la memoria compartida, es una alternativa fácil de usar y es más eficiente en sistemas con múltiples núcleos de CPU.

#### **MPI (Message Passing Interface):**
MPI es una biblioteca de comunicación utilizada para programación paralela en sistemas distribuidos o de memoria distribuida. Se divide el trabajo en rangos de datos para que cada proceso realice una parte del cálculo. MPI es adecuado para sistemas distribuidos y permite una escalabilidad eficiente en grandes clústeres.

#### **CUDA:**
CUDA es una plataforma de programación paralela para computación en GPU (Unidad de Procesamiento Gráfico). Es especialmente pensado para aplicaciones que se pueden acelerar mediante el paralelismo masivo ofrecido por las GPU y por tanto, requiere de una GPU compatible con CUDA para ejecutar el código. Esta solución puede ser más compleja de programar a comparación de las soluciones basadas en CPU.

En cuanto a cuál de las anteriores herramientas es mejor, su elección depende del contexto y los recursos disponibles:
- Si se dispone de un sistema con múltiples núcleos de CPU y no se requiere una distribución en clúster, la opción de OpenMP puede ser la más sencilla y eficiente.
- Si se trabaja con un sistema distribuido, como un clúster, donde los procesos deben comunicarse entre sí, MPI es una elección adecuada y escalable.
- Si se dispone de una GPU compatible con CUDA y la aplicación es altamente paralela y adecuada para la aceleración de GPU, la opción de CUDA puede ofrecer el mayor rendimiento.

De acuerdo con los tiempos de ejecución en segundos, se obtuvieron los siguientes valores: 
| Comparativa | OpenMP | MPI | CUDA |
| summaSimple |0.005825|3.721245|0.120000|




