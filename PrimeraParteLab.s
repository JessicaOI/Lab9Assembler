/*
*----------------------------------------
* Laboratorio #8
* ---------------------------------------
* CC3054 - Organización de computadoras y Assembler
* Andrea Lam , 20102
* Jessica Ortiz, 20192
* ---------------------------------------*/


/* VARIABLES */

msg: .asciz "Sea bienvenido a la simulacion de la calculadora \n	+		Suma\n	*		Multiplicacion\n	M		modulo\n	P		potencia\n	=		resultado guardado\n	1		primera cadena de caracteres\n	2		segunda cadena de caracteres\n	C		Concatenar cadenas asignadas anteriormente\n	q		Salir\n "
msgnumero: .asciz "Ingrese un numero porfavor"
msgerror: .asciz "Porfavor, ingrese una opcion valida"
msgopcion: .asciz " \n Eliga una opcion "
formato1: .asciz "%c"
formato2: .asciz "%d"
input: .word 0

//

.text
.align 2
.global main
.type main,%function

//main


main:
	stmfd sp!, {lr}	/* SP = R13 link register */
	mov r6, #16
	ldr r0,=msg
	bl printf

/* Pedir los datos al usuario  */
ingValores:
	mov r1, #0
	ldr r5,=input //se guarda el valor en r5
	str r1, [r5]
	mov r5, #0			
	ldr r0,=msgopcion //muestra el mensaje de que opcion desea realizar
	bl puts
	ldr r0,=formato1 //Scan para guardar la opcion 
	ldr r1,=input // se guarda la opcion en el input
	bl scanf
	ldr r5,=input //el valor se guarda en r4
	ldrb r5,[r5]	
	
/* Verificar si ingreso una opcion viable */

	/* suma  */
	
	cmp r5,#'+'			//-----Suma
	bne vmulti
	bl suma
	b retorno


/* multiplicacion */
vmulti:
	cmp r5,#'*'			
	bne vmodulo
	bl multiplicacion
	b retorno

/* modulo */
vmodulo:
	cmp r5,#'M'			
	bne vpotencia
	bl modulo
	b retorno
	
/* potencia */
vpotencia:
	cmp r5,#'P'			
	bne vigual
	bl potencia
	b retorno
	
/* igual */
vigual:
	cmp r5,#'='			
	bne verc1
	bl resultado
	b retorno

/* para pedir la cadena de datos */
verc1:
	cmp r5,#'1'			
	bne verc2
	bl Cadena1
	b retorno
	
/* para pedir la segunda cadena de datos  */
verc2:
	cmp r5,#'2'			
	bne verC
	bl Cadena2
	b retorno
	
/* Esto concatena los strings */
verC:
	cmp r5,#'C'			
	bne vers
	bl CCadenas
	b retorno
	
/* Mensaje de salida */
vers:
	cmp r5,#'q'			
	bne verror
	bl adios
	b fin

/* Mensaje de error */
verror:
	ldr r0,=error
	bl printf

/* El retorno de los datos */
retorno:
		bl getchar
		b ingValores

	
	/* Verifica la salida correcta de los datos */	
	fin:
		mov r3,#0
		mov r0,#0
		ldmfd sp!,{lr}
		bx lr

	
	

