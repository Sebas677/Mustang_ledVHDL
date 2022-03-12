# Mustang_ledVHDL
Usando una máquina de estados de Moore, se creó un secuenciador de luces traseras de un Ford-Mustang.

Condiciones:

Este diseño usará como entradas la señal de vuelta izquierda, derecha, intermitentes.
La señal de luces intermitentes tiene prioridad sobre las direccionales, esto significa que si ambas señales (intermitentes y alguna direccional) son seleccionadas a la vez, las luces deberán quedar encendiendo y apagando de forma intermitente.
Una vez que la direccional comience su rutina, ésta tendrá que terminar hasta que todas las luces estén apagadas.
Las luces traseras cambiarán 1 vez por segundo.
Las dos direccionales no pueden estar seleccionadas al mismo tiempo.

IDEA: a pesar de que un auto esté apagado se pueden encender las luces intermitentes más no las direccionales. Es por ello que si todos los switches están en '0' y se activa el sw1, se encienden unas intermitenes bajas. En caso de activar el sw9 es como si se encendiera el coche, por lo que las luces de contorno se mantienen encendidas. Posteriormente y manteniendo activo en alto el sw9 se pueden usar el sw2 (direccional izquierda), sw1 (intermitentes altas) y sw0 (direccional derecha).

Funcionamiento de switches:
SW9: ENCIENDE "VEHICULO" Y PRENDE LUCES DE CONTORNO
SW3: RESET QUE APAGA LAS LUCES SIN IMPORTAR LA RUTINA (ESTADO)
SW2: ACTIVA VUELTA A LA IZQUIERDA
SW1: ACTIVA INTERMITENTES BAJAS Y ALTAS
SW0: ACTIVA VUELTA A LA DERECHA


Liga al video de funcionamiento:

https://drive.google.com/file/d/1ojW2FNOppcrTRFzw-O_RJWj_WsoSow6W/view?usp=sharing
