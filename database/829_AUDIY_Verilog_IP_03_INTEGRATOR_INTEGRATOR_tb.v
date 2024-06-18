// This program was cloned from: https://github.com/AUDIY/AUDIY_Verilog_IP
// License: CERN Open Hardware Licence Version 2 - Permissive

/*-----------------------------------------------------------------------------
* INTEGRATOR_tb.v
*
* Test bench for INTEGRATOR_FWD.v & INTEGRATOR_BACK.v
*
* Version: 1.01
* Author : AUDIY
* Date   : 2024/05/02
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
`timescale 1ns/1ps

module INTEGRATOR_tb ();
    
    localparam DATA_BIT_WIDTH = 5;

    wire MCLK_I;
    wire CLK_I ;
    reg  signed [DATA_BIT_WIDTH-1:0] DATA_I = {(DATA_BIT_WIDTH){1'b0}};
    reg  NRST_I = 1'b1;

    reg [5:0] CLK_REG = 6'b000000;

    wire                             CLK_O_u0;
    wire                             CLK_O_u1;
    wire signed [DATA_BIT_WIDTH-1:0] DATA_O_u0;
    wire signed [DATA_BIT_WIDTH-1:0] DATA_O_u1;
    wire                             OFDET_O_u0;
    wire                             OFDET_O_u1;
    wire                             UFDET_O_u0;
    wire                             UFDET_O_u1;

    INTEGRATOR_FWD #(
        .DATA_BIT_WIDTH(DATA_BIT_WIDTH)
    ) u0 (
        .MCLK_I  (MCLK_I     ),
        .CLK_I   (CLK_I      ),
        .DATA_I  (DATA_I     ),
        .NRST_I  (NRST_I     ),
        .CLK_O   (CLK_O_u0   ),
        .DATA_O  (DATA_O_u0  ),
        .OFDET_O (OFDET_O_u0 ),
        .UFDET_O (UFDET_O_u0 )
    );

    INTEGRATOR_BACK #(
        .DATA_BIT_WIDTH(DATA_BIT_WIDTH)
    ) u1 (
        .MCLK_I  (MCLK_I     ),
        .CLK_I   (CLK_I      ),
        .DATA_I  (DATA_I     ),
        .NRST_I  (NRST_I     ),
        .CLK_O   (CLK_O_u1   ),
        .DATA_O  (DATA_O_u1  ),
        .OFDET_O (OFDET_O_u1 ),
        .UFDET_O (UFDET_O_u1 )
    );

    initial begin
        $dumpfile("INTEGRATOR_tb.vcd");
        $dumpvars(0, INTEGRATOR_tb);

        #100000 $finish;
    end

    always begin
        #1 CLK_REG <= CLK_REG + 1'b1;
    end

    always begin
        // Decrement
        #4096 DATA_I <= {(DATA_BIT_WIDTH){1'b1}};

        // Increment
        #4096 DATA_I <= {{(DATA_BIT_WIDTH-1){1'b0}}, 1'b1};
    end

    always begin
        #30000 NRST_I <= 1'b0;
        #20    NRST_I <= 1'b1;
    end

    assign MCLK_I = CLK_REG[0];
    assign CLK_I = CLK_REG[5];

endmodule
