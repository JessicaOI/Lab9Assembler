.text
.align 2
.global main
.func main

msg1: .asciz "Ingrese un numero de 0 a 9999:\n"
string: .asciz "                             "
enter: 	.asciz "\n"
strLen: .word 0
strNumVal: .word 0
testNum: .word 9
unchar: .asciz "  "

main:

	ldr r0,=bienvenido
	mov r1,r5
	bl printf

	ldr r0,=seleccione
	mov r1,r5
	bl printf

	ldr r0,=suma
	mov r1,r5
	bl printf

	ldr r0,=multi
	mov r1,r5
	bl printf

	ldr r0,=potencia
	mov r1,r5
	bl printf

	ldr r0,=resultado
	mov r1,r5
	bl printf

	ldr r0,=primera
	mov r1,r5
	bl printf

	ldr r0,=segunda
	mov r1,r5
	bl printf

	ldr r0,=concatener
	mov r1,r5
	bl printf

	ldr r0,=despedida
	mov r1,r5
	bl printf

	//Cargo en r0 puntero donde guardare los chars ingresados
   ldr r0,=string
   bl _keybread

   //Imprimo la cadena anterior
   ldr r1,=string
   bl _print

   //Convierto un string de digito a numero
   ldr r0,=string
   ldr r1,=strNumVal
   bl _char2Num

	/* valor1 */
	ldr r0,=valor1
	ldr r1,[r0]

	ldr r0,=valor2
	ldr r2,[r0]

	add r3,r1,r2

	ldr r0,=suma
	str r3,[r0]

	ldr r0,= formato
	mov r1,r3
	bl printf

	/* salida correcta*/
	mov r0, #0
	mov r3, #0
	ldmfd sp!, {lr} /*R13 = SP*/
	bx lr

.data
.align 2
formato:
	.asciz "La suma es %d\n"
valor1:
	.word 0
valor2:
	.word 0
sumaR:
	.word 0

bienvenido:
	.asciz "*-----------------------------Bienvenido a la calculadora------------------------*"

seleccione:
	.asciz "Seleccione operacion a realizar"

suma:
	.asciz "+ Suma\n"
multi:
	.asciz "* Multiplicacion\n"
modulo:
	.asciz "M Modulo\n"
potencia:
	.asciz "P Potencia de un numero\n"
resultado:
	.asciz "= Mostrar el resultado almacenado\n"
primera:
	.asciz "1 Ingresar primera cadena de caracteres"
segunda:
	.asciz "2 Ingresar segunda cadena de caracteres"
concatener:
	.asciz "C Concatenar cadenas de caracteres 1 y 2"
despedida:
	.asciz "q Mostrar mensaje de despedida y salir al sistema operativo"


