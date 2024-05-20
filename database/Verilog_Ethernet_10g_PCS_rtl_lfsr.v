// This program was cloned from: https://github.com/sofiavalos/Verilog_Ethernet_10g_PCS
// License: MIT License

/*

Copyright (c) 2016-2023 Alex Forencich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

/*
 * Parametrizable combinatorial parallel LFSR/CRC (Linear Feedback Shift Register/Cyclic Redundancy Check)
 */
module lfsr #
(
    // ancho del LFSR
    parameter LFSR_WIDTH = 31,
    // polinomio del LFSR
    parameter LFSR_POLY = 31'h10000001,	// los 31 bits son el grado del polinomio, después los términos 1 y x^y se representan por 1, en este caso: x^31+x^28+1. El término más grande del polinomio (x^31) no se incluye en este parámetro, sino que se genera automáticamente por LFSR_WIDTH
    // LFSR configuracion: "GALOIS", "FIBONACCI" Fibonacci is generally used for linear-feedback shift registers (LFSR) for pseudorandom binary sequence (PRBS) generators, scramblers, and descrambers,
    // while Galois is generally used for cyclic redundancy check generators and checkers.
    parameter LFSR_CONFIG = "FIBONACCI",	// genera secuencias binarias pseudoaleatorias
    // LFSR feed forward enable: habilita el feed forward en vez de feedback (en este caso no está habilitado)
    parameter LFSR_FEED_FORWARD = 0, 		// Enable this for PRBS checking and self- synchronous descrambling.
    // bit-reverse input and output: en este caso no invierte la entrada y salida del LFSR
    parameter REVERSE = 0,	//Shifts MSB first by default, set REVERSE for LSB first.
    // width of data input
    parameter DATA_WIDTH = 8,
    // implementation style: "AUTO", "LOOP", "REDUCTION"
    parameter STYLE = "AUTO"	// selecciona automáticamente el estilo de implementación del LFSR según el entorno de simulación o síntesis
)
(
    input  wire [DATA_WIDTH-1:0] data_in,	// datos de entrada que se desplazarán a través del LFSR
    input  wire [LFSR_WIDTH-1:0] state_in,	// estado actual del LFSR
    output wire [DATA_WIDTH-1:0] data_out,	// datos de salida que representan los bits desplazados fuera del LFSR
    output wire [LFSR_WIDTH-1:0] state_out	// próximo estado del LFSR
);

