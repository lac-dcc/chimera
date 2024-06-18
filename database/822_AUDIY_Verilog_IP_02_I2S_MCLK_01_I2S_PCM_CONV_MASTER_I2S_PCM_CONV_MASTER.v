// This program was cloned from: https://github.com/AUDIY/AUDIY_Verilog_IP
// License: CERN Open Hardware Licence Version 2 - Permissive

/*-----------------------------------------------------------------------------
* I2S_PCM_CONV_MASTER.v
*
* I2S to PCM Converter (Synchronous w/ MCLK)
* 
* Version: 0.11
* Author : AUDIY
* Date   : 2024/03/10
* 
* Port
*   Input
*       MCLK_I: Master Clock Input (x2 or more faster than BCK_I).
*       BCK_I : I2S Bit Clock Input
*       LRCK_I: I2S L/R Clock Input
*       DATA_I: I2S Data Input
*       NRST_I: Synchronous Reset Input (Active Low).
*
*   Output
*       MCLK_O : Master Clock Output (Pass-through MCLK_I).
*       BCK_O  : PCM Bit Clock Output.
*       WCLK_O : PCM Word Clock Output.
*       DATAL_O: PCM Left Data Output.
*       DATAR_O: PCM Right Data Output.
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
module I2S_PCM_CONV_MASTER #(
    /* Parameter Definition */
    parameter PCM_BIT_WIDTH = 32
)(
    /* Input Port Definition */
    input  wire                            MCLK_I,
    input  wire                            BCK_I,
    input  wire                            LRCK_I,
    input  wire                            DATA_I,
    input  wire                            NRST_I,

    /* Output Port Definition */
    output wire                            MCLK_O,
    output wire                            BCK_O,
    output wire                            WCLK_O,
    output wire signed [PCM_BIT_WIDTH-1:0] DATAL_O,
    output wire signed [PCM_BIT_WIDTH-1:0] DATAR_O
);

    /* Internal Register/Wire Definition */
    reg                              BCK_REG   = 1'b1;
    reg                              LRCK_REG1 = 1'b1;
    reg                              LRCK_REG2 = 1'b1;
    reg signed [2*PCM_BIT_WIDTH-1:0] DATA_REG  = {(2*PCM_BIT_WIDTH){1'b0}};
    reg signed [PCM_BIT_WIDTH-1:0]   DATAL_REG = {(PCM_BIT_WIDTH){1'b0}};
    reg signed [PCM_BIT_WIDTH-1:0]   DATAR_REG = {(PCM_BIT_WIDTH){1'b0}};

    /* RTL */
    always @ (posedge MCLK_I) begin
        BCK_REG  <= BCK_I;

        if ((BCK_I & ~BCK_REG) == 1'b1) begin
            /* posedge BCK_I */
            LRCK_REG1 <= LRCK_I;
            if (NRST_I == 1'b0) begin
                /* Mute While Reset */
                DATA_REG <= {(2*PCM_BIT_WIDTH){1'b0}};
            end else begin
                /* Store DATA_I to Data Register */
                DATA_REG <= {DATA_REG[2*PCM_BIT_WIDTH-2:0], DATA_I};
            end
        end

        if ((~BCK_I & BCK_REG) == 1'b1) begin
            /* negedge BCK_I */
            LRCK_REG2 <= LRCK_REG1;
            if ((~LRCK_REG1 & LRCK_REG2) == 1'b1) begin
                /* negedge LRCK_I */
                if (NRST_I == 1'b0) begin
                    /* Mute While Reset */
                    DATAL_REG <= {(PCM_BIT_WIDTH){1'b0}};
                    DATAR_REG <= {(PCM_BIT_WIDTH){1'b0}};
                end else begin
                    /* PCM Data Output */
                    DATAL_REG <= DATA_REG[2*PCM_BIT_WIDTH-1:PCM_BIT_WIDTH];
                    DATAR_REG <= DATA_REG[PCM_BIT_WIDTH-1:0];
                end
            end
        end
    end

    /* Output Assign */
    assign MCLK_O  = MCLK_I;
    assign BCK_O   = BCK_REG;
    assign WCLK_O  = LRCK_REG2;
    assign DATAL_O = DATAL_REG;
    assign DATAR_O = DATAR_REG;

endmodule
