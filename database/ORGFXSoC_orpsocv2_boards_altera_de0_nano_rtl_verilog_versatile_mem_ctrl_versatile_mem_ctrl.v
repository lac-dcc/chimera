`line 1 "sdr_16_defines.v" 1
//
// Specify either type of memory
// or
// BA_SIZE, ROW_SIZE, COL_SIZE and SDRAM_DATA_WIDTH
//
// either in this file or as command line option; +define+MT48LC16M16
//

// Most of these defines have an effect on things in fsm_sdr_16.v

//`define MT48LC32M16   // 64MB part
 // 32MB part
//`define MT48LC4M16    //  8MB part

// Define this to allow indication that a burst read is still going
// to the wishbone state machine, so it doesn't start emptying the
// ingress fifo after a aborted burst before the burst read is
// actually finished.
 

// If intending to burst write, and the wishbone clock is about 1/4 the speed
// of the SDRAM clock, then the data may come late, and this triggers a bug
// during write. To avoid this we can just wait a little longer for data when
// burst reading (there's no almost_empty signal from the FIFO)
 


 


  
 
 
 
 


`line 37 "sdr_16_defines.v" 0
 //  `ifdef MT48LC16M16

 
// using 1 of MT48LC16M16
// SDRAM data width is 16
  
 
 
 
 

 //  `ifdef MT48LC16M16

 


  
 
 
 
 


`line 59 "sdr_16_defines.v" 0
 //  `ifdef MT48LC4M16

// LMR
// [12:10] reserved
// [9]     WB, write burst; 0 - programmed burst length, 1 - single location
// [8:7]   OP Mode, 2'b00
// [6:4]   CAS Latency; 3'b010 - 2, 3'b011 - 3
// [3]     BT, Burst Type; 1'b0 - sequential, 1'b1 - interleaved
// [2:0]   Burst length; 3'b000 - 1, 3'b001 - 2, 3'b010 - 4, 3'b011 - 8, 3'b111 - full page
 
 
 
 
`line 72 "sdr_16_defines.v" 2
`line 1 "fsm_wb.v" 1
module fsm_wb (
	       stall_i, stall_o,
	       we_i, cti_i, bte_i, stb_i, cyc_i, ack_o,
	       egress_fifo_we, egress_fifo_full,
	       ingress_fifo_re, ingress_fifo_empty,
	       state_idle,
	       sdram_burst_reading,
	       debug_state,
	       wb_clk, wb_rst
	       );

   input stall_i;
   output stall_o;

   input [2:0] cti_i;
   input [1:0] bte_i;
   input       we_i, stb_i, cyc_i;
   output      ack_o;
   output      egress_fifo_we, ingress_fifo_re;
   input       egress_fifo_full, ingress_fifo_empty;
   input       sdram_burst_reading;
   output      state_idle;
   input       wb_clk, wb_rst;
   output [1:0] debug_state;
   
   

   reg 	       ingress_fifo_read_reg;

   // bte
   parameter linear       = 2'b00;
   parameter wrap4        = 2'b01;
   parameter wrap8        = 2'b10;
   parameter wrap16       = 2'b11;
   // cti
   parameter classic      = 3'b000;
   parameter endofburst   = 3'b111;

   parameter idle = 2'b00;
   parameter rd   = 2'b01;
   parameter wr   = 2'b10;
   parameter fe   = 2'b11;
   reg [1:0]   state;

   assign debug_state = state;
   

   reg 	       sdram_burst_reading_1, sdram_burst_reading_2;
   wire        sdram_burst_reading_wb_clk;
   

   always @ (posedge wb_clk or posedge wb_rst)
     if (wb_rst)
       state <= idle;
     else
       case (state)
         idle:
           if (we_i & stb_i & cyc_i & !egress_fifo_full & !stall_i)
             state <= wr;
           else if (!we_i & stb_i & cyc_i & !egress_fifo_full & !stall_i)
             state <= rd;
         wr:
           if ((cti_i==classic | cti_i==endofburst | bte_i==linear) & 
	       stb_i & cyc_i & !egress_fifo_full & !stall_i)
             state <= idle;
         rd:
           if ((cti_i==classic | cti_i==endofburst | bte_i==linear) & 
	       stb_i & cyc_i & ack_o)
             state <= fe;
         fe:
           if (ingress_fifo_empty & !sdram_burst_reading_wb_clk)
             state <= idle;
         default: ;
       endcase
   
   assign state_idle = (state==idle);
   
   assign stall_o = (stall_i) ? 1'b1 :
                    (state==idle & stb_i & cyc_i & !egress_fifo_full) ? 1'b1 :
                    (state==wr   & stb_i & cyc_i & !egress_fifo_full) ? 1'b1 :
                    (state==rd   & stb_i & cyc_i & !ingress_fifo_empty) ? 1'b1 :
                    (state==fe   & !ingress_fifo_empty) ? 1'b1 :
                    1'b0;
   
   assign egress_fifo_we = (state==idle & stb_i & cyc_i & !egress_fifo_full & !stall_i) ? 1'b1 :
                           (state==wr   & stb_i & cyc_i & !egress_fifo_full & !stall_i) ? 1'b1 :
                           1'b0;
   
   assign ingress_fifo_re = (state==rd & stb_i & cyc_i & !ingress_fifo_empty & !stall_i) ? 1'b1 :
                            (state==fe & !ingress_fifo_empty & !stall_i) ? 1'b1:
                            1'b0;
   
   always @ (posedge wb_clk or posedge wb_rst)
     if (wb_rst)
       ingress_fifo_read_reg <= 1'b0;
     else
       ingress_fifo_read_reg <= ingress_fifo_re;
   
   /*assign ack_o = (ingress_fifo_read_reg & stb_i) ? 1'b1 :
                  (state==fe) ? 1'b0 :
                  (state==wr & stb_i & cyc_i & !egress_fifo_full & !stall_i) ? 1'b1 :
                  1'b0;*/

   assign ack_o = !(state==fe) & ((ingress_fifo_read_reg & stb_i) | (state==wr & stb_i & cyc_i & !egress_fifo_full & !stall_i));


   // Sample the SDRAM burst reading signal in WB domain
   always @(posedge wb_clk)
     sdram_burst_reading_1 <= sdram_burst_reading;
   
   always @(posedge wb_clk)
     sdram_burst_reading_2 <= sdram_burst_reading_1;

   assign sdram_burst_reading_wb_clk = sdram_burst_reading_2;
   
endmodule
`line 116 "fsm_wb.v" 2
`line 1 "versatile_fifo_async_cmp.v" 1
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  Versatile counter                                           ////
////                                                              ////
////  Description                                                 ////
////  Versatile counter, a reconfigurable binary, gray or LFSR    ////
////  counter                                                     ////
////                                                              ////
////  To Do:                                                      ////
////   - add LFSR with more taps                                  ////
////                                                              ////
////  Author(s):                                                  ////
////      - Michael Unneback, unneback@opencores.org              ////
////        ORSoC AB                                              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors and OPENCORES.ORG                 ////
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

module versatile_fifo_async_cmp ( wptr, rptr, fifo_empty, fifo_full, wclk, rclk, rst );

   parameter ADDR_WIDTH = 4;   
   parameter N = ADDR_WIDTH-1;

   parameter Q1 = 2'b00;
   parameter Q2 = 2'b01;
   parameter Q3 = 2'b11;
   parameter Q4 = 2'b10;

   parameter going_empty = 1'b0;
   parameter going_full  = 1'b1;
   
   input [N:0]  wptr, rptr;   
   output reg	fifo_empty;
   output       fifo_full;
   input 	wclk, rclk, rst;   

    
   wire direction;

 
    

`line 66 "versatile_fifo_async_cmp.v" 0

   reg 	direction_set, direction_clr;
   
   wire async_empty, async_full;
   wire fifo_full2;
   reg  fifo_empty2;   
   
   // direction_set
   always @ (wptr[N:N-1] or rptr[N:N-1])
     case ({wptr[N:N-1],rptr[N:N-1]})
       {Q1,Q2} : direction_set <= 1'b1;
       {Q2,Q3} : direction_set <= 1'b1;
       {Q3,Q4} : direction_set <= 1'b1;
       {Q4,Q1} : direction_set <= 1'b1;
       default : direction_set <= 1'b0;
     endcase

   // direction_clear
   always @ (wptr[N:N-1] or rptr[N:N-1] or rst)
     if (rst)
       direction_clr <= 1'b1;
     else
       case ({wptr[N:N-1],rptr[N:N-1]})
	 {Q2,Q1} : direction_clr <= 1'b1;
	 {Q3,Q2} : direction_clr <= 1'b1;
	 {Q4,Q3} : direction_clr <= 1'b1;
	 {Q1,Q4} : direction_clr <= 1'b1;
	 default : direction_clr <= 1'b0;
       endcase

 
    dff_sr dff_sr_dir( .aclr(direction_clr), .aset(direction_set), .clock(1'b1), .data(1'b1), .q(direction));


 
         
      
         
     
         

`line 106 "versatile_fifo_async_cmp.v" 0


   assign async_empty = (wptr == rptr) && (direction==going_empty);
   assign async_full  = (wptr == rptr) && (direction==going_full);

    dff_sr dff_sr_empty0( .aclr(rst), .aset(async_full), .clock(wclk), .data(async_full), .q(fifo_full2));
    dff_sr dff_sr_empty1( .aclr(rst), .aset(async_full), .clock(wclk), .data(fifo_full2), .q(fifo_full));

/*
   always @ (posedge wclk or posedge rst or posedge async_full)
     if (rst)
       {fifo_full, fifo_full2} <= 2'b00;
     else if (async_full)
       {fifo_full, fifo_full2} <= 2'b11;
     else
       {fifo_full, fifo_full2} <= {fifo_full2, async_full};
*/
   always @ (posedge rclk or posedge async_empty)
     if (async_empty)
       {fifo_empty, fifo_empty2} <= 2'b11;
     else
       {fifo_empty,fifo_empty2} <= {fifo_empty2,async_empty};   

endmodule // async_comp
`line 130 "versatile_fifo_async_cmp.v" 2
`line 1 "async_fifo_mq.v" 1
// async FIFO with multiple queues

