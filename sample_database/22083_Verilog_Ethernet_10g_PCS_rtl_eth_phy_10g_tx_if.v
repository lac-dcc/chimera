// This program was cloned from: https://github.com/sofiavalos/Verilog_Ethernet_10g_PCS
// License: MIT License

/*

Copyright (c) 2018 Alex Forencich

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
 * 10G Ethernet PHY TX IF
 */
module eth_phy_10g_tx_if #
(
    parameter DATA_WIDTH = 64, 		// ancho de los datos en bits.
    parameter HDR_WIDTH = 2,		// ancho del encabezado en bits.
    parameter BIT_REVERSE = 0,		// Controla si se debe invertir el orden de los bits en las señales de salida.
    parameter SCRAMBLER_DISABLE = 0,	// Habilita o deshabilita el mecanismo de scrambling.
    parameter PRBS31_ENABLE = 0,	// Habilita la generación de secuencias de bits pseudoaleatorias de 31 bits.
    parameter SERDES_PIPELINE = 0	// Define la profundidad del pipeline del SERDES.
)
(
    input  wire                  clk,	// Entrada: reloj del sistema
    input  wire                  rst,	// Entrada: señal de reincio

    /*
     * 10GBASE-R encoded interface
     */
    input  wire [DATA_WIDTH-1:0] encoded_tx_data,	// Entrada: datos codificados para la transmisión
    input  wire [HDR_WIDTH-1:0]  encoded_tx_hdr,	// Entrada: encabezado de los datos codificados

    /*
     * SERDES interface
     */
    output wire [DATA_WIDTH-1:0] serdes_tx_data,	// Salida: datos de salida para el SERDES
    output wire [HDR_WIDTH-1:0]  serdes_tx_hdr,		// Salida: encabezado de salida para el SERDES

    /*
     * Configuration
     */
    input  wire                  cfg_tx_prbs31_enable	// Entrada: señal de habilitación para la generación de secuencias PRBS31
);

// bus width assertions
initial begin
    if (DATA_WIDTH != 64) begin
        $error("Error: Interface width must be 64");
        $finish;
    end

    if (HDR_WIDTH != 2) begin
        $error("Error: HDR_WIDTH must be 2");
        $finish;
    end
end

reg [57:0] scrambler_state_reg = {58{1'b1}};	// Registro para el estado del scrambler. Lo inicializa en 58 unos
wire [57:0] scrambler_state;			// bus de salida del estado del scrambler.
wire [DATA_WIDTH-1:0] scrambled_data;		// bus de salida de datos obtenidos luego de aplicar el scrambling.

reg [30:0] prbs31_state_reg = 31'h7fffffff;	// Registro para el estado del generador PRBS31. Lo inicializa en 31 unos
wire [30:0] prbs31_state;			// bus de salida del estado del generador PRBS31.
wire [DATA_WIDTH+HDR_WIDTH-1:0] prbs31_data;	// bus de salida de datos generados por el generador PRBS31.

reg [DATA_WIDTH-1:0] serdes_tx_data_reg = {DATA_WIDTH{1'b0}};	// registro que almacena los datos que se enviarán al transmisor SERDES inicializado en cero
reg [HDR_WIDTH-1:0] serdes_tx_hdr_reg = {HDR_WIDTH{1'b0}};	// registro que almacena el encabezado que se enviará al transmisor SERDES inicializado en cero

wire [DATA_WIDTH-1:0] serdes_tx_data_int;	// bus de salida para los datos del transmisor SERDES
wire [HDR_WIDTH-1:0]  serdes_tx_hdr_int;	// bus de salida para el encabezado del transmisor SERDES	

generate
    genvar n;

    if (BIT_REVERSE) begin	// si BIT_REVERSE está activado, los datos y el encabezado se asignan de manera inversa a serdes_tx_data_int y serdes_tx_hdr_int
        for (n = 0; n < DATA_WIDTH; n = n + 1) begin
            assign serdes_tx_data_int[n] = serdes_tx_data_reg[DATA_WIDTH-n-1];
        end

        for (n = 0; n < HDR_WIDTH; n = n + 1) begin
            assign serdes_tx_hdr_int[n] = serdes_tx_hdr_reg[HDR_WIDTH-n-1];
        end
    end else begin
        assign serdes_tx_data_int = serdes_tx_data_reg;
        assign serdes_tx_hdr_int = serdes_tx_hdr_reg;
    end

    if (SERDES_PIPELINE > 0) begin	// si SERDES_PIPELINE > 0, implementa un pipeline en serue para serdes_Tx_data y serdes_tx_hdr
        (* srl_style = "register" *)
        reg [DATA_WIDTH-1:0] serdes_tx_data_pipe_reg[SERDES_PIPELINE-1:0];	// registros para almacenar los datos del pipeline de tamaño SERDES_PIPELINE.
        (* srl_style = "register" *)
        reg [HDR_WIDTH-1:0]  serdes_tx_hdr_pipe_reg[SERDES_PIPELINE-1:0];

        for (n = 0; n < SERDES_PIPELINE; n = n + 1) begin
            initial begin
                serdes_tx_data_pipe_reg[n] <= {DATA_WIDTH{1'b0}};		// inicializa los registros de pipeline en cero en el primer ciclo
                serdes_tx_hdr_pipe_reg[n] <= {HDR_WIDTH{1'b0}};
            end

            always @(posedge clk) begin		// en el primer ciclo de reloj, el registro de pipeline toma el valor de serdes_tx_data_int, en los que sigue toma el valor del registro anterior
                serdes_tx_data_pipe_reg[n] <= n == 0 ? serdes_tx_data_int : serdes_tx_data_pipe_reg[n-1];
                serdes_tx_hdr_pipe_reg[n] <= n == 0 ? serdes_tx_hdr_int : serdes_tx_hdr_pipe_reg[n-1];
            end
        end

        assign serdes_tx_data = serdes_tx_data_pipe_reg[SERDES_PIPELINE-1];	// Asigna los valores del último registro del pipeline a los buses de salida serdes_tx_data y serdes_tx_hdr
        assign serdes_tx_hdr = serdes_tx_hdr_pipe_reg[SERDES_PIPELINE-1];
    end else begin
        assign serdes_tx_data = serdes_tx_data_int;	// Si SERDES_PIPELINE es cero, los buses de salida se asignan directamente a serdes_tx_data_int y serdes_tx_hdr_int
        assign serdes_tx_hdr = serdes_tx_hdr_int;
    end

endgenerate

// se instancia un módulo LFSR (Linear Feedback Shift Register) llamado scrambler_inst 
lfsr #(
    .LFSR_WIDTH(58),
    .LFSR_POLY(58'h8000000001),
    .LFSR_CONFIG("FIBONACCI"),
    .LFSR_FEED_FORWARD(0),
    .REVERSE(1),
    .DATA_WIDTH(DATA_WIDTH),
    .STYLE("AUTO")
)
scrambler_inst (
    .data_in(encoded_tx_data),
    .state_in(scrambler_state_reg),
    .data_out(scrambled_data),
    .state_out(scrambler_state)
);

lfsr #(
    .LFSR_WIDTH(31),
    .LFSR_POLY(31'h10000001),
    .LFSR_CONFIG("FIBONACCI"),
    .LFSR_FEED_FORWARD(0),
    .REVERSE(1),
    .DATA_WIDTH(DATA_WIDTH+HDR_WIDTH),
    .STYLE("AUTO")
)
prbs31_gen_inst (
    .data_in({DATA_WIDTH+HDR_WIDTH{1'b0}}),
    .state_in(prbs31_state_reg),
    .data_out(prbs31_data),
    .state_out(prbs31_state)
);

always @(posedge clk) begin
    scrambler_state_reg <= scrambler_state;	// Actualiza el estado del LFSR scrambler_state_reg con el estado actual del módulo LFSR scrambler_state.

    if (PRBS31_ENABLE && cfg_tx_prbs31_enable) begin	// si PRBS31 esta habilitado, los datos que se envían son de PRBS31
        prbs31_state_reg <= prbs31_state;	

        serdes_tx_data_reg <= ~prbs31_data[DATA_WIDTH+HDR_WIDTH-1:HDR_WIDTH];	// le asigna a serdes_tx_data_reg la negación de bits de prbs31_data sin incluir el header
        serdes_tx_hdr_reg <= ~prbs31_data[HDR_WIDTH-1:0];			//
    end else begin					// si PRBS31 no esta habilitado, los datos que se envían son de scramble o encoded si SCRAMBLER_DISABLE está en 1
        serdes_tx_data_reg <= SCRAMBLER_DISABLE ? encoded_tx_data : scrambled_data;
        serdes_tx_hdr_reg <= encoded_tx_hdr;
    end
end

endmodule

`resetall