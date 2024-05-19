// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
//                        Project Polyphony
//
// File:
//   fm_cmn_dram_01.v
//
// Abstract:
//   Dualport RAM, which will be mapped onto distributed ram
//
//  Created:
//    10 April 2009
//
// Copyright (c) 2008-2009  Kenji Ishimaru, All rights reserved.
//
//======================================================================
//  Revision History

// synthesis attribute ram_style of fm_cmn_dram_01 is distributed;

module fm_cmn_dram_01 (
    clk,
    we,
    a,
    dpra,
    di,
    spo,
    dpo
 );

//////////////////////////////////
// parameter
//////////////////////////////////
    parameter P_WIDTH = 32;
    parameter P_RANGE = 2;
    parameter P_DEPTH = 1 << P_RANGE;
//////////////////////////////////
// I/O port definition
//////////////////////////////////
    input                clk;
    input                we;
    input  [P_RANGE-1:0] a;
    input  [P_RANGE-1:0] dpra;
    input  [P_WIDTH-1:0] di;
    output [P_WIDTH-1:0] spo;
    output [P_WIDTH-1:0] dpo;

//////////////////////////////////
// reg 
//////////////////////////////////
    reg [P_WIDTH-1:0] ram [P_DEPTH-1:0];
    reg [P_WIDTH-1:0] spo;
    reg [P_WIDTH-1:0] dpo;

//////////////////////////////////
// always
//////////////////////////////////
    // port A: write-first
    always @(posedge clk) begin
        if (we) begin
            ram[a] <= di;
            spo <= di;
        end else begin
            spo <= ram[a];
        end
    end

    // port B: read-first
    always @(posedge clk) begin
        dpo <= ram[dpra];
    end
endmodule
