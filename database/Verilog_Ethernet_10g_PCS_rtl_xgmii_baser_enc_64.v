// This program was cloned from: https://github.com/sofiavalos/Verilog_Ethernet_10g_PCS
// License: MIT License

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

/*
 * XGMII 10GBASE-R encoder
 */
module xgmii_baser_enc_64 #
(
    parameter DATA_WIDTH = 64,
    parameter CTRL_WIDTH = (DATA_WIDTH/8),
    parameter HDR_WIDTH = 2
)
(
    input  wire                  clk,
    input  wire                  rst,

    /*
     * XGMII interface
     */
    input  wire [DATA_WIDTH-1:0] xgmii_txd,	// datos de entrada XGMII
    input  wire [CTRL_WIDTH-1:0] xgmii_txc,	// señales de control XGMII

    /*
     * 10GBASE-R encoded interface
     */
    output wire [DATA_WIDTH-1:0] encoded_tx_data,	// salida para datos codificados
    output wire [HDR_WIDTH-1:0]  encoded_tx_hdr,	// salida para encabezado codificado

    /*
     * Status
     */
    output wire                  tx_bad_block		// salida estado que indica si hay un bloque de transmision defectuoso
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

localparam [7:0]		// Codigos de control XGMII (tabla 49-1, pagina 11)
    XGMII_IDLE   = 8'h07,	// XGMII Control Code para caracter de control idle
    XGMII_LPI    = 8'h06,	// XGMII Control Code para caracter de control LPI
    XGMII_START  = 8'hfb,	// XGMII Control Code para caracter de control start
    XGMII_TERM   = 8'hfd,	// XGMII Control Code para caracter de control terminate
    XGMII_ERROR  = 8'hfe,	// XGMII Control Code para caracter de control error
    XGMII_SEQ_OS = 8'h9c,	// XGMII Control Code para caracter de control Sequence ordered set
    XGMII_RES_0  = 8'h1c,	// XGMII Control Code para caracter de control reserved0
    XGMII_RES_1  = 8'h3c,	// XGMII Control Code para caracter de control reserved1
    XGMII_RES_2  = 8'h7c,	// XGMII Control Code para caracter de control reserved2
    XGMII_RES_3  = 8'hbc,	// XGMII Control Code para caracter de control reserved3
    XGMII_RES_4  = 8'hdc,	// XGMII Control Code para caracter de control reserved4
    XGMII_RES_5  = 8'hf7,	// XGMII Control Code para caracter de control reserved5
    XGMII_SIG_OS = 8'h5c;	// XGMII Control Code para caracter de control Signal ordered set

localparam [6:0]		// Codigos de Control 10GBASE-R (tabla 49-1, pagina 11)
    CTRL_IDLE  = 7'h00,		// 10GBASE-R Control Code para caracter de control idle
    CTRL_LPI   = 7'h06,		// 10GBASE-R Control Code para caracter de control LPI
    CTRL_ERROR = 7'h1e,		// 10GBASE-R Control Code para caracter de control error
    CTRL_RES_0 = 7'h2d,		// 10GBASE-R Control Code para caracter de control reserved0
    CTRL_RES_1 = 7'h33,		// 10GBASE-R Control Code para caracter de control reserved1
    CTRL_RES_2 = 7'h4b,		// 10GBASE-R Control Code para caracter de control reserved2
    CTRL_RES_3 = 7'h55,		// 10GBASE-R Control Code para caracter de control reserved3
    CTRL_RES_4 = 7'h66,		// 10GBASE-R Control Code para caracter de control reserved4
    CTRL_RES_5 = 7'h78;		// 10GBASE-R Control Code para caracter de control reserved5

localparam [3:0]		// Codigo O 10GBASE-R (tabla 49-1, pagina 11)
    O_SEQ_OS = 4'h0,		// 10GBASE-R O Code para caracter de control Sequence ordered set
    O_SIG_OS = 4'hf;		// 10GBASE-R O Code para caracter de control Signal ordered set

localparam [1:0]
    SYNC_DATA = 2'b10,		// Header de Sincronizacion para bloque de datos (esto no deberia ser al revés?)
    SYNC_CTRL = 2'b01;		// Header de Sincronizacion para bloque de control

localparam [7:0]	// block formarts 64b/66b (figura 49-7, pagina 10)
    BLOCK_TYPE_CTRL     = 8'h1e, // C7 C6 C5 C4 C3 C2 C1 C0 BT
    BLOCK_TYPE_OS_4     = 8'h2d, // D7 D6 D5 O4 C3 C2 C1 C0 BT
    BLOCK_TYPE_START_4  = 8'h33, // D7 D6 D5    C3 C2 C1 C0 BT
    BLOCK_TYPE_OS_START = 8'h66, // D7 D6 D5    O0 D3 D2 D1 BT
    BLOCK_TYPE_OS_04    = 8'h55, // D7 D6 D5 O4 O0 D3 D2 D1 BT
    BLOCK_TYPE_START_0  = 8'h78, // D7 D6 D5 D4 D3 D2 D1    BT
    BLOCK_TYPE_OS_0     = 8'h4b, // C7 C6 C5 C4 O0 D3 D2 D1 BT
    BLOCK_TYPE_TERM_0   = 8'h87, // C7 C6 C5 C4 C3 C2 C1    BT
    BLOCK_TYPE_TERM_1   = 8'h99, // C7 C6 C5 C4 C3 C2    D0 BT
    BLOCK_TYPE_TERM_2   = 8'haa, // C7 C6 C5 C4 C3    D1 D0 BT
    BLOCK_TYPE_TERM_3   = 8'hb4, // C7 C6 C5 C4    D2 D1 D0 BT
    BLOCK_TYPE_TERM_4   = 8'hcc, // C7 C6 C5    D3 D2 D1 D0 BT
    BLOCK_TYPE_TERM_5   = 8'hd2, // C7 C6    D4 D3 D2 D1 D0 BT
    BLOCK_TYPE_TERM_6   = 8'he1, // C7    D5 D4 D3 D2 D1 D0 BT
    BLOCK_TYPE_TERM_7   = 8'hff; //    D6 D5 D4 D3 D2 D1 D0 BT

reg [DATA_WIDTH*7/8-1:0] encoded_ctrl;	// registro para almacenar control codificado
reg [CTRL_WIDTH-1:0] encode_err;	// registro para almacenar errores en codificacion

reg [DATA_WIDTH-1:0] encoded_tx_data_reg = {DATA_WIDTH{1'b0}}, encoded_tx_data_next;	// registro para almacenar los datos de salida codificado. Se inicializa en 0. encoded_tx_data_next es el valor siguiente que tomará encoded_tx_data_reg 
reg [HDR_WIDTH-1:0] encoded_tx_hdr_reg = {HDR_WIDTH{1'b0}}, encoded_tx_hdr_next;	// registro para almacenar el header de salida codificado. Se inicializa en cero. encoded_tx_hdr_next es el valor siguiente que tomará encoded_tx_hdr_reg

reg tx_bad_block_reg = 1'b0, tx_bad_block_next;		// registro para indicar si hay un bloque de transmisión defectuoso. Se inicializa en 0. tx_bad_block_next es el valor siguiente que tomará tx_bad_block_reg.

assign encoded_tx_data = encoded_tx_data_reg;		// conecta la salida codificada de datps al exterior del modulo
assign encoded_tx_hdr = encoded_tx_hdr_reg;		// conecta la salida del header codificado al exterior del modulo

assign tx_bad_block = tx_bad_block_reg;			// señal externa que indica si hay un bloque de transmision defectuoso

integer i;

always @* begin
    tx_bad_block_next = 1'b0;					// se inicializa en 0 la señal que indica si el siguiente bloque es defectuoso

    for (i = 0; i < CTRL_WIDTH; i = i + 1) begin		
        if (xgmii_txc[i]) begin
            // control
            case (xgmii_txd[8*i +: 8])			// evalua el tipo de control segun el codigo de control
                XGMII_IDLE: begin
                    encoded_ctrl[7*i +: 7] = CTRL_IDLE;	
                    encode_err[i] = 1'b0;
                end
                XGMII_LPI: begin
                    encoded_ctrl[7*i +: 7] = CTRL_LPI;
                    encode_err[i] = 1'b0;
                end
                XGMII_ERROR: begin
                    encoded_ctrl[7*i +: 7] = CTRL_ERROR;
                    encode_err[i] = 1'b0;
                end
                XGMII_RES_0: begin
                    encoded_ctrl[7*i +: 7] = CTRL_RES_0;
                    encode_err[i] = 1'b0;
                end
                XGMII_RES_1: begin
                    encoded_ctrl[7*i +: 7] = CTRL_RES_1;
                    encode_err[i] = 1'b0;
                end
                XGMII_RES_2: begin
                    encoded_ctrl[7*i +: 7] = CTRL_RES_2;
                    encode_err[i] = 1'b0;
                end
                XGMII_RES_3: begin
                    encoded_ctrl[7*i +: 7] = CTRL_RES_3;
                    encode_err[i] = 1'b0;
                end
                XGMII_RES_4: begin
                    encoded_ctrl[7*i +: 7] = CTRL_RES_4;
                    encode_err[i] = 1'b0;
                end
                XGMII_RES_5: begin
                    encoded_ctrl[7*i +: 7] = CTRL_RES_5;
                    encode_err[i] = 1'b0;
                end
                default: begin
                    encoded_ctrl[7*i +: 7] = CTRL_ERROR;
                    encode_err[i] = 1'b1;
                end
            endcase
        end else begin
            // data (always invalid as control)
            encoded_ctrl[7*i +: 7] = CTRL_ERROR;
            encode_err[i] = 1'b1;
        end
    end

    if (xgmii_txc == 8'h00) begin		// todos los bits de control estan en cero
        encoded_tx_data_next = xgmii_txd;	// se pasa xgmii_txd al siguiente ciclo de reloj
        encoded_tx_hdr_next = SYNC_DATA;	// se establece que el encabezado es de tipo data
        tx_bad_block_next = 1'b0;		// no hay ningun bloque malo en esta secuencia de datos
    end else begin				// al menos uno de los bits de control no está en cero
        if (xgmii_txc == 8'h1f && xgmii_txd[39:32] == XGMII_SEQ_OS) begin	// si el tipo de control es XGMII_SEQ_OS
            // ordered set in lane 4
            encoded_tx_data_next = {xgmii_txd[63:40], O_SEQ_OS, encoded_ctrl[27:0], BLOCK_TYPE_OS_4};
            tx_bad_block_next = encode_err[3:0] != 0;
        end else if (xgmii_txc == 8'h1f && xgmii_txd[39:32] == XGMII_START) begin
            // start in lane 4
            encoded_tx_data_next = {xgmii_txd[63:40], 4'd0, encoded_ctrl[27:0], BLOCK_TYPE_START_4};
            tx_bad_block_next = encode_err[3:0] != 0;
        end else if (xgmii_txc == 8'h11 && xgmii_txd[7:0] == XGMII_SEQ_OS && xgmii_txd[39:32] == XGMII_START) begin
            // ordered set in lane 0, start in lane 4
            encoded_tx_data_next = {xgmii_txd[63:40], 4'd0, O_SEQ_OS, xgmii_txd[31:8], BLOCK_TYPE_OS_START};
            tx_bad_block_next = 1'b0;
        end else if (xgmii_txc == 8'h11 && xgmii_txd[7:0] == XGMII_SEQ_OS && xgmii_txd[39:32] == XGMII_SEQ_OS) begin
            // ordered set in lane 0 and lane 4
            encoded_tx_data_next = {xgmii_txd[63:40], O_SEQ_OS, O_SEQ_OS, xgmii_txd[31:8], BLOCK_TYPE_OS_04};
            tx_bad_block_next = 1'b0;
        end else if (xgmii_txc == 8'h01 && xgmii_txd[7:0] == XGMII_START) begin
            // start in lane 0
            encoded_tx_data_next = {xgmii_txd[63:8], BLOCK_TYPE_START_0};
            tx_bad_block_next = 1'b0;
        end else if (xgmii_txc == 8'hf1 && xgmii_txd[7:0] == XGMII_SEQ_OS) begin
            // ordered set in lane 0
            encoded_tx_data_next = {encoded_ctrl[55:28], O_SEQ_OS, xgmii_txd[31:8], BLOCK_TYPE_OS_0};
            tx_bad_block_next = encode_err[7:4] != 0;
        end else if (xgmii_txc == 8'hff && xgmii_txd[7:0] == XGMII_TERM) begin
            // terminate in lane 0
            encoded_tx_data_next = {encoded_ctrl[55:7], 7'd0, BLOCK_TYPE_TERM_0};
            tx_bad_block_next = encode_err[7:1] != 0;
        end else if (xgmii_txc == 8'hfe && xgmii_txd[15:8] == XGMII_TERM) begin
            // terminate in lane 1
            encoded_tx_data_next = {encoded_ctrl[55:14], 6'd0, xgmii_txd[7:0], BLOCK_TYPE_TERM_1};
            tx_bad_block_next = encode_err[7:2] != 0;
        end else if (xgmii_txc == 8'hfc && xgmii_txd[23:16] == XGMII_TERM) begin
            // terminate in lane 2
            encoded_tx_data_next = {encoded_ctrl[55:21], 5'd0, xgmii_txd[15:0], BLOCK_TYPE_TERM_2};
            tx_bad_block_next = encode_err[7:3] != 0;
        end else if (xgmii_txc == 8'hf8 && xgmii_txd[31:24] == XGMII_TERM) begin
            // terminate in lane 3
            encoded_tx_data_next = {encoded_ctrl[55:28], 4'd0, xgmii_txd[23:0], BLOCK_TYPE_TERM_3};
            tx_bad_block_next = encode_err[7:4] != 0;
        end else if (xgmii_txc == 8'hf0 && xgmii_txd[39:32] == XGMII_TERM) begin
            // terminate in lane 4
            encoded_tx_data_next = {encoded_ctrl[55:35], 3'd0, xgmii_txd[31:0], BLOCK_TYPE_TERM_4};
            tx_bad_block_next = encode_err[7:5] != 0;
        end else if (xgmii_txc == 8'he0 && xgmii_txd[47:40] == XGMII_TERM) begin
            // terminate in lane 5
            encoded_tx_data_next = {encoded_ctrl[55:42], 2'd0, xgmii_txd[39:0], BLOCK_TYPE_TERM_5};
            tx_bad_block_next = encode_err[7:6] != 0;
        end else if (xgmii_txc == 8'hc0 && xgmii_txd[55:48] == XGMII_TERM) begin
            // terminate in lane 6
            encoded_tx_data_next = {encoded_ctrl[55:49], 1'd0, xgmii_txd[47:0], BLOCK_TYPE_TERM_6};
            tx_bad_block_next = encode_err[7] != 0;
        end else if (xgmii_txc == 8'h80 && xgmii_txd[63:56] == XGMII_TERM) begin
            // terminate in lane 7
            encoded_tx_data_next = {xgmii_txd[55:0], BLOCK_TYPE_TERM_7};
            tx_bad_block_next = 1'b0;
        end else if (xgmii_txc == 8'hff) begin
            // all control
            encoded_tx_data_next = {encoded_ctrl, BLOCK_TYPE_CTRL};
            tx_bad_block_next = encode_err != 0;
        end else begin
            // no corresponding block format
            encoded_tx_data_next = {{8{CTRL_ERROR}}, BLOCK_TYPE_CTRL};
            tx_bad_block_next = 1'b1;
        end
        encoded_tx_hdr_next = SYNC_CTRL; // se establece que el encabezado es de tipo CONTROL
    end
end

always @(posedge clk) begin	// en cada flanco positivo del clock se actualizan los registros con sus respectivos valores calculados en el bloque anterior
    encoded_tx_data_reg <= encoded_tx_data_next;	
    encoded_tx_hdr_reg <= encoded_tx_hdr_next;

    tx_bad_block_reg <= tx_bad_block_next;
end

endmodule

`resetall