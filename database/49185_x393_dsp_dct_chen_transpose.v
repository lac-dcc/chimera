// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>dct_chen_transpose
 * @file dct_chen_transpose.v
 * @date 2016-06-09  
 * @author  Andrey Filippov
 *     
 * @brief Reorder+transpose data between two 1-d DCT passes
 *
 * @copyright Copyright (c) 2016 Elphel, Inc.
 *
 * <b>License:</b>
 *
 *dct_chen_transpose.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  dct_chen_transpose.v is distributed in the hope that it will be useful,
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

module  dct_chen_transpose#(
    parameter WIDTH = 24
 )(
    input                  clk,
    input                  rst,
    input    [WIDTH -1:0]  din,            // pre2_start-X-F4-X-F2-X-F6-F5-F0-F3-X-F1-X-F7
    input                  pre2_start,     // Two cycles ahead of F4. Next one should start either at exactly 64 cycles, or >=68 cycles from the previous one 
    output [2*WIDTH -1:0]  dout_10_32_76_54, // Concatenated/reordered output data {x[1],x[0]}/{x[3],x[2]}/ {x[7],x[6]}/{x[5],x[4]}
    output reg             start_out,
    output reg             en_out // to be sampled when start_out is expected
);
    reg         [6:0] wcntr;    // write counter, used to calculate write address (2 pages of 64 words), that will be valid next cycle
    wire        [2:0] wrow = wcntr[5:3];     
    wire        [2:0] wcol = wcntr[2:0];
    wire              wpage;
         
    reg               wcol13;    // columns 1 and 3 (special)
    wire        [3:0] wrow_mod;  // effective row, including modifier for wpage
    wire        [1:0] wcol01_mod = wcol[1:0] - wcol[2];   
    reg         [6:0] waddr;
    wire              pre2_stop;
    reg   [WIDTH-1:0] transpose_ram[0:127];
    reg               pre_we_r;
    reg               we_r;
    reg         [5:0] rcntr = 6'h3f;    // read counter
    reg         [5:0] raddr;    // read counter, addresses dual words
    reg               re_r;
    reg               regen_r;
    reg [2*WIDTH-1:0] ram_reg;
    reg [2*WIDTH-1:0] ram_reg2;
    wire              pre_rstart_w = wcntr[5:0] == 61;
    reg         [1:0] rstop_r;
    reg               first_after_pause; // first block after pause - do not write 2 items to the "past"
    
    assign wpage = wcntr[6] ^ wrow_mod[3]; // previous page for row 0, col 1 & 3
    assign wrow_mod = {1'b0, wrow} - wcol13; 
    assign dout_10_32_76_54 = ram_reg2;
    // TODO: prevent writing to previous page after pause!
    always @(posedge clk) begin
        wcol13 <=      pre_we_r & ~wcol[0] & ~wcol[2];
        waddr[0] <=    wrow_mod[0] ^ wrow_mod[2];  
        waddr[1] <=    wcol[0];
        waddr[2] <=    wcol01_mod[1];
        waddr[3] <=   ~wcol01_mod[0] ^ wcol01_mod[1];
        waddr[4] <=    wrow_mod[1] ^ wrow_mod[2];
        waddr[5] <=    wrow_mod[2];
        waddr[6] <=    wpage;

        if      (rst)        pre_we_r <= 0;
        else if (pre2_start) pre_we_r <= 1;
        else if (pre2_stop)  pre_we_r <= 0;
        
        if      (rst)        wcntr <= 0;
        else if (pre_we_r)   wcntr <= wcntr + 1;        // including page, should be before 'if (pre2_start)'
        else if (pre2_start) wcntr <= {wcntr[6], 6'b0}; // if happens during pre_we_r - will be ignored, otherwise (after pause) will zero in-page adderss
        
        we_r <= pre_we_r && (!first_after_pause || !wcol13 || (|wrow)); // do not write first after pause to the "past"
        
        if (we_r) transpose_ram[waddr] <= din;
        
        if      (rst)          rcntr <= ~0;
        else if (pre_rstart_w) rcntr <= 0;
        else if (!(&rcntr))    rcntr <= rcntr + 1;
        
        re_r <=    ~rcntr[2];
        regen_r <= re_r;
        
        if (rcntr == 0) raddr[5] <= wcntr[6]; // page
        raddr[4:0] <= {rcntr[1:0],rcntr[5:3]};
        
        if (re_r)    ram_reg <= {transpose_ram[2*raddr+1],transpose_ram[2*raddr]}; // See if it will correctly infer   
        if (regen_r) ram_reg2 <= ram_reg;
        
        if (rst || pre_rstart_w) rstop_r <= 0;
        else if (&rcntr)         rstop_r <= {rstop_r[0], 1'b1};
        
        start_out <= (rcntr == 1);
        
        if      (rst)        en_out <= 0;
        else if (rcntr == 1) en_out <= 1;
        else if (rstop_r[1]) en_out <= 0;
        
        if      (rst)                 first_after_pause <= 0;
        else if (pre2_start && !we_r) first_after_pause <= 1;
        else if (&wcntr[5:0])         first_after_pause <= 0;
        
    end
    
    dly01_16 dly01_16_stop_i (
        .clk  (clk), // input
        .rst  (rst),                        // input
        .dly  (4'h3),                       // input[3:0] 
        .din  (&wcntr[5:0] && !pre2_start), // input
        .dout (pre2_stop)                   // output
    );
    
    
/*
min latency == 60, // adding 1 for read after write in RAM
max latency = 83 (when using a 2-page buffer)
wseq=(0x08,  0x62,  0x04,  0x6e,  0x0c,  0x0a,  0x00,  0x06,
 0x09,  0x02,  0x05,  0x0e,  0x0d,  0x0b,  0x01,  0x07,
 0x18,  0x03,  0x14,  0x0f,  0x1c,  0x1a,  0x10,  0x16,
 0x19,  0x12,  0x15,  0x1e,  0x1d,  0x1b,  0x11,  0x17,
 0x39,  0x13,  0x35,  0x1f,  0x3d,  0x3b,  0x31,  0x37,
 0x38,  0x33,  0x34,  0x3f,  0x3c,  0x3a,  0x30,  0x36,
 0x29,  0x32,  0x25,  0x3e,  0x2d,  0x2b,  0x21,  0x27,
 0x28,  0x23,  0x24,  0x2f,  0x2c,  0x2a,  0x20,  0x26)
rseq = (0x00,0x10,0x20,0x30,-1,-1,-1,-1,
        0x02,0x12,0x22,0x32,-1,-1,-1,-1,
        0x04,0x14,0x24,0x34,-1,-1,-1,-1,
        0x06,0x16,0x26,0x36,-1,-1,-1,-1,
        0x08,0x18,0x28,0x38,-1,-1,-1,-1,
        0x0a,0x1a,0x2a,0x3a,-1,-1,-1,-1,
        0x0c,0x1c,0x2c,0x3c,-1,-1,-1,-1,
        0x0e,0x1e,0x2e,0x3e,-1,-1,-1,-1)

*/
endmodule

