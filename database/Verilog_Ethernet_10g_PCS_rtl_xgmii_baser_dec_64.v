// This program was cloned from: https://github.com/sofiavalos/Verilog_Ethernet_10g_PCS
// License: MIT License

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

/*
 * XGMII 10GBASE-R decoder
 */
module xgmii_baser_dec_64 #
(
    parameter DATA_WIDTH = 64,			// ancho de datos
    parameter CTRL_WIDTH = (DATA_WIDTH/8),	// ancho de control
    parameter HDR_WIDTH = 2			// ancho de header
)
(
    input  wire                  clk,		// señal de clock
    input  wire                  rst,		// señal de reinicio

    /*
     * 10GBASE-R encoded input
     */
    input  wire [DATA_WIDTH-1:0] encoded_rx_data,	// datos de entrada codificados
    input  wire [HDR_WIDTH-1:0]  encoded_rx_hdr,	// encabezado de entrada codificado

    /*
     * XGMII interface
     */
    output wire [DATA_WIDTH-1:0] xgmii_rxd,		// salida de datos para XGMII
    output wire [CTRL_WIDTH-1:0] xgmii_rxc,		// salida de control para XGMII

    /*
     * Status
     */
    output wire                  rx_bad_block,		// salida de estado para indicar bloques invalidos
    output wire                  rx_sequence_error	// salida de estado para indicar errores de secuencia
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

reg [DATA_WIDTH-1:0] decoded_ctrl;	// registro para almacenar control decodificado
reg [CTRL_WIDTH-1:0] decode_err;	// registro para almacenar errores en decodificacion

reg [DATA_WIDTH-1:0] xgmii_rxd_reg = {DATA_WIDTH{1'b0}}, xgmii_rxd_next;	// registro para almacenar la salida de datos de XGMII
reg [CTRL_WIDTH-1:0] xgmii_rxc_reg = {CTRL_WIDTH{1'b0}}, xgmii_rxc_next;	// registro para almacenar la salida de control de XGMII

reg rx_bad_block_reg = 1'b0, rx_bad_block_next;			// registro para almacenar el estado de bloques incorrectos
reg rx_sequence_error_reg = 1'b0, rx_sequence_error_next;	// registro para almacenar el estado de errores de secuencia
reg frame_reg = 1'b0, frame_next;				// registro para indicar el inicio de un nuevo marco de datos

assign xgmii_rxd = xgmii_rxd_reg;	// asignamos las salidas a sus respectivos registros
assign xgmii_rxc = xgmii_rxc_reg;

assign rx_bad_block = rx_bad_block_reg;
assign rx_sequence_error = rx_sequence_error_reg;

integer i;

always @* begin
    xgmii_rxd_next = {8{XGMII_ERROR}};		// el siguiente valor de salida de datos es 8 veces XGMII_ERROR (error en la transmision)
    xgmii_rxc_next = 8'hff;			// el siguiente valor de salida de control es FF (valor de control predeterminado o invalido)
    rx_bad_block_next = 1'b0;			// inicializa el registro de estado de error a 0
    rx_sequence_error_next = 1'b0;		// inicializa el registro de error de secuencia en 0
    frame_next = frame_reg;			// asigna el siguiente frame al actual frame

    for (i = 0; i < CTRL_WIDTH; i = i + 1) begin	// se iteran sobre los bytes de encoded_rx_data para decodificar el control correspondiente para cada byte
        case (encoded_rx_data[7*i+8 +: 7])
            CTRL_IDLE: begin
                decoded_ctrl[8*i +: 8] = XGMII_IDLE;
                decode_err[i] = 1'b0;
            end
            CTRL_LPI: begin
                decoded_ctrl[8*i +: 8] = XGMII_LPI;
                decode_err[i] = 1'b0;
            end
            CTRL_ERROR: begin
                decoded_ctrl[8*i +: 8] = XGMII_ERROR;
                decode_err[i] = 1'b0;
            end
            CTRL_RES_0: begin
                decoded_ctrl[8*i +: 8] = XGMII_RES_0;
                decode_err[i] = 1'b0;
            end
            CTRL_RES_1: begin
                decoded_ctrl[8*i +: 8] = XGMII_RES_1;
                decode_err[i] = 1'b0;
            end
            CTRL_RES_2: begin
                decoded_ctrl[8*i +: 8] = XGMII_RES_2;
                decode_err[i] = 1'b0;
            end
            CTRL_RES_3: begin
                decoded_ctrl[8*i +: 8] = XGMII_RES_3;
                decode_err[i] = 1'b0;
            end
            CTRL_RES_4: begin
                decoded_ctrl[8*i +: 8] = XGMII_RES_4;
                decode_err[i] = 1'b0;
            end
            CTRL_RES_5: begin
                decoded_ctrl[8*i +: 8] = XGMII_RES_5;
                decode_err[i] = 1'b0;
            end
            default: begin
                decoded_ctrl[8*i +: 8] = XGMII_ERROR;
                decode_err[i] = 1'b1;
            end
        endcase
    end

    // use only four bits of block type for reduced fanin
    if (encoded_rx_hdr[0] == 0) begin		// si el bit mas significativo del encabezado es cero, se trata de un bloque de datos
        xgmii_rxd_next = encoded_rx_data;	// se actualiza xgmii_rxd
        xgmii_rxc_next = 8'h00;			// se reinicia xgmii_rxc
        rx_bad_block_next = 1'b0;		// se reomocoa rx_bad_block
    end else begin				// si el bit mas significativo del encabezado no es cero, se trata de un bloque de control
        case (encoded_rx_data[7:4])		// se determina el tipo de bloque de control y se realiza la decodificacion correspondiente
            BLOCK_TYPE_CTRL[7:4]: begin
                // C7 C6 C5 C4 C3 C2 C1 C0 BT
                xgmii_rxd_next = decoded_ctrl;
                xgmii_rxc_next = 8'hff;
                rx_bad_block_next = decode_err != 0;
            end
            BLOCK_TYPE_OS_4[7:4]: begin
                // D7 D6 D5 O4 C3 C2 C1 C0 BT
                xgmii_rxd_next[31:0] = decoded_ctrl[31:0];
                xgmii_rxc_next[3:0] = 4'hf;
                xgmii_rxd_next[63:40] = encoded_rx_data[63:40];
                xgmii_rxc_next[7:4] = 4'h1;
                if (encoded_rx_data[39:36] == O_SEQ_OS) begin
                    xgmii_rxd_next[39:32] = XGMII_SEQ_OS;
                    rx_bad_block_next = decode_err[3:0] != 0;
                end else begin
                    xgmii_rxd_next[39:32] = XGMII_ERROR;
                    rx_bad_block_next = 1'b1;
                end
            end
            BLOCK_TYPE_START_4[7:4]: begin
                // D7 D6 D5    C3 C2 C1 C0 BT
                xgmii_rxd_next = {encoded_rx_data[63:40], XGMII_START, decoded_ctrl[31:0]};
                xgmii_rxc_next = 8'h1f;
                rx_bad_block_next = decode_err[3:0] != 0;
                rx_sequence_error_next = frame_reg;
                frame_next = 1'b1;
            end
            BLOCK_TYPE_OS_START[7:4]: begin
                // D7 D6 D5    O0 D3 D2 D1 BT
                xgmii_rxd_next[31:8] = encoded_rx_data[31:8];
                xgmii_rxc_next[3:0] = 4'hf;
                if (encoded_rx_data[35:32] == O_SEQ_OS) begin
                    xgmii_rxd_next[7:0] = XGMII_SEQ_OS;
                    rx_bad_block_next = 1'b0;
                end else begin
                    xgmii_rxd_next[7:0] = XGMII_ERROR;
                    rx_bad_block_next = 1'b1;
                end
                xgmii_rxd_next[63:32] = {encoded_rx_data[63:40], XGMII_START};
                xgmii_rxc_next[7:4] = 4'h1;
                rx_sequence_error_next = frame_reg;
                frame_next = 1'b1;
            end
            BLOCK_TYPE_OS_04[7:4]: begin
                // D7 D6 D5 O4 O0 D3 D2 D1 BT
                rx_bad_block_next = 1'b0;
                xgmii_rxd_next[31:8] = encoded_rx_data[31:8];
                xgmii_rxc_next[3:0] = 4'h1;
                if (encoded_rx_data[35:32] == O_SEQ_OS) begin
                    xgmii_rxd_next[7:0] = XGMII_SEQ_OS;
                end else begin
                    xgmii_rxd_next[7:0] = XGMII_ERROR;
                    rx_bad_block_next = 1'b1;
                end
                xgmii_rxd_next[63:40] = encoded_rx_data[63:40];
                xgmii_rxc_next[7:4] = 4'h1;
                if (encoded_rx_data[39:36] == O_SEQ_OS) begin
                    xgmii_rxd_next[39:32] = XGMII_SEQ_OS;
                end else begin
                    xgmii_rxd_next[39:32] = XGMII_ERROR;
                    rx_bad_block_next = 1'b1;
                end
            end
            BLOCK_TYPE_START_0[7:4]: begin
                // D7 D6 D5 D4 D3 D2 D1    BT
                xgmii_rxd_next = {encoded_rx_data[63:8], XGMII_START};
                xgmii_rxc_next = 8'h01;
                rx_bad_block_next = 1'b0;
                rx_sequence_error_next = frame_reg;
                frame_next = 1'b1;
            end
            BLOCK_TYPE_OS_0[7:4]: begin
                // C7 C6 C5 C4 O0 D3 D2 D1 BT
                xgmii_rxd_next[31:8] = encoded_rx_data[31:8];
                xgmii_rxc_next[3:0] = 4'h1;
                if (encoded_rx_data[35:32] == O_SEQ_OS) begin
                    xgmii_rxd_next[7:0] = XGMII_SEQ_OS;
                    rx_bad_block_next = decode_err[7:4] != 0;
                end else begin
                    xgmii_rxd_next[7:0] = XGMII_ERROR;
                    rx_bad_block_next = 1'b1;
                end
                xgmii_rxd_next[63:32] = decoded_ctrl[63:32];
                xgmii_rxc_next[7:4] = 4'hf;
            end
            BLOCK_TYPE_TERM_0[7:4]: begin
                // C7 C6 C5 C4 C3 C2 C1    BT
                xgmii_rxd_next = {decoded_ctrl[63:8], XGMII_TERM};
                xgmii_rxc_next = 8'hff;
                rx_bad_block_next = decode_err[7:1] != 0;
                rx_sequence_error_next = !frame_reg;
                frame_next = 1'b0;
            end
            BLOCK_TYPE_TERM_1[7:4]: begin
                // C7 C6 C5 C4 C3 C2    D0 BT
                xgmii_rxd_next = {decoded_ctrl[63:16], XGMII_TERM, encoded_rx_data[15:8]};
                xgmii_rxc_next = 8'hfe;
                rx_bad_block_next = decode_err[7:2] != 0;
                rx_sequence_error_next = !frame_reg;
                frame_next = 1'b0;
            end
            BLOCK_TYPE_TERM_2[7:4]: begin
                // C7 C6 C5 C4 C3    D1 D0 BT
                xgmii_rxd_next = {decoded_ctrl[63:24], XGMII_TERM, encoded_rx_data[23:8]};
                xgmii_rxc_next = 8'hfc;
                rx_bad_block_next = decode_err[7:3] != 0;
                rx_sequence_error_next = !frame_reg;
                frame_next = 1'b0;
            end
            BLOCK_TYPE_TERM_3[7:4]: begin
                // C7 C6 C5 C4    D2 D1 D0 BT
                xgmii_rxd_next = {decoded_ctrl[63:32], XGMII_TERM, encoded_rx_data[31:8]};
                xgmii_rxc_next = 8'hf8;
                rx_bad_block_next = decode_err[7:4] != 0;
                rx_sequence_error_next = !frame_reg;
                frame_next = 1'b0;
            end
            BLOCK_TYPE_TERM_4[7:4]: begin
                // C7 C6 C5    D3 D2 D1 D0 BT
                xgmii_rxd_next = {decoded_ctrl[63:40], XGMII_TERM, encoded_rx_data[39:8]};
                xgmii_rxc_next = 8'hf0;
                rx_bad_block_next = decode_err[7:5] != 0;
                rx_sequence_error_next = !frame_reg;
                frame_next = 1'b0;
            end
            BLOCK_TYPE_TERM_5[7:4]: begin
                // C7 C6    D4 D3 D2 D1 D0 BT
                xgmii_rxd_next = {decoded_ctrl[63:48], XGMII_TERM, encoded_rx_data[47:8]};
                xgmii_rxc_next = 8'he0;
                rx_bad_block_next = decode_err[7:6] != 0;
                rx_sequence_error_next = !frame_reg;
                frame_next = 1'b0;
            end
            BLOCK_TYPE_TERM_6[7:4]: begin
                // C7    D5 D4 D3 D2 D1 D0 BT
                xgmii_rxd_next = {decoded_ctrl[63:56], XGMII_TERM, encoded_rx_data[55:8]};
                xgmii_rxc_next = 8'hc0;
                rx_bad_block_next = decode_err[7] != 0;
                rx_sequence_error_next = !frame_reg;
                frame_next = 1'b0;
            end
            BLOCK_TYPE_TERM_7[7:4]: begin
                //    D6 D5 D4 D3 D2 D1 D0 BT
                xgmii_rxd_next = {XGMII_TERM, encoded_rx_data[63:8]};
                xgmii_rxc_next = 8'h80;
                rx_bad_block_next = 1'b0;
                rx_sequence_error_next = !frame_reg;
                frame_next = 1'b0;
            end
            default: begin				// en caso que no corresponda con ningun tipo de bloque, el bloque es invalido y se asignan valores predeterminados de error
                // invalid block type
                xgmii_rxd_next = {8{XGMII_ERROR}};
                xgmii_rxc_next = 8'hff;
                rx_bad_block_next = 1'b1;
            end
        endcase
    end

    // check all block type bits to detect bad encodings, se realiza una verificacion de los bits de tipo de bloque para detectar codificaciones incorrectas
    if (encoded_rx_hdr == SYNC_DATA) begin		// si el encabezado es de datos (no hace nada)
    end else if (encoded_rx_hdr == SYNC_CTRL) begin	// si el encabezado es de control
        case (encoded_rx_data[7:0])			// case de los bits que representan el tipo de bloques
            BLOCK_TYPE_CTRL: begin end			// si coincide con cualquiera de los tipos de bloques predefinidos sale del case indicando que no hay error en el tipo de bloque
            BLOCK_TYPE_OS_4: begin end
            BLOCK_TYPE_START_4: begin end
            BLOCK_TYPE_OS_START: begin end
            BLOCK_TYPE_OS_04: begin end
            BLOCK_TYPE_START_0: begin end
            BLOCK_TYPE_OS_0: begin end
            BLOCK_TYPE_TERM_0: begin end
            BLOCK_TYPE_TERM_1: begin end
            BLOCK_TYPE_TERM_2: begin end
            BLOCK_TYPE_TERM_3: begin end
            BLOCK_TYPE_TERM_4: begin end
            BLOCK_TYPE_TERM_5: begin end
            BLOCK_TYPE_TERM_6: begin end
            BLOCK_TYPE_TERM_7: begin end
            default: begin				// si no coincide con ninguno de los tipos de bloques predefinidos indica error
                // invalid block type
                xgmii_rxd_next = {8{XGMII_ERROR}};
                xgmii_rxc_next = 8'hff;
                rx_bad_block_next = 1'b1;
            end
        endcase
    end else begin					// si el encabezado no es ni de datos ni de control tambien se indica error
        // invalid header
        xgmii_rxd_next = {8{XGMII_ERROR}};
        xgmii_rxc_next = 8'hff;
        rx_bad_block_next = 1'b1;
    end
end

always @(posedge clk) begin		// en cada flanco positivo de clock se actualizan los registros y se verifica si hubo un reset, en cuyo caso el frame pasa a ser 0
    xgmii_rxd_reg <= xgmii_rxd_next;
    xgmii_rxc_reg <= xgmii_rxc_next;

    rx_bad_block_reg <= rx_bad_block_next;
    rx_sequence_error_reg <= rx_sequence_error_next;
    frame_reg <= frame_next;

    if (rst) begin
        frame_reg <= 1'b0;
    end
end

endmodule

`resetall