/*******************************************************************************
 * Module: axibram
 * Date:2014-03-18  
 * Author: Andrey Filippov
 * Description: 
 *
 * Copyright (c) 2014 Elphel, Inc.
 * axibram.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  axibram.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
module  axibram(
   input         aclk,    // clock - should be buffered
   input         aresetn, // reset, active low
// AXI Read Address   
   input  [31:0] araddr,  // ARADDR[31:0], input 
   input         arvalid, // ARVALID, input
   output        arready, // ARREADY, output
   input  [11:0] arid,    // ARID[11:0], input
//   input  [ 1:0] arlock,  // ARLOCK[1:0], input
//   input  [ 3:0] archache,// ARCACHE[3:0], input
//   input  [ 2:0] arprot,  // ARPROT[2:0], input
   input  [ 3:0] arlen,   // ARLEN[3:0], input
   input  [ 1:0] arsize,  // ARSIZE[1:0], input
   input  [ 1:0] arburst, // ARBURST[1:0], input
//   input  [ 3:0] adqos,   // ARQOS[3:0], input
// AXI Read Data
   output [31:0] rdata,   // RDATA[31:0], output
   output reg    rvalid,  // RVALID, output
   input         rready,  // RREADY, input
   output reg [11:0] rid,     // RID[11:0], output
   output reg    rlast,   // RLAST, output
   output [ 1:0] rresp,   // RRESP[1:0], output
// AXI Write Address
   input  [31:0] awaddr,  // AWADDR[31:0], input
   input         awvalid, // AWVALID, input
   output        awready, // AWREADY, output
   input  [11:0] awid,    // AWID[11:0], input
//   input  [ 1:0] awlock,  // AWLOCK[1:0], input
//   input  [ 3:0] awcache, // AWCACHE[3:0], input
//   input  [ 2:0] awprot,  // AWPROT[2:0], input
   input  [ 3:0] awlen,   // AWLEN[3:0], input
   input  [ 1:0] awsize,  // AWSIZE[1:0], input
   input  [ 1:0] awburst, // AWBURST[1:0], input
//   input  [ 3:0] awqos,   // AWQOS[3:0], input
// AXI PS Master GP0: Write Data
   input  [31:0] wdata,   // WDATA[31:0], input
   input         wvalid,  // WVALID, input
   output        wready,  // WREADY, output
   input  [11:0] wid,     // WID[11:0], input
   input         wlast,   // WLAST, input
   input  [ 3:0] wstb,    // WSTRB[3:0], input
// AXI PS Master GP0: Write Responce
   output        bvalid,  // BVALID, output
   input         bready,  // BREADY, input
   output [11:0] bid,     // BID[11:0], output
   output [ 1:0] bresp    // BRESP[1:0], output
);
// **** Read channel ****
    wire ar_nempty;
    wire ar_half_full;
    assign arready=~ar_half_full;
    wire [ 1:0] arburst_out;
    // SuppressWarnings VEditor all 
    wire [ 1:0] arsize_out; // not used 
    wire [ 3:0] arlen_out;
    wire [ 9:0] araddr_out;
    wire [11:0] arid_out;
    wire rst=~aresetn;
    reg  read_in_progress=0;
    reg  read_in_progress_d=0; // delayed by one active cycle (not skipped)
    reg  read_in_progress_or=0; // read_in_progress || read_in_progress_d
    
    reg  [ 9:0] read_address;       // transfer address (not including lower bits 
    reg  [ 3:0] read_left;          // number of read transfers
// will ignore arsize - assuming always 32 bits  (a*size[2:0]==2)
    reg  [ 1:0] rburst;             // registered burst type 
    reg  [ 3:0] rlen;               // registered burst type 
    wire [ 9:0] next_rd_address_w;     // next transfer address;
    assign      next_rd_address_w=
      rburst[1]?
        (rburst[0]? (10'h0):((read_address[9:0]+1) & {6'h3f, ~rlen[3:0]})):
        (rburst[0]? (read_address[9:0]+1):(read_address[9:0]));
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
    
    reg bram_reg_re_0;

    wire pre_left_zero_w;
    reg last_in_burst_1;
    reg last_in_burst_0;
    reg start_read_burst_0;
    reg start_read_burst_1;
    reg [11:0] pre_rid0;
    reg [11:0] pre_rid;


    always @ (posedge  aclk or posedge  rst) begin
    
      if   (rst)                   pre_last_in_burst_r <= 0;
//      else if (start_read_burst_w) pre_last_in_burst_r <= (read_left==4'b0);
      else if (bram_reg_re_w)      pre_last_in_burst_r <= (read_left==4'b0);
    
      if   (rst)                   rburst[1:0] <= 0;
      else if (start_read_burst_w) rburst[1:0] <= arburst_out[1:0];

      if   (rst)                   rlen[3:0] <= 0;
      else if (start_read_burst_w) rlen[3:0] <= arlen_out[3:0];
    
      if   (rst) read_in_progress <= 0;
      else       read_in_progress <= read_in_progress_w;

      if   (rst)                read_in_progress_d <= 0;
//      else   read_in_progress_d <= read_in_progress_d_w;
      else if (bram_reg_re_w)   read_in_progress_d <= read_in_progress_d_w;
      
      if   (rst) read_in_progress_or <= 0;
//      else       read_in_progress_or <= read_in_progress_d_w || read_in_progress_w;
//      else  if (bram_reg_re_w) read_in_progress_or <= read_in_progress_d_w || read_in_progress_w;
// FIXME:
      else  if (bram_reg_re_w || !read_in_progress_or) read_in_progress_or <= read_in_progress_d_w || read_in_progress_w;
      
//    reg  read_in_progress_d=0; // delayed by one active cycle (not skipped)
//    reg  read_in_progress_or=0; // read_in_progress || read_in_progress_d

      if   (rst) read_left <= 0;
      else if (start_read_burst_w) read_left <= arlen_out[3:0]; // precedence over inc
      else if (bram_reg_re_w)      read_left <= read_left-1;
            
      if   (rst)                   read_address <= 10'b0;
      else if (start_read_burst_w) read_address <= araddr_out[9:0]; // precedence over inc
      else if (bram_reg_re_w)      read_address <= next_rd_address_w;
      
      if      (rst)                                  rvalid <= 1'b0;
      else if (bram_reg_re_w && read_in_progress_d)  rvalid <= 1'b1;
      else if (rready)                               rvalid <= 1'b0;

      if      (rst)                rlast <= 1'b0;
      else if (last_in_burst_d_w)  rlast <= 1'b1;
      else if (rready)             rlast <= 1'b0;
    end
    always @ (posedge  aclk) begin
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

    assign bram_reg_re_w=   read_in_progress_or && (!rvalid || rready); // slower/simplier
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

// **** Write channel: ****
    wire aw_nempty;
    wire aw_half_full;
    assign awready=~aw_half_full;
    wire [ 1:0] awburst_out;
    // SuppressWarnings VEditor all 
    wire [ 1:0] awsize_out; // not used
    wire [ 3:0] awlen_out;
    wire [ 9:0] awaddr_out;
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
    reg  [ 9:0] write_address;       // transfer address (not including lower bits 
    reg  [ 3:0] write_left;          // number of read transfers
// will ignore arsize - assuming always 32 bits  (a*size[2:0]==2)
    reg  [ 1:0] wburst;             // registered burst type
    reg  [ 3:0] wlen;               // registered awlen type (for wrapped over transfers)
    wire [ 9:0] next_wr_address_w;  // next transfer address;
    wire        bram_we_w;          // write BRAM memory 
    wire        start_write_burst_w;
    wire        write_in_progress_w;
    assign      next_wr_address_w=
      wburst[1]?
        (wburst[0]? (10'h0):((write_address[9:0]+1) & {6'h3f, ~wlen[3:0]})):
        (wburst[0]? (write_address[9:0]+1):(write_address[9:0]));
    assign      bram_we_w= w_nempty &&  write_in_progress;
    assign start_write_burst_w=aw_nempty && (!write_in_progress || (w_nempty && (write_left[3:0]==4'b0)));
    assign write_in_progress_w=aw_nempty || (write_in_progress && !(w_nempty && (write_left[3:0]==4'b0))); 
    
    always @ (posedge  aclk or posedge  rst) begin
      if   (rst)                    wburst[1:0] <= 0;
      else if (start_write_burst_w) wburst[1:0] <= awburst_out[1:0];

      if   (rst)                    wlen[3:0] <= 0;
      else if (start_write_burst_w) wlen[3:0] <= awlen_out[3:0];
    
      if   (rst) write_in_progress <= 0;
      else       write_in_progress <= write_in_progress_w;

      if   (rst) write_left <= 0;
      else if (start_write_burst_w) write_left <= awlen_out[3:0]; // precedence over inc
      else if (bram_we_w)           write_left <= write_left-1;
            
      if   (rst)                    write_address <= 10'b0;
      else if (start_write_burst_w) write_address <= awaddr_out[9:0]; // precedence over inc
      else if (bram_we_w)           write_address <= next_wr_address_w;
    end
// **** Write responce channel ****    
    wire [ 1:0] bresp_in;
    assign bresp_in=2'b0;
        
/*
   output        bvalid,  // BVALID, output
   input         bready,  // BREADY, input
   output [11:0] bid,     // BID[11:0], output
   output [ 1:0] bresp    // BRESP[1:0], output

*/
/*    
    reg bram_reg_re_r;
    always @ (posedge aclk) begin
        bram_reg_re_r <= bram_reg_re_w;
    end
*/    
ram_1kx32_1kx32 
  #(
      .REGISTERS(1) // 1 - registered output
   )
   ram_1kx32_1kx32_i
   (
      .rclk(aclk),                  // clock for read port
      .raddr(read_in_progress?read_address[9:0]:10'h3ff),    // read address
//      .ren(read_in_progress_or) ,      // read port enable
      .ren(bram_reg_re_w) ,      // read port enable
      .regen(bram_reg_re_w),        // output register enable
//      .regen(bram_reg_re_r),        // output register enable
      .data_out(rdata[31:0]),       // data out
      .wclk(aclk),                  // clock for read port
      .waddr(write_address[9:0]),   // write address
      .we(bram_we_w),               // write port enable
      .web(wstb_out[3:0]),          // write byte enable
      .data_in(wdata_out[31:0])     // data out
    );
    
fifo_same_clock   #( .DATA_WIDTH(30),.DATA_DEPTH(4))    
    raddr_i (
        .rst(rst),
        .clk(aclk),
        .we(arvalid && arready),
        .re(start_read_burst_w),
        .data_in({arid[11:0], arburst[1:0],arsize[1:0],arlen[3:0],araddr[11:2]}),
        .data_out({arid_out[11:0], arburst_out[1:0],arsize_out[1:0],arlen_out[3:0],araddr_out[9:0]}),
        .nempty(ar_nempty),
        .full(),
        .half_full(ar_half_full)
    );
fifo_same_clock   #( .DATA_WIDTH(30),.DATA_DEPTH(4))    
    waddr_i (
        .rst(rst),
        .clk(aclk),
        .we(awvalid && awready),
        .re(start_write_burst_w),
        .data_in({awid[11:0], awburst[1:0],awsize[1:0],awlen[3:0],awaddr[11:2]}),
        .data_out({awid_out[11:0], awburst_out[1:0],awsize_out[1:0],awlen_out[3:0],awaddr_out[9:0]}),
        .nempty(aw_nempty),
        .full(),
        .half_full(aw_half_full)
    );
fifo_same_clock   #( .DATA_WIDTH(49),.DATA_DEPTH(4))    
    wdata_i (
        .rst(rst),
        .clk(aclk),
        .we(wvalid && wready),
        .re(bram_we_w), //start_write_burst_w), // wrong
        .data_in({wid[11:0],wlast,wstb[3:0],wdata[31:0]}),
        .data_out({wid_out[11:0],wlast_out,wstb_out[3:0],wdata_out[31:0]}),
        .nempty(w_nempty),
        .full(),
        .half_full(w_half_full)
    );
fifo_same_clock  #( .DATA_WIDTH(14),.DATA_DEPTH(4))    
    wresp_i (
        .rst(rst),
        .clk(aclk),
        .we(bram_we_w),
        .re(bready && bvalid),
        .data_in({wid_out[11:0],bresp_in[1:0]}),
        .data_out({bid[11:0],bresp[1:0]}),
        .nempty(bvalid),
        .full(),
        .half_full()
    );

endmodule
