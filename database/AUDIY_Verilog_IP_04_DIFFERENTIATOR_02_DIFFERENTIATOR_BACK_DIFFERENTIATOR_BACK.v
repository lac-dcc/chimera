// This program was cloned from: https://github.com/AUDIY/AUDIY_Verilog_IP
// License: CERN Open Hardware Licence Version 2 - Permissive

/*-----------------------------------------------------------------------------
* DIFFERENTIATOR_BACK.v
*
* Back Eular Method Differentiator (w/ M-length Latch) Module
*
* Version: 1.02
* Author : AUDIY
* Date   : 2024/05/02
* 
* Port
*   Input
*       MCLK_I : Master Clock Input
*       CLK_I  : Data Clock Input
*       DATA_I : Data Input (Width: DATA_BIT_WIDTH)
*       NRST_I : Synchronous Reset Input (Active LOW)
*
*   Output
*       CLK_O  : Data Clock Output
*       DATA_O : Differentiated Data Output
*       OFDET_O: Overflow Detection
*                1'b1: Overflow
*                1'b0: Valid (NOT Overflow)
*       UFDET_O: Underflow Detection
*                1'b1: Underflow
*                1'b0: Valid (NOT Underflow)
*
* Parameters
*   DATA_BIT_WIDTH: Input Data Bit Width (Default: 32)
*   LATCH_LENGTH  : Data Latch Length (Default: 3)
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
module DIFFERENTIATOR_BACK #(
    /* Parameter Definition */
    parameter DATA_BIT_WIDTH = 32,
    parameter LATCH_LENGTH = 3
)(
    /* Input Port Definition */
    input  wire                              MCLK_I ,
    input  wire                              CLK_I  ,
    input  wire signed  [DATA_BIT_WIDTH-1:0] DATA_I ,
    input  wire                              NRST_I ,
    /* Output Port Definition */
    output wire                              CLK_O  ,
    output wire signed  [DATA_BIT_WIDTH-1:0] DATA_O ,
    output wire                              OFDET_O,
    output wire                              UFDET_O
);

    /* Internal Wire/Reg Definition */
    reg     CLKI_REG =               1'b0;
    reg     CLKO_REG =               1'b0;
    reg     signed [DATA_BIT_WIDTH-1:0] DATA_REG_POS [0:LATCH_LENGTH-1];
    reg     signed [DATA_BIT_WIDTH-1:0] DATAI_REG    = {(DATA_BIT_WIDTH){1'b0}};
    reg     signed [DATA_BIT_WIDTH-1:0] DATA_REG_NEG = {(DATA_BIT_WIDTH){1'b0}};
    wire    signed [DATA_BIT_WIDTH:0]   DIFF_DATA;
    integer ii       =               0;

    /* Initialize the shift register */
    generate
        genvar i;
        for (i = 0; i < LATCH_LENGTH; i = i + 1) begin : gen_init1
            initial begin
                DATA_REG_POS[i] = {(DATA_BIT_WIDTH){1'b0}};
            end
        end
    endgenerate

    always @(posedge MCLK_I ) begin
        if (NRST_I == 1'b0) begin
            CLKI_REG                     <=                   1'b0;
            CLKO_REG                     <=                   1'b0;
            DATAI_REG                    <= {(DATA_BIT_WIDTH){1'b0}};
            DATA_REG_NEG                 <= {(DATA_BIT_WIDTH){1'b0}};

            /* Reset Shit Register */
            for (ii = 0; ii < LATCH_LENGTH; ii = ii + 1) begin : for_reset1
                DATA_REG_POS[ii] <= {(DATA_BIT_WIDTH){1'b0}};
            end
        end else begin
            CLKI_REG <= CLK_I;

            /* Positive Edge of Data Clock (CLK_I) */
            if ((CLKI_REG == 1'b0) && (CLK_I == 1'b1)) begin
                CLKO_REG <= CLK_I;
                for (ii = 0; ii < LATCH_LENGTH; ii = ii + 1) begin : for_normal
                    if (ii == 0) begin
                        DATA_REG_POS[ii] <= DATA_I;
                    end else begin
                        DATA_REG_POS[ii] <= DATA_REG_POS[ii - 1];
                    end
                end
            end

            /* Negative Edge of Data Clock (CLK_I) */
            if ((CLKI_REG == 1'b1) && (CLK_I == 1'b0)) begin
                CLKO_REG     <= CLK_I                       ;
                DATAI_REG    <= DATA_I                      ;
                DATA_REG_NEG <= DATA_REG_POS[LATCH_LENGTH-1];
            end
        end
    end

    /* Output Assign */
    assign  CLK_O                       =  CLKO_REG;
    assign  DIFF_DATA                   = (NRST_I == 1'b0) ? {(DATA_BIT_WIDTH+1){1'b0}} : {DATAI_REG[DATA_BIT_WIDTH-1], DATAI_REG} - {DATA_REG_NEG[DATA_BIT_WIDTH-1], DATA_REG_NEG};
    assign {OFDET_O  , UFDET_O, DATA_O} =  assign_out(DIFF_DATA);

    /* Overflow/Underflow Detection & Output alligning */
    function [DATA_BIT_WIDTH+1:0] assign_out;
        input [DATA_BIT_WIDTH:0] DIFFDATA;
    begin
        case (DIFFDATA[DATA_BIT_WIDTH:DATA_BIT_WIDTH-1])
            2'b01: begin
                // Overflow
                // Ex. 5'b01111 + 5'b00001 = 5'b01111 (6'b010000)
                assign_out = {1'b1, 1'b0, 1'b0, {(DATA_BIT_WIDTH-1){1'b1}}};
            end

            2'b10: begin
                // Underflow
                // Ex. 5'b10000 + 5'b11110 = 5'b10000 (6'b101111)
                assign_out = {1'b0, 1'b1, 1'b1, {(DATA_BIT_WIDTH-1){1'b0}}};
            end 

            default: begin
                // Normal Operation
                assign_out = {1'b0, 1'b0, DIFFDATA[DATA_BIT_WIDTH], DIFFDATA[DATA_BIT_WIDTH-2:0]};
            end
        endcase
    end    
    endfunction

endmodule