module async_fifo_mq (
    d, fifo_full, write, write_enable, clk1, rst1,
    q, fifo_empty, read, read_enable, clk2, rst2
);

parameter a_hi_size = 4;
parameter a_lo_size = 4;
parameter nr_of_queues = 16;
parameter data_width = 36;

input [data_width-1:0] d;
output [0:nr_of_queues-1] fifo_full;
input                     write;
input  [0:nr_of_queues-1] write_enable;
input clk1;
input rst1;

output [data_width-1:0] q;
output [0:nr_of_queues-1] fifo_empty;
input                     read;
input  [0:nr_of_queues-1] read_enable;
input clk2;
input rst2;

wire [a_lo_size-1:0]  fifo_wadr_bin[0:nr_of_queues-1];
wire [a_lo_size-1:0]  fifo_wadr_gray[0:nr_of_queues-1];
wire [a_lo_size-1:0]  fifo_radr_bin[0:nr_of_queues-1];
wire [a_lo_size-1:0]  fifo_radr_gray[0:nr_of_queues-1];
reg [a_lo_size-1:0] wadr;
reg [a_lo_size-1:0] radr;
reg [data_width-1:0] wdata;
wire [data_width-1:0] wdataa[0:nr_of_queues-1];

genvar i;
integer j,k,l;

