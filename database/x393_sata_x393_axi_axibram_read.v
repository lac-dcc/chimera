// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*******************************************************************************
 * Module: axibram_read
 * Date:2014-03-18  
 * Author: Andrey Filippov
 * Description: Read block RAM memory over AXI PS Master GP0
 *
 * Copyright (c) 2014 Elphel, Inc.
 * axibram_read.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  axibram_read.v is distributed in the hope that it will be useful,
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
 *******************************************************************************/
 // Check that this fix did not break anything:
`include "system_defines.vh" 
`define USE_SHORT_REN_REGEN 
module  axibram_read #(
    parameter ADDRESS_BITS = 10 // number of memory address bits
)(
   input         aclk,    // clock - should be buffered
//   input         rst, // reset, active high
   input         arst, // @posedge aclk  sync reset, active high
// AXI Read Address   
   input  [31:0] araddr,  // ARADDR[31:0], input 
   input         arvalid, // ARVALID, input
   output        arready, // ARREADY, output
   input  [11:0] arid,    // ARID[11:0], input
   input  [ 3:0] arlen,   // ARLEN[3:0], input
   input  [ 1:0] arsize,  // ARSIZE[1:0], input
   input  [ 1:0] arburst, // ARBURST[1:0], input
// AXI Read Data
   output [31:0] rdata,   // RDATA[31:0], output
   output reg    rvalid,  // RVALID, output
   input         rready,  // RREADY, input
   output reg [11:0] rid,     // RID[11:0], output
   output reg    rlast,   // RLAST, output
   output [ 1:0] rresp,
// External memory synchronization
   output [ADDRESS_BITS-1:0] pre_araddr, // same as awaddr_out, early address to decode and return dev_ready
   output        start_burst, // start of read burst, valid pre_araddr, save externally to control ext. dev_ready multiplexer
   input         dev_ready,   // extrernal combinatorial ready signal, multiplexed from different sources according to pre_araddr@start_burst
   
// External memory interface   
   output        bram_rclk,  //      .rclk(aclk),                  // clock for read port
   output  [ADDRESS_BITS-1:0] bram_raddr, //   .raddr(read_in_progress?read_address[9:0]:10'h3ff),    // read address
   output        bram_ren,   //      .ren(bram_reg_re_w) ,      // read port enable
   output        bram_regen, //   .regen(bram_reg_re_w),        // output register enable
   input  [31:0] bram_rdata  //      .data_out(rdata[31:0]),       // data out
      // RRESP[1:0], output
);
// **** AXI Read channel ****
    wire ar_nempty;
    wire ar_half_full;
    assign arready=~ar_half_full;
    wire [ 1:0] arburst_out;
    // SuppressWarnings VEditor all 
    wire [ 1:0] arsize_out; // not used 
    wire [ 3:0] arlen_out;
    wire [ADDRESS_BITS-1:0] araddr_out;
    wire [11:0] arid_out;
//    wire rst=~aresetn;
    reg  read_in_progress=0;
    reg  read_in_progress_d=0; // delayed by one active cycle (not skipped)
    reg  read_in_progress_or=0; // read_in_progress || read_in_progress_d
    
    reg  [ADDRESS_BITS-1:0] read_address;       // transfer address (not including lower bits 
    reg  [ 3:0] read_left;          // number of read transfers
// will ignore arsize - assuming always 32 bits  (a*size[2:0]==2)
    reg  [ 1:0] rburst;             // registered burst type 
    reg  [ 3:0] rlen;               // registered burst type 
    wire [ADDRESS_BITS-1:0] next_rd_address_w;     // next transfer address;
    assign      next_rd_address_w= //SuppressThisWarning ISExst Result of 32-bit expression is truncated to fit in 13-bit target.
      rburst[1]?
        (rburst[0]? {ADDRESS_BITS{1'b0}}:((read_address[ADDRESS_BITS-1:0]+1) & {{(ADDRESS_BITS-4){1'b1}}, ~rlen[3:0]})):
        (rburst[0]? (read_address[ADDRESS_BITS-1:0]+1):(read_address[ADDRESS_BITS-1:0]));
    wire start_read_burst_w;
//    wire bram_re_w;
    wire bram_reg_re_w;
    wire read_in_progress_w;
    wire read_in_progress_d_w;
    wire last_in_burst_w;
    wire last_in_burst_d_w;
    reg  pre_last_in_burst_r;
    assign rresp=2'b0;
    // reduce combinatorial delay from rready (use it in final mux)
