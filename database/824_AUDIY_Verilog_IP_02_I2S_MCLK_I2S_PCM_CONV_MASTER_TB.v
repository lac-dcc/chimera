// This program was cloned from: https://github.com/AUDIY/AUDIY_Verilog_IP
// License: CERN Open Hardware Licence Version 2 - Permissive

/*-----------------------------------------------------------------------------
* I2S_PCM_CONV_MASTER_TB.v
*
* Test-bench for I2S_PCM_CONV_MASTER.v
* 
* Version: 0.11
* Author : AUDIY
* Date   : 2024/03/10
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
`timescale 1 ns / 10 ps
module I2S_PCM_CONV_MASTER_TB();
    
    localparam DATA_WIDTH = 32;

    reg  MCLK_I = 1'b1;
    wire BCK_I;
    wire LRCK_I;
    reg  DATA_I = 1'b0;
    reg  NRST_I = 1'b1;

    wire                         MCLK_O;
    wire                         BCK_O;
    wire                         WCLK_O;
    wire signed [DATA_WIDTH-1:0] DATAL_O;
    wire signed [DATA_WIDTH-1:0] DATAR_O;

    wire BCK;
    wire LRCK;
    wire DATA;

    integer fp;
    integer rp;

    reg        [8:0]            MCLK_CNT = {9{1'b0}};
    reg signed [DATA_WIDTH-1:0] DATAREG  = {DATA_WIDTH{1'b0}};

    reg signed [DATA_WIDTH-1:0] PCML_I = {DATA_WIDTH{1'b0}};
    reg signed [DATA_WIDTH-1:0] PCMR_I = {DATA_WIDTH{1'b0}};

    initial begin
        $dumpfile("I2S_PCM_CONV_MASTER_TB.vcd");
        $dumpvars(0, I2S_PCM_CONV_MASTER_TB);

        if (fp != 0) begin
            $fclose(fp);
        end

        fp = $fopen("PCM_1kHz_44100fs_32bit.txt", "r");

        if (fp == 0) begin
            $display("ERROR: The file doesn't exist.");
            $finish(0);
        end

        #400000 $finish;
    end

    always begin
        #1 MCLK_I <= ~MCLK_I;
    end

    always @ (negedge MCLK_I) begin
        MCLK_CNT <= MCLK_CNT + 1'b1;
    end
    
    always begin
        #100000 NRST_I <= 1'b0;
        #20000  NRST_I <= 1'b1;
    end
    

    assign BCK_I  = MCLK_CNT[0];
    assign LRCK_I = MCLK_CNT[6];

    always @ (posedge LRCK_I) begin
        rp = $fscanf(fp, "%d\n", DATAREG);
    end

    always @ (negedge LRCK_I) begin
        PCML_I <= DATAREG;
        PCMR_I <= ~DATAREG;
    end

    PCM_I2S_CONV_MASTER #(
        .PCM_BIT_WIDTH(DATA_WIDTH)
    ) u_PCM_I2S_CONV_MASTER (
        .MCLK_I(MCLK_I),
        .BCK_I(BCK_I),
        .WCLK_I(LRCK_I),
        .DATAL_I(PCML_I),
        .DATAR_I(PCMR_I),
        .NRST_I(NRST_I),
        .MCLK_O(),
        .BCK_O(BCK),
        .LRCK_O(LRCK),
        .DATA_O(DATA)
    );

    I2S_PCM_CONV_MASTER #(
        .PCM_BIT_WIDTH(DATA_WIDTH)
    ) u_I2S_PCM_CONV_MASTER (
        .MCLK_I(MCLK_I),
        .BCK_I(BCK),
        .LRCK_I(LRCK),
        .DATA_I(DATA),
        .NRST_I(NRST_I),
        .MCLK_O(MCLK_O),
        .BCK_O(BCK_O),
        .WCLK_O(WCLK_O),
        .DATAL_O(DATAL_O),
        .DATAR_O(DATAR_O)
    );

endmodule
