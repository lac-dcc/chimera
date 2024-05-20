// This program was cloned from: https://github.com/sofiavalos/Verilog_Ethernet_10g_PCS
// License: MIT License

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

/*
 * 10G Ethernet PHY TX
 */
module eth_phy_10g_tx #
(
    parameter DATA_WIDTH = 64,			// ancho de los datos
    parameter CTRL_WIDTH = (DATA_WIDTH/8),	// ancho de control
    parameter HDR_WIDTH = 2,			// ancho de header
    parameter BIT_REVERSE = 0,			// inversion de bits deshabilitada
    parameter SCRAMBLER_DISABLE = 0,		// habilitado el scrambler
    parameter PRBS31_ENABLE = 0,		// deshabilitado generacion de patrones pseudoaleatorios PRBS31
    parameter SERDES_PIPELINE = 0		// deshabilitado el uso de una pipeline en el SERDES
)
(
    input  wire                  clk,		// entrada de clock
    input  wire                  rst,		// señal de reset

    /*
     * XGMII interface
     */
    input  wire [DATA_WIDTH-1:0] xgmii_txd,	// datos de entrada de XGMII que se transmitirán
    input  wire [CTRL_WIDTH-1:0] xgmii_txc,	// señales de control de XGMII

    /*
     * SERDES interface
     */
    output wire [DATA_WIDTH-1:0] serdes_tx_data,	// datos de salida para SERDES
    output wire [HDR_WIDTH-1:0]  serdes_tx_hdr,		// header de salida para SERDES

    /*
     * Status
     */
    output wire                  tx_bad_block,		// señal de estado para indicar un bloque defectuoso durante la transmisión

    /*
     * Configuration
     */
    input  wire                  cfg_tx_prbs31_enable	// entrada para habilitar la generacion de patrones PRBS31
);

// bus width assertions
initial begin
    if (DATA_WIDTH != 64) begin
        $error("Error: Interface width must be 64");
        $finish;
    end

    if (CTRL_WIDTH * 8 != DATA_WIDTH) begin
        $error("Error: Interface requires byte (8-bit) granularity");
        $finish;
    end

    if (HDR_WIDTH != 2) begin
        $error("Error: HDR_WIDTH must be 2");
        $finish;
    end
end

wire [DATA_WIDTH-1:0] encoded_tx_data;		// señal para datos codificados
wire [HDR_WIDTH-1:0]  encoded_tx_hdr;		// señal para encabezado codigficado

xgmii_baser_enc_64 #(				// se instancia codificacion de datos segun estandar XGMII
    .DATA_WIDTH(DATA_WIDTH),
    .CTRL_WIDTH(CTRL_WIDTH),
    .HDR_WIDTH(HDR_WIDTH)
)
xgmii_baser_enc_inst (
    .clk(clk),
    .rst(rst),
    .xgmii_txd(xgmii_txd),
    .xgmii_txc(xgmii_txc),
    .encoded_tx_data(encoded_tx_data),
    .encoded_tx_hdr(encoded_tx_hdr),
    .tx_bad_block(tx_bad_block)
);

eth_phy_10g_tx_if #(				// se instancia modulo que se encarga de la recepción de datos codificados desde la capa XGMII, la configuración de la transmisión según parámetros como el bit reverse, la habilitación o deshabilitación de scrambler y la generación de PRBS31, así como la transmisión de estos datos codificados y la configuración del SERDES.
    .DATA_WIDTH(DATA_WIDTH),
    .HDR_WIDTH(HDR_WIDTH),
    .BIT_REVERSE(BIT_REVERSE),
    .SCRAMBLER_DISABLE(SCRAMBLER_DISABLE),
    .PRBS31_ENABLE(PRBS31_ENABLE),
    .SERDES_PIPELINE(SERDES_PIPELINE)
)
eth_phy_10g_tx_if_inst (
    .clk(clk),
    .rst(rst),
    .encoded_tx_data(encoded_tx_data),
    .encoded_tx_hdr(encoded_tx_hdr),
    .serdes_tx_data(serdes_tx_data),
    .serdes_tx_hdr(serdes_tx_hdr),
    .cfg_tx_prbs31_enable(cfg_tx_prbs31_enable)
);

endmodule

`resetall