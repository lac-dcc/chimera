// This program was cloned from: https://github.com/AUDIY/AUDIY_Verilog_IP
// License: CERN Open Hardware Licence Version 2 - Permissive

/*-----------------------------------------------------------------------------
* INTEGRATOR_BACK.v
*
* Back Eular Method Integrator (w/ Saturation) Module
*
* Transfer Function:
*      1             z
* ------------ or -------
*  1 - z^(-1)      z - 1 
*
* Version: 1.02
* Author : AUDIY
* Date   : 2024/05/03
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
*       DATA_O : Integrated Data Output
*       OFDET_O: Overflow Detection
*                1'b1: Overflow
*                1'b0: Valid (NOT Overflow)
*       UFDET_O: Underflow Detection
*                1'b1: Underflow
*                1'b0: Valid (NOT Underflow)
*
* Parameters
*   DATA_BIT_WIDTH: Input Data Bit Width (Default: 32)
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
module INTEGRATOR_BACK #(
    /* Parameter Definition */
    parameter DATA_BIT_WIDTH = 32
)(
    /* Input Port Definition */
    input  wire                             MCLK_I ,
    input  wire                             CLK_I  ,
    input  wire signed [DATA_BIT_WIDTH-1:0] DATA_I ,
    input  wire                             NRST_I ,

    /* Output Port Definition */
    output wire                             CLK_O  ,
    output wire signed [DATA_BIT_WIDTH-1:0] DATA_O ,
    output wire                             OFDET_O,
    output wire                             UFDET_O
);

    /* Internal wire/reg Definition */
    reg CLKI_REG = 1'b0;
    reg CLKO_REG = 1'b0;
    reg signed [DATA_BIT_WIDTH-1:0] DATA_REG_POS = {(DATA_BIT_WIDTH){1'b0}};
    reg signed [DATA_BIT_WIDTH-1:0] DATA_REG_NEG = {(DATA_BIT_WIDTH){1'b0}};
    reg signed [DATA_BIT_WIDTH-1:0] DATAI_REG    = {(DATA_BIT_WIDTH){1'b0}}; 
    wire signed [DATA_BIT_WIDTH:0] SUM_DATA;

    assign SUM_DATA = (NRST_I == 1'b0) ? {(DATA_BIT_WIDTH+1){1'b0}} : ({DATAI_REG[DATA_BIT_WIDTH-1], DATAI_REG} + {DATA_REG_NEG[DATA_BIT_WIDTH-1], DATA_REG_NEG});

    always @(posedge MCLK_I ) begin
        if (NRST_I == 1'b0) begin
            CLKI_REG     <=                   1'b0;
            CLKO_REG     <=                   1'b0;
            DATA_REG_POS <= {(DATA_BIT_WIDTH){1'b0}};
            DATA_REG_NEG <= {(DATA_BIT_WIDTH){1'b0}};
            DATAI_REG    <= {(DATA_BIT_WIDTH){1'b0}};
        end else begin
            CLKI_REG <= CLK_I;

            /* Positive Edge of Data Clk (CLK_I) */
            if ((CLKI_REG == 1'b0) && (CLK_I == 1'b1)) begin
                CLKO_REG     <= CLK_I ;
                DATA_REG_POS <= DATA_O;
            end

            /* Negative Edge of Data Clock (CLK_I) */
            if ((CLKI_REG == 1'b1) && (CLK_I == 1'b0)) begin
                CLKO_REG     <= CLK_I       ;
                DATAI_REG    <= DATA_I      ;
                DATA_REG_NEG <= DATA_REG_POS;
            end
        end
    end

    /* Assign Output */
    assign {UFDET_O, OFDET_O, DATA_O} = assign_out(SUM_DATA);
    assign CLK_O = CLKO_REG;

    /* Saturation process */
    // Output: {UFDET_O, OFDET_O, DATA_O}
    function [DATA_BIT_WIDTH+1:0] assign_out;
        input [DATA_BIT_WIDTH:0] SUMDATA;
    begin
        case (SUMDATA[DATA_BIT_WIDTH:DATA_BIT_WIDTH-1])
            2'b01: begin
                // Overflow
                // Ex. 5'b01111 + 5'b00001 = 5'b01111 (6'b010000)
                assign_out = {1'b0, 1'b1, 1'b0, {(DATA_BIT_WIDTH-1){1'b1}}};
            end

            2'b10: begin
                // Underflow
                // Ex. 5'b10000 + 5'b11110 = 5'b10000 (6'b101111)
                assign_out = {1'b1, 1'b0, 1'b1, {(DATA_BIT_WIDTH-1){1'b0}}};
            end 

            default: begin
                // Normal Operation
                assign_out = {1'b0, 1'b0, SUMDATA[DATA_BIT_WIDTH], SUMDATA[DATA_BIT_WIDTH-2:0]};
            end 
        endcase
    end  
    endfunction

endmodule