//    assign bram_reg_re_w=     read_in_progress && (!rvalid || rready);
//    assign start_read_burst_w=ar_nempty && (!read_in_progress || (bram_reg_re_w && (read_left==4'b0))); // reduce delay from arready
    assign last_in_burst_w=  bram_reg_re_w && (read_left==4'b0);
    assign last_in_burst_d_w=bram_reg_re_w && pre_last_in_burst_r;
    // make sure ar_nempty is updated
//    assign start_read_burst_w=ar_nempty && (!read_in_progress || last_in_burst_w); // reduce delay from arready
    assign read_in_progress_w=  start_read_burst_w || (read_in_progress && !last_in_burst_w); // reduce delay from arready
    
    assign read_in_progress_d_w=(read_in_progress && bram_reg_re_w) ||
     (read_in_progress && !last_in_burst_d_w); // reduce delay from arready

//    assign read_in_progress_d_w=read_in_progress_d;

    wire pre_rvalid_w;
    assign  pre_rvalid_w=bram_reg_re_w || (rvalid && !rready);
    
    wire pre_left_zero_w;
    // TODO: Speed up by moving registers
    // SuppressWarnings VEditor all - not yet used 
    reg bram_reg_re_0;
    // SuppressWarnings VEditor all - not yet used 
    reg last_in_burst_1;
    // SuppressWarnings VEditor all - not yet used 
    reg last_in_burst_0;
    // SuppressWarnings VEditor all - not yet used 
    reg start_read_burst_0;
    // SuppressWarnings VEditor all - not yet used 
    reg start_read_burst_1;
    reg [11:0] pre_rid0;
    reg [11:0] pre_rid;
    
// External memory interface - synchronization with ready
   assign pre_araddr=  araddr_out[ADDRESS_BITS-1:0];
   assign start_burst= start_read_burst_w;
   //input dev_ready,   // extrernal combinatorial ready signal, multiplexed from different sources according to pre_araddr@start_burst 
// External memory interface
   assign  bram_rclk =  aclk;  // clock for read port
   assign  bram_raddr = read_in_progress?read_address[ADDRESS_BITS-1:0]:{ADDRESS_BITS{1'b1}};  // read address
   
`ifdef USE_SHORT_REN_REGEN 
   reg bram_regen_r;
//   assign  bram_ren =   bram_reg_re_w && !pre_last_in_burst_r ;     // read port enable
///   assign  bram_ren = read_in_progress;
   assign  bram_ren = read_in_progress && dev_ready;
   assign  bram_regen = bram_regen_r;     // output register enable
`else
   assign  bram_ren =   bram_reg_re_w;     // read port enable
   assign  bram_regen = bram_reg_re_w;     // output register enable
`endif   
   
   assign  rdata[31:0] = bram_rdata;    // data out

    always @ (posedge  aclk) begin
`ifdef USE_SHORT_REN_REGEN   
      if   (arst)  bram_regen_r <= 0;
      else        bram_regen_r <=  bram_ren;
`endif    
   
      if   (arst)                   pre_last_in_burst_r <= 0;
//      else if (start_read_burst_w) pre_last_in_burst_r <= (read_left==4'b0);
      else if (bram_reg_re_w)      pre_last_in_burst_r <= (read_left==4'b0);
    
      if   (arst)                   rburst[1:0] <= 0;
      else if (start_read_burst_w) rburst[1:0] <= arburst_out[1:0];

      if   (arst)                   rlen[3:0] <= 0;
      else if (start_read_burst_w) rlen[3:0] <= arlen_out[3:0];
    
      if   (arst) read_in_progress <= 0;
      else       read_in_progress <= read_in_progress_w;

      if   (arst)                read_in_progress_d <= 0;
//      else   read_in_progress_d <= read_in_progress_d_w;
      else if (bram_reg_re_w)   read_in_progress_d <= read_in_progress_d_w;
      
      if   (arst) read_in_progress_or <= 0;
//      else       read_in_progress_or <= read_in_progress_d_w || read_in_progress_w;
//      else  if (bram_reg_re_w) read_in_progress_or <= read_in_progress_d_w || read_in_progress_w;
// FIXME:
      else  if (bram_reg_re_w || !read_in_progress_or) read_in_progress_or <= read_in_progress_d_w || read_in_progress_w;
      
//    reg  read_in_progress_d=0; // delayed by one active cycle (not skipped)
//    reg  read_in_progress_or=0; // read_in_progress || read_in_progress_d

      if      (arst)               read_left <= 0;
      else if (start_read_burst_w) read_left <= arlen_out[3:0]; // precedence over inc
      else if (bram_reg_re_w)      read_left <= read_left-1; //SuppressThisWarning ISExst Result of 32-bit expression is truncated to fit in 4-bit target.
            
      if      (arst)               read_address <= {ADDRESS_BITS{1'b0}};
      else if (start_read_burst_w) read_address <= araddr_out[ADDRESS_BITS-1:0]; // precedence over inc
      else if (bram_reg_re_w)      read_address <= next_rd_address_w;
      
      if      (arst)                                 rvalid <= 1'b0;
      else if (bram_reg_re_w && read_in_progress_d)  rvalid <= 1'b1;
      else if (rready)                               rvalid <= 1'b0;

      if      (arst)               rlast <= 1'b0;
      else if (last_in_burst_d_w)  rlast <= 1'b1;
      else if (rready)             rlast <= 1'b0;
    end
    
    always @ (posedge  aclk) begin //SuppressThisWarning ISExst Assignment to bram_reg_re_0 ignored, since the identifier is never used
//        bram_reg_re_0 <= read_in_progress_w && !pre_rvalid_w;

        bram_reg_re_0 <= (ar_nempty && !read_in_progress) || (read_in_progress && !read_in_progress);
        
        last_in_burst_1 <= read_in_progress_w && pre_left_zero_w;
        
        last_in_burst_0 <= read_in_progress_w && !pre_rvalid_w && pre_left_zero_w;
        
        start_read_burst_1 <= !read_in_progress_w || pre_left_zero_w;
        start_read_burst_0 <= !read_in_progress_w || (!pre_rvalid_w && pre_left_zero_w);
        
        if (start_read_burst_w) pre_rid0[11:0] <= arid_out[11:0];
        if (bram_reg_re_w)      pre_rid[11:0]  <= pre_rid0[11:0];
        if (bram_reg_re_w)      rid[11:0] <= pre_rid[11:0];
    end
    // reducing rready combinatorial delay
    assign  pre_left_zero_w=start_read_burst_w?(arlen_out[3:0]==4'b0):(bram_reg_re_w && (read_left==4'b0001));
//    assign bram_reg_re_w=     read_in_progress && (!rvalid || rready);

    assign bram_reg_re_w=   dev_ready && read_in_progress_or && (!rvalid || rready); // slower/simplier
//    assign bram_reg_re_w=   rready? read_in_progress : bram_reg_re_0; // faster - more verification
    
    
    assign last_in_burst_w=bram_reg_re_w && (read_left==4'b0); // slower/simplier
//    assign last_in_burst_w=rready? (read_in_progress && (read_left==4'b0)): (bram_reg_re_0 && (read_left==4'b0));
//    assign last_in_burst_w=rready? last_in_burst_1: last_in_burst_0; // faster (unfinished) - more verification


    assign start_read_burst_w=ar_nempty && (!read_in_progress || (bram_reg_re_w && (read_left==4'b0))); // reduce delay from rready
//    assign start_read_burst_w=ar_nempty && (!read_in_progress || ((rready? read_in_progress : bram_reg_re_0) && (read_left==4'b0)));

//    assign start_read_burst_w=
//    rready?
//    (ar_nempty && (!read_in_progress || ((read_in_progress) && (read_left==4'b0)))):
//    (ar_nempty && (!read_in_progress || ((bram_reg_re_0   ) && (read_left==4'b0))));

/*
    assign start_read_burst_w=
    ar_nempty*(rready?
    (!read_in_progress || (read_left==4'b0)):
    ((!read_in_progress || ((bram_reg_re_0   ) && (read_left==4'b0)))));
*/    
//    assign start_read_burst_w=  ar_nempty && (rready?start_read_burst_1:start_read_burst_0);

fifo_same_clock   #( .DATA_WIDTH(ADDRESS_BITS+20),.DATA_DEPTH(4))    
    raddr_i (
        .rst(1'b0),
        .clk(aclk),
        .sync_rst(arst),
        .we(arvalid && arready),
        .re(start_read_burst_w),
        .data_in({arid[11:0], arburst[1:0],arsize[1:0],arlen[3:0],araddr[ADDRESS_BITS+1:2]}), 
        .data_out({arid_out[11:0], arburst_out[1:0],arsize_out[1:0],arlen_out[3:0],araddr_out[ADDRESS_BITS-1:0]}), //SuppressThisWarning ISExst Assignment to arsize ignored, since the identifier is never used
        .nempty(ar_nempty),
        .half_full(ar_half_full)
    );
endmodule
