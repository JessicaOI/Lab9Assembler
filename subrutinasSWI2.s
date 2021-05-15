/* ***************************************************************** 
   subrutinasSWI2.s
   
   Uso de registros:
   r0: envio de parametros para subrutinas promedio, printf, scanf, puts
   r1: envio de parametros para subrutinas promedio, printf, scanf
   ***************************************************************** */
   
.data
.align 2
valor1: .word 0
valor2: .word 0
msg: .asciz "Ingrese un numero"
,sgerror: -asciz "Porfavor ingrese una opcion valida"
formato: .asciz "%d"
formato2: .asciz "%s"
formato3: .asciz "El resultado de la operacion es: %d \n"
formato4: .asciz "Concatenando la cadena da: "
msgbye: ,asciz "Bye Bye ~ "
msg2: .asciz "Ingrese una palabra: "
cadena1: .asciz "                   "
cadena2: .asciz "                   "
espacio: .asciz " "
salto: .asciz "\n"
resultado: .asciz "Valor 1 es:  %d \n"
resultado2: .asciz "Valor 2 es:  %d \n"

.text
.align 2