/*

Fully parametrizable combinatorial parallel LFSR/CRC module.  Implements an unrolled LFSR
next state computation, shifting DATA_WIDTH bits per pass through the module.  Input data
is XORed with LFSR feedback path, tie data_in to zero if this is not required.

Works in two parts: statically computes a set of bit masks, then uses these bit masks to
select bits for XORing to compute the next state.  

Ports:

data_in

Data bits to be shifted through the LFSR (DATA_WIDTH bits)

state_in

LFSR/CRC current state input (LFSR_WIDTH bits)

data_out

Data bits shifted out of LFSR (DATA_WIDTH bits)

state_out

LFSR/CRC next state output (LFSR_WIDTH bits)

Parameters:

LFSR_WIDTH

Specify width of LFSR/CRC register

LFSR_POLY

Specify the LFSR/CRC polynomial in hex format.  For example, the polynomial

x^32 + x^26 + x^23 + x^22 + x^16 + x^12 + x^11 + x^10 + x^8 + x^7 + x^5 + x^4 + x^2 + x + 1

would be represented as

32'h04c11db7

Note that the largest term (x^32) is suppressed.  This term is generated automatically based
on LFSR_WIDTH.

LFSR_CONFIG

Specify the LFSR configuration, either Fibonacci or Galois.  Fibonacci is generally used
for linear-feedback shift registers (LFSR) for pseudorandom binary sequence (PRBS) generators,
scramblers, and descrambers, while Galois is generally used for cyclic redundancy check
generators and checkers.

Fibonacci style (example for 64b66b scrambler, 0x8000000001 = 1+x^39)

   DIN (LSB first) (DIN = Datos de Entrada)
    |
    V
   (+)<---------------------------(+)<-----------------------------.
    |                              ^                               |
    |  .----.  .----.       .----. |  .----.       .----.  .----.  |
    +->|  0 |->|  1 |->...->| 38 |-+->| 39 |->...->| 56 |->| 57 |--'
    |  '----'  '----'       '----'    '----'       '----'  '----'
    V
   DOUT	(DOUT = Datos de salida)

Galois style (example for CRC16, 0x8005 = x^15+x^2+1)

    ,-------------------+-------------------------+----------(+)<-- DIN (MSB first)
    |                   |                         |           ^
    |  .----.  .----.   V   .----.       .----.   V   .----.  |
    `->|  0 |->|  1 |->(+)->|  2 |->...->| 14 |->(+)->| 15 |--+---> DOUT
       '----'  '----'       '----'       '----'       '----'

LFSR_FEED_FORWARD

Generate feed forward instead of feed back LFSR.  Enable this for PRBS checking and self-
synchronous descrambling.

Fibonacci feed-forward style (example for 64b66b descrambler, 0x8000000001)

   DIN (LSB first)
    |
    |  .----.  .----.       .----.    .----.       .----.  .----.
    +->|  0 |->|  1 |->...->| 38 |-+->| 39 |->...->| 56 |->| 57 |--.
    |  '----'  '----'       '----' |  '----'       '----'  '----'  |
    |                              V                               |
   (+)<---------------------------(+)------------------------------'
    |
    V
   DOUT

Galois feed-forward style

    ,-------------------+-------------------------+------------+--- DIN (MSB first)
    |                   |                         |            |
    |  .----.  .----.   V   .----.       .----.   V   .----.   V
    `->|  0 |->|  1 |->(+)->|  2 |->...->| 14 |->(+)->| 15 |->(+)-> DOUT
       '----'  '----'       '----'       '----'       '----'

REVERSE

Bit-reverse LFSR input and output.  Shifts MSB first by default, set REVERSE for LSB first.

DATA_WIDTH

Specify width of input and output data bus.  The module will perform one shift per input
data bit, so if the input data bus is not required tie data_in to zero and set DATA_WIDTH
to the required number of shifts per clock cycle.  

STYLE

Specify implementation style.  Can be "AUTO", "LOOP", or "REDUCTION".  When "AUTO"
is selected, implemenation will be "LOOP" or "REDUCTION" based on synthesis translate
directives.  "REDUCTION" and "LOOP" are functionally identical, however they simulate
and synthesize differently.  "REDUCTION" is implemented with a loop over a Verilog
reduction operator.  "LOOP" is implemented as a doubly-nested loop with no reduction
operator.  "REDUCTION" is very fast for simulation in iverilog and synthesizes well in
Quartus but synthesizes poorly in ISE, likely due to large inferred XOR gates causing
problems with the optimizer.  "LOOP" synthesizes will in both ISE and Quartus.  "AUTO"
will default to "REDUCTION" when simulating and "LOOP" for synthesizers that obey
synthesis translate directives.

Settings for common LFSR/CRC implementations:

Name        Configuration           Length  Polynomial      Initial value   Notes
CRC16-IBM   Galois, bit-reverse     16      16'h8005        16'hffff
CRC16-CCITT Galois                  16      16'h1021        16'h1d0f
CRC32       Galois, bit-reverse     32      32'h04c11db7    32'hffffffff    Ethernet FCS; invert final output
CRC32C      Galois, bit-reverse     32      32'h1edc6f41    32'hffffffff    iSCSI, Intel CRC32 instruction; invert final output
PRBS6       Fibonacci               6       6'h21           any
PRBS7       Fibonacci               7       7'h41           any
PRBS9       Fibonacci               9       9'h021          any             ITU V.52
PRBS10      Fibonacci               10      10'h081         any             ITU
PRBS11      Fibonacci               11      11'h201         any             ITU O.152
PRBS15      Fibonacci, inverted     15      15'h4001        any             ITU O.152
PRBS17      Fibonacci               17      17'h04001       any
PRBS20      Fibonacci               20      20'h00009       any             ITU V.57
PRBS23      Fibonacci, inverted     23      23'h040001      any             ITU O.151
PRBS29      Fibonacci, inverted     29      29'h08000001    any
PRBS31      Fibonacci, inverted     31      31'h10000001    any
64b66b      Fibonacci, bit-reverse  58      58'h8000000001  any             10G Ethernet
128b130b    Galois, bit-reverse     23      23'h210125      any             PCIe gen 3

*/

