//=======================================================================
//                        Project Polyphony
//
// File:
//   fm_cmn_bram_00.v
//
// Abstract:
//   Dualport RAM, which will be mapped onto block ram
//
//  Created:
//    20 October 2008
//
// Copyright (c) 2008  Kenji Ishimaru, All rights reserved.
//
//======================================================================
//  Revision History

// sssssssynthesis attribute ram_style of fm_cmn_bram_00 is block;

module fm_cmn_bram_00 (
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
    reg [P_RANGE-1:0] read_a;
    reg [P_RANGE-1:0] read_dpra;

//////////////////////////////////
// assign 
//////////////////////////////////
    assign spo = ram[read_a];
    assign dpo = ram[read_dpra];
//////////////////////////////////
// always
//////////////////////////////////
    always @(posedge clk) begin
        if (we) ram[a] <= di;
        read_a <= a;
        read_dpra <= dpra;
    end

endmodule
