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
 * 10G Ethernet PHY
 */
module eth_phy_10g #
(
    parameter DATA_WIDTH = 64,			// ancho de bus de datos de 64 bits
    parameter CTRL_WIDTH = (DATA_WIDTH/8),	// ancho de bus de control en bytes
    parameter HDR_WIDTH = 2,			// ancho de header de sincronizacion (01 para bloques de data 10 para control), permiten establecer límites de bloques
    parameter BIT_REVERSE = 0,			// inversion de bits deshabilitada
    parameter SCRAMBLER_DISABLE = 0,		// habilitado proceso scrambler
    parameter PRBS31_ENABLE = 0,		// deshabilitada secuencia pseudoaletoria PRBS31 para pruebas
    parameter TX_SERDES_PIPELINE = 0,		// no hay profundidad adicional de pipeline en las interfaces SERDES (serializacion/deserializacion) para la transmision de datos
    parameter RX_SERDES_PIPELINE = 0,		// no hay profundidad adicional de pipeline en las interfaces SERDES (serializacion/deserializacion) para la recepcion de datos
    parameter BITSLIP_HIGH_CYCLES = 1,		// 1 ciclos de reloj para el proceso de bitslip en alto
    parameter BITSLIP_LOW_CYCLES = 8,		// 8 ciclos de reloj para el proceso de bitslip en bajo
    parameter COUNT_125US = 125000/6.4		// Contador de 125 us
)
(
    input  wire                  rx_clk,	// entrada señal de reloj para recepcion
    input  wire                  rx_rst,	// entrada señal de reinicio de recepcion
    input  wire                  tx_clk,	// entrada señal de reloj para transmision
    input  wire                  tx_rst,	// entrada señal de reinicio de transmision

    /*
     * XGMII interface
     */
    input  wire [DATA_WIDTH-1:0] xgmii_txd,	// entrada para transmitir datos a la capa fisica
    input  wire [CTRL_WIDTH-1:0] xgmii_txc,	// entrada para transmitir control a la capa fisica
    output wire [DATA_WIDTH-1:0] xgmii_rxd,	// salida para recibir datos de la capa fisica
    output wire [CTRL_WIDTH-1:0] xgmii_rxc,	// salida para recibir control de la capa fisica

    /*
     * SERDES interface
     */
    output wire [DATA_WIDTH-1:0] serdes_tx_data,	// salida para enviar datos serializados
    output wire [HDR_WIDTH-1:0]  serdes_tx_hdr,		// salida para enviar encabezados serializados
    input  wire [DATA_WIDTH-1:0] serdes_rx_data,	// entrada para recibir datos serializados
    input  wire [HDR_WIDTH-1:0]  serdes_rx_hdr,		// entrada para recibir encabezados serializados
    output wire                  serdes_rx_bitslip,	
    output wire                  serdes_rx_reset_req,

    /*
     * Status
     */
    output wire                  tx_bad_block,
    output wire [6:0]            rx_error_count,
    output wire                  rx_bad_block,
    output wire                  rx_sequence_error,
    output wire                  rx_block_lock,
    output wire                  rx_high_ber,
    output wire                  rx_status,

    /*
     * Configuration
     */
    input  wire                  cfg_tx_prbs31_enable,
    input  wire                  cfg_rx_prbs31_enable
);

eth_phy_10g_rx #(
    .DATA_WIDTH(DATA_WIDTH),
    .CTRL_WIDTH(CTRL_WIDTH),
    .HDR_WIDTH(HDR_WIDTH),
    .BIT_REVERSE(BIT_REVERSE),
    .SCRAMBLER_DISABLE(SCRAMBLER_DISABLE),
    .PRBS31_ENABLE(PRBS31_ENABLE),
    .SERDES_PIPELINE(RX_SERDES_PIPELINE),
    .BITSLIP_HIGH_CYCLES(BITSLIP_HIGH_CYCLES),
    .BITSLIP_LOW_CYCLES(BITSLIP_LOW_CYCLES),
    .COUNT_125US(COUNT_125US)
)
eth_phy_10g_rx_inst (
    .clk(rx_clk),
    .rst(rx_rst),
    .xgmii_rxd(xgmii_rxd),
    .xgmii_rxc(xgmii_rxc),
    .serdes_rx_data(serdes_rx_data),
    .serdes_rx_hdr(serdes_rx_hdr),
    .serdes_rx_bitslip(serdes_rx_bitslip),
    .serdes_rx_reset_req(serdes_rx_reset_req),
    .rx_error_count(rx_error_count),
    .rx_bad_block(rx_bad_block),
    .rx_sequence_error(rx_sequence_error),
    .rx_block_lock(rx_block_lock),
    .rx_high_ber(rx_high_ber),
    .rx_status(rx_status),
    .cfg_rx_prbs31_enable(cfg_rx_prbs31_enable)
);

eth_phy_10g_tx #(			// se instancia modulo que coordina la codificación de datos XGMII y gestiona la interfaz con el SERDES de transmisión.
    .DATA_WIDTH(DATA_WIDTH),
    .CTRL_WIDTH(CTRL_WIDTH),
    .HDR_WIDTH(HDR_WIDTH),
    .BIT_REVERSE(BIT_REVERSE),
    .SCRAMBLER_DISABLE(SCRAMBLER_DISABLE),
    .PRBS31_ENABLE(PRBS31_ENABLE),
    .SERDES_PIPELINE(TX_SERDES_PIPELINE)
)
eth_phy_10g_tx_inst (
    .clk(tx_clk),
    .rst(tx_rst),
    .xgmii_txd(xgmii_txd),
    .xgmii_txc(xgmii_txc),
    .serdes_tx_data(serdes_tx_data),
    .serdes_tx_hdr(serdes_tx_hdr),
    .tx_bad_block(tx_bad_block),
    .cfg_tx_prbs31_enable(cfg_tx_prbs31_enable)
);

endmodule

`resetall