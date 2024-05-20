// This program was cloned from: https://github.com/AUDIY/AUDIY_Verilog_IP
// License: CERN Open Hardware Licence Version 2 - Permissive

/*-----------------------------------------------------------------------------
* INTEGRATOR_FWD.v
*
* Forward Eular Method Integrator (w/ Saturation) Module
*
* Transfer Function:
*    z^(-1)          1
* ------------ or -------
*  1 - z^(-1)      z - 1 
*
* Version: 1.01
* Author : AUDIY
* Date   : 2024/05/01
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
module INTEGRATOR_FWD #(
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
    reg                             CLKI_REG      =                   1'b0;
    reg                             CLKO_REG      =                   1'b0;
    reg signed [DATA_BIT_WIDTH-1:0] DATA_REG_POS  = {(DATA_BIT_WIDTH){1'b0}};
    reg signed [DATA_BIT_WIDTH-1:0] DATA_REG_NEG  = {(DATA_BIT_WIDTH){1'b0}};
    reg                             OFDET_REG_POS =                   1'b0;
    reg                             OFDET_REG_NEG =                   1'b0;
    reg                             UFDET_REG_POS =                   1'b0;
    reg                             UFDET_REG_NEG =                   1'b0;

    wire signed [DATA_BIT_WIDTH:0] SUM_DATA;

    assign SUM_DATA = (NRST_I == 1'b0) ? {(DATA_BIT_WIDTH+1){1'b0}} : ({DATA_I[DATA_BIT_WIDTH-1], DATA_I} + {DATA_O[DATA_BIT_WIDTH-1], DATA_O});

    always @(posedge MCLK_I) begin
        if (NRST_I == 1'b0) begin
            /* Reset */
            CLKI_REG      <=                   1'b0;
            CLKO_REG      <=                   1'b0;
            DATA_REG_POS  <= {(DATA_BIT_WIDTH){1'b0}};
            DATA_REG_NEG  <= {(DATA_BIT_WIDTH){1'b0}};
            OFDET_REG_POS <=                   1'b0;
            OFDET_REG_NEG <=                   1'b0;
            UFDET_REG_POS <=                   1'b0;
            UFDET_REG_NEG <=                   1'b0;
        end else begin
            CLKI_REG <= CLK_I;

            /* Positive Edge of Data Clk (CLK_I) */
            if ((CLKI_REG == 1'b0) && (CLK_I == 1'b1)) begin
                CLKO_REG <= CLK_I;
                case (SUM_DATA[DATA_BIT_WIDTH:DATA_BIT_WIDTH-1])
                    2'b01: begin
                        // Overflow
                        // Ex. 5'b01111 + 5'b00001 = 5'b01111 (6'b010000)
                        DATA_REG_POS  <= {1'b0, {(DATA_BIT_WIDTH-1){1'b1}}};
                        OFDET_REG_POS <=  1'b1;
                        UFDET_REG_POS <=  1'b0;
                    end

                    2'b10: begin
                        // Underflow
                        // Ex. 5'b10000 + 5'b11110 = 5'b10000 (6'b101111)
                        DATA_REG_POS  <= {1'b1, {(DATA_BIT_WIDTH-1){1'b0}}};
                        OFDET_REG_POS <=  1'b0;
                        UFDET_REG_POS <=  1'b1;
                    end 

                    default: begin
                        // Normal Operation
                        DATA_REG_POS  <= {SUM_DATA[DATA_BIT_WIDTH], SUM_DATA[DATA_BIT_WIDTH-2:0]};
                        OFDET_REG_POS <= 1'b0;
                        UFDET_REG_POS <= 1'b0;
                    end 
                endcase
            end

            /* Negative Edge of Data Clock (CLK_I) */
            if ((CLKI_REG == 1'b1) && (CLK_I == 1'b0)) begin
                CLKO_REG      <= CLK_I        ;
                DATA_REG_NEG  <= DATA_REG_POS ;
                OFDET_REG_NEG <= OFDET_REG_POS;
                UFDET_REG_NEG <= UFDET_REG_POS;
            end
        end
    end

    /* Output Assign */
    assign CLK_O   = CLKO_REG     ;
    assign DATA_O  = DATA_REG_NEG ;
    assign OFDET_O = OFDET_REG_NEG;
    assign UFDET_O = UFDET_REG_NEG;

endmodule
