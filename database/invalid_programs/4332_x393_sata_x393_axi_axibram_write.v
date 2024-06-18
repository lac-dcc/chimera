// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*******************************************************************************
 * Module: axibram_write
 * Date:2014-03-18  
 * Author: Andrey Filippov
 * Description: Read block RAM memory (or memories?) over AXI PS Master GP0
 * Memory is supposed to be fast enough
 *
 * Copyright (c) 2014 Elphel, Inc.
 * axibram_write.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  axibram_write.v is distributed in the hope that it will be useful,
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
//`define DEBUG_FIFO 1 
`include "system_defines.vh" 
`ifdef DEBUG_FIFO
  `undef DEBUG_FIFO
`endif
module  axibram_write #(
    parameter ADDRESS_BITS = 10 // number of memory address bits
)(
   input         aclk,    // clock - should be buffered
   input         arst,     // @aclk sync reset, active high
   
// AXI Write Address
   input  [31:0] awaddr,  // AWADDR[31:0], input
   input         awvalid, // AWVALID, input
   output        awready, // AWREADY, output
   input  [11:0] awid,    // AWID[11:0], input
   input  [ 3:0] awlen,   // AWLEN[3:0], input
   input  [ 1:0] awsize,  // AWSIZE[1:0], input
   input  [ 1:0] awburst, // AWBURST[1:0], input
// AXI PS Master GP0: Write Data
   input  [31:0] wdata,   // WDATA[31:0], input
   input         wvalid,  // WVALID, input
   output        wready,  // WREADY, output
   input  [11:0] wid,     // WID[11:0], input
   input         wlast,   // WLAST, input
   input  [ 3:0] wstb,    // WSTRB[3:0], input
// AXI PS Master GP0: Write response
   output        bvalid,  // BVALID, output
   input         bready,  // BREADY, input
   output [11:0] bid,     // BID[11:0], output
   output [ 1:0] bresp,    // BRESP[1:0], output
   
// BRAM (and other write modules) interface
   output [ADDRESS_BITS-1:0] pre_awaddr, // same as awaddr_out, early address to decode and return dev_ready
   output        start_burst, // start of write burst, valid pre_awaddr, save externally to control ext. dev_ready multiplexer
   input         dev_ready,   // extrernal combinatorial ready signal, multiplexed from different sources according to pre_awaddr@start_burst
    
   output        bram_wclk,
   output  [ADDRESS_BITS-1:0] bram_waddr,
   output        pre_bram_wen,// 1 ahead of bram_wen, not masked by dev_ready
   output        bram_wen,    // external memory write enable, (internally combined with registered dev_ready
   output  [3:0] bram_wstb, 
   output [31:0] bram_wdata
`ifdef DEBUG_FIFO
    ,
        output    waddr_under,
        output    wdata_under,
        output    wresp_under, 
        output    waddr_over,
        output    wdata_over,
        output    wresp_over,
        
        output [3:0]   waddr_wcount, 
        output [3:0]   waddr_rcount, 
        output [3:0]   waddr_num_in_fifo, 
        
        output [3:0]   wdata_wcount, 
        output [3:0]   wdata_rcount, 
        output [3:0]   wdata_num_in_fifo, 
        
        output [3:0]   wresp_wcount, 
        output [3:0]   wresp_rcount, 
        output [3:0]   wresp_num_in_fifo,
        
        output [3:0]   wleft,
        
        output [3:0]   wlength,
        output reg [3:0] wlen_in_dbg  

`endif   
);
//    wire rst=~aresetn;
// **** Write channel: ****
    wire aw_nempty;
    wire aw_half_full;
    assign awready=~aw_half_full;
    wire [ 1:0] awburst_out;
    // SuppressWarnings VEditor all 
    wire [ 1:0] awsize_out; // not used
    wire [ 3:0] awlen_out;
    wire [ADDRESS_BITS-1:0] awaddr_out;
    // SuppressWarnings VEditor all 
    wire [11:0] awid_out;   // not used
    wire w_nempty;
    wire w_half_full;
    assign wready=~w_half_full;
    wire [31:0] wdata_out;
    // SuppressWarnings VEditor all 
    wire        wlast_out;   // not used
    wire [ 3:0] wstb_out;    // WSTRB[3:0], input
    wire [11:0] wid_out;
    reg         write_in_progress=0;
    reg  [ADDRESS_BITS-1:0] write_address;       // transfer address (not including lower bits 
    reg  [ 3:0] write_left;          // number of write transfers