function [a_lo_size-1:0] onehot2bin;
input [0:nr_of_queues-1] a;
integer i;
begin
    onehot2bin = {a_lo_size{1'b0}};
    for (i=1;i<nr_of_queues;i=i+1) begin
        if (a[i])
            onehot2bin = i;
    end
end
endfunction

generate
    for (i=0;i<nr_of_queues;i=i+1) begin : fifo_adr
        
        gray_counter wadrcnt (
            .cke(write & write_enable[i]),
            .q(fifo_wadr_gray[i]),
            .q_bin(fifo_wadr_bin[i]),
            .rst(rst1),
            .clk(clk1));
        
        gray_counter radrcnt (
            .cke(read & read_enable[i]),
            .q(fifo_radr_gray[i]),
            .q_bin(fifo_radr_bin[i]),
            .rst(rst2),
            .clk(clk2));
        
	versatile_fifo_async_cmp
            #(.ADDR_WIDTH(a_lo_size))
            egresscmp ( 
                .wptr(fifo_wadr_gray[i]), 
		.rptr(fifo_radr_gray[i]), 
		.fifo_empty(fifo_empty[i]), 
		.fifo_full(fifo_full[i]), 
		.wclk(clk1), 
		.rclk(clk2), 
		.rst(rst1));
        
    end
endgenerate

// and-or mux write address
always @*
begin
    wadr = {a_lo_size{1'b0}};
    for (j=0;j<nr_of_queues;j=j+1) begin
        wadr = (fifo_wadr_bin[j] & {a_lo_size{write_enable[j]}}) | wadr;
    end
end

// and-or mux read address
always @*
begin
    radr = {a_lo_size{1'b0}};
    for (k=0;k<nr_of_queues;k=k+1) begin
        radr = (fifo_radr_bin[k] & {a_lo_size{read_enable[k]}}) | radr;
    end
end

vfifo_dual_port_ram_dc_sw # ( .DATA_WIDTH(data_width), .ADDR_WIDTH(a_hi_size+a_lo_size))
    dpram (
    .d_a(d),
    .adr_a({onehot2bin(write_enable),wadr}), 
    .we_a(write),
    .clk_a(clk1),
    .q_b(q),
    .adr_b({onehot2bin(read_enable),radr}),
    .clk_b(clk2) );

endmodule
`line 111 "async_fifo_mq.v" 2
`line 1 "delay.v" 1
`timescale 1ns/1ns
module delay (d, q, clk, rst);

   parameter width = 4;
   parameter depth = 3;

   input  [width-1:0] d;
   output [width-1:0] q;
   input              clk;
   input 	      rst;

   reg [width-1:0] dffs [1:depth];

   integer i;
   
   always @ (posedge clk or posedge rst)
     if (rst)
       for ( i=1; i <= depth; i=i+1)
	 dffs[i] <= {width{1'b0}};
     else
       begin
	  dffs[1] <= d;
	  for ( i=2; i <= depth; i=i+1 )
	    dffs[i] <= dffs[i-1];
       end

   assign q = dffs[depth];   
   
endmodule //delay

   
`line 32 "delay.v" 2
`line 1 "codec.v" 1
`timescale 1ns/1ns
module encode (
    fifo_empty_0, fifo_empty_1, fifo_empty_2, fifo_empty_3,
    fifo_sel, fifo_sel_domain
);

input  [0:15] fifo_empty_0, fifo_empty_1, fifo_empty_2, fifo_empty_3;
output [0:15] fifo_sel;
output [1:0]  fifo_sel_domain;

function [0:15] encode;
input [0:15] a;
input [0:15] b;
input [0:15] c;
input [0:15] d;
integer i;
begin
    if (!(&d))
        casex (d)
        16'b0xxxxxxxxxxxxxxx: encode = 16'b1000000000000000;
        16'b10xxxxxxxxxxxxxx: encode = 16'b0100000000000000;
        16'b110xxxxxxxxxxxxx: encode = 16'b0010000000000000;
        16'b1110xxxxxxxxxxxx: encode = 16'b0001000000000000;
        16'b11110xxxxxxxxxxx: encode = 16'b0000100000000000;
        16'b111110xxxxxxxxxx: encode = 16'b0000010000000000;
        16'b1111110xxxxxxxxx: encode = 16'b0000001000000000;
        16'b11111110xxxxxxxx: encode = 16'b0000000100000000;
        16'b111111110xxxxxxx: encode = 16'b0000000010000000;
        16'b1111111110xxxxxx: encode = 16'b0000000001000000;
        16'b11111111110xxxxx: encode = 16'b0000000000100000;
        16'b111111111110xxxx: encode = 16'b0000000000010000;
        16'b1111111111110xxx: encode = 16'b0000000000001000;
        16'b11111111111110xx: encode = 16'b0000000000000100;
        16'b111111111111110x: encode = 16'b0000000000000010;
        16'b1111111111111110: encode = 16'b0000000000000001;
        default:              encode = 16'b0000000000000000;
        endcase
    else if (!(&c))
        casex (c)
        16'b0xxxxxxxxxxxxxxx: encode = 16'b1000000000000000;
        16'b10xxxxxxxxxxxxxx: encode = 16'b0100000000000000;
        16'b110xxxxxxxxxxxxx: encode = 16'b0010000000000000;
        16'b1110xxxxxxxxxxxx: encode = 16'b0001000000000000;
        16'b11110xxxxxxxxxxx: encode = 16'b0000100000000000;
        16'b111110xxxxxxxxxx: encode = 16'b0000010000000000;
        16'b1111110xxxxxxxxx: encode = 16'b0000001000000000;
        16'b11111110xxxxxxxx: encode = 16'b0000000100000000;
        16'b111111110xxxxxxx: encode = 16'b0000000010000000;
        16'b1111111110xxxxxx: encode = 16'b0000000001000000;
        16'b11111111110xxxxx: encode = 16'b0000000000100000;
        16'b111111111110xxxx: encode = 16'b0000000000010000;
        16'b1111111111110xxx: encode = 16'b0000000000001000;
        16'b11111111111110xx: encode = 16'b0000000000000100;
        16'b111111111111110x: encode = 16'b0000000000000010;
        16'b1111111111111110: encode = 16'b0000000000000001;
        default:              encode = 16'b0000000000000000;
        endcase
    else if (!(&b))
        casex (b)
        16'b0xxxxxxxxxxxxxxx: encode = 16'b1000000000000000;
        16'b10xxxxxxxxxxxxxx: encode = 16'b0100000000000000;
        16'b110xxxxxxxxxxxxx: encode = 16'b0010000000000000;
        16'b1110xxxxxxxxxxxx: encode = 16'b0001000000000000;
        16'b11110xxxxxxxxxxx: encode = 16'b0000100000000000;
        16'b111110xxxxxxxxxx: encode = 16'b0000010000000000;
        16'b1111110xxxxxxxxx: encode = 16'b0000001000000000;
        16'b11111110xxxxxxxx: encode = 16'b0000000100000000;
        16'b111111110xxxxxxx: encode = 16'b0000000010000000;
        16'b1111111110xxxxxx: encode = 16'b0000000001000000;
        16'b11111111110xxxxx: encode = 16'b0000000000100000;
        16'b111111111110xxxx: encode = 16'b0000000000010000;
        16'b1111111111110xxx: encode = 16'b0000000000001000;
        16'b11111111111110xx: encode = 16'b0000000000000100;
        16'b111111111111110x: encode = 16'b0000000000000010;
        16'b1111111111111110: encode = 16'b0000000000000001;
        default:              encode = 16'b0000000000000000;
        endcase
    else
        casex (a)
        16'b0xxxxxxxxxxxxxxx: encode = 16'b1000000000000000;
        16'b10xxxxxxxxxxxxxx: encode = 16'b0100000000000000;
        16'b110xxxxxxxxxxxxx: encode = 16'b0010000000000000;
        16'b1110xxxxxxxxxxxx: encode = 16'b0001000000000000;
        16'b11110xxxxxxxxxxx: encode = 16'b0000100000000000;
        16'b111110xxxxxxxxxx: encode = 16'b0000010000000000;
        16'b1111110xxxxxxxxx: encode = 16'b0000001000000000;
        16'b11111110xxxxxxxx: encode = 16'b0000000100000000;
        16'b111111110xxxxxxx: encode = 16'b0000000010000000;
        16'b1111111110xxxxxx: encode = 16'b0000000001000000;
        16'b11111111110xxxxx: encode = 16'b0000000000100000;
        16'b111111111110xxxx: encode = 16'b0000000000010000;
        16'b1111111111110xxx: encode = 16'b0000000000001000;
        16'b11111111111110xx: encode = 16'b0000000000000100;
        16'b111111111111110x: encode = 16'b0000000000000010;
        16'b1111111111111110: encode = 16'b0000000000000001;
        default:              encode = 16'b0000000000000000;
        endcase
end
endfunction

assign fifo_sel = encode( fifo_empty_0, fifo_empty_1, fifo_empty_2, fifo_empty_3);
assign fifo_sel_domain = (!(&fifo_empty_3)) ? 2'b11 :
                         (!(&fifo_empty_2)) ? 2'b10 :
                         (!(&fifo_empty_1)) ? 2'b01 :
                         2'b00;
                         
endmodule

`timescale 1ns/1ns
module decode (
    fifo_sel, fifo_sel_domain,
    fifo_we_0, fifo_we_1, fifo_we_2, fifo_we_3
);

input  [0:15] fifo_sel;
input  [1:0]  fifo_sel_domain;
output [0:15] fifo_we_0, fifo_we_1, fifo_we_2, fifo_we_3;

assign fifo_we_0 = (fifo_sel_domain == 2'b00) ? fifo_sel : {16{1'b0}};
assign fifo_we_1 = (fifo_sel_domain == 2'b01) ? fifo_sel : {16{1'b0}};
assign fifo_we_2 = (fifo_sel_domain == 2'b10) ? fifo_sel : {16{1'b0}};
assign fifo_we_3 = (fifo_sel_domain == 2'b11) ? fifo_sel : {16{1'b0}};

endmodule
`line 125 "codec.v" 2
`line 1 "gray_counter.v" 1
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  Versatile counter                                           ////
////                                                              ////
////  Description                                                 ////
////  Versatile counter, a reconfigurable binary, gray or LFSR    ////
////  counter                                                     ////
////                                                              ////
////  To Do:                                                      ////
////   - add LFSR with more taps                                  ////
////                                                              ////
////  Author(s):                                                  ////
////      - Michael Unneback, unneback@opencores.org              ////
////        ORSoC AB                                              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors and OPENCORES.ORG                 ////
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

// GRAY counter
module gray_counter ( cke, q, q_bin, rst, clk);

   parameter length = 4;
   input cke;
   output reg [length:1] q;
   output [length:1] q_bin;
   input rst;
   input clk;

   parameter clear_value = 0;

   reg  [length:1] qi;
   wire [length:1] q_next;
   assign q_next = qi + {{length-1{1'b0}},1'b1};

   always @ (posedge clk or posedge rst)
     if (rst)
       qi <= {length{1'b0}};
     else
     if (cke)
       qi <= q_next;

   always @ (posedge clk or posedge rst)
     if (rst)
       q <= {length{1'b0}};
     else
       if (cke)
         q <= (q_next>>1) ^ q_next;

   assign q_bin = qi;

endmodule
`line 76 "gray_counter.v" 2
`line 1 "egress_fifo.v" 1
// async FIFO with multiple queues, multiple data
 
 
module egress_fifo (
    d, fifo_full, write, write_enable, clk1, rst1,
    q, fifo_empty, read_adr, read_data, read_enable, clk2, rst2
);

parameter a_hi_size = 4;
parameter a_lo_size = 4;
parameter nr_of_queues = 16;
parameter data_width = 36;

input [data_width*nr_of_queues-1:0] d;
output [0:nr_of_queues-1] fifo_full;
input                     write;
input  [0:nr_of_queues-1] write_enable;
input clk1;
input rst1;

output reg [data_width-1:0] q;
output [0:nr_of_queues-1] fifo_empty;
input                     read_adr, read_data;
input  [0:nr_of_queues-1] read_enable;
input clk2;
input rst2;

wire [data_width-1:0] fifo_q;
   
wire [a_lo_size-1:0]  fifo_wadr_bin[0:nr_of_queues-1];
wire [a_lo_size-1:0]  fifo_wadr_gray[0:nr_of_queues-1];
wire [a_lo_size-1:0]  fifo_radr_bin[0:nr_of_queues-1];
wire [a_lo_size-1:0]  fifo_radr_gray[0:nr_of_queues-1];
reg [a_lo_size-1:0] wadr;
reg [a_lo_size-1:0] radr;
reg [data_width-1:0] wdata;
wire [data_width-1:0] wdataa[0:nr_of_queues-1];

reg read_adr_reg;
reg [0:nr_of_queues-1] read_enable_reg;

genvar i;
integer j,k,l;

function [a_lo_size-1:0] onehot2bin;
input [0:nr_of_queues-1] a;
integer i;
begin
    onehot2bin = {a_lo_size{1'b0}};
    for (i=1;i<nr_of_queues;i=i+1) begin
        if (a[i])
            onehot2bin = i;
    end
end
endfunction

// a pipeline stage for address read gives higher clock frequency but adds one 
// clock latency for adr read
always @ (posedge clk2 or posedge rst2)
if (rst2)
    read_adr_reg <= 1'b0;
else
    read_adr_reg <= read_adr;
    
always @ (posedge clk2 or posedge rst2)
if (rst2)
    read_enable_reg <= {nr_of_queues{1'b0}};
else
    if (read_adr)
        read_enable_reg <= read_enable;
        

generate
    for (i=0;i<nr_of_queues;i=i+1) begin : fifo_adr
        
        gray_counter wadrcnt (
            .cke(write & write_enable[i]),
            .q(fifo_wadr_gray[i]),
            .q_bin(fifo_wadr_bin[i]),
            .rst(rst1),
            .clk(clk1));
        
        gray_counter radrcnt (
            .cke((read_adr_reg | read_data) & read_enable_reg[i]),
            .q(fifo_radr_gray[i]),
            .q_bin(fifo_radr_bin[i]),
            .rst(rst2),
            .clk(clk2));
        
	versatile_fifo_async_cmp
            #(.ADDR_WIDTH(a_lo_size))
            egresscmp ( 
                .wptr(fifo_wadr_gray[i]), 
		.rptr(fifo_radr_gray[i]), 
		.fifo_empty(fifo_empty[i]), 
		.fifo_full(fifo_full[i]), 
		.wclk(clk1), 
		.rclk(clk2), 
		.rst(rst1));
        
    end
endgenerate

// and-or mux write address
always @*
begin
    wadr = {a_lo_size{1'b0}};
    for (j=0;j<nr_of_queues;j=j+1) begin
        wadr = (fifo_wadr_bin[j] & {a_lo_size{write_enable[j]}}) | wadr;
    end
end

// and-or mux read address
always @*
begin
    radr = {a_lo_size{1'b0}};
    for (k=0;k<nr_of_queues;k=k+1) begin
        radr = (fifo_radr_bin[k] & {a_lo_size{read_enable_reg[k]}}) | radr;
    end
end

// and-or mux write data
generate
    for (i=0;i<nr_of_queues;i=i+1) begin : vector2array
        assign wdataa[i] = d[(nr_of_queues-i)*data_width-1:(nr_of_queues-1-i)*data_width];
    end
endgenerate

always @*
begin
    wdata = {data_width{1'b0}};
    for (l=0;l<nr_of_queues;l=l+1) begin
        wdata = (wdataa[l] & {data_width{write_enable[l]}}) | wdata;
    end
end


   
vfifo_dual_port_ram_dc_sw 
  # ( 
      .DATA_WIDTH(data_width), 
      .ADDR_WIDTH(a_hi_size+a_lo_size)
      )
    dpram (
    .d_a(wdata),
    .adr_a({onehot2bin(write_enable),wadr}), 
    .we_a(write),
    .clk_a(clk1),
    .q_b(fifo_q),
    .adr_b({onehot2bin(read_enable_reg),radr}),
    .clk_b(clk2) );

   // Added registering of FIFO output to break a timing path
   always@(posedge clk2)
     q <= fifo_q;
   

endmodule
 
  
         
          


   
   
   
   

  
  
                     
   
 
 

   
  
                      
   
 
 

  
   
   
   
   
   
  
  
  
  

 
  

 
 



      
 
      

      
    
      
 
      

     
          
        
   
    
     
        
      
      
      
      
      
   
    
     
          
      
      
      
      
      
   
   
     
      
      
   
      
        
        
        
        
        
        
       
       

   
       
     
        
      
      
      
      
      
   
    
     
          
      
      
      
      
      
   
   
     
      
      
   
      
        
        
        
        
        
        
       
       

   
       
     
        
      
      
      
      
      
   
    
     
          
      
      
      
      
      
   
   
     
      
      
   
      
        
        
        
        
        
        
       
       

   
         
		    
		   
   
         
		    
		   
   
     
      
      
      
   
          
		       
		          

     
         
		        
		     
     
         
		        
		     
      
 
    
       
      
      
     
    
     
    
    
    
    
     

   
    
       
   



`line 365 "egress_fifo.v" 0
 // !`ifdef ORIGINAL_EGRESS_FIFO
`line 366 "egress_fifo.v" 2
`line 1 "versatile_fifo_dual_port_ram_dc_sw.v" 1
// true dual port RAM, sync

 
	 

`line 5 "versatile_fifo_dual_port_ram_dc_sw.v" 0

module vfifo_dual_port_ram_dc_sw
  (
   d_a,
   adr_a, 
   we_a,
   clk_a,
   q_b,
   adr_b,
   clk_b
   );
   parameter DATA_WIDTH = 32;
   parameter ADDR_WIDTH = 8;
   input [(DATA_WIDTH-1):0]      d_a;
   input [(ADDR_WIDTH-1):0] 	 adr_a;
   input [(ADDR_WIDTH-1):0] 	 adr_b;
   input 			 we_a;
   output [(DATA_WIDTH-1):0] 	 q_b;
   input 			 clk_a, clk_b;
   reg [(ADDR_WIDTH-1):0] 	 adr_b_reg;
   reg [DATA_WIDTH-1:0] ram [(1<<ADDR_WIDTH)-1:0] /*synthesis syn_ramstyle = "no_rw_check"*/;
   always @ (posedge clk_a)
   if (we_a)
     ram[adr_a] <= d_a;
   always @ (posedge clk_b)
   adr_b_reg <= adr_b;   
   assign q_b = ram[adr_b_reg];
endmodule 
`line 33 "versatile_fifo_dual_port_ram_dc_sw.v" 2
`line 1 "dff_sr.v" 1
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  Versatile counter                                           ////
////                                                              ////
////  Description                                                 ////
////  Versatile counter, a reconfigurable binary, gray or LFSR    ////
////  counter                                                     ////
////                                                              ////
////  To Do:                                                      ////
////   - add LFSR with more taps                                  ////
////                                                              ////
////  Author(s):                                                  ////
////      - Michael Unneback, unneback@opencores.org              ////
////        ORSoC AB                                              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors and OPENCORES.ORG                 ////
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

module dff_sr ( aclr, aset, clock, data, q);

    input	  aclr;
    input	  aset;
    input	  clock;
    input	  data;
    output reg	  q;

   always @ (posedge clock or posedge aclr or posedge aset)
     if (aclr)
       q <= 1'b0;
     else if (aset)
       q <= 1'b1;
     else
       q <= data;

endmodule
`line 60 "dff_sr.v" 2
`line 1 "ref_counter.v" 1
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  Versatile counter                                           ////
////                                                              ////
////  Description                                                 ////
////  Versatile counter, a reconfigurable binary, gray or LFSR    ////
////  counter                                                     ////
////                                                              ////
////  To Do:                                                      ////
////   - add LFSR with more taps                                  ////
////                                                              ////
////  Author(s):                                                  ////
////      - Michael Unneback, unneback@opencores.org              ////
////        ORSoC AB                                              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors and OPENCORES.ORG                 ////
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

// LFSR counter
module ref_counter ( zq, rst, clk);

   parameter length = 10;
   output reg zq;
   input rst;
   input clk;

   parameter clear_value = 0;
   parameter set_value = 0;
   parameter wrap_value = 417;

   reg  [length:1] qi;
   reg lfsr_fb;
   wire [length:1] q_next;
   reg [32:1] polynom;
   integer i;

   always @ (qi)
   begin
        case (length) 
         2: polynom = 32'b11;                               // 0x3
         3: polynom = 32'b110;                              // 0x6
         4: polynom = 32'b1100;                             // 0xC
         5: polynom = 32'b10100;                            // 0x14
         6: polynom = 32'b110000;                           // 0x30
         7: polynom = 32'b1100000;                          // 0x60
         8: polynom = 32'b10111000;                         // 0xb8
         9: polynom = 32'b100010000;                        // 0x110
        10: polynom = 32'b1001000000;                       // 0x240
        11: polynom = 32'b10100000000;                      // 0x500
        12: polynom = 32'b100000101001;                     // 0x829
        13: polynom = 32'b1000000001100;                    // 0x100C
        14: polynom = 32'b10000000010101;                   // 0x2015
        15: polynom = 32'b110000000000000;                  // 0x6000
        16: polynom = 32'b1101000000001000;                 // 0xD008
        17: polynom = 32'b10010000000000000;                // 0x12000
        18: polynom = 32'b100000010000000000;               // 0x20400
        19: polynom = 32'b1000000000000100011;              // 0x40023
        20: polynom = 32'b10000010000000000000;             // 0x82000
        21: polynom = 32'b101000000000000000000;            // 0x140000
        22: polynom = 32'b1100000000000000000000;           // 0x300000
        23: polynom = 32'b10000100000000000000000;          // 0x420000
        24: polynom = 32'b111000010000000000000000;         // 0xE10000
        25: polynom = 32'b1001000000000000000000000;        // 0x1200000
        26: polynom = 32'b10000000000000000000100011;       // 0x2000023
        27: polynom = 32'b100000000000000000000010011;      // 0x4000013
        28: polynom = 32'b1100100000000000000000000000;     // 0xC800000
        29: polynom = 32'b10100000000000000000000000000;    // 0x14000000
        30: polynom = 32'b100000000000000000000000101001;   // 0x20000029
        31: polynom = 32'b1001000000000000000000000000000;  // 0x48000000
        32: polynom = 32'b10000000001000000000000000000011; // 0x80200003
        default: polynom = 32'b0;
        endcase
        lfsr_fb = qi[length];
        for (i=length-1; i>=1; i=i-1) begin
            if (polynom[i])
                lfsr_fb = lfsr_fb  ~^ qi[i];
        end
    end
   assign q_next = (qi == wrap_value) ? {length{1'b0}} :{qi[length-1:1],lfsr_fb};

   always @ (posedge clk or posedge rst)
     if (rst)
       qi <= {length{1'b0}};
     else
       qi <= q_next;



   always @ (posedge clk or posedge rst)
     if (rst)
       zq <= 1'b1;
     else
       zq <= q_next == {length{1'b0}};
endmodule
`line 119 "ref_counter.v" 2
`line 1 "fsm_sdr_16.v" 1
`timescale 1ns/1ns
 
`line 2 "fsm_sdr_16.v" 0
`line 1 "sdr_16_defines.v" 1
//
// Specify either type of memory
// or
// BA_SIZE, ROW_SIZE, COL_SIZE and SDRAM_DATA_WIDTH
//
// either in this file or as command line option; +define+MT48LC16M16
//

// Most of these defines have an effect on things in fsm_sdr_16.v

//`define MT48LC32M16   // 64MB part
 // 32MB part
//`define MT48LC4M16    //  8MB part

// Define this to allow indication that a burst read is still going
// to the wishbone state machine, so it doesn't start emptying the
// ingress fifo after a aborted burst before the burst read is
// actually finished.
 

// If intending to burst write, and the wishbone clock is about 1/4 the speed
// of the SDRAM clock, then the data may come late, and this triggers a bug
// during write. To avoid this we can just wait a little longer for data when
// burst reading (there's no almost_empty signal from the FIFO)
 


 


  
 
 
 
 


`line 37 "sdr_16_defines.v" 0
 //  `ifdef MT48LC16M16

 
// using 1 of MT48LC16M16
// SDRAM data width is 16
  
 
 
 
 

 //  `ifdef MT48LC16M16

 


  
 
 
 
 


`line 59 "sdr_16_defines.v" 0
 //  `ifdef MT48LC4M16

// LMR
// [12:10] reserved
// [9]     WB, write burst; 0 - programmed burst length, 1 - single location
// [8:7]   OP Mode, 2'b00
// [6:4]   CAS Latency; 3'b010 - 2, 3'b011 - 3
// [3]     BT, Burst Type; 1'b0 - sequential, 1'b1 - interleaved
// [2:0]   Burst length; 3'b000 - 1, 3'b001 - 2, 3'b010 - 4, 3'b011 - 8, 3'b111 - full page
 
 
 
 
`line 72 "sdr_16_defines.v" 2
`line 2 "fsm_sdr_16.v" 0

module fsm_sdr_16 (
		   adr_i, we_i, bte_i, cti_i, sel_i,
		   fifo_empty, fifo_rd_adr, fifo_rd_data, count0,
		   refresh_req, cmd_aref, cmd_read, state_idle,
		   ba, a, cmd, dqm, dq_oe,
		   sdram_burst_reading,
		   debug_state, debug_fifo_we_record,
		   sdram_clk, sdram_fifo_wr, sdram_rst
		   );

   /* Now these are defined
    parameter ba_size = 2;   
    parameter row_size = 13;
    parameter col_size = 9;   
    */
   
   input [2+13+9-1:0] adr_i;
   input 				 we_i;
   input [1:0] 				 bte_i;
   input [2:0] 				 cti_i;
   input [3:0] 				 sel_i;

   input 				 fifo_empty;
   output 				 fifo_rd_adr, fifo_rd_data;
   output reg 				 count0;

   input 				 refresh_req;
   output reg 				 cmd_aref; // used for rerfresh ack
   output reg 				 cmd_read; // used for ingress fifo control
   output 				 state_idle; // state=idle

   output reg [1:0] 			 ba /*synthesis syn_useioff=1 syn_allow_retiming=0 */;
   output reg [12:0] 			 a /*synthesis syn_useioff=1 syn_allow_retiming=0 */;
   output reg [2:0] 			 cmd /*synthesis syn_useioff=1 syn_allow_retiming=0 */;
   output reg [1:0] 			 dqm /*synthesis syn_useioff=1 syn_allow_retiming=0 */;
   output reg 				 dq_oe;

   output 				 sdram_burst_reading;   
   input 				 sdram_clk, sdram_fifo_wr, sdram_rst;

   output [2:0] 			 debug_state;
   output [3:0] 			 debug_fifo_we_record;

   wire [2-1:0] 			 bank;
   wire [13-1:0] 			 row;
   wire [9-1:0] 			 col;
   wire [12:0] 				 col_reg_a10_fix;
   reg [0:31] 				 shreg;
   wire 				 stall; // active if write burst need data

   reg [0:15] 				 fifo_sel_reg_int;
   reg [1:0] 				 fifo_sel_domain_reg_int;

   // adr_reg {ba,row,col,we}
   reg [1:0] 				 ba_reg;  
   reg [13-1:0] 			 row_reg;
   reg [9-1:0] 			 col_reg;
   reg 					 we_reg;
   reg [1:0] 				 bte_reg;
   reg [2:0] 				 cti_reg;

   // to keep track of open rows per bank
   reg [13-1:0] 			 open_row[0:3];
   reg [0:3] 				 open_ba;
   wire 				 current_bank_closed, current_row_open;
   reg 					 current_bank_closed_reg, current_row_open_reg;

   parameter [2:0] classic=3'b000,
		constant=3'b001,
		increment=3'b010,
		endburst=3'b111;
   
   parameter [1:0] linear = 2'b00,
                beat4  = 2'b01,
                beat8  = 2'b10,
                beat16 = 2'b11;

   parameter [2:0] cmd_nop = 3'b111,
                cmd_act = 3'b011,
                cmd_rd  = 3'b101,
                cmd_wr  = 3'b100,
                cmd_pch = 3'b010,
                cmd_rfr = 3'b001,
                cmd_lmr = 3'b000;

   // ctrl FSM
   
/*    define instead of param, as synplify is doing weird things
 parameter [2:0] init = 3'b000,
                idle = 3'b001,
                rfr  = 3'b010,
                adr  = 3'b011,
                pch  = 3'b100,
                act  = 3'b101,
                w4d  = 3'b110,
                rw   = 3'b111;
 */
 
 
 
 
 
 
 
 
   
   reg [2:0] 				 state, next;

   assign debug_state = state;

   function [12:0] a10_fix;
      input [9-1:0] 		 a;
      integer 				 i;
      begin
	 for (i=0;i<13;i=i+1) begin
            if (i<10)
              if (i<9)
                a10_fix[i] = a[i];
              else
                a10_fix[i] = 1'b0;
            else if (i==10)
              a10_fix[i] = 1'b0;
            else
              if (i<9)
                a10_fix[i] = a[i-1];
              else
                a10_fix[i] = 1'b0;
	 end
      end
   endfunction


   assign {bank,row,col} = adr_i;

   always @ (posedge sdram_clk or posedge sdram_rst)
     if (sdram_rst)
       state <= 3'b000;
     else
       state <= next;
   
   always @*
     begin
	next = 3'bx;
	case (state)
	  3'b000:
	    if (shreg[31])          
	      next = 3'b001;
            else                    
	      next = 3'b000;
	  3'b001:   
	    if (refresh_req)        
	      next = 3'b010;
            else if (!shreg[0] & !fifo_empty)   
	      next = 3'b011;
            else                    
	      next = 3'b001;
	  3'b010: 
	    if (shreg[5])           
	      next = 3'b001;
            else                    
	      next = 3'b010;
	  3'b011:
	    if (shreg[5])
	      begin
		 if (current_bank_closed_reg)   
		   next = 3'b101;
		 else if (current_row_open_reg)
		   next = (we_reg) ?  3'b110 : 3'b111;
		 else 		                     
		   next = 3'b100;
	      end
            else                                            
	      next = 3'b011;
	  3'b100:    
	    if (shreg[1])         
	      next = 3'b101;
            else                    
	      next = 3'b100;
	  3'b101:
	    if (shreg[2])
	      begin
 
		 // Automatiacally go to wait for data if burst writing
		 if ((|bte_reg) & we_reg & cti_reg==increment) 
		   next = 3'b110;
		 else if ((!fifo_empty | !we_reg)) 
		   next = 3'b111;

		     
		     

`line 193 "fsm_sdr_16.v" 0

		 else if (fifo_empty)         
		   next = 3'b110;
	      end
            else                                    
	      next = 3'b101;
 
	  // Add some wait here if bursting and the wishbone clock is slow
	  3'b110:    
	    if (!fifo_empty & ((cti_reg!=increment)|(cti_reg==increment /*& bte_reg==beat4*/  & shreg[14])))
	      next = 3'b111;

	      
	      
	        

`line 208 "fsm_sdr_16.v" 0
	  
            else             
	      next = 3'b110;
	  3'b111:     
	    if ((bte_reg==linear | !(cti_reg==increment)) & shreg[1])
              next = 3'b001;
            else if (bte_reg==beat4 & shreg[7])
              next = 3'b001;
 
                
                

`line 219 "fsm_sdr_16.v" 0

 
                
                

`line 223 "fsm_sdr_16.v" 0

            else
              next = 3'b111;
	endcase
     end // always @ *
   

   // active if write burst need data
   assign stall = state==3'b111 & next==3'b111 & fifo_empty & count0 & we_reg;

   // counter
   always @ (posedge sdram_clk or posedge sdram_rst)
     begin
	if (sdram_rst) begin
           shreg   <= {1'b1,{31{1'b0}}};
           count0  <= 1'b0;
	end else
          if (state!=next) begin
             shreg   <= {1'b1,{31{1'b0}}};
             count0  <= 1'b0;
          end else 
            if (~stall) begin
               shreg   <= shreg >> 1;
               count0  <= ~count0;
            end
     end

   // ba, a, cmd
   // col_reg_a10 has bit [10] set to zero to disable auto precharge
   assign col_reg_a10_fix = a10_fix(col_reg);

   // outputs dependent on state vector
   always @ (posedge sdram_clk or posedge sdram_rst)
     begin
	if (sdram_rst) begin
           {ba,a,cmd} <= {2'b00,13'd0,cmd_nop};
           dqm <= 2'b11;
           cmd_aref <= 1'b0;
           cmd_read <= 1'b0;
           dq_oe <= 1'b0;
           {open_ba,open_row[0],open_row[1],open_row[2],open_row[3]} <= 
                                                  {4'b0000,{13*4{1'b0}}};
           {ba_reg,row_reg,col_reg,we_reg,cti_reg,bte_reg} <= 
                     {2'b00, {13{1'b0}}, {9{1'b0}}, 1'b0,3'b000, 2'b00 };
	end else begin
           {ba,a,cmd} <= {2'b00,13'd0,cmd_nop};
           dqm <= 2'b11;
           cmd_aref <= 1'b0;
           cmd_read <= 1'b0;
           dq_oe <= 1'b0;
           case (state)
             3'b000:
               if (shreg[3]) begin
                  {ba,a,cmd} <= {2'b00, 13'b0010000000000, cmd_pch};
                  open_ba[ba_reg] <= 1'b0;
               end else if (shreg[7] | shreg[19])
                 {ba,a,cmd,cmd_aref} <= {2'b00, 13'd0, cmd_rfr,1'b1};
               else if (shreg[31])
                 {ba,a,cmd} <= 
		  {2'b00,3'b000,1'b0,2'b00,3'b010,1'b0,3'b001, cmd_lmr};
             3'b010:
               if (shreg[0]) begin
                  {ba,a,cmd} <= {2'b00, 13'b0010000000000, cmd_pch};
                  open_ba <= 4'b0000;
               end else if (shreg[2])
                 {ba,a,cmd,cmd_aref} <= {2'b00, 13'd0, cmd_rfr,1'b1};
             3'b011:
               if (shreg[4])
                 {ba_reg,row_reg,col_reg,we_reg,cti_reg,bte_reg} <= 
		                                {bank,row,col,we_i,cti_i,bte_i};
             3'b100:
               if (shreg[0]) begin
                  {ba,a,cmd} <= {ba_reg,13'd0,cmd_pch};
                  //open_ba <= 4'b0000;
		  open_ba[ba_reg] <= 1'b0;
               end
             3'b101:
               if (shreg[0]) begin
                  {ba,a,cmd} <= {ba_reg,(13'd0 | row_reg),cmd_act};
                  {open_ba[ba_reg],open_row[ba_reg]} <= {1'b1,row_reg};
               end
             3'b111:
               begin
                  if (we_reg & !count0)
                    cmd <= cmd_wr;
                  else if (!count0)
                    {cmd,cmd_read} <= {cmd_rd,1'b1};
                  else
                    cmd <= cmd_nop;
                  if (we_reg)
		    begin
		       dqm <= count0 ? ~sel_i[1:0] : ~sel_i[3:2];
		    end
                  else
                    dqm <= 2'b00;
                  //if (we_reg)
                  dq_oe <= we_reg;//1'b1;
                  if (!stall)
		    begin
		       if (cti_reg==increment)
			 case (bte_reg)
			   linear: {ba,a} <= {ba_reg,col_reg_a10_fix};
			   beat4:  {ba,a,col_reg[2:0]} <= 
				  {ba_reg,col_reg_a10_fix, col_reg[2:0] + 3'd1};
           
			       
				     
          
`line 330 "fsm_sdr_16.v" 0

           
			      
				     
          
`line 334 "fsm_sdr_16.v" 0

			 endcase // case (bte_reg)
		       else
			 {ba,a} <= {ba_reg,col_reg_a10_fix};
		       
		    end // if (!stall)
               end
			   endcase
	end
     end
			   
   reg fifo_read_data_en;
   always @(posedge sdram_clk)
     if (sdram_rst)
       fifo_read_data_en <= 1;
     else if (next==3'b111)
       fifo_read_data_en <= ~fifo_read_data_en;
     else
       fifo_read_data_en <= 1;

   reg [3:0] beat4_data_read_limiter; // Use this to record how many times we've pulsed fifo_rd_data
   // Only 3 bits, becuase we're looking at when fifo_read_data_en goes low - should only happen 3
   // times for a 4-beat burst
   always @(posedge sdram_clk)
     if (sdram_rst)
       beat4_data_read_limiter <= 0;
     else if(state==3'b011)
       beat4_data_read_limiter <= 0;
     else if (!fifo_read_data_en)
       beat4_data_read_limiter <= {beat4_data_read_limiter[2:0],1'b1};
   
   

   // rd_adr goes high when next adr is fetched from sync RAM and during write burst
   assign fifo_rd_adr  = state==3'b011 & shreg[1];

   assign fifo_rd_data = (((state!=3'b111 & next==3'b111)|(state==3'b111 & (cti_reg==increment && bte_reg==beat4 & fifo_read_data_en & !(&beat4_data_read_limiter)))) & we_reg & !fifo_empty);
   
   /*
   assign fifo_rd_data = ((state==`FSM_RW & next==`FSM_RW) & 
			  we_reg & !count0 & !fifo_empty);
*/
   assign state_idle = (state==3'b001);

   // bank and row open ?
   assign current_bank_closed = !(open_ba[bank]);
   assign current_row_open = open_row[bank]==row;

   always @ (posedge sdram_clk or posedge sdram_rst)
     if (sdram_rst)
       {current_bank_closed_reg, current_row_open_reg} <= {1'b1, 1'b0};
     else
       //if (state==adr & counter[1:0]==2'b10)
       {current_bank_closed_reg, current_row_open_reg} <= 
				        {current_bank_closed, current_row_open};

   // Record the number of write enables going to INGRESS fifo (ie. that we 
   // generate when we're reading) - this makes sure we keep track of when a
   // burst read is in progress, and we can signal the wishbone bus to wait
   // for this data to be put into the FIFO before it'll empty it when it's
   // had a terminated burst transfer.
   reg [3:0] fifo_we_record;
   assign debug_fifo_we_record = fifo_we_record;   
   always @(posedge sdram_clk) 
     if (sdram_rst)
       fifo_we_record <= 0;
     else if (next==3'b111 & ((state==3'b011)|(state==3'b101)) & 
	      cti_reg==increment & (bte_reg==beat4) & !we_reg)
       fifo_we_record <= 4'b0001;
     else if (sdram_fifo_wr)
       fifo_we_record <= {fifo_we_record[2:0],1'b0};
    
   assign sdram_burst_reading = |fifo_we_record;
   
      

`line 409 "fsm_sdr_16.v" 0

   

endmodule
`line 413 "fsm_sdr_16.v" 2
`line 1 "versatile_mem_ctrl_wb.v" 1
`timescale 1ns/1ns
module versatile_mem_ctrl_wb 
  (
   // wishbone side
   wb_adr_i_v, wb_dat_i_v, wb_dat_o_v,
   wb_stb_i, wb_cyc_i, wb_ack_o,
   wb_clk, wb_rst,
    // SDRAM controller interface
   sdram_dat_o, sdram_fifo_empty, sdram_fifo_rd_adr, sdram_fifo_rd_data, sdram_fifo_re,
   sdram_dat_i, sdram_fifo_wr, sdram_fifo_we, sdram_burst_reading,
   debug_wb_fsm_state, debug_ingress_fifo_empty, debug_egress_fifo_empty,
   sdram_clk, sdram_rst

);

parameter nr_of_wb_ports = 3;
    
input  [36*nr_of_wb_ports-1:0]  wb_adr_i_v;
input  [36*nr_of_wb_ports-1:0]  wb_dat_i_v;
input  [0:nr_of_wb_ports-1]     wb_stb_i;
input  [0:nr_of_wb_ports-1]     wb_cyc_i;
output [32*nr_of_wb_ports-1:0]  wb_dat_o_v;
output [0:nr_of_wb_ports-1]     wb_ack_o;
input                           wb_clk;
input                           wb_rst;

output [35:0]               sdram_dat_o;
output [0:nr_of_wb_ports-1] sdram_fifo_empty;
input                       sdram_fifo_rd_adr, sdram_fifo_rd_data;
input  [0:nr_of_wb_ports-1] sdram_fifo_re;
input  [31:0]               sdram_dat_i;
input                       sdram_fifo_wr;
input  [0:nr_of_wb_ports-1] sdram_fifo_we;
input   		    sdram_burst_reading;
input                       sdram_clk;
input                       sdram_rst;

   output [(2*nr_of_wb_ports)-1:0] debug_wb_fsm_state;
   output [nr_of_wb_ports-1:0] 	debug_ingress_fifo_empty;
   output [nr_of_wb_ports-1:0] 	debug_egress_fifo_empty;
   
   

parameter linear       = 2'b00;
parameter wrap4        = 2'b01;
parameter wrap8        = 2'b10;
parameter wrap16       = 2'b11;
parameter classic      = 3'b000;
parameter endofburst   = 3'b111;

 
 
 

parameter idle = 2'b00;
parameter rd   = 2'b01;
parameter wr   = 2'b10;
parameter fe   = 2'b11;

reg [1:0] wb_state[0:nr_of_wb_ports-1];

wire [35:0] wb_adr_i[0:nr_of_wb_ports-1];
wire [35:0] wb_dat_i[0:nr_of_wb_ports-1];
wire [36*nr_of_wb_ports-1:0] egress_fifo_di;
wire [31:0] wb_dat_o;

wire [0:nr_of_wb_ports] stall;
wire [0:nr_of_wb_ports-1] state_idle;
wire [0:nr_of_wb_ports-1] egress_fifo_we,  egress_fifo_full;
wire [0:nr_of_wb_ports-1] ingress_fifo_re, ingress_fifo_empty;

   wire [1:0] 		  debug_each_wb_fsm_state [0:nr_of_wb_ports-1];
   

genvar i;

assign stall[0] = 1'b0;

 
generate
    for (i=0;i<nr_of_wb_ports;i=i+1) begin : vector2array
        assign wb_adr_i[i] = wb_adr_i_v[(nr_of_wb_ports-i)*36-1:(nr_of_wb_ports-1-i)*36];
        assign wb_dat_i[i] = wb_dat_i_v[(nr_of_wb_ports-i)*36-1:(nr_of_wb_ports-1-i)*36];
        assign egress_fifo_di[(nr_of_wb_ports-i)*36-1:(nr_of_wb_ports-1-i)*36] = (state_idle[i]) ? 
					wb_adr_i[i] : wb_dat_i[i];

    end
endgenerate

   // Debug output assignments
   generate
      for (i=0;i<nr_of_wb_ports;i=i+1) begin : vector2debugarray
	 assign debug_wb_fsm_state[(nr_of_wb_ports-i)*2-1:(nr_of_wb_ports-1-i)*2] = debug_each_wb_fsm_state[i];
      end
   endgenerate
   assign debug_ingress_fifo_empty = ingress_fifo_empty;
   assign debug_egress_fifo_empty = egress_fifo_we;
   
	
generate
    for (i=0;i<nr_of_wb_ports;i=i+1) begin : fsm
        fsm_wb fsm_wb_i 
	  (
           .stall_i(stall[i]),
           .stall_o(stall[i+1]),
           .we_i (wb_adr_i[i][5]),
           .cti_i(wb_adr_i[i][2:0]),
           .bte_i(wb_adr_i[i][4:3]),
           .stb_i(wb_stb_i[i]),
           .cyc_i(wb_cyc_i[i]),
           .ack_o(wb_ack_o[i]),
           .egress_fifo_we(egress_fifo_we[i]),
           .egress_fifo_full(egress_fifo_full[i]),
            .ingress_fifo_re(ingress_fifo_re[i]),
           .ingress_fifo_empty(ingress_fifo_empty[i]),
           .state_idle(state_idle[i]),
	   .sdram_burst_reading(sdram_burst_reading),
	   .debug_state(debug_each_wb_fsm_state[i]),
           .wb_clk(wb_clk),
           .wb_rst(wb_rst)
           );
    end
endgenerate

egress_fifo # (
	       .a_hi_size(4),.a_lo_size(4),.nr_of_queues(nr_of_wb_ports),
	       .data_width(36))
   egress_FIFO(
	       .d(egress_fifo_di), 
	       .fifo_full(egress_fifo_full), 
	       .write(|(egress_fifo_we)), 
	       .write_enable(egress_fifo_we),
	       .q(sdram_dat_o), 
	       .fifo_empty(sdram_fifo_empty), 
	       .read_adr(sdram_fifo_rd_adr), 
	       .read_data(sdram_fifo_rd_data), 
	       .read_enable(sdram_fifo_re),
	       .clk1(wb_clk), 
	       .rst1(wb_rst), 
	       .clk2(sdram_clk), 
	       .rst2(sdram_rst)
	       );
   
   async_fifo_mq # (
		    .a_hi_size(4),.a_lo_size(4),.nr_of_queues(nr_of_wb_ports),
		    .data_width(32))
   ingress_FIFO(
		.d(sdram_dat_i), .fifo_full(), .write(sdram_fifo_wr), 
		.write_enable(sdram_fifo_we), .q(wb_dat_o), 
		.fifo_empty(ingress_fifo_empty), .read(|(ingress_fifo_re)), 
		.read_enable(ingress_fifo_re), .clk1(sdram_clk), 
		.rst1(sdram_rst), .clk2(wb_clk), .rst2(wb_rst)
		);

assign wb_dat_o_v = {nr_of_wb_ports{wb_dat_o}};

endmodule
`line 157 "versatile_mem_ctrl_wb.v" 2
`line 1 "versatile_mem_ctrl_top.v" 1
`timescale 1ns/1ns
 
  

`line 4 "versatile_mem_ctrl_top.v" 0

 
  
`line 6 "versatile_mem_ctrl_top.v" 0
`line 1 "sdr_16_defines.v" 1
//
// Specify either type of memory
// or
// BA_SIZE, ROW_SIZE, COL_SIZE and SDRAM_DATA_WIDTH
//
// either in this file or as command line option; +define+MT48LC16M16
//

// Most of these defines have an effect on things in fsm_sdr_16.v

//`define MT48LC32M16   // 64MB part
 // 32MB part
//`define MT48LC4M16    //  8MB part

// Define this to allow indication that a burst read is still going
// to the wishbone state machine, so it doesn't start emptying the
// ingress fifo after a aborted burst before the burst read is
// actually finished.
 

// If intending to burst write, and the wishbone clock is about 1/4 the speed
// of the SDRAM clock, then the data may come late, and this triggers a bug
// during write. To avoid this we can just wait a little longer for data when
// burst reading (there's no almost_empty signal from the FIFO)
 


 


  
 
 
 
 


`line 37 "sdr_16_defines.v" 0
 //  `ifdef MT48LC16M16

 
// using 1 of MT48LC16M16
// SDRAM data width is 16
  
 
 
 
 

 //  `ifdef MT48LC16M16

 


  
 
 
 
 


`line 59 "sdr_16_defines.v" 0
 //  `ifdef MT48LC4M16

// LMR
// [12:10] reserved
// [9]     WB, write burst; 0 - programmed burst length, 1 - single location
// [8:7]   OP Mode, 2'b00
// [6:4]   CAS Latency; 3'b010 - 2, 3'b011 - 3
// [3]     BT, Burst Type; 1'b0 - sequential, 1'b1 - interleaved
// [2:0]   Burst length; 3'b000 - 1, 3'b001 - 2, 3'b010 - 4, 3'b011 - 8, 3'b111 - full page
 
 
 
 
`line 72 "sdr_16_defines.v" 2
`line 6 "versatile_mem_ctrl_top.v" 0


module versatile_mem_ctrl
  (
   // wishbone side
   wb_adr_i_0, wb_dat_i_0, wb_dat_o_0,
   wb_stb_i_0, wb_cyc_i_0, wb_ack_o_0,
   wb_adr_i_1, wb_dat_i_1, wb_dat_o_1,
   wb_stb_i_1, wb_cyc_i_1, wb_ack_o_1,
   wb_adr_i_2, wb_dat_i_2, wb_dat_o_2,
   wb_stb_i_2, wb_cyc_i_2, wb_ack_o_2,
   wb_adr_i_3, wb_dat_i_3, wb_dat_o_3,
   wb_stb_i_3, wb_cyc_i_3, wb_ack_o_3,
   wb_clk, wb_rst,

 
   ba_pad_o, a_pad_o, cs_n_pad_o, ras_pad_o, cas_pad_o, we_pad_o, dq_o, dqm_pad_o, dq_i, dq_oe, cke_pad_o,


 
       
       
            

`line 29 "versatile_mem_ctrl_top.v" 0

   // SDRAM signals
   sdram_clk, sdram_rst
   );

   // number of wb clock domains
   parameter nr_of_wb_clk_domains = 1;
   // number of wb ports in each wb clock domain
   parameter nr_of_wb_ports_clk0  = 3;
   parameter nr_of_wb_ports_clk1  = 0;
   parameter nr_of_wb_ports_clk2  = 0;
   parameter nr_of_wb_ports_clk3  = 0;
   
   input  [36*nr_of_wb_ports_clk0-1:0] wb_adr_i_0;
   input [36*nr_of_wb_ports_clk0-1:0]  wb_dat_i_0;
   output [32*nr_of_wb_ports_clk0-1:0] wb_dat_o_0;
   input [0:nr_of_wb_ports_clk0-1]     wb_stb_i_0, wb_cyc_i_0;
   output [0:nr_of_wb_ports_clk0-1]    wb_ack_o_0;
   
   
   input [36*nr_of_wb_ports_clk1-1:0]  wb_adr_i_1;
   input [36*nr_of_wb_ports_clk1-1:0]  wb_dat_i_1;
   output [32*nr_of_wb_ports_clk1-1:0] wb_dat_o_1;
   input [0:nr_of_wb_ports_clk1-1]     wb_stb_i_1, wb_cyc_i_1;   
   output [0:nr_of_wb_ports_clk1-1]    wb_ack_o_1;
   
   input [36*nr_of_wb_ports_clk2-1:0]  wb_adr_i_2;
   input [36*nr_of_wb_ports_clk2-1:0]  wb_dat_i_2;
   output [32*nr_of_wb_ports_clk2-1:0] wb_dat_o_2;
   input [0:nr_of_wb_ports_clk2-1]     wb_stb_i_2, wb_cyc_i_2;
   output [0:nr_of_wb_ports_clk2-1]    wb_ack_o_2;
   
   input [36*nr_of_wb_ports_clk3-1:0]  wb_adr_i_3;
   input [36*nr_of_wb_ports_clk3-1:0]  wb_dat_i_3;
   output [32*nr_of_wb_ports_clk3-1:0] wb_dat_o_3;
   input [0:nr_of_wb_ports_clk3-1]     wb_stb_i_3, wb_cyc_i_3;
   output [0:nr_of_wb_ports_clk3-1]    wb_ack_o_3;
   
   input [0:nr_of_wb_clk_domains-1]    wb_clk;
   input [0:nr_of_wb_clk_domains-1]    wb_rst;
   
 
   output [1:0] 		       ba_pad_o;
   output [12:0] 		       a_pad_o;
   output 			       cs_n_pad_o;
   output 			       ras_pad_o;
   output 			       cas_pad_o;
   output 			       we_pad_o;
   output reg [(16)-1:0] dq_o /*synthesis syn_useioff=1 syn_allow_retiming=0 */;
   output [1:0] 		       dqm_pad_o;
   input [(16)-1:0]     dq_i ;
   output 			       dq_oe;
   output 			       cke_pad_o;

 
    			       
    			       
    			       
    			       
    			       
    			       
    			       
    			       
    			       
     			       
     		       
     		       
     		       
     			       
    			       
     			       
     			       
    			       

`line 102 "versatile_mem_ctrl_top.v" 0

   input 			       sdram_clk, sdram_rst;

   wire [0:15] 			       fifo_empty[0:3];
   wire 			       current_fifo_empty;
   wire [0:15] 			       fifo_re[0:3];
   wire [35:0] 			       fifo_dat_o[0:3];
   wire [31:0] 			       fifo_dat_i;
   wire [0:15] 			       fifo_we[0:3];
   wire 			       fifo_rd_adr, fifo_rd_data, fifo_wr, idle, count0;
   
   wire [0:15] 			       fifo_sel_i, fifo_sel_dly;
   reg [0:15] 			       fifo_sel_reg;
   wire [1:0] 			       fifo_sel_domain_i, fifo_sel_domain_dly;
   reg [1:0] 			       fifo_sel_domain_reg;

   reg 				       refresh_req;
   
   wire [35:0] 			       tx_fifo_dat_o;

   wire 			       burst_reading;
   reg 				       sdram_fifo_wr_r;
   
   
   generate   
      if (nr_of_wb_clk_domains > 0) begin    
         versatile_mem_ctrl_wb
           # (.nr_of_wb_ports(nr_of_wb_ports_clk0))
         wb0
	   (
            // wishbone side
            .wb_adr_i_v(wb_adr_i_0),
            .wb_dat_i_v(wb_dat_i_0),
            .wb_dat_o_v(wb_dat_o_0),
            .wb_stb_i(wb_stb_i_0),
            .wb_cyc_i(wb_cyc_i_0),
            .wb_ack_o(wb_ack_o_0),
            .wb_clk(wb_clk[0]),
            .wb_rst(wb_rst[0]),
            // SDRAM controller interface
            .sdram_dat_o(fifo_dat_o[0]),
            .sdram_fifo_empty(fifo_empty[0][0:nr_of_wb_ports_clk0-1]),
            .sdram_fifo_rd_adr(fifo_rd_adr),
            .sdram_fifo_rd_data(fifo_rd_data),
            .sdram_fifo_re(fifo_re[0][0:nr_of_wb_ports_clk0-1]),
            .sdram_dat_i(fifo_dat_i),
            .sdram_fifo_wr(fifo_wr),
            .sdram_fifo_we(fifo_we[0][0:nr_of_wb_ports_clk0-1]),
	    .sdram_burst_reading(burst_reading),
	    .debug_wb_fsm_state(),
	    .debug_ingress_fifo_empty(),
	    .debug_egress_fifo_empty(),
            .sdram_clk(sdram_clk),
            .sdram_rst(sdram_rst) );
      end
      if (nr_of_wb_ports_clk0 < 16) begin
         assign fifo_empty[0][nr_of_wb_ports_clk0:15] = {(16-nr_of_wb_ports_clk0){1'b1}};
      end
   endgenerate

   generate   
      if (nr_of_wb_clk_domains > 1) begin    
         versatile_mem_ctrl_wb
           # (.nr_of_wb_ports(nr_of_wb_ports_clk1))
         wb1
	   (
            // wishbone side
            .wb_adr_i_v(wb_adr_i_1),
            .wb_dat_i_v(wb_dat_i_1),
            .wb_dat_o_v(wb_dat_o_1),
            .wb_stb_i(wb_stb_i_1),
            .wb_cyc_i(wb_cyc_i_1),
            .wb_ack_o(wb_ack_o_1),
            .wb_clk(wb_clk[1]),
            .wb_rst(wb_rst[1]),
            // SDRAM controller interface
            .sdram_dat_o(fifo_dat_o[1]),
            .sdram_fifo_empty(fifo_empty[1][0:nr_of_wb_ports_clk1-1]),
            .sdram_fifo_rd_adr(fifo_rd_adr),
            .sdram_fifo_rd_data(fifo_rd_data),
            .sdram_fifo_re(fifo_re[1][0:nr_of_wb_ports_clk1-1]),
            .sdram_dat_i(fifo_dat_i),
            .sdram_fifo_wr(fifo_wr),
            .sdram_fifo_we(fifo_we[1][0:nr_of_wb_ports_clk1-1]),
	    .sdram_burst_reading(burst_reading),
            .sdram_clk(sdram_clk),
            .sdram_rst(sdram_rst) );
         if (nr_of_wb_ports_clk1 < 16) begin
            assign fifo_empty[1][nr_of_wb_ports_clk1:15] = {(16-nr_of_wb_ports_clk1){1'b1}};
         end
      end else begin
         assign fifo_empty[1] = {16{1'b1}};
         assign fifo_dat_o[1] = {36{1'b0}};
      end
   endgenerate

   generate   
      if (nr_of_wb_clk_domains > 2) begin    
         versatile_mem_ctrl_wb
           # (.nr_of_wb_ports(nr_of_wb_ports_clk1))
         wb2
	   (
            // wishbone side
            .wb_adr_i_v(wb_adr_i_2),
            .wb_dat_i_v(wb_dat_i_2),
            .wb_dat_o_v(wb_dat_o_2),
            .wb_stb_i(wb_stb_i_2),
            .wb_cyc_i(wb_cyc_i_2),
            .wb_ack_o(wb_ack_o_2),
            .wb_clk(wb_clk[2]),
            .wb_rst(wb_rst[2]),
            // SDRAM controller interface
            .sdram_dat_o(fifo_dat_o[2]),
            .sdram_fifo_empty(fifo_empty[2][0:nr_of_wb_ports_clk2-1]),
            .sdram_fifo_rd_adr(fifo_rd_adr),
            .sdram_fifo_rd_data(fifo_rd_data),
            .sdram_fifo_re(fifo_re[2][0:nr_of_wb_ports_clk2-1]),
            .sdram_dat_i(fifo_dat_i),
            .sdram_fifo_wr(fifo_wr),
            .sdram_fifo_we(fifo_we[2][0:nr_of_wb_ports_clk2-1]),
	    .sdram_burst_reading(burst_reading),
            .sdram_clk(sdram_clk),
            .sdram_rst(sdram_rst) );
         if (nr_of_wb_ports_clk2 < 16) begin
            assign fifo_empty[2][nr_of_wb_ports_clk2:15] = {(16-nr_of_wb_ports_clk2){1'b1}};
         end
      end else begin
         assign fifo_empty[2] = {16{1'b1}};
         assign fifo_dat_o[2] = {36{1'b0}};
      end
   endgenerate

   generate   
      if (nr_of_wb_clk_domains > 3) begin    
         versatile_mem_ctrl_wb
           # (.nr_of_wb_ports(nr_of_wb_ports_clk3))
         wb3
	   (
            // wishbone side
            .wb_adr_i_v(wb_adr_i_3),
            .wb_dat_i_v(wb_dat_i_3),
            .wb_dat_o_v(wb_dat_o_3),
            .wb_stb_i(wb_stb_i_3),
            .wb_cyc_i(wb_cyc_i_3),
            .wb_ack_o(wb_ack_o_3),
            .wb_clk(wb_clk[3]),
            .wb_rst(wb_rst[3]),
            // SDRAM controller interface
            .sdram_dat_o(fifo_dat_o[3]),
            .sdram_fifo_empty(fifo_empty[3][0:nr_of_wb_ports_clk3-1]),
            .sdram_fifo_rd_adr(fifo_rd_adr),
            .sdram_fifo_rd_data(fifo_rd_data),
            .sdram_fifo_re(fifo_re[3][0:nr_of_wb_ports_clk3-1]),
            .sdram_dat_i(fifo_dat_i),
            .sdram_fifo_wr(fifo_wr),
            .sdram_fifo_we(fifo_we[3][0:nr_of_wb_ports_clk3-1]),
	    .sdram_burst_reading(burst_reading),
            .sdram_clk(sdram_clk),
            .sdram_rst(sdram_rst) );
         if (nr_of_wb_ports_clk3 < 16) begin
            assign fifo_empty[3][nr_of_wb_ports_clk3:15] = {(16-nr_of_wb_ports_clk3){1'b1}};
         end
      end else begin
         assign fifo_empty[3] = {16{1'b1}};
         assign fifo_dat_o[3] = {36{1'b0}};
      end
   endgenerate

   encode encode0 
     (
      .fifo_empty_0(fifo_empty[0]), .fifo_empty_1(fifo_empty[1]), 
      .fifo_empty_2(fifo_empty[2]), .fifo_empty_3(fifo_empty[3]),
      .fifo_sel(fifo_sel_i), .fifo_sel_domain(fifo_sel_domain_i)
      );

   always @ (posedge sdram_clk or posedge sdram_rst)
     begin
	if (sdram_rst)
          {fifo_sel_reg,fifo_sel_domain_reg} <= {16'h0,2'b00};
	else
          if (idle)
            {fifo_sel_reg,fifo_sel_domain_reg}<={fifo_sel_i,fifo_sel_domain_i};
     end

   decode decode0 
     (
      .fifo_sel(fifo_sel_reg), .fifo_sel_domain(fifo_sel_domain_reg),
      .fifo_we_0(fifo_re[0]), .fifo_we_1(fifo_re[1]), .fifo_we_2(fifo_re[2]), 
      .fifo_we_3(fifo_re[3])
      );

   // fifo_re[0-3] is a one-hot read enable structure
   // fifo_empty should go active when chosen fifo queue is empty
   assign current_fifo_empty = (idle) ? 
			       (!(|fifo_sel_i)) : 
			       (|(fifo_empty[0] & fifo_re[0])) | 
			       (|(fifo_empty[1] & fifo_re[1])) | 
			       (|(fifo_empty[2] & fifo_re[2])) | 
			       (|(fifo_empty[3] & fifo_re[3]));

   decode decode1 
     (
      .fifo_sel(fifo_sel_dly), .fifo_sel_domain(fifo_sel_domain_dly),
      .fifo_we_0(fifo_we[0]), .fifo_we_1(fifo_we[1]), .fifo_we_2(fifo_we[2]), 
      .fifo_we_3(fifo_we[3])
      );

 

   wire ref_cnt_zero;
   reg [(16)-1:0] dq_i_reg /*synthesis syn_useioff=1 syn_allow_retiming=0 */;
   reg [(16)-1:0] dq_i_tmp_reg;
   reg [17:0] dq_o_tmp_reg;
   wire       cmd_aref, cmd_read;
   
   // refresch counter
   //ref_counter ref_counter0( .zq(ref_cnt_zero), .rst(sdram_rst), .clk(sdram_clk));
   ref_counter
      
      

`line 322 "versatile_mem_ctrl_top.v" 0
   
   ref_counter0( .zq(ref_cnt_zero), .rst(sdram_rst), .clk(sdram_clk));
   
   always @ (posedge sdram_clk or posedge sdram_rst)
     if (sdram_rst)
       refresh_req <= 1'b0;
     else
       if (ref_cnt_zero)
         refresh_req <= 1'b1;
       else if (cmd_aref)
         refresh_req <= 1'b0;

   reg 	      current_fifo_empty_r;
   always @(posedge sdram_clk)
     current_fifo_empty_r <= current_fifo_empty;
   
   always @(posedge sdram_clk)
     sdram_fifo_wr_r <= fifo_wr;
   
   
   
   // SDR SDRAM 16 FSM
   fsm_sdr_16 fsm_sdr_16_0 
     (
      .adr_i({fifo_dat_o[0][2+13+9+6-2:6],1'b0}),
      .we_i(fifo_dat_o[0][5]),
      .bte_i(fifo_dat_o[0][4:3]),
      .cti_i(fifo_dat_o[0][2:0]),
      .sel_i({fifo_dat_o[0][3:2],dq_o_tmp_reg[1:0]}),
      .fifo_empty(current_fifo_empty_r),
      .fifo_rd_adr(fifo_rd_adr),
      .fifo_rd_data(fifo_rd_data),
      .state_idle(idle),
      .count0(count0),
      .refresh_req(refresh_req),
      .cmd_aref(cmd_aref),
      .cmd_read(cmd_read),
      .ba(ba_pad_o), .a(a_pad_o),
      .cmd({ras_pad_o, cas_pad_o, we_pad_o}),
      .dq_oe(dq_oe),
      .dqm(dqm_pad_o),
      .sdram_fifo_wr(sdram_fifo_wr_r),
      .sdram_burst_reading(burst_reading),
      .debug_state(),
      .debug_fifo_we_record(),
      .sdram_clk(sdram_clk),
      .sdram_rst(sdram_rst)
      );

   assign cs_pad_o = 1'b0;
   assign cke_pad_o = 1'b1;

   genvar     i;
   generate
      for (i=0; i < 16; i=i+1) begin : dly

         defparam delay0.depth=3'b010+2;   
         defparam delay0.width=1;
         delay delay0 (
		       .d(fifo_sel_reg[i]),
		       .q(fifo_sel_dly[i]),
		       .clk(sdram_clk),
		       .rst(sdram_rst)
		       );
      end
      
      defparam delay1.depth=3'b010+2;   
      defparam delay1.width=2;
      delay delay1 (
		    .d(fifo_sel_domain_reg),
		    .q(fifo_sel_domain_dly),
		    .clk(sdram_clk),
		    .rst(sdram_rst)
		    );
      
      defparam delay2.depth=3'b010+2;   
      defparam delay2.width=1;
      delay delay2 (
		    .d(cmd_read),
		    .q(fifo_wr),
		    .clk(sdram_clk),
		    .rst(sdram_rst)
		    );    
      
   endgenerate  

   // output registers
   assign cs_n_pad_o = 1'b0;
   assign cke_pad_o  = 1'b1;
 
   always @ (posedge sdram_clk)
     dq_i_reg <= dq_i;

   always @(posedge sdram_clk)
     dq_i_tmp_reg <= dq_i_reg;
   
   assign fifo_dat_i = {dq_i_tmp_reg, dq_i_reg};
   
   always @ (posedge sdram_clk or posedge sdram_rst)
     if (sdram_rst)
       dq_o_tmp_reg <= 18'h0;
     else
       dq_o_tmp_reg <= {fifo_dat_o[0][19:4],fifo_dat_o[0][1:0]};
   
   // output dq_o mux and dffs
   always @ (posedge sdram_clk or posedge sdram_rst)
     if (sdram_rst)
       dq_o <= 16'h0000;
     else
       if (~count0)
         dq_o <= fifo_dat_o[0][35:20];
       else
         dq_o <= dq_o_tmp_reg[17:2];
   
   /*
    // data mask signals should be not(sel_i) for write and 2'b00 for read
    always @ (posedge sdram_clk or posedge sdram_rst)
    if (sdram_rst)
    dqm_pad_o <= 2'b00;
    else
    if (~count0)
    dqm_pad_o <= ~fifo_dat_o[fifo_sel_domain_reg][3:2];
    else
    dqm_pad_o <= ~dq_o_tmp_reg[1:0];
    */
   /*
    always @ (posedge sdram_clk or posedge sdram_rst)
    if (sdram_rst) begin
    {dq_o, dqm_pad_o} <= {16'h0000,2'b00};
    
    end else
    if (~count0) begin
    dq_o <= fifo_dat_o[fifo_sel_domain_reg][35:20];
    dq_o_tmp_reg[17:2] <= fifo_dat_o[fifo_sel_domain_reg][19:4];
    if (cmd_read)
    dqm_pad_o <= 2'b00;
    else
    dqm_pad_o <= ~fifo_dat_o[fifo_sel_domain_reg][3:2];
    if (cmd_read)
    dq_o_tmp_reg[1:0] <= 2'b00;
    else
    dq_o_tmp_reg[1:0] <= ~fifo_dat_o[fifo_sel_domain_reg][1:0];
       end else
    {dq_o,dqm_pad_o} <= dq_o_tmp_reg;
    */


 //  `ifdef SDR_16


 
            
             
           
                
               
              
      
     
       
      
      
     
            
      
     
      
     
     
       
      
        
            
            
            
   
   
       
       
   
            
     
      
   
      
   
           

    
    
      
   
     
     
     
     
         
    
       
   
      
         
       
         

   
    
     
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      

    
     
      
      
      
      
      
      
      
      
      
      

   
    
     
      
      
      
      
      
   
   
    
     
      
      
      
      
      

   
                
                                   
                         

   
   
              
         
      
         
     
        
           
   
   

   
         
      
         
     
               

   
     
    
     
      
      
      
      

   
   
       
        
        
        
         
         
       
      
           

   
     
    
     
     
        
      
      
      
      
   
   
    
    
     
     
      
      
      
      
      

   
    
    
     
     
      
      
      
      
      



   
        
      

   
    
   
             

           
        
         
         
         
         
         
       
     
    
         
      
       
       
       
       
       
     
  


   
    
    
     
     
      
      
      
      
      

   
   
   
     
     
      
      
      
      
      
      
      
      
      

   
     
     
      
      
      
      
      
       
      
      
      
      
      
      
      
      
      
      
      


`line 752 "versatile_mem_ctrl_top.v" 0
 //  `ifdef DDR_16
   
endmodule // wb_sdram_ctrl_top
`line 755 "versatile_mem_ctrl_top.v" 2