function [LFSR_WIDTH+DATA_WIDTH-1:0] lfsr_mask(input [31:0] index); // funcion que calcula la máscara para la operación LFSR. Recibe un índice como entrada y devuelve una máscara de btis que se utiliza para seleccionar los bits relevantes para el cálculo del próximo estado
    reg [LFSR_WIDTH-1:0] lfsr_mask_state[LFSR_WIDTH-1:0];	// registro para almacenar el estado de la máscara del LFSR
    reg [DATA_WIDTH-1:0] lfsr_mask_data[LFSR_WIDTH-1:0];	// registro para almacenar los datos del LFSR
    reg [LFSR_WIDTH-1:0] output_mask_state[DATA_WIDTH-1:0];	// registro del estado de la máscara de salida
    reg [DATA_WIDTH-1:0] output_mask_data[DATA_WIDTH-1:0];	// registro de los datos de la máscara de salida

    reg [LFSR_WIDTH-1:0] state_val;	// registro adicional para almacenar valores de estado
    reg [DATA_WIDTH-1:0] data_val;	// registro adicional para almacenar valores de datos

    reg [DATA_WIDTH-1:0] data_mask;

    integer i, j;

    begin
        // init bit masks inicializo los bits de la máscara
        for (i = 0; i < LFSR_WIDTH; i = i + 1) begin
            lfsr_mask_state[i] = 0;		// inicializa en cero todos los bits del estado de la máscara
            lfsr_mask_state[i][i] = 1'b1;	// pone en uno los elementos de la diagonal principal (bits relevantes para el cálculo de la máscara)
            lfsr_mask_data[i] = 0;		// inicializa en cero los bits de datos del LFSR
        end
        for (i = 0; i < DATA_WIDTH; i = i + 1) begin	// inicializa los registros relacionados con la salida de la máscara
            output_mask_state[i] = 0;			// inicializa en cero los bits del estado de la máscara de salida
            if (i < LFSR_WIDTH) begin
                output_mask_state[i][i] = 1'b1;		// pone en uno los elementos de la diagonal principal cuyo índice sea menor al ancho de LFSR
            end
            output_mask_data[i] = 0;			// inicializa en cero los datos de la máscara de salida
        end

        // simulate shift register
        if (LFSR_CONFIG == "FIBONACCI") begin
            // Fibonacci configuration
            for (data_mask = {1'b1, {DATA_WIDTH-1{1'b0}}}; data_mask != 0; data_mask = data_mask >> 1) begin //  inicializa data_mask con una secuencia binaria que comienza con un 1 seguido de ceros, y luego realiza un desplazamiento a la derecha en cada iteración hasta que data_mask sea cero.
                // determine shift in value
                // current value in last FF, XOR with input data bit (MSB first)
                state_val = lfsr_mask_state[LFSR_WIDTH-1];	//sate_val toma el valor del estado de la máscara lfsr de la última iteración
                data_val = lfsr_mask_data[LFSR_WIDTH-1];	//data_val toma el valor de dato de la máscara lfsr de la última iteración
                data_val = data_val ^ data_mask;		// realiza una operación XOR entre data_val y data_mask

                // add XOR inputs from correct indicies
                for (j = 1; j < LFSR_WIDTH; j = j + 1) begin
                    if ((LFSR_POLY >> j) & 1) begin	// Verifica si el bit en la posición j del polinomio LFSR es 1.
                        state_val = lfsr_mask_state[j-1] ^ state_val;	//realiza una operación XOR entre state_val y el estado correspondiente en lfsr_mask_state.
                        data_val = lfsr_mask_data[j-1] ^ data_val;	//realiza una operación XOR entre data_val y los datos correspondientes en lfsr_mask_data.
                    end
                end

                // shift
                for (j = LFSR_WIDTH-1; j > 0; j = j - 1) begin	//realiza un desplazamiento hacia la derecha en los registros de estado y datos del LFSR.
                    lfsr_mask_state[j] = lfsr_mask_state[j-1];
                    lfsr_mask_data[j] = lfsr_mask_data[j-1];
                end
                for (j = DATA_WIDTH-1; j > 0; j = j - 1) begin	//realiza un desplazamiento hacia la derecha en los registros de estado y datos de salida.
                    output_mask_state[j] = output_mask_state[j-1];
                    output_mask_data[j] = output_mask_data[j-1];
                end
                output_mask_state[0] = state_val;	// actualiza el primer elemento de output_mask_state con el nuevo state_val.
                output_mask_data[0] = data_val;		// actualiza el primer elemento de output_mask_data con el nuevo data_val.
                if (LFSR_FEED_FORWARD) begin		
                    // only shift in new input data
                    state_val = {LFSR_WIDTH{1'b0}};	// establece todos los bits de state_val en 0.
                    data_val = data_mask;		// establece data_val en el valor de data_mask para la siguiente iteración.
                end
                lfsr_mask_state[0] = state_val;		// actualiza el primer elemento de lfsr_mask_state con el nuevo state_val.
                lfsr_mask_data[0] = data_val;		// actualiza el primer elemento de lfsr_mask_data con el nuevo data_val.
            end
        end else if (LFSR_CONFIG == "GALOIS") begin
            // Galois configuration
            for (data_mask = {1'b1, {DATA_WIDTH-1{1'b0}}}; data_mask != 0; data_mask = data_mask >> 1) begin	// inicializa data_mask con una secuencia binaria que comienza con un 1 seguido de ceros, y luego realiza un desplazamiento a la derecha en cada iteración hasta que data_mask sea cero.
                // determine shift in value
                // current value in last FF, XOR with input data bit (MSB first)
                state_val = lfsr_mask_state[LFSR_WIDTH-1];				// inicializa state_val con el valor del último estado en el registro de desplazamiento.
                data_val = lfsr_mask_data[LFSR_WIDTH-1];				// inicializa data_val con el valor de los datos en el último estado en el registro de desplazamiento.
                data_val = data_val ^ data_mask;					// realiza una operación XOR entre data_val y data_mask.

                // shift
                for (j = LFSR_WIDTH-1; j > 0; j = j - 1) begin		// realiza un desplazamiento hacia la derecha en los registros de estado y datos del LFSR.
                    lfsr_mask_state[j] = lfsr_mask_state[j-1];
                    lfsr_mask_data[j] = lfsr_mask_data[j-1];
                end
                for (j = DATA_WIDTH-1; j > 0; j = j - 1) begin		// realiza un desplazamiento hacia la derecha en los registros de salida de la máscara.
                    output_mask_state[j] = output_mask_state[j-1];
                    output_mask_data[j] = output_mask_data[j-1];
                end
                output_mask_state[0] = state_val;		// Actualiza el primer elemento de output_mask_state con el nuevo state_val.
                output_mask_data[0] = data_val;			// Actualiza el primer elemento de output_mask_data con el nuevo data_val.
                if (LFSR_FEED_FORWARD) begin			
                    // only shift in new input data
                    state_val = {LFSR_WIDTH{1'b0}};		// establece todos los bits de state_val en 0.
                    data_val = data_mask;			// establece data_val en el valor de data_mask para la siguiente iteración.
                end
                lfsr_mask_state[0] = state_val;			// Actualiza el primer elemento de lfsr_mask_state con el nuevo state_val.
                lfsr_mask_data[0] = data_val;			// Actualiza el primer elemento de lfsr_mask_data con el nuevo data_val.

                // add XOR inputs at correct indicies
                for (j = 1; j < LFSR_WIDTH; j = j + 1) begin	// itera sobre los índices del LFSR para realizar la operación XOR en aquellos índices específicos determinados por el polinomio del LFSR
                    if ((LFSR_POLY >> j) & 1) begin		// Verifica si el bit en la posición j del polinomio LFSR es 1.
                        lfsr_mask_state[j] = lfsr_mask_state[j] ^ state_val;	//realiza una operación XOR entre state_val y el estado correspondiente en lfsr_mask_state.
                        lfsr_mask_data[j] = lfsr_mask_data[j] ^ data_val;	//realiza una operación XOR entre data_val y los datos correspondientes en lfsr_mask_data.
                    end
                end
            end
        end else begin
            $error("Error: unknown configuration setting!");
            $finish;
        end

        // reverse bits if selected
        if (REVERSE) begin
            if (index < LFSR_WIDTH) begin
                state_val = 0;		//  Se inicializa state_val como cero
                for (i = 0; i < LFSR_WIDTH; i = i + 1) begin
                    state_val[i] = lfsr_mask_state[LFSR_WIDTH-index-1][LFSR_WIDTH-i-1];
                end

                data_val = 0;
                for (i = 0; i < DATA_WIDTH; i = i + 1) begin
                    data_val[i] = lfsr_mask_data[LFSR_WIDTH-index-1][DATA_WIDTH-i-1];
                end
            end else begin
                state_val = 0;
                for (i = 0; i < LFSR_WIDTH; i = i + 1) begin
                    state_val[i] = output_mask_state[DATA_WIDTH-(index-LFSR_WIDTH)-1][LFSR_WIDTH-i-1];
                end

                data_val = 0;
                for (i = 0; i < DATA_WIDTH; i = i + 1) begin
                    data_val[i] = output_mask_data[DATA_WIDTH-(index-LFSR_WIDTH)-1][DATA_WIDTH-i-1];
                end
            end
        end else begin
            if (index < LFSR_WIDTH) begin
                state_val = lfsr_mask_state[index];
                data_val = lfsr_mask_data[index];
            end else begin
                state_val = output_mask_state[index-LFSR_WIDTH];
                data_val = output_mask_data[index-LFSR_WIDTH];
            end
        end
        lfsr_mask = {data_val, state_val};
    end
endfunction

// synthesis translate_off
`define SIMULATION
// synthesis translate_on

`ifdef SIMULATION
// "AUTO" style is "REDUCTION" for faster simulation
parameter STYLE_INT = (STYLE == "AUTO") ? "REDUCTION" : STYLE;
`else
// "AUTO" style is "LOOP" for better synthesis result
parameter STYLE_INT = (STYLE == "AUTO") ? "LOOP" : STYLE;
`endif

genvar n;

generate

if (STYLE_INT == "REDUCTION") begin

    // use Verilog reduction operator
    // fast in iverilog
    // significantly larger than generated code with ISE (inferred wide XORs may be tripping up optimizer)
    // slightly smaller than generated code with Quartus
    // --> better for simulation

    for (n = 0; n < LFSR_WIDTH; n = n + 1) begin : lfsr_state
        wire [LFSR_WIDTH+DATA_WIDTH-1:0] mask = lfsr_mask(n);
        assign state_out[n] = ^({data_in, state_in} & mask);
    end
    for (n = 0; n < DATA_WIDTH; n = n + 1) begin : lfsr_data
        wire [LFSR_WIDTH+DATA_WIDTH-1:0] mask = lfsr_mask(n+LFSR_WIDTH);
        assign data_out[n] = ^({data_in, state_in} & mask);
    end

end else if (STYLE_INT == "LOOP") begin

    // use nested loops
    // very slow in iverilog
    // slightly smaller than generated code with ISE
    // same size as generated code with Quartus
    // --> better for synthesis

    for (n = 0; n < LFSR_WIDTH; n = n + 1) begin : lfsr_state
        wire [LFSR_WIDTH+DATA_WIDTH-1:0] mask = lfsr_mask(n);

        reg state_reg;

        assign state_out[n] = state_reg;

        integer i;

        always @* begin
            state_reg = 1'b0;
            for (i = 0; i < LFSR_WIDTH; i = i + 1) begin
                if (mask[i]) begin
                    state_reg = state_reg ^ state_in[i];
                end
            end
            for (i = 0; i < DATA_WIDTH; i = i + 1) begin
                if (mask[i+LFSR_WIDTH]) begin
                    state_reg = state_reg ^ data_in[i];
                end
            end
        end
    end
    for (n = 0; n < DATA_WIDTH; n = n + 1) begin : lfsr_data
        wire [LFSR_WIDTH+DATA_WIDTH-1:0] mask = lfsr_mask(n+LFSR_WIDTH);

        reg data_reg;

        assign data_out[n] = data_reg;

        integer i;

        always @* begin
            data_reg = 1'b0;
            for (i = 0; i < LFSR_WIDTH; i = i + 1) begin
                if (mask[i]) begin
                    data_reg = data_reg ^ state_in[i];
                end
            end
            for (i = 0; i < DATA_WIDTH; i = i + 1) begin
                if (mask[i+LFSR_WIDTH]) begin
                    data_reg = data_reg ^ data_in[i];
                end
            end
        end
    end

end else begin

    initial begin
        $error("Error: unknown style setting!");
        $finish;
    end

end

endgenerate

endmodule

`resetall