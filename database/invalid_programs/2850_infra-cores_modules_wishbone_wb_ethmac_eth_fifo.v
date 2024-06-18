// This program was cloned from: https://github.com/lnls-dig/infra-cores
// License: GNU Lesser General Public License v3.0

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  eth_fifo.v                                                  ////
////                                                              ////
////  This file is part of the Ethernet IP core project           ////
////  http://www.opencores.org/project,ethmac                     ////
////                                                              ////
////  Author(s):                                                  ////
////      - Igor Mohor (igorM@opencores.org)                      ////
////      - Julius Baxter (julius@opencores.org)                  ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2001 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

`include "ethmac_defines.v"
`include "timescale.v"

module eth_fifo (data_in, data_out, clk, reset, write, read, clear, 
		 almost_full, full, almost_empty, empty, cnt);

parameter DATA_WIDTH    = 32;
parameter DEPTH         = 8;
parameter CNT_WIDTH     = 3;

input                     clk;
input                     reset;
input                     write;
input                     read;
input                     clear;
input   [DATA_WIDTH-1:0]  data_in;

output  [DATA_WIDTH-1:0]  data_out;
output                    almost_full;
output                    full;
output                    almost_empty;
output                    empty;
output  [CNT_WIDTH-1:0]   cnt;


reg     [CNT_WIDTH-1:0]   read_pointer;
reg [CNT_WIDTH-1:0] 	  cnt;
reg 			  final_read;
   