// will ignore arsize - assuming always 32 bits  (a*size[2:0]==2)
    reg  [ 1:0] wburst;             // registered burst type
    reg  [ 3:0] wlen;               // registered awlen type (for wrapped over transfers)
    wire [ADDRESS_BITS-1:0] next_wr_address_w;  // next transfer address;
    wire        bram_we_w; //,bram_we_nonmasked;   // write BRAM memory non-masked - should be combined with  
    wire        start_write_burst_w;
    wire        write_in_progress_w;
    
    wire        aw_nempty_ready; // aw_nempty and device ready
    wire        w_nempty_ready; // w_nempty and device ready
    assign aw_nempty_ready=aw_nempty && dev_ready_r; // should it be dev_ready?
    assign w_nempty_ready=w_nempty && dev_ready_r; // should it be dev_ready?
    
    reg         dev_ready_r;        // device, selected at start burst
    assign      next_wr_address_w= //SuppressThisWarning ISExst Result of 32-bit expression is truncated to fit in 13-bit target.
      wburst[1]?
        (wburst[0]? {ADDRESS_BITS{1'b0}}:((write_address[ADDRESS_BITS-1:0]+1) & {{(ADDRESS_BITS-4){1'b1}}, ~wlen[3:0]})):
        (wburst[0]? (write_address[ADDRESS_BITS-1:0]+1):(write_address[ADDRESS_BITS-1:0]));
        
    assign      bram_we_w=         w_nempty_ready &&  write_in_progress;
