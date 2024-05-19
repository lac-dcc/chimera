// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmd_deser
 * @file cmd_deser.v
 * @date 2015-01-12  
 * @author Andrey Filippov     
 *
 * @brief Expand command address/data from a byte-wide
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmd_deser.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmd_deser.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify this Program, or any covered work, by linking or combining it
 * with independent modules provided by the FPGA vendor only (this permission
 * does not extend to any 3-rd party modules, "soft cores" or macros) under
 * different license terms solely for the purpose of generating binary "bitstream"
 * files and/or simulating the code, the copyright holders of this Program give
 * you the right to distribute the covered work without those independent modules
 * as long as the source code for them is available from the FPGA vendor free of
 * charge, and there is no dependence on any encrypted modules for simulating of
 * the combined code. This permission applies to you if the distributed code
 * contains all the components and scripts required to completely simulate it
 * with at least one of the Free Software programs.
 */
`timescale 1ns/1ps

module  cmd_deser#(
    parameter ADDR=0,
    parameter ADDR_MASK =  'hffff,
    parameter NUM_CYCLES =  6,
    parameter ADDR_WIDTH =  16,
    parameter DATA_WIDTH =  32,
    parameter ADDR1 =       0,   // optional second address
    parameter ADDR_MASK1 =  0,   // optional second mask
    parameter ADDR2 =       0,   // optional third address 
    parameter ADDR_MASK2 =  0,   // optional third mask
    parameter WE_EARLY =    0    // if 1 - we and addr will be valid 1 cycle before data
)(
    input                                               rst,
    input                                               clk,
    input                                               srst, // sync reset
    input                                         [7:0] ad,
    input                                               stb,
    output                             [ADDR_WIDTH-1:0] addr,
    output                             [DATA_WIDTH-1:0] data,
    output [(ADDR_MASK2!=0)?2:((ADDR_MASK1!=0)?1:0):0]  we
);
    localparam  WE_WIDTH=(ADDR_MASK2!=0)?3:((ADDR_MASK1!=0)?2:1);
    generate
        if (NUM_CYCLES==1)
            cmd_deser_single # (
                .ADDR       (ADDR),
                .ADDR_MASK  (ADDR_MASK),
                .ADDR_WIDTH (ADDR_WIDTH),
                .DATA_WIDTH (DATA_WIDTH),
                .ADDR1      (ADDR1),
                .ADDR_MASK1 (ADDR_MASK1),
                .ADDR2      (ADDR2),
                .ADDR_MASK2 (ADDR_MASK2),
                .WE_WIDTH   (WE_WIDTH),
                .WE_EARLY   (WE_EARLY)
            ) i_cmd_deser_single (
                .rst(rst),
                .clk(clk),
                .srst(srst),
                .ad(ad),
                .stb(stb),
                .addr(addr),
                .data(data),
                .we(we)
            );
        else if (NUM_CYCLES==2)
            cmd_deser_dual # (
                .ADDR(ADDR),
                .ADDR_MASK(ADDR_MASK),
                .ADDR_WIDTH(ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH),
                .ADDR1      (ADDR1),
                .ADDR_MASK1 (ADDR_MASK1),
                .ADDR2      (ADDR2),
                .ADDR_MASK2 (ADDR_MASK2),
                .WE_WIDTH   (WE_WIDTH),
                .WE_EARLY   (WE_EARLY)
            ) i_cmd_deser_dual (
                .rst(rst),
                .clk(clk),
                .srst(srst),
                .ad(ad),
                .stb(stb),
                .addr(addr),
                .data(data),
                .we(we)
            );
        else 
            cmd_deser_multi # (
                .ADDR(ADDR),
                .ADDR_MASK(ADDR_MASK),
                .NUM_CYCLES(NUM_CYCLES),
                .ADDR_WIDTH(ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH),
                .ADDR1      (ADDR1),
                .ADDR_MASK1 (ADDR_MASK1),
                .ADDR2      (ADDR2),
                .ADDR_MASK2 (ADDR_MASK2),
                .WE_WIDTH   (WE_WIDTH),
                .WE_EARLY   (WE_EARLY)
            ) i_cmd_deser_multi (
                .rst(rst),
                .clk(clk),
                .srst(srst),
                .ad(ad),
                .stb(stb),
                .addr(addr),
                .data(data),
                .we(we)
            );
        
    endgenerate

endmodule

module  cmd_deser_single#(
    parameter ADDR=0,
    parameter ADDR_MASK='hffff,
    parameter ADDR_WIDTH=8, // <=8
    parameter DATA_WIDTH=1,  // will 0 work?
    parameter ADDR1=0,
    parameter ADDR_MASK1=0,
    parameter ADDR2=0,
    parameter ADDR_MASK2=0,
    parameter WE_WIDTH=1,
    parameter WE_EARLY =    0 //
    
)(
    input                   rst,
    input                   clk,
    input                   srst, // sync reset
    input             [7:0] ad,
    input                   stb,
    output [ADDR_WIDTH-1:0] addr,
    output [DATA_WIDTH-1:0] data,
    output  [WE_WIDTH-1:0]  we
);
    localparam  ADDR_LOW= ADDR & 8'hff;
    localparam  ADDR_MASK_LOW= ADDR_MASK & 8'hff;
    localparam  ADDR_LOW1= ADDR1 & 8'hff;
    localparam  ADDR_MASK_LOW1= ADDR_MASK1 & 8'hff;
    localparam  ADDR_LOW2= ADDR2 & 8'hff;
    localparam  ADDR_MASK_LOW2= ADDR_MASK2 & 8'hff;
    reg                 [7:0] deser_r;
    wire                [2:0] match_low;
    reg         [2:0]         we_r;
    
    assign we = (WE_EARLY > 0)?(match_low[WE_WIDTH-1:0] & {WE_WIDTH{stb}}):we_r[WE_WIDTH-1:0];
    assign match_low= { // unused bits will be optimized
     ((ad ^ ADDR_LOW2)  & (8'hff & ADDR_MASK_LOW2)) == 0,
     ((ad ^ ADDR_LOW1)  & (8'hff & ADDR_MASK_LOW1)) == 0,
     ((ad ^ ADDR_LOW )  & (8'hff & ADDR_MASK_LOW )) == 0};
    always @ (posedge rst or posedge clk) begin
        if      (rst)  we_r <= 0; 
        else if (srst) we_r <= 0; 
        else           we_r <= match_low & {3{stb}};
        if (rst)      deser_r <= 0; 
        else if (srst) deser_r <= 0; 
        else if ((|match_low) && stb) deser_r <= ad;
    end
    assign data={DATA_WIDTH{1'b0}};
//    assign addr=deser_r[ADDR_WIDTH-1:0];
    assign addr=(WE_EARLY>0) ? ad[ADDR_WIDTH-1:0]: deser_r[ADDR_WIDTH-1:0];
endmodule

module  cmd_deser_dual#(
    parameter ADDR=0,
    parameter ADDR_MASK='hffff,
    parameter ADDR_WIDTH=12, // <=16
    parameter DATA_WIDTH=1,  // will 0 work?
    parameter ADDR1=0,
    parameter ADDR_MASK1=0,
    parameter ADDR2=0,
    parameter ADDR_MASK2=0,
    parameter WE_WIDTH=1,
    parameter WE_EARLY =    0    // if 1 - we and addr will be valid 1 cycle before data
)(
    input                   rst,
    input                   clk,
    input                   srst, // sync reset
    input             [7:0] ad,
    input                   stb,
    output [ADDR_WIDTH-1:0] addr,
    output [DATA_WIDTH-1:0] data,
    output   [WE_WIDTH-1:0] we
);
    localparam  ADDR_LOW= ADDR & 8'hff;
    localparam  ADDR_HIGH=(ADDR>>8) & 8'hff;
    localparam  ADDR_MASK_LOW= ADDR_MASK & 8'hff;
    localparam  ADDR_MASK_HIGH=(ADDR_MASK>>8) & 8'hff;

    localparam  ADDR_LOW1= ADDR1 & 8'hff;
    localparam  ADDR_MASK_LOW1= ADDR_MASK1 & 8'hff;
    localparam  ADDR_LOW2= ADDR2 & 8'hff;
    localparam  ADDR_MASK_LOW2= ADDR_MASK2 & 8'hff;

    localparam  ADDR_HIGH1=(ADDR1>>8) & 8'hff;
    localparam  ADDR_MASK_HIGH1=(ADDR_MASK1>>8) & 8'hff;
    localparam  ADDR_HIGH2=(ADDR2>>8) & 8'hff;
    localparam  ADDR_MASK_HIGH2=(ADDR_MASK2>>8) & 8'hff;


    reg                [15:0] deser_r;
//    reg                       stb_d;
    reg                 [2:0] stb_d;
    wire                [2:0] match_low;
    wire                [2:0] match_high;

    wire                [2:0] we3;
    reg                 [2:0] we_r;
    
//    assign we=we_r;
    assign we3 = (WE_EARLY > 0) ? (match_high & stb_d):we_r; // 3 bits wide - for each possible output
    assign we = we3[WE_WIDTH-1:0]; // truncate
    
    assign match_low=  {((ad ^ ADDR_LOW2)  & (8'hff & ADDR_MASK_LOW2)) == 0,
                        ((ad ^ ADDR_LOW1)  & (8'hff & ADDR_MASK_LOW1)) == 0,
                        ((ad ^ ADDR_LOW )  & (8'hff & ADDR_MASK_LOW )) == 0};
    assign match_high= {((ad ^ ADDR_HIGH2) & (8'hff & ADDR_MASK_HIGH2)) == 0,
                        ((ad ^ ADDR_HIGH1) & (8'hff & ADDR_MASK_HIGH1)) == 0,
                        ((ad ^ ADDR_HIGH ) & (8'hff & ADDR_MASK_HIGH )) == 0};
    
    always @ (posedge rst or posedge clk) begin
        if      (rst)  stb_d <= 3'b0;
        else if (srst) stb_d <= 3'b0;
        else           stb_d <= stb?match_low:3'b0;

        if      (rst)  we_r <= 3'b0;
        else if (srst) we_r <= 3'b0;
        else           we_r  <= match_high & stb_d;
        
        if      (rst)                                         deser_r[15:0]  <= 0;
        else if (srst)                                        deser_r[15:0]  <= 0;
        else if ((match_low && stb) || (match_high && stb_d)) deser_r[15:0] <= {ad,deser_r[15:8]};
    end
    assign data=0; // {DATA_WIDTH{1'b0}};
//    assign addr=deser_r[ADDR_WIDTH-1:0];
    assign addr=deser_r[8*WE_EARLY +: ADDR_WIDTH];
endmodule

module  cmd_deser_multi#(
    parameter ADDR=0,
    parameter ADDR_MASK='hffff,
    parameter NUM_CYCLES=6, // >=3
    parameter ADDR_WIDTH=16,
    parameter DATA_WIDTH=32,
    parameter ADDR1=0,
    parameter ADDR_MASK1=0,
    parameter ADDR2=0,
    parameter ADDR_MASK2=0,
    parameter WE_WIDTH=1,
    parameter WE_EARLY =    0    // if 1 - we and addr will be valid 1 cycle before data
)(
    input                   rst,
    input                   clk,
    input                   srst, // sync reset
    input             [7:0] ad,
    input                   stb,
    output [ADDR_WIDTH-1:0] addr,
    output [DATA_WIDTH-1:0] data,
    output   [WE_WIDTH-1:0] we
);
    localparam  ADDR_LOW= ADDR & 8'hff;
    localparam  ADDR_HIGH=(ADDR>>8) & 8'hff;
    localparam  ADDR_MASK_LOW= ADDR_MASK & 8'hff;
    localparam  ADDR_MASK_HIGH=(ADDR_MASK>>8) & 8'hff;

    localparam  ADDR_LOW1= ADDR1 & 8'hff;
    localparam  ADDR_MASK_LOW1= ADDR_MASK1 & 8'hff;
    localparam  ADDR_LOW2= ADDR2 & 8'hff;
    localparam  ADDR_MASK_LOW2= ADDR_MASK2 & 8'hff;

    localparam  ADDR_HIGH1=(ADDR1>>8) & 8'hff;
    localparam  ADDR_MASK_HIGH1=(ADDR_MASK1>>8) & 8'hff;
    localparam  ADDR_HIGH2=(ADDR2>>8) & 8'hff;
    localparam  ADDR_MASK_HIGH2=(ADDR_MASK2>>8) & 8'hff;

    
    reg    [8*NUM_CYCLES-1:0] deser_r;
    reg                 [2:0] stb_d;
    wire                [2:0] match_low;
    wire                [2:0] match_high;
    reg      [NUM_CYCLES-2:0] sr;
    reg      [NUM_CYCLES-2:0] sr1;
    reg      [NUM_CYCLES-2:0] sr2;
    wire                [2:0] we3;

    assign we3={sr2[WE_EARLY],sr1[WE_EARLY],sr[WE_EARLY]};
//    assign we=sr[WE_WIDTH-1:0]; // we_r;
    assign we=we3[WE_WIDTH-1:0]; // truncate to required number of bits
    
    assign match_low=  {((ad ^ ADDR_LOW2)  & (8'hff & ADDR_MASK_LOW2)) == 0,
                        ((ad ^ ADDR_LOW1)  & (8'hff & ADDR_MASK_LOW1)) == 0,
                        ((ad ^ ADDR_LOW )  & (8'hff & ADDR_MASK_LOW )) == 0};
    assign match_high= {((ad ^ ADDR_HIGH2) & (8'hff & ADDR_MASK_HIGH2)) == 0,
                        ((ad ^ ADDR_HIGH1) & (8'hff & ADDR_MASK_HIGH1)) == 0,
                        ((ad ^ ADDR_HIGH ) & (8'hff & ADDR_MASK_HIGH )) == 0};
    always @ (posedge rst or posedge clk) begin
        if       (rst) stb_d <= 0;
        else if (srst) stb_d <= 0;
        else           stb_d <= stb?match_low:3'b0;

        if      (rst)                       sr <= 0;
        else if (srst)                      sr <= 0;
        else if (match_high[0] && stb_d[0]) sr <= 1 << (NUM_CYCLES-2);
        else                                sr <= {1'b0,sr[NUM_CYCLES-2:1]};

        if      (rst)                       sr1 <= 0;
        else if (srst)                      sr1 <= 0;
        else if (match_high[1] && stb_d[1]) sr1 <= 1 << (NUM_CYCLES-2);
        else                                sr1 <= {1'b0,sr1[NUM_CYCLES-2:1]};

        if      (rst)                       sr2 <= 0;
        else if (srst)                      sr2 <= 0;
        else if (match_high[2] && stb_d[2]) sr2 <= 1 << (NUM_CYCLES-2);
        else                                sr2 <= {1'b0,sr2[NUM_CYCLES-2:1]};
        
        if      (rst)                       deser_r[8*NUM_CYCLES-1:0] <= 0;
        else if (srst)                      deser_r[8*NUM_CYCLES-1:0] <= 0;
        else if ((match_low &&  (|stb)) ||
                 (match_high && (|stb_d)) ||
                 (|sr) || (|sr1) || (|sr2)) deser_r[8*NUM_CYCLES-1:0] <= {ad,deser_r[8*NUM_CYCLES-1:8]};

    end
    assign data=deser_r[DATA_WIDTH+15:16];
//    assign addr=deser_r[ADDR_WIDTH-1:0];
    assign addr=deser_r[8*WE_EARLY +: ADDR_WIDTH];
endmodule
