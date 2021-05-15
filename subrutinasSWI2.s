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
recibe: .asciz "Ingrese un numero"
msgerror: .asciz "Porfavor ingrese una opcion valida"
formato: .asciz "%d"
formatoS: .asciz "%s"
resultadoOp: .asciz "El resultado de la operacion es: %d \n"
resultadoA: .asciz "El resultado actual es: %d\n"
formatoC: .asciz "Concatenando la cadena da: "
msgbye: .asciz "Bye Bye ~ "
msg: .asciz "Ingrese una palabra: "
cadena1: .asciz "                   "
cadena2: .asciz "                   "
espacio: .asciz " "
salto: .asciz "\n"
resultado: .asciz "Valor 1 es:  %d \n"
resultado2: .asciz "Valor 2 es:  %d \n"

.text
.align 2

.global recibeValores

recibeValores:
	
	push {lr}
	//el usuario ingresa los valores
	ig:
	ldr r0,=recibe
	bl puts
	ldr r0,=formato                                    
	ldr r1,=valor2                                    
	bl scanf
	
	//..Programacion defensiva (Revisa que el numero ingresado sea correcto)..//
	cmp r0,#0
	bne valida
	bl getchar	//se utiliza para que el programa lea (enter) para continuar
	ldr r0,=msgerror
	bl puts
	mov r5, #0
	ldr r5,=valor2
	b ig
	
	valida: 
		ldr r5,=valor2
		ldr r5, [r5]
	pop {lr}
	mov pc, lr

	//------------------

.global mostrarValores
mostrarValores:

	push {lr}
	ldr r0,=resultado			//muestra el valor definidio al inicio del programa
	mov r1, r6
	bl printf
	ldr r0,=resultado2			//muestra el valor ingresado por el usuario
	mov r1, r5
	bl printf
	pop {lr}
	mov pc, lr
	
//..Suma..//

.global suma
suma:

	push {lr}
	bl recibeValores
	bl mostrarValores
	//..Proceso..//
	add r6, r6,r5				//suma el numero 1 con el numero ingresado
	ldr r0,=resultadoOp
	mov r1, r6
	bl printf
	//..Retorno..//
	pop {lr}
	mov pc, lr

//..Multiplicacion..//

.global multiplicacion
multiplicacion:

	push {lr}
	bl recibeValores
	bl mostrarValores
	//..Proceso..//
	mul r6, r6,r5				//se multiplicara el numero 1 con el numero ingresado por el usuario
	ldr r0,=resultadoOp
	mov r1, r6
	bl printf
	//..Retorno..//
	pop {lr}
	mov pc, lr

//..Modulo..//
.global modulo
modulo:
	push {lr}
	bl recibeValores
	bl mostrarValores
	//..Proceso..//
	mov r7, #0
	mov r8, r6			//se mueve el valor de r6 a r8 para usarlo despues
	div: 
		cmp r5, r6		//revisa si el divisor es mayor al dividendo
		bgt mod			//Si lo es, se dirije a mod
		sub r6, r5		//Si no lo es, resta al dividendo el valor del divisor
		add r7, #1
		b div			//reinicia el ciclo div
	mod:
		mul r5, r5, r7	//multiplica el coeficiente resultante por el divisor
		mov r6, r8		//se usar el valor guardado en r8
		sub r6, r5		
		ldr r0,=resultadoOp
		mov r1, r6
		bl printf
		
	pop {lr}
	mov pc, lr

//..Potencia..//
.global potencia
potencia:
	push {lr}
	bl recibeValores
	bl mostrarValores
	//..Proceso..//
	mov r7,#1
	mov r8, r6					//se mueve el valor de r6 a r8 para usarlo despues
	contpotencia:			//loop potencia
		add r7, #1				//+1 al contador
		mul r6, r8				//multiplica r6, por el valor en r8
		cmp r7, r5				//revisa si se termina el loop o se reinicia
		beq salir
		b contpotencia
	//..Retorno..//
	salir:
		ldr r0,=resultadoOp		//muestra el resultado 
		mov r1, r6
		bl printf
		pop {lr}
		mov pc, lr

//..Muestra el resultado actual..//
.global resultado
resultado:
	push {lr}
	ldr r0,=resultadoA		//muestra el valor almacenado actualmente en r6
	mov r1, r6
	bl printf
	pop {lr}
	mov pc, lr

//..Cadena 1..//
.global Cadena1
Cadena1:
	push {lr}
	
	ldr r0,= msg
	bl puts
	
	ldr r0,=formatoS		//le pide al usuario que ingrese una cadena
	ldr r1,=cadena1
	bl scanf
	
	ldr r8,=cadena1				//guarda en r8 para luego imprimirla
	
	pop {lr}
	mov pc, lr

//..Cadena 2..//	
.global Cadena2
Cadena2:
	push {lr}
	
	ldr r0,= msg
	bl puts
	
	ldr r0,=formatoS			//le pide al usuario que ingrese una cadena
	ldr r1,=cadena2
	bl scanf
	
	ldr r9,=cadena2					//guarda en r9 para luego imprimirla
	
	pop {lr}
	mov pc, lr

//..Concatenacion de datos..//
.global CCadenas
CCadenas:
	push {lr}
	
	ldr r0,=formatoC
	bl puts
	
	ldr r0,=cadena1			//muestra la primera cadena
	bl printf
	ldr r0,=espacio			//muestra un espacio
	bl printf
	ldr r0,=cadena2			//muestra la segunda cadena
	bl printf
	ldr r0,=salto			//muestra un salto de linea
	bl printf
	
	pop {lr}
	mov pc, lr
	
	
//..Mensaje de despedida..//
.global adios
adios:
	push {lr}
	ldr r0,=msgbye			//muestra un mensaje de salida
	bl puts
	pop {lr}
	mov pc, lr