always @ (posedge clk or posedge reset)
begin
  if(reset)
    cnt <= 0;
  else
  if(clear)
    cnt <= { {(CNT_WIDTH-1){1'b0}}, read^write};
  else
  if(read ^ write)
    if(read)
      cnt <= cnt - 1;
    else
      cnt <= cnt + 1;
end

   
`ifdef ETH_FIFO_GENERIC

   reg     [DATA_WIDTH-1:0]  fifo  [0:DEPTH-1] /*synthesis syn_ramstyle = "no_rw_check"*/ ;
   
   
   // This should make the synthesis tool infer a RAM
   reg [CNT_WIDTH-1:0] waddr, raddr, raddr_reg;
   reg 		       clear_reg; // Register the clear pulse

   reg 		       fallthrough_read;
   reg [CNT_WIDTH-1:0] fallthrough_read_addr;

   
   always @(posedge clk)
     if (reset)
       fallthrough_read <= 0;
     else
       fallthrough_read <= empty & write;

   always @(posedge clk)
     if (empty & write)
       fallthrough_read_addr <= waddr;   
			   
   always @(posedge clk)
     if (reset)
       waddr <= 0;
     else if (write)
       waddr <= waddr + 1;

   always @(posedge clk)
     if (reset)
       raddr <= 0;
     else if (clear)
       raddr <= waddr;
     else if (read | clear_reg)
       raddr <= raddr + 1;
   
   always @ (posedge clk)
     if (write & ~full)
       fifo[waddr] <=  data_in;


   always @(posedge clk)
     clear_reg <= clear;

   always @ (posedge clk)
     if (read | clear_reg)
       raddr_reg <= raddr;
     else if (fallthrough_read) // To pulse RE for fall-through on Xilinx
       raddr_reg <= fallthrough_read_addr;   
   
   assign  data_out = fifo[raddr_reg];


   always @(posedge clk)
     if (reset)
       final_read <= 0;
     else if (final_read & read & !write)
       final_read <= ~final_read;
     else if ((cnt == 1) & read & !write)
       final_read <= 1; // Indicate last read data has been output
   
   assign empty = ~(|cnt);
   assign almost_empty = cnt==1;
   assign full  = {{32-CNT_WIDTH{1'b0}},cnt} == (DEPTH-1);
   //assign almost_full  = &cnt[CNT_WIDTH-1:0];
   assign almost_full  = {{32-CNT_WIDTH{1'b0}},cnt} == (DEPTH-2);



always @ (posedge clk or posedge reset)
begin
  if(reset)
    read_pointer <= 0;
  else
  if(clear)
    // Begin read pointer at 1
    read_pointer <= { {(CNT_WIDTH-1){1'b0}}, 1'b1};
  else
  if(read & ~empty)
    read_pointer <= read_pointer + 1'b1;
end


`else // !`ifdef ETH_FIFO_GENERIC

reg     [CNT_WIDTH-1:0]   write_pointer;


always @ (posedge clk or posedge reset)
begin
  if(reset)
    read_pointer <= 0;
  else
  if(clear)
    read_pointer <= { {(CNT_WIDTH-1){1'b0}}, read};
  else
  if(read & ~empty)
    read_pointer <= read_pointer + 1'b1;
end

always @ (posedge clk or posedge reset)
begin
  if(reset)
    write_pointer <= 0;
  else
  if(clear)
    write_pointer <= { {(CNT_WIDTH-1){1'b0}}, write};
  else
  if(write & ~full)
    write_pointer <= write_pointer + 1'b1;
end

 `ifdef ETH_FIFO_XILINX
   
  generate
     if (CNT_WIDTH==4)
       begin
	  xilinx_dist_ram_16x32 fifo
	    ( .data_out(data_out), 
	      .we(write & ~full),
	      .data_in(data_in),
	      .read_address( clear ? {CNT_WIDTH-1{1'b0}} : read_pointer[3:0]),
	      .write_address(clear ? {CNT_WIDTH-1{1'b0}} : write_pointer[3:0]),
	      .wclk(clk)
	      );
       end // if (CNT_WIDTH==4)
     else if (CNT_WIDTH==6)
       begin

	  wire  [DATA_WIDTH-1:0]  data_out0;
	  wire [DATA_WIDTH-1:0]   data_out1;
	  wire [DATA_WIDTH-1:0]   data_out2;
	  wire [DATA_WIDTH-1:0]   data_out3;
	  
	  wire 			  we_ram0,we_ram1,we_ram2,we_ram3;

	  assign we_ram0 = (write_pointer[5:4]==2'b00);
	  assign we_ram1 = (write_pointer[5:4]==2'b01);
	  assign we_ram2 = (write_pointer[5:4]==2'b10);
	  assign we_ram3 = (write_pointer[5:4]==2'b11);
	  
	  assign data_out = (read_pointer[5:4]==2'b11) ? data_out3 :
			    (read_pointer[5:4]==2'b10) ? data_out2 :
			    (read_pointer[5:4]==2'b01) ? data_out1 : data_out0;
	  
	  xilinx_dist_ram_16x32 fifo0
	    ( .data_out(data_out0), 
	      .we(write & ~full & we_ram0),
	      .data_in(data_in),
	      .read_address( clear ? {CNT_WIDTH-1{1'b0}} : read_pointer[3:0]),
	      .write_address(clear ? {CNT_WIDTH-1{1'b0}} : write_pointer[3:0]),
	      .wclk(clk)
	      );
	  
	  xilinx_dist_ram_16x32 fifo1
	    ( .data_out(data_out1), 
	      .we(write & ~full & we_ram1),
	      .data_in(data_in),
	      .read_address( clear ? {CNT_WIDTH-1{1'b0}} : read_pointer[3:0]),
	      .write_address(clear ? {CNT_WIDTH-1{1'b0}} : write_pointer[3:0]),
	      .wclk(clk)
	      );

	  xilinx_dist_ram_16x32 fifo2
	    ( .data_out(data_out2), 
	      .we(write & ~full & we_ram2),
	      .data_in(data_in),
	      .read_address( clear ? {CNT_WIDTH-1{1'b0}} : read_pointer[3:0]),
	      .write_address(clear ? {CNT_WIDTH-1{1'b0}} : write_pointer[3:0]),
	      .wclk(clk)
	      );
	  
	  xilinx_dist_ram_16x32 fifo3
	    ( .data_out(data_out3), 
	      .we(write & ~full & we_ram3),
	      .data_in(data_in),
	      .read_address( clear ? {CNT_WIDTH-1{1'b0}} : read_pointer[3:0]),
	      .write_address(clear ? {CNT_WIDTH-1{1'b0}} : write_pointer[3:0]),
	      .wclk(clk)
	      );    
       end // if (CNT_WIDTH==6)
  endgenerate
   
   
     

   
`else   // !ETH_FIFO_XILINX
`ifdef ETH_ALTERA_ALTSYNCRAM
  altera_dpram_16x32	altera_dpram_16x32_inst
  (
  	.data             (data_in),
  	.wren             (write & ~full),
  	.wraddress        (clear ? {CNT_WIDTH-1{1'b0}} : write_pointer),
  	.rdaddress        (clear ? {CNT_WIDTH-1{1'b0}} : read_pointer ),
  	.clock            (clk),
  	.q                (data_out)
  );  //exemplar attribute altera_dpram_16x32_inst NOOPT TRUE
`endif //  `ifdef ETH_ALTERA_ALTSYNCRAM
`endif // !`ifdef ETH_FIFO_XILINX

   
assign empty = ~(|cnt);
assign almost_empty = cnt == 1;
assign full  = cnt == (DEPTH-1);
assign almost_full  = &cnt[CNT_WIDTH-1:0];
   
`endif // !`ifdef ETH_FIFO_GENERIC
   


endmodule