//    assign start_write_burst_w=w_nempty_ready && aw_nempty_ready && (!write_in_progress || (w_nempty_ready && (write_left[3:0]==4'b0)));
//    assign write_in_progress_w=w_nempty_ready && aw_nempty_ready || (write_in_progress && !(w_nempty_ready && (write_left[3:0]==4'b0))); 
    // adding wlast_out to take precedence over (write_left[3:0]==4'b0), maybe wlast_out itself is sufficient
    assign start_write_burst_w=w_nempty_ready && aw_nempty_ready && (!write_in_progress || (w_nempty_ready && ((write_left[3:0]==4'b0) || wlast_out)));
    assign write_in_progress_w=w_nempty_ready && aw_nempty_ready || (write_in_progress && !(w_nempty_ready && ((write_left[3:0]==4'b0) || wlast_out))); 
    
    assign pre_bram_wen = write_in_progress_w;
    always @ (posedge  aclk) begin
      if   (arst)                   wburst[1:0] <= 0;
      else if (start_write_burst_w) wburst[1:0] <= awburst_out[1:0];

      if   (arst)                   wlen[3:0] <= 0;
      else if (start_write_burst_w) wlen[3:0] <= awlen_out[3:0];
    
      if   (arst) write_in_progress <= 0;
      else        write_in_progress <= write_in_progress_w;

      if   (arst)                   write_left <= 0;
      else if (start_write_burst_w) write_left <= awlen_out[3:0]; // precedence over inc
      else if (bram_we_w)           write_left <= write_left-1; //SuppressThisWarning ISExst Result of 32-bit expression is truncated to fit in 4-bit target.
            
      if   (arst)                   write_address <= {ADDRESS_BITS{1'b0}};
      else if (start_write_burst_w) write_address <= awaddr_out[ADDRESS_BITS-1:0]; // precedence over inc
      else if (bram_we_w)           write_address <= next_wr_address_w;
      
      if (arst) dev_ready_r <= 1'b0;
      else      dev_ready_r <= dev_ready;
    end
// **** Write response channel ****    
    wire [ 1:0] bresp_in;
    assign bresp_in=2'b0;

// external memory interface (write only)
   assign pre_awaddr=awaddr_out[ADDRESS_BITS-1:0];
   assign start_burst=start_write_burst_w;
   
   assign  bram_wclk  = aclk;
   assign  bram_waddr = write_address[ADDRESS_BITS-1:0];
   assign  bram_wen   = bram_we_w; 
   assign  bram_wstb   = wstb_out[3:0]; 
   assign  bram_wdata = wdata_out[31:0];
    
 `ifdef DEBUG_FIFO
    assign wleft=write_left;
    assign wlength[3:0]=wlen[3:0];
    always @ (posedge aclk) begin
        wlen_in_dbg <= awlen[3:0];
    end
 `endif  
fifo_same_clock   #( .DATA_WIDTH(20+ADDRESS_BITS),.DATA_DEPTH(4))
    waddr_i (
        .rst       (1'b0), //rst),
        .clk       (aclk),
        .sync_rst  (arst),
        .we        (awvalid && awready),
        .re        (start_write_burst_w),
        .data_in   ({awid[11:0], awburst[1:0],awsize[1:0],awlen[3:0],awaddr[ADDRESS_BITS+1:2]}),
        .data_out  ({awid_out[11:0], awburst_out[1:0],awsize_out[1:0],awlen_out[3:0],awaddr_out[ADDRESS_BITS-1:0]}),  //SuppressThisWarning ISExst Assignment to awsize_out ignored, since the identifier is never used
        .nempty    (aw_nempty),
        .half_full (aw_half_full)
`ifdef DEBUG_FIFO
        ,
        .under      (waddr_under), // output reg 
        .over       (waddr_over), // output reg
        .wcount     (waddr_wcount), // output[3:0] reg 
        .rcount     (waddr_rcount), // output[3:0] reg 
        .num_in_fifo(waddr_num_in_fifo) // output[3:0] 
`endif         
    );
fifo_same_clock   #( .DATA_WIDTH(49),.DATA_DEPTH(4))    
    wdata_i (
        .rst(1'b0), //rst),
        .clk(aclk),
        .sync_rst  (arst),
        .we(wvalid && wready),
        .re(bram_we_w), //start_write_burst_w), // wrong
        .data_in({wid[11:0],wlast,wstb[3:0],wdata[31:0]}),
        .data_out({wid_out[11:0],wlast_out,wstb_out[3:0],wdata_out[31:0]}), //SuppressThisWarning ISExst Assignment to wlast ignored, since the identifier is never used
        .nempty(w_nempty),
        .half_full(w_half_full)
`ifdef DEBUG_FIFO
        ,
        .under      (wdata_under), // output reg 
        .over       (wdata_over), // output reg
        .wcount     (wdata_wcount), // output[3:0] reg 
        .rcount     (wdata_rcount), // output[3:0] reg 
        .num_in_fifo(wdata_num_in_fifo) // output[3:0] 
`endif
    );
//debugging - slow down bresp
reg was_bresp_re=0;
wire bresp_re;
assign bresp_re=bready && bvalid && !was_bresp_re;
always @ (posedge aclk) begin
    if (arst) was_bresp_re<=0;
    else      was_bresp_re <= bresp_re;
end
  
fifo_same_clock  #( .DATA_WIDTH(14),.DATA_DEPTH(4))    
    wresp_i (
        .rst(1'b0), //rst),
        .clk(aclk),
        .sync_rst  (arst),
        .we(bram_we_w &&((write_left[3:0]==4'b0) || wlast_out)), // added ((write_left[3:0]==4'b0) || wlast_out) - only last wrtite -> bresp
//        .re(bready && bvalid),
        .re(bresp_re), // not allowing RE next cycle after bvalid
        .data_in({wid_out[11:0],bresp_in[1:0]}),
        .data_out({bid[11:0],bresp[1:0]}),
        .nempty(bvalid),
        .half_full()
`ifdef DEBUG_FIFO
        ,
        .under      (wresp_under), // output reg 
        .over       (wresp_over), // output reg
        .wcount     (wresp_wcount), // output[3:0] reg 
        .rcount     (wresp_rcount), // output[3:0] reg 
        .num_in_fifo(wresp_num_in_fifo) // output[3:0] 
        
`endif
    );

endmodule
