//=======================================================================
//                        Project Polyphony
//
// File:
//   fm_cmn_bram_02.v
//
// Abstract:
//   Dualport RAM, which will be mapped onto block ram
//   with different clocks
//  Created:
//    5 November 2008
//
// Copyright (c) 2008  Kenji Ishimaru, All rights reserved.
//
//======================================================================
//  Revision History

// synthesis attribute ram_style of fm_cmn_bram_02 is block;

module fm_cmn_bram_02 (
    clka,
    clkb,
    wea,
    addra,
    addrb,
    dia,
    doa,
    dob
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
    input                clka;
    input                clkb;
    input                wea;
    input  [P_RANGE-1:0] addra;
    input  [P_RANGE-1:0] addrb;
    input  [P_WIDTH-1:0] dia;
    output [P_WIDTH-1:0] doa;
    output [P_WIDTH-1:0] dob;

//////////////////////////////////
// reg 
//////////////////////////////////
    reg [P_WIDTH-1:0] ram [P_DEPTH-1:0];
    reg [P_WIDTH-1:0] doa;
    reg [P_WIDTH-1:0] dob;

//////////////////////////////////
// always
//////////////////////////////////
    // port A: write-first
    always @(posedge clka) begin
        if (wea) begin
            ram[addra] <= dia;
            doa <= dia;
        end else begin
            doa <= ram[addra];
        end
    end

    // port B: read-first
    always @(posedge clkb) begin
        dob <= ram[addrb];
    end
endmodule
