// This program was cloned from: https://github.com/jrpompio/Circuitos-Digitales-II
// License: MIT License

/**************************************************************************//**
 * @file AutomatedTellerMachine.v
 * @brief Tarea03 de Circuitos Digitales II - Controlador de cajero automatico
 * 
 * Estudiante: Junior Ruiz Sánchez
 * Carnet: B97206
 * Mediante la implementación de una máquina de estados este controlador
 * gestiona todo lo relacionado las operaciones de un cajero automatico
 * como lo pueden ser autentificación, depositos y retiros.
 *
 *****************************************************************************/

/**************************************************************************//**
 * @brief Controlador de cajero automatico
 *****************************************************************************/
module ATM (/*AUTOARG*/
   // Outputs
   BALANCE_ACTUALIZADO, ENTREGAR_DINERO, FONDOS_INSUFICIENTES,
   PIN_INCORRECTO, ADVERTENCIA, BLOQUEO,
   // Inputs
   clk, reset, TARJETA_RECIBIDA, PIN, DIGITO, DIGITO_STB, TIPO_TRANS,
   MONTO, MONTO_STB
   );

/* Se procederá a declarar las entradas usando input para cada una de ellas
 * debido a que estoy probado si puedo lograr documentar con Doxygen, 
 * lo mismo para outputs y regs.
 * Aún no estoy seguro si es la manera correcta, si encuento una mejor manera
 * lo cambiaré
 */

/******************************************************************************
 *     DECLARACIÓN DE ENTRADAS, SALIDAS y REGISTROS INTERNOS.
 *****************************************************************************/

input clk;                 /**< Señal de reloj para sinconizar el modulo */

input reset;               /**< Señal de reinicio, reinicia en reset = 0 */

input TARJETA_RECIBIDA;    /**< Señal de entraba binaria que indica si se ha
                                introducido una tarjeta valida*/

input [15:0] PIN;          /**< Entrada de 16 bits donde cada grupo de 4 bits 
                                representa un digito del PIN de la tarjeta que
                                se recibió*/

input [3:0] DIGITO;        /**< Entrada de 4 bits que representa el último 
                                dígito tecleado por el usuario, mantiene 
                                su valor anterior hasta que se preciona
                                la tecla siguiente*/

input DIGITO_STB;          /**< Señal de entrada que se pone en 1 durante
                                un solo ciclo de reloj, cuando se preciona
                                un botón del teclado. La lectura de PIN se debe
                                comparar con los valores de entrada DIGITO
                                cuando DIGITO_STB=1*/

input TIPO_TRANS;          /**< Entrada binaria que indica el tipo de
                                transacción.
                                TIPO_TRANS=0 --> depósito
                                TIPO_TRANS=1 --> retiro     */

input [31:0] MONTO;        /**< Entrada de 32 bits que representa el monto
                                de la transacción expresado en binario*/

input MONTO_STB;           /**< Señal de entrada que se pone en 1 durante un
                                solo ciclo de reloj, cuando se ha actualizado
                                el valor del MONTO a través del teclado*/

reg [63:0] BALANCE;        /**< Registro interno de 64 bits que representa
                                el balance existente en la cuenta usuario */

reg [1:0] INTENTOS;        /**< Registro interno de 2 bits que representa la 
                                cantidad de intentos usados por el usuario
                                al introducir el PIN de su tarjeta.
                                2 intentos --> enciende ADVERTENCIA
                                3 intentos --> enciende BLOQUEO */

reg [1:0] nextINTENTOS;    /*   Registro para gestión de cantidad de intentos*/

reg PIN_CORRECTO;          /**< Registro interno que tiene valor 1 cuando la 
                                validación de PIN es correcta. */
output reg 
BALANCE_ACTUALIZADO;       /**< Salida de un bit para indicar que una
                                transacción fue exitosa y que se actualizó el
                                balance en la cuenta, tanto para depósitos como
                                para retiros.*/
output reg
ENTREGAR_DINERO;           /**< Salida de un bit para indicarle al cajero que
                                entregue el monto durante una transacción de
                                retiro */
output reg
FONDOS_INSUFICIENTES;      /**< Señal de alerta cuando, durante un retiro,
                                el valor de BALANCE es menor que el valor
                                de MONTO  */
output reg
PIN_INCORRECTO;            /**< Señal que indica que el valor del PIN recibido
                                a través del teclado es distinto del PIN de
                                la tarjeta especificado en la entrada PIN*/

output reg
ADVERTENCIA;               /**< Salida binaria que se enciende cuando el
                                usuario ha introducido el PIN de forma
                                incorrecta dos veces  */
output reg
BLOQUEO;                    /**< Salida binaria que se enciende cuando el 
                                usuario ha introducido el pin de forma
                                incorrecta tres veces */

/******************************************************************************
 *             Uso de parametros para definir estados 
 *   y declaración de registros para gestionar estado actual y futuro
 *****************************************************************************/

parameter standby    = 5'b1;
parameter validacion = 5'b10;
parameter deposito   = 5'b100;
parameter retiro     = 5'b1000;
parameter bloqueo    = 5'b10000;

reg [4:0] state;
reg [4:0] nextState;

/******************************************************************************
 *                          Comportamientos
 *****************************************************************************/

always @(posedge clk) begin
  if (!reset) begin 
    state <= standby;
    INTENTOS <= 2'b0;
    BALANCE_ACTUALIZADO <= 1'b0;
    ENTREGAR_DINERO <= 1'b0;
    PIN_INCORRECTO <= 1'b0;
    ADVERTENCIA <= 1'b0;
    BLOQUEO <= 1'b0;
    FONDOS_INSUFICIENTES <= 1'b0;
  end else begin
    state <= nextState;
    INTENTOS <= nextINTENTOS;
  end
end

always @(*) begin
  nextState = state;
  nextINTENTOS = INTENTOS;
  case(state)
    
    standby: if (TARJETA_RECIBIDA) nextState = validacion;
    validacion: begin
                  if (PIN_CORRECTO && ~TIPO_TRANS) nextState = deposito;
                  if (PIN_CORRECTO && TIPO_TRANS) nextState = retiro;
                  if (INTENTOS == 2'b11) nextState = bloqueo;
                end
    deposito: if (PIN_CORRECTO) nextState = standby;
    retiro:   if (PIN_CORRECTO) nextState = standby;
    bloqueo:  if (PIN_CORRECTO) nextState = standby;
    default: nextState = standby;

  endcase

end

endmodule 
