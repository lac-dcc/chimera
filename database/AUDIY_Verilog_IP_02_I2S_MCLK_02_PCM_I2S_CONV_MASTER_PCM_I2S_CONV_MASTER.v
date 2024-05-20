// This program was cloned from: https://github.com/AUDIY/AUDIY_Verilog_IP
// License: CERN Open Hardware Licence Version 2 - Permissive

/*-----------------------------------------------------------------------------
* PCM_I2S_CONV_MASTER.v
*
* PCM to I2S Converter (Synchronous w/ MCLK)
* 
* Version: 0.11
* Author : AUDIY
* Date   : 2024/03/10
* 
* Port
*   Input
*       MCLK_I : Master Clock Input (x2 or more faster than BCK_I).
*       BCK_I  : PCM Bit Clock Input
*       WCLK_I : PCM Word Clock Input
*       DATAL_I: PCM Left Data Input
*       DATAR_I: PCM Right Data Input
*       NRST_I : Synchronous Reset Input (Active Low).
*
*   Output
*       MCLK_O : Master Clock Output (Pass-through MCLK_I).
*       BCK_O  : I2S Bit Clock Output.
*       LRCK_O : I2S L/R Clock Output.
*       DATA_O : I2S Data Output.
*
* Parameters
*   PCM_BIT_WIDTH: PCM Bit Length (Default: 32)
*
* License under CERN-OHL-P v2
--------------------------------------------------------------------------------
| Copyright AUDIY 2024.                                                        |
|                                                                              |
| This source describes Open Hardware and is licensed under the CERN-OHL-P v2. |
|                                                                              |
| You may redistribute and modify this source and make products using it under |
| the terms of the CERN-OHL-P v2 (https:/cern.ch/cern-ohl).                    |
|                                                                              |
| This source is distributed WITHOUT ANY EXPRESS OR IMPLIED WARRANTY,          |
| INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A         |
| PARTICULAR PURPOSE. Please see the CERN-OHL-P v2 for applicable conditions.  |
--------------------------------------------------------------------------------
*
-----------------------------------------------------------------------------*/
module PCM_I2S_CONV_MASTER #(
    /* Parameter Definition */
    parameter PCM_BIT_WIDTH = 32
)(
    /* Input Port Definition */
    input  wire                            MCLK_I,
    input  wire                            BCK_I,
    input  wire                            WCLK_I,
    input  wire signed [PCM_BIT_WIDTH-1:0] DATAL_I,
    input  wire signed [PCM_BIT_WIDTH-1:0] DATAR_I,
    input  wire                            NRST_I,

    /* Output Port Definition */
    output wire                            MCLK_O,
    output wire                            BCK_O,
    output wire                            LRCK_O,
    output wire                            DATA_O
);

    /* Internal Register/Wire Definition */
    reg                       WCLK_REG   = 1'b1;
    reg                       BCK_REG    = 1'b1;
    reg [2*PCM_BIT_WIDTH-1:0] DATA_REG_p = {(2*PCM_BIT_WIDTH){1'b0}};
    reg [2*PCM_BIT_WIDTH-1:0] DATA_REG_n = {(2*PCM_BIT_WIDTH){1'b0}};
    reg                       DATAO_REG  = 1'b0;

    /* RTL */
    always @(posedge MCLK_I) begin
        WCLK_REG <= WCLK_I;
        BCK_REG  <= BCK_I;

        if ((WCLK_I & ~WCLK_REG) == 1'b1) begin
            /* posedge WCLK_I*/
            if (NRST_I == 1'b0) begin
                /* Mute While Reset */
                DATA_REG_p <= {(2*PCM_BIT_WIDTH){1'b0}};
            end else begin
                /* Store PCM Data to Data Register */
                DATA_REG_p <= {DATAL_I, DATAR_I};
            end
        end
        
        if ((~WCLK_I & WCLK_REG) == 1'b1) begin
            /* negedge WCLK_I */
            if (NRST_I == 1'b0) begin
                /* Mute While Reset */
                DATA_REG_n <= {(2*PCM_BIT_WIDTH){1'b0}};
            end else begin
                DATA_REG_n <= DATA_REG_p;
            end
        end else if ((~BCK_I & BCK_REG) == 1'b1) begin
            DATA_REG_n <= DATA_REG_n << 1;
        end

        if ((~BCK_I & BCK_REG) == 1'b1) begin
            DATAO_REG <= DATA_REG_n[2*PCM_BIT_WIDTH-1];
        end
    end

    /* Output Assign */
    assign MCLK_O = MCLK_I;
    assign BCK_O  = BCK_REG;
    assign LRCK_O = WCLK_REG;
    assign DATA_O = DATAO_REG;

endmodule
