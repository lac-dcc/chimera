//////////////////////////////////////////////////////////////////////
////                                                              ////
////  Versatile memory controller                                 ////
////                                                              ////
////  Description                                                 ////
////  A modular wishbone compatible memory controller with support////
////  for various types of memory configurations                  ////
////                                                              ////
////  To Do:                                                      ////
////   - add support for additional SDRAM variants                ////
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

`ifndef GENERATE_DIRECTION_AS_LATCH   
   wire direction;
`endif
`ifdef GENERATE_DIRECTION_AS_LATCH
   reg direction;
`endif
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

`ifndef GENERATE_DIRECTION_AS_LATCH
    dff_sr dff_sr_dir( .aclr(direction_clr), .aset(direction_set), .clock(1'b1), .data(1'b1), .q(direction));
`endif

`ifdef GENERATE_DIRECTION_AS_LATCH
   always @ (posedge direction_set or posedge direction_clr)
     if (direction_clr)
       direction <= going_empty;
     else
       direction <= going_full;
`endif

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
module vfifo_dual_port_ram_dc_dw
  (
   d_a,
   q_a,
   adr_a, 
   we_a,
   clk_a,
   q_b,
   adr_b,
   d_b, 
   we_b,
   clk_b
   );
   parameter DATA_WIDTH = 32;
   parameter ADDR_WIDTH = 8;
   input [(DATA_WIDTH-1):0]      d_a;
   input [(ADDR_WIDTH-1):0] 	 adr_a;
   input [(ADDR_WIDTH-1):0] 	 adr_b;
   input 			 we_a;
   output [(DATA_WIDTH-1):0] 	 q_b;
   input [(DATA_WIDTH-1):0] 	 d_b;
   output reg [(DATA_WIDTH-1):0] q_a;
   input 			 we_b;
   input 			 clk_a, clk_b;
   reg [(DATA_WIDTH-1):0] 	 q_b;   
   reg [DATA_WIDTH-1:0] ram [(1<<ADDR_WIDTH)-1:0] /*synthesis syn_ramstyle = "no_rw_check"*/;
   always @ (posedge clk_a)
     begin 
	q_a <= ram[adr_a];
	if (we_a)
	     ram[adr_a] <= d_a;
     end 
   always @ (posedge clk_b)
     begin 
	  q_b <= ram[adr_b];
	if (we_b)
	  ram[adr_b] <= d_b;
     end
endmodule 
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
module ctrl_counter ( clear, cke, zq, rst, clk);

   parameter length = 5;
   input clear;
   input cke;
   output reg zq;
   input rst;
   input clk;

   parameter clear_value = 0;
   parameter set_value = 0;
   parameter wrap_value = 31;

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
   assign q_next =  clear ? {length{1'b0}} :{qi[length-1:1],lfsr_fb};

   always @ (posedge clk or posedge rst)
     if (rst)
       qi <= {length{1'b0}};
     else
     if (cke)
       qi <= q_next;



   always @ (posedge clk or posedge rst)
     if (rst)
       zq <= 1'b1;
     else
     if (cke)
       zq <= q_next == {length{1'b0}};
endmodule
`include "versatile_mem_ctrl_defines.v"

module fifo
  (
   // A side
   input [35:0]  a_dat_i,
   input 	 a_we_i,
   input  [2:0]  a_fifo_sel_i,
   output [7:0]  a_fifo_full_o,
   input 	 a_clk,
   // B side
   output [35:0] b_dat_o,
   input 	 b_re_i,
   input [2:0]   b_fifo_sel_i,
   output [7:0]  b_fifo_empty_o,
   input 	 b_clk,
   // Common
   input 	 rst 	 
   );

   wire [4:0] 	 wadr0, radr0;
   wire [4:0]	 wadr1, radr1;
   wire [4:0]	 wadr2, radr2;
   wire [4:0]	 wadr3, radr3;
   wire [4:0]	 wadr4, radr4;
   wire [4:0]	 wadr5, radr5;
   wire [4:0]	 wadr6, radr6;
   wire [4:0]	 wadr7, radr7;
   
`ifdef PORT0
   wire [4:0] 	 wptr0, rptr0;
`endif
`ifdef PORT1
   wire [4:0] 	 wptr1, rptr1;
`endif
`ifdef PORT2
   wire [4:0] 	 wptr2, rptr2;
`endif
`ifdef PORT3
   wire [4:0] 	 wptr3, rptr3;
`endif
`ifdef PORT4
   wire [4:0] 	 wptr4, rptr4;
`endif
`ifdef PORT5
   wire [4:0] 	 wptr5, rptr5;
`endif
`ifdef PORT6
   wire [4:0] 	 wptr6, rptr6;
`endif
`ifdef PORT7
   wire [4:0] 	 wptr7, rptr7;
`endif
   
   wire [7:0] 	 dpram_a_a, dpram_a_b;   

   // WB#0
`ifdef PORT0
   fifo_adr_counter wptr0_cnt
     (
      .q(wptr0),
      .q_bin(wadr0),
      .cke(a_we_i & (a_fifo_sel_i==3'h0)),
      .clk(a_clk),
      .rst(rst)
      );

   fifo_adr_counter rptr0_cnt
     (
      .q(rptr0),
      .q_bin(radr0),
      .cke(b_re_i & (b_fifo_sel_i==3'h0)),
      .clk(b_clk),
      .rst(rst)
      );

  versatile_fifo_async_cmp
    #
    (
     .ADDR_WIDTH(5)
     )
    cmp0
    ( 
      .wptr(wptr0), 
      .rptr(rptr0), 
      .fifo_empty(b_fifo_empty_o[0]), 
      .fifo_full(a_fifo_full_o[0]), 
      .wclk(a_clk), 
      .rclk(b_clk), 
      .rst(rst)
      );
`else // !`ifdef PORT0
   assign wptr0 = 5'h0;
   assign wadr0 = 5'h0;
   assign rptr0 = 5'h0;
   assign radr0 = 5'h0;
   assign a_fifo_full_o[0] = 1'b0;
   assign b_fifo_empty_o[0] = 1'b1;
`endif // !`ifdef PORT0
   
   // WB#1
`ifdef PORT1
   fifo_adr_counter wptr1_cnt
     (
      .q(wptr1),
      .q_bin(wadr1),
      .cke(a_we_i & (a_fifo_sel_i==3'h1)),
      .clk(a_clk),
      .rst(rst)
      );

   fifo_adr_counter rptr1_cnt
     (
      .q(rptr1),
      .q_bin(radr1),
      .cke(b_re_i & (b_fifo_sel_i==3'h1)),
      .clk(b_clk),
      .rst(rst)
      );

  versatile_fifo_async_cmp
    #
    (
     .ADDR_WIDTH(5)
     )
    cmp1
    ( 
      .wptr(wptr1), 
      .rptr(rptr1), 
      .fifo_empty(b_fifo_empty_o[1]), 
      .fifo_full(a_fifo_full_o[1]), 
      .wclk(a_clk), 
      .rclk(b_clk), 
      .rst(rst)
      );
`else // !`ifdef PORT1
   assign wptr1 = 5'h0;
   assign wadr1 = 5'h0;
   assign rptr1 = 5'h0;
   assign radr1 = 5'h0;
   assign a_fifo_full_o[1] = 1'b0;
   assign b_fifo_empty_o[1] = 1'b1;
`endif // !`ifdef PORT1
   
   // WB#2
`ifdef PORT2
   fifo_adr_counter wptr2_cnt
     (
      .q(wptr2),
      .q_bin(wadr2),
      .cke(a_we_i & (a_fifo_sel_i==3'h2)),
      .clk(a_clk),
      .rst(rst)
      );

   fifo_adr_counter rptr2_cnt
     (
      .q(rptr2),
      .q_bin(radr2),
      .cke(b_re_i & (b_fifo_sel_i==3'h2)),
      .clk(b_clk),
      .rst(rst)
      );

  versatile_fifo_async_cmp
    #
    (
     .ADDR_WIDTH(5)
     )
    cmp2
    ( 
      .wptr(wptr2), 
      .rptr(rptr2), 
      .fifo_empty(b_fifo_empty_o[2]), 
      .fifo_full(a_fifo_full_o[2]), 
      .wclk(a_clk), 
      .rclk(b_clk), 
      .rst(rst)
      );
`else // !`ifdef PORT2
   assign wptr2 = 5'h0;
   assign wadr2 = 5'h0;
   assign rptr2 = 5'h0;
   assign radr2 = 5'h0;
   assign a_fifo_full_o[2] = 1'b0;
   assign b_fifo_empty_o[2] = 1'b1;
`endif // !`ifdef PORT2
   
   // WB#3
`ifdef PORT3
   fifo_adr_counter wptr3_cnt
     (
      .q(wptr3),
      .q_bin(wadr3),
      .cke(a_we_i & (a_fifo_sel_i==3'h3)),
      .clk(a_clk),
      .rst(rst)
      );

   fifo_adr_counter rptr3_cnt
     (
      .q(rptr3),
      .q_bin(radr3),
      .cke(b_re_i & (b_fifo_sel_i==3'h3)),
      .clk(b_clk),
      .rst(rst)
      );

  versatile_fifo_async_cmp
    #
    (
     .ADDR_WIDTH(5)
     )
    cmp3
    ( 
      .wptr(wptr3), 
      .rptr(rptr3), 
      .fifo_empty(b_fifo_empty_o[3]), 
      .fifo_full(a_fifo_full_o[3]), 
      .wclk(a_clk), 
      .rclk(b_clk), 
      .rst(rst)
      );
`else // !`ifdef PORT3
   assign wptr3 = 5'h0;
   assign wadr3 = 5'h0;
   assign rptr3 = 5'h0;
   assign radr3 = 5'h0;
   assign a_fifo_full_o[3] = 1'b0;
   assign b_fifo_empty_o[3] = 1'b1;
`endif // !`ifdef PORT3
   
   // WB#4
`ifdef PORT4
   fifo_adr_counter wptr4_cnt
     (
      .q(wptr4),
      .q_bin(wadr4),
      .cke(a_we_i & (a_fifo_sel_i==3'h4)),
      .clk(a_clk),
      .rst(rst)
      );

   fifo_adr_counter rptr4_cnt
     (
      .q(rptr4),
      .q_bin(radr4),
      .cke(b_re_i & (b_fifo_sel_i==3'h4)),
      .clk(b_clk),
      .rst(rst)
      );

  versatile_fifo_async_cmp
    #
    (
     .ADDR_WIDTH(5)
     )
    cmp4
    ( 
      .wptr(wptr4), 
      .rptr(rptr4), 
      .fifo_empty(b_fifo_empty_o[4]), 
      .fifo_full(a_fifo_full_o[4]), 
      .wclk(a_clk), 
      .rclk(b_clk), 
      .rst(rst)
      );
`else // !`ifdef PORT4
   assign wptr4 = 5'h0;
   assign wadr4 = 5'h0;
   assign rptr4 = 5'h0;
   assign radr4 = 5'h0;
   assign a_fifo_full_o[4] = 1'b0;
   assign b_fifo_empty_o[4] = 1'b1;
`endif // !`ifdef PORT4
   
   // WB#5
`ifdef PORT5
   fifo_adr_counter wptr5_cnt
     (
      .q(wptr5),
      .q_bin(wadr5),
      .cke(a_we_i & (a_fifo_sel_i==3'h5)),
      .clk(a_clk),
      .rst(rst)
      );

   fifo_adr_counter rptr5_cnt
     (
      .q(rptr5),
      .q_bin(radr5),
      .cke(b_re_i & (b_fifo_sel_i==3'h5)),
      .clk(b_clk),
      .rst(rst)
      );

  versatile_fifo_async_cmp
    #
    (
     .ADDR_WIDTH(5)
     )
    cmp5
    ( 
      .wptr(wptr5), 
      .rptr(rptr5), 
      .fifo_empty(b_fifo_empty_o[5]), 
      .fifo_full(a_fifo_full_o[5]), 
      .wclk(a_clk), 
      .rclk(b_clk), 
      .rst(rst)
      );
`else // !`ifdef PORT5
   assign wptr5 = 5'h0;
   assign wadr5 = 5'h0;
   assign rptr5 = 5'h0;
   assign radr5 = 5'h0;
   assign a_fifo_full_o[5] = 1'b0;
   assign b_fifo_empty_o[5] = 1'b1;
`endif // !`ifdef PORT5
   
   // WB#6
`ifdef PORT6
   fifo_adr_counter wptr6_cnt
     (
      .q(wptr6),
      .q_bin(wadr6),
      .cke(a_we_i & (a_fifo_sel_i==3'h6)),
      .clk(a_clk),
      .rst(rst)
      );

   fifo_adr_counter rptr6_cnt
     (
      .q(rptr6),
      .q_bin(radr6),
      .cke(b_re_i & (b_fifo_sel_i==3'h6)),
      .clk(b_clk),
      .rst(rst)
      );

  versatile_fifo_async_cmp
    #
    (
     .ADDR_WIDTH(5)
     )
    cmp6
    ( 
      .wptr(wptr6), 
      .rptr(rptr6), 
      .fifo_empty(b_fifo_empty_o[6]), 
      .fifo_full(a_fifo_full_o[6]), 
      .wclk(a_clk), 
      .rclk(b_clk), 
      .rst(rst)
      );
`else // !`ifdef PORT6
   assign wptr6 = 5'h0;
   assign wadr6 = 5'h0;
   assign rptr6 = 5'h0;
   assign radr6 = 5'h0;
   assign a_fifo_full_o[6] = 1'b0;
   assign b_fifo_empty_o[6] = 1'b1;
`endif // !`ifdef PORT6
   
   // WB#7
`ifdef PORT7
   fifo_adr_counter wptr7_cnt
     (
      .q(wptr7),
      .q_bin(wadr7),
      .cke(a_we_i & (a_fifo_sel_i==3'h7)),
      .clk(a_clk),
      .rst(rst)
      );

   fifo_adr_counter rptr7_cnt
     (
      .q(rptr7),
      .q_bin(radr7),
      .cke(b_re_i & (b_fifo_sel_i==3'h7)),
      .clk(b_clk),
      .rst(rst)
      );

  versatile_fifo_async_cmp
    #
    (
     .ADDR_WIDTH(5)
     )
    cmp7
    ( 
      .wptr(wptr7), 
      .rptr(rptr7), 
      .fifo_empty(b_fifo_empty_o[7]), 
      .fifo_full(a_fifo_full_o[7]), 
      .wclk(a_clk), 
      .rclk(b_clk), 
      .rst(rst)
      );
`else // !`ifdef PORT7
   assign wptr7 = 5'h0;
   assign wadr7 = 5'h0;
   assign rptr7 = 5'h0;
   assign radr7 = 5'h0;
   assign a_fifo_full_o[7] = 1'b0;
   assign b_fifo_empty_o[7] = 1'b1;
`endif // !`ifdef PORT7
   
   assign dpram_a_a = (a_fifo_sel_i==3'd0) ? {a_fifo_sel_i,wadr0} :
		      (a_fifo_sel_i==3'd1) ? {a_fifo_sel_i,wadr1} :
		      (a_fifo_sel_i==3'd2) ? {a_fifo_sel_i,wadr2} :
		      (a_fifo_sel_i==3'd3) ? {a_fifo_sel_i,wadr3} :
		      (a_fifo_sel_i==3'd4) ? {a_fifo_sel_i,wadr4} :
		      (a_fifo_sel_i==3'd5) ? {a_fifo_sel_i,wadr5} :
		      (a_fifo_sel_i==3'd6) ? {a_fifo_sel_i,wadr6} :
		                             {a_fifo_sel_i,wadr7} ;

   assign dpram_a_b = (b_fifo_sel_i==3'd0) ? {b_fifo_sel_i,radr0} :
		      (b_fifo_sel_i==3'd1) ? {b_fifo_sel_i,radr1} :
		      (b_fifo_sel_i==3'd2) ? {b_fifo_sel_i,radr2} :
		      (b_fifo_sel_i==3'd3) ? {b_fifo_sel_i,radr3} :
		      (b_fifo_sel_i==3'd4) ? {b_fifo_sel_i,radr4} :
		      (b_fifo_sel_i==3'd5) ? {b_fifo_sel_i,radr5} :
		      (b_fifo_sel_i==3'd6) ? {b_fifo_sel_i,radr6} :
		                             {b_fifo_sel_i,radr7} ;
		      

`ifdef ACTEL
   TwoPortRAM_256x36 dpram
     (
      .WD(a_dat_i),
      .RD(b_dat_o),
      .WEN(a_we_i),
      //.REN(b_re_i),
      .REN(1'b1),
      .WADDR(dpram_a_a),
      .RADDR(dpram_a_b),
      .WCLK(a_clk),
      .RCLK(b_clk)
      );   
`else		        
   vfifo_dual_port_ram_dc_dw
/*     #
     (
      .ADDR_WIDTH(8),
      .DATA_WIDTH(36)
      )*/
     dpram
     (
      .d_a(a_dat_i),
      .q_a(),
      .adr_a(dpram_a_a), 
      .we_a(a_we_i),
      .clk_a(a_clk),
      .q_b(b_dat_o),
      .adr_b(dpram_a_b),
      .d_b(36'h0), 
      .we_b(1'b0),
      .clk_b(b_clk)
      );
`endif
endmodule // sd_fifo
`define EOB (!(|cti) | &cti)
module fifo_fill (
  output reg wbs_flag,
  output reg we_req,
  input wire ack,
  input wire [1:0] bte,
  input wire clk,
  input wire [2:0] cti,
  input wire cyc,
  input wire rst,
  input wire stb,
  input wire we,
  input wire we_ack 
);
  
  
  // state bits
  parameter 
  idle    = 0, 
  state1  = 1, 
  state10 = 2, 
  state11 = 3, 
  state12 = 4, 
  state13 = 5, 
  state14 = 6, 
  state15 = 7, 
  state16 = 8, 
  state2  = 9, 
  state3  = 10, 
  state4  = 11, 
  state5  = 12, 
  state6  = 13, 
  state7  = 14, 
  state8  = 15, 
  state9  = 16; 
  
  reg [16:0] state;
  reg [16:0] nextstate;
  
  // comb always block
  always @* begin
    nextstate = 17'b00000000000000000;
    wbs_flag = 1'b0; // default
    we_req = we & stb; // default
    case (1'b1) // synopsys parallel_case full_case
      state[idle]   : begin
        wbs_flag = 1'b1;
        we_req = cyc & stb;
        if (cyc & stb & we_ack) begin
          nextstate[state1] = 1'b1;
        end
        else begin
          nextstate[idle] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[state1] : begin
        if (`EOB & ack) begin
          nextstate[idle] = 1'b1;
        end
        else if (ack) begin
          nextstate[state2] = 1'b1;
        end
        else begin
          nextstate[state1] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[state10]: begin
        if (`EOB & ack) begin
          nextstate[idle] = 1'b1;
        end
        else if (ack) begin
          nextstate[state11] = 1'b1;
        end
        else begin
          nextstate[state10] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[state11]: begin
        if (`EOB & ack) begin
          nextstate[idle] = 1'b1;
        end
        else if (ack) begin
          nextstate[state12] = 1'b1;
        end
        else begin
          nextstate[state11] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[state12]: begin
        if (`EOB & ack) begin
          nextstate[idle] = 1'b1;
        end
        else if (ack) begin
          nextstate[state13] = 1'b1;
        end
        else begin
          nextstate[state12] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[state13]: begin
        if (`EOB & ack) begin
          nextstate[idle] = 1'b1;
        end
        else if (ack) begin
          nextstate[state14] = 1'b1;
        end
        else begin
          nextstate[state13] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[state14]: begin
        if (`EOB & ack) begin
          nextstate[idle] = 1'b1;
        end
        else if (ack) begin
          nextstate[state15] = 1'b1;
        end
        else begin
          nextstate[state14] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[state15]: begin
        if (`EOB & ack) begin
          nextstate[idle] = 1'b1;
        end
        else if (ack) begin
          nextstate[state16] = 1'b1;
        end
        else begin
          nextstate[state15] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[state16]: begin
        if (ack) begin
          nextstate[idle] = 1'b1;
        end
        else begin
          nextstate[state16] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[state2] : begin
        if (`EOB & ack) begin
          nextstate[idle] = 1'b1;
        end
        else if (ack) begin
          nextstate[state3] = 1'b1;
        end
        else begin
          nextstate[state2] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[state3] : begin
        if (`EOB & ack) begin
          nextstate[idle] = 1'b1;
        end
        else if (ack) begin
          nextstate[state4] = 1'b1;
        end
        else begin
          nextstate[state3] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[state4] : begin
        if (`EOB & ack) begin
          nextstate[idle] = 1'b1;
        end
        else if ((bte==2'b01) & ack) begin
          nextstate[idle] = 1'b1;
        end
        else if (ack) begin
          nextstate[state5] = 1'b1;
        end
        else begin
          nextstate[state4] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[state5] : begin
        if (`EOB & ack) begin
          nextstate[idle] = 1'b1;
        end
        else if (ack) begin
          nextstate[state6] = 1'b1;
        end
        else begin
          nextstate[state5] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[state6] : begin
        if (`EOB & ack) begin
          nextstate[idle] = 1'b1;
        end
        else if (ack) begin
          nextstate[state7] = 1'b1;
        end
        else begin
          nextstate[state6] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[state7] : begin
        if (`EOB & ack) begin
          nextstate[idle] = 1'b1;
        end
        else if (ack) begin
          nextstate[state8] = 1'b1;
        end
        else begin
          nextstate[state7] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[state8] : begin
        if (`EOB & ack) begin
          nextstate[idle] = 1'b1;
        end
        else if ((bte==2'b10) & ack) begin
          nextstate[idle] = 1'b1;
        end
        else if (ack) begin
          nextstate[state9] = 1'b1;
        end
        else begin
          nextstate[state8] = 1'b1; // Added because implied_loopback is true
        end
      end
      state[state9] : begin
        if (`EOB & ack) begin
          nextstate[idle] = 1'b1;
        end
        else if (ack) begin
          nextstate[state10] = 1'b1;
        end
        else begin
          nextstate[state9] = 1'b1; // Added because implied_loopback is true
        end
      end
    endcase
  end
  
  // sequential always block
  always @(posedge clk or posedge rst) begin
    if (rst)
      state <= 17'b00000000000000001 << idle;
    else
      state <= nextstate;
  end
  
  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [55:0] statename;
  always @* begin
    case (1'b1)
      state[idle]   :
        statename = "idle";
      state[state1] :
        statename = "state1";
      state[state10]:
        statename = "state10";
      state[state11]:
        statename = "state11";
      state[state12]:
        statename = "state12";
      state[state13]:
        statename = "state13";
      state[state14]:
        statename = "state14";
      state[state15]:
        statename = "state15";
      state[state16]:
        statename = "state16";
      state[state2] :
        statename = "state2";
      state[state3] :
        statename = "state3";
      state[state4] :
        statename = "state4";
      state[state5] :
        statename = "state5";
      state[state6] :
        statename = "state6";
      state[state7] :
        statename = "state7";
      state[state8] :
        statename = "state8";
      state[state9] :
        statename = "state9";
      default:
        statename = "XXXXXXX";
    endcase
  end
  `endif

  
endmodule

module inc_adr
  (
   input  [3:0] adr_i,
   input  [2:0] cti_i,
   input  [1:0] bte_i,
   input  init,
   input  inc,
   output reg [3:0] adr_o,
   output reg done,
   input clk,
   input rst
   );

   reg 	 init_i;
   
   reg [1:0] bte;
   reg [3:0] cnt;

   // delay init one clock cycle to be able to read from mem
   always @ (posedge clk or posedge rst)
     if (rst)
       init_i <= 1'b0;
     else
       init_i <= init;
   
   // bte
   always @ (posedge clk or posedge rst)
     if (rst)
       bte <= 2'b00;
     else
       if (init_i)
	 bte <= bte_i;

   // adr_o
   always @ (posedge clk or posedge rst)
     if (rst)
       adr_o <= 4'd0;
     else
       if (init_i)
	 adr_o <= adr_i;
       else
	 if (inc)
	   case (bte)
	     2'b01: adr_o <= {adr_o[3:2], adr_o[1:0] + 2'd1};
	     2'b10: adr_o <= {adr_o[3], adr_o[2:0] + 3'd1};
	     default: adr_o <= adr_o + 4'd1;
	   endcase // case (bte)
   
   // done
   always @ (posedge clk or posedge rst)
     if (rst)
       {done,cnt} <= {1'b0,4'd0};
     else
       if (init_i)
	 begin
	    done <= ({bte_i,cti_i} == {2'b00,3'b000});
	    case (bte_i)
	      2'b01: cnt <= 4'd12;
	      2'b10: cnt <= 4'd8;
	      2'b11: cnt <= 4'd0;
	      default: cnt <= adr_i;
	    endcase
	 end
       else
	 if (inc)
	   {done,cnt} <= cnt + 4'd1;

endmodule // inc_adr

   
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

// BINARY counter
module ref_delay_counter ( cke, zq, rst, clk);

   parameter length = 6;
   input cke;
   output reg zq;
   input rst;
   input clk;

   parameter clear_value = 0;
   parameter set_value = 0;
   parameter wrap_value = 12;

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
       zq <= 1'b1;
     else
     if (cke)
       zq <= q_next == {length{1'b0}};
endmodule
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

// BINARY counter
module pre_delay_counter ( cke, zq, rst, clk);

   parameter length = 2;
   input cke;
   output reg zq;
   input rst;
   input clk;

   parameter clear_value = 0;
   parameter set_value = 0;
   parameter wrap_value = 2;

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
       zq <= 1'b1;
     else
     if (cke)
       zq <= q_next == {length{1'b0}};
endmodule
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

// BINARY counter
module burst_length_counter ( cke, zq, rst, clk);

   parameter length = 2;
   input cke;
   output reg zq;
   input rst;
   input clk;

   parameter clear_value = 0;
   parameter set_value = 0;
   parameter wrap_value = 3;

   reg  [length:1] qi;
   wire [length:1] q_next;
   assign q_next = (qi == wrap_value) ? {length{1'b0}} :qi + {{length-1{1'b0}},1'b1};

   always @ (posedge clk or posedge rst)
     if (rst)
       qi <= {length{1'b0}};
     else
     if (cke)
       qi <= q_next;



   always @ (posedge clk or posedge rst)
     if (rst)
       zq <= 1'b1;
     else
     if (cke)
       zq <= q_next == {length{1'b0}};
endmodule
 `timescale 1ns/1ns
module ddr_16 (
  output reg [14:0] a,
  output reg adr_init,
  output reg bl_en,
  output reg [2:0] cmd,
  output reg cs_n,
  output reg [12:0] cur_row,
  output reg fifo_re,
  output reg read,
  output reg ref_ack,
  output reg ref_delay,
  output reg state_idle,
  output reg write,
  input wire bl_ack,
  input wire [3:0] burst_adr,
  input wire clk,
  input wire fifo_empty,
  input wire fifo_re_d,
  input wire [2:0] fifo_sel,
  input wire ref_delay_ack,
  input wire ref_req,
  input wire rst,
  input wire [35:0] tx_fifo_dat_o 
);
  parameter 
  IDLE        = 0, 
  ACT_ROW     = 1, 
  AREF        = 2, 
  AREF_0      = 3, 
  AREF_1      = 4, 
  AWAIT_CMD   = 5, 
  LEMR2       = 6, 
  LEMR3       = 7, 
  LEMR_0      = 8, 
  LEMR_1      = 9, 
  LEMR_2      = 10, 
  LMR_0       = 11, 
  LMR_1       = 12, 
  NOP0        = 13, 
  NOP1        = 14, 
  NOP10       = 15, 
  NOP11       = 16, 
  NOP12       = 17, 
  NOP14       = 18, 
  NOP15       = 19, 
  NOP2        = 20, 
  NOP20       = 21, 
  NOP21       = 22, 
  NOP22       = 23, 
  NOP3        = 24, 
  NOP30       = 25, 
  NOP31       = 26, 
  NOP32       = 27, 
  NOP4        = 28, 
  NOP5        = 29, 
  NOP6        = 30, 
  NOP7        = 31, 
  NOP8        = 32, 
  NOP9        = 33, 
  NOP_tRFC    = 34, 
  NOP_tWR     = 35, 
  PRECHARGE   = 36, 
  PRE_0       = 37, 
  PRE_1       = 38, 
  READ_ADDR   = 39, 
  READ_BURST  = 40, 
  WRITE_ADDR  = 41, 
  WRITE_BURST = 42; 
  reg [42:0] state;
  reg [42:0] nextstate;
  always @* begin
    nextstate = 43'b0000000000000000000000000000000000000000000;
    adr_init = 1'b0; 
    bl_en = 1'b0; 
    fifo_re = 1'b0; 
    read = 1'b0; 
    ref_ack = 1'b0; 
    ref_delay = 1'b0; 
    state_idle = 1'b0; 
    write = 1'b0; 
    case (1'b1) 
      state[IDLE]       : begin
        begin
          nextstate[NOP0] = 1'b1;
        end
      end
      state[ACT_ROW]    : begin
        if (tx_fifo_dat_o[5]) begin
          nextstate[NOP14] = 1'b1;
        end
        else begin
          nextstate[NOP15] = 1'b1;
        end
      end
      state[AREF]       : begin
        ref_ack = 1'b1;
        ref_delay = 1'b1;
        begin
          nextstate[NOP_tRFC] = 1'b1;
        end
      end
      state[AREF_0]     : begin
        ref_ack = 1'b1;
        begin
          nextstate[NOP7] = 1'b1;
        end
      end
      state[AREF_1]     : begin
        ref_ack = 1'b1;
        begin
          nextstate[NOP8] = 1'b1;
        end
      end
      state[AWAIT_CMD]  : begin
        adr_init = !fifo_empty;
        state_idle = 1'b1;
        if (ref_req) begin
          nextstate[AREF] = 1'b1;
        end
        else if (!fifo_empty) begin
          nextstate[NOP12] = 1'b1;
        end
        else begin
          nextstate[AWAIT_CMD] = 1'b1; 
        end
      end
      state[LEMR2]      : begin
        ref_ack = 1'b1;
        begin
          nextstate[NOP2] = 1'b1;
        end
      end
      state[LEMR3]      : begin
        ref_ack = 1'b1;
        begin
          nextstate[NOP3] = 1'b1;
        end
      end
      state[LEMR_0]     : begin
        ref_ack = 1'b1;
        begin
          nextstate[NOP4] = 1'b1;
        end
      end
      state[LEMR_1]     : begin
        ref_ack = 1'b1;
        begin
          nextstate[NOP10] = 1'b1;
        end
      end
      state[LEMR_2]     : begin
        ref_ack = 1'b1;
        begin
          nextstate[NOP11] = 1'b1;
        end
      end
      state[LMR_0]      : begin
        ref_ack = 1'b1;
        begin
          nextstate[NOP5] = 1'b1;
        end
      end
      state[LMR_1]      : begin
        ref_ack = 1'b1;
        begin
          nextstate[NOP9] = 1'b1;
        end
      end
      state[NOP0]       : begin
        begin
          nextstate[PRE_0] = 1'b1;
        end
      end
      state[NOP1]       : begin
        if (ref_req) begin
          nextstate[LEMR2] = 1'b1;
        end
        else begin
          nextstate[NOP1] = 1'b1; 
        end
      end
      state[NOP10]      : begin
        if (ref_req) begin
          nextstate[LEMR_2] = 1'b1;
        end
        else begin
          nextstate[NOP10] = 1'b1; 
        end
      end
      state[NOP11]      : begin
        if (ref_req) begin
          nextstate[AWAIT_CMD] = 1'b1;
        end
        else begin
          nextstate[NOP11] = 1'b1; 
        end
      end
      state[NOP12]      : begin
        begin
          nextstate[ACT_ROW] = 1'b1;
        end
      end
      state[NOP14]      : begin 
        begin
          nextstate[WRITE_ADDR] = 1'b1;
        end
      end
      state[NOP15]      : begin
        begin
          nextstate[READ_ADDR] = 1'b1;
        end
      end
      state[NOP2]       : begin
        if (ref_req) begin
          nextstate[LEMR3] = 1'b1;
        end
        else begin
          nextstate[NOP2] = 1'b1; 
        end
      end
      state[NOP20]      : begin
        begin
          nextstate[NOP21] = 1'b1;
        end
      end
      state[NOP21]      : begin
        adr_init = 1'b1;
        fifo_re = 1'b1;
        begin
          nextstate[NOP22] = 1'b1;
        end
      end
      state[NOP22]      : begin
        begin
          nextstate[NOP_tWR] = 1'b1;
        end
      end
      state[NOP3]       : begin
        if (ref_req) begin
          nextstate[LEMR_0] = 1'b1;
        end
        else begin
          nextstate[NOP3] = 1'b1; 
        end
      end
      state[NOP30]      : begin
        begin
          nextstate[NOP31] = 1'b1;
        end
      end
      state[NOP31]      : begin
        adr_init = 1'b1;
        fifo_re = 1'b1;
        begin
          nextstate[NOP32] = 1'b1;
        end
      end
      state[NOP32]      : begin
        begin
          nextstate[NOP_tWR] = 1'b1;
        end
      end
      state[NOP4]       : begin
        if (ref_req) begin
          nextstate[LMR_0] = 1'b1;
        end
        else begin
          nextstate[NOP4] = 1'b1; 
        end
      end
      state[NOP5]       : begin
        if (ref_req) begin
          nextstate[PRE_1] = 1'b1;
        end
        else begin
          nextstate[NOP5] = 1'b1; 
        end
      end
      state[NOP6]       : begin
        if (ref_req) begin
          nextstate[AREF_0] = 1'b1;
        end
        else begin
          nextstate[NOP6] = 1'b1; 
        end
      end
      state[NOP7]       : begin
        if (ref_req) begin
          nextstate[AREF_1] = 1'b1;
        end
        else begin
          nextstate[NOP7] = 1'b1; 
        end
      end
      state[NOP8]       : begin
        if (ref_req) begin
          nextstate[LMR_1] = 1'b1;
        end
        else begin
          nextstate[NOP8] = 1'b1; 
        end
      end
      state[NOP9]       : begin
        if (ref_req) begin
          nextstate[LEMR_1] = 1'b1;
        end
        else begin
          nextstate[NOP9] = 1'b1; 
        end
      end
      state[NOP_tRFC]   : begin 
        ref_delay = !ref_delay_ack;
        if (ref_delay_ack) begin
          nextstate[AWAIT_CMD] = 1'b1;
        end
        else begin
          nextstate[NOP_tRFC] = 1'b1; 
        end
      end
      state[NOP_tWR]    : begin 
        begin
          nextstate[PRECHARGE] = 1'b1;
        end
      end
      state[PRECHARGE]  : begin
        begin
          nextstate[AWAIT_CMD] = 1'b1;
        end
      end
      state[PRE_0]      : begin
        ref_ack = 1'b1;
        begin
          nextstate[NOP1] = 1'b1;
        end
      end
      state[PRE_1]      : begin
        ref_ack = 1'b1;
        begin
          nextstate[NOP6] = 1'b1;
        end
      end
      state[READ_ADDR]  : begin
        bl_en = 1'b1;
        read = 1'b1;
        begin
          nextstate[READ_BURST] = 1'b1;
        end
      end
      state[READ_BURST] : begin
        bl_en = !bl_ack;
        read = !bl_ack;
        if (bl_ack) begin
          nextstate[NOP30] = 1'b1;
        end
        else begin
          nextstate[READ_BURST] = 1'b1; 
        end
      end
      state[WRITE_ADDR] : begin
        bl_en = 1'b1;
        write = 1'b1;
        begin
          nextstate[WRITE_BURST] = 1'b1;
        end
      end
      state[WRITE_BURST]: begin
        bl_en = !bl_ack;
        fifo_re = 1'b1;
        write = 1'b1;
        if (bl_ack) begin
          nextstate[NOP20] = 1'b1;
        end
        else begin
          nextstate[WRITE_BURST] = 1'b1; 
        end
      end
    endcase
  end
  always @(posedge clk or posedge rst) begin
    if (rst)
      state <= 43'b0000000000000000000000000000000000000000001 << IDLE;
    else
      state <= nextstate;
  end
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      a[14:0] <= 15'd0;
      cmd[2:0] <= 3'b111;
      cs_n <= 1'b1;
      cur_row[12:0] <= cur_row;
    end
    else begin
      a[14:0] <= 15'd0; 
      cmd[2:0] <= 3'b111; 
      cs_n <= 1'b0; 
      cur_row[12:0] <= cur_row; 
      case (1'b1) 
        nextstate[IDLE]       : begin
          cs_n <= 1'b1;
        end
        nextstate[ACT_ROW]    : begin
          a[14:0] <= {tx_fifo_dat_o[28:27],tx_fifo_dat_o[26:14]};
          cmd[2:0] <= 3'b011;
          cur_row[12:0] <= tx_fifo_dat_o[26:14];
        end
        nextstate[AREF]       : begin
          a[14:0] <= a;
          cmd[2:0] <= 3'b001;
        end
        nextstate[AREF_0]     : begin
          a[14:0] <= a;
          cmd[2:0] <= 3'b001;
        end
        nextstate[AREF_1]     : begin
          a[14:0] <= a;
          cmd[2:0] <= 3'b001;
        end
        nextstate[AWAIT_CMD]  : begin
          a[14:0] <= a;
          cs_n <= 1'b1;
        end
        nextstate[LEMR2]      : begin
          a[14:0] <= {2'b10,5'b00000,1'b0,7'b0000000};
          cmd[2:0] <= 3'b000;
        end
        nextstate[LEMR3]      : begin
          a[14:0] <= {2'b11,13'b0000000000000};
          cmd[2:0] <= 3'b000;
        end
        nextstate[LEMR_0]     : begin
          a[14:0] <= {2'b01,1'b0,1'b0,1'b0,3'b000,1'b0,3'b000,1'b0,1'b0,1'b0};
          cmd[2:0] <= 3'b000;
        end
        nextstate[LEMR_1]     : begin
          a[14:0] <= {2'b01,1'b0,1'b0,1'b0,3'b111,1'b0,3'b000,1'b0,1'b0,1'b0};
          cmd[2:0] <= 3'b000;
        end
        nextstate[LEMR_2]     : begin
          a[14:0] <= {2'b01,1'b0,1'b0,1'b0,3'b000,1'b0,3'b000,1'b0,1'b0,1'b0};
          cmd[2:0] <= 3'b000;
        end
        nextstate[LMR_0]      : begin
          a[14:0] <= {2'b00,1'b0,3'b001,1'b1,1'b0,3'b100,1'b0,3'b011};
          cmd[2:0] <= 3'b000;
        end
        nextstate[LMR_1]      : begin
          a[14:0] <= {2'b00,1'b0,3'b001,1'b0,1'b0,3'b100,1'b0,3'b011};
          cmd[2:0] <= 3'b000;
        end
        nextstate[NOP0]       : begin
          a[14:0] <= a;
        end
        nextstate[NOP1]       : begin
          a[14:0] <= a;
        end
        nextstate[NOP10]      : begin
          a[14:0] <= a;
        end
        nextstate[NOP11]      : begin
          a[14:0] <= a;
        end
        nextstate[NOP14]      : begin
          a[14:0] <= a;
        end
        nextstate[NOP15]      : begin
          a[14:0] <= a;
        end
        nextstate[NOP2]       : begin
          a[14:0] <= a;
        end
        nextstate[NOP20]      : begin
          a[14:0] <= a;
        end
        nextstate[NOP21]      : begin
          a[14:0] <= a;
        end
        nextstate[NOP22]      : begin
          a[14:0] <= a;
        end
        nextstate[NOP3]       : begin
          a[14:0] <= a;
        end
        nextstate[NOP30]      : begin
          a[14:0] <= a;
        end
        nextstate[NOP31]      : begin
          a[14:0] <= a;
        end
        nextstate[NOP32]      : begin
          a[14:0] <= a;
        end
        nextstate[NOP4]       : begin
          a[14:0] <= a;
        end
        nextstate[NOP5]       : begin
          a[14:0] <= a;
        end
        nextstate[NOP6]       : begin
          a[14:0] <= a;
        end
        nextstate[NOP7]       : begin
          a[14:0] <= a;
        end
        nextstate[NOP8]       : begin
          a[14:0] <= a;
        end
        nextstate[NOP9]       : begin
          a[14:0] <= a;
        end
        nextstate[NOP_tRFC]   : begin
          a[14:0] <= a;
        end
        nextstate[NOP_tWR]    : begin
          a[14:0] <= a;
        end
        nextstate[PRECHARGE]  : begin
          a[14:0] <= {2'b00,13'b0010000000000};
          cmd[2:0] <= 3'b010;
        end
        nextstate[PRE_0]      : begin
          a[14:0] <= {2'b00,13'b0010000000000};
          cmd[2:0] <= 3'b010;
        end
        nextstate[PRE_1]      : begin
          a[14:0] <= {2'b00,13'b0010000000000};
          cmd[2:0] <= 3'b010;
        end
        nextstate[READ_ADDR]  : begin
          a[14:0] <= {tx_fifo_dat_o[28:27],{4'b0000,tx_fifo_dat_o[13:10],burst_adr,1'b0}};
          cmd[2:0] <= 3'b101;
        end
        nextstate[READ_BURST] : begin
          a[14:0] <= a;
        end
        nextstate[WRITE_ADDR] : begin
          a[14:0] <= {tx_fifo_dat_o[28:27],{4'b0000,tx_fifo_dat_o[13:10],burst_adr,1'b0}};
          cmd[2:0] <= 3'b100;
        end
        nextstate[WRITE_BURST]: begin
          a[14:0] <= a;
        end
      endcase
    end
  end
  reg [87:0] statename;
  always @* begin
    case (1'b1)
      state[IDLE]       :
        statename = "IDLE";
      state[ACT_ROW]    :
        statename = "ACT_ROW";
      state[AREF]       :
        statename = "AREF";
      state[AREF_0]     :
        statename = "AREF_0";
      state[AREF_1]     :
        statename = "AREF_1";
      state[AWAIT_CMD]  :
        statename = "AWAIT_CMD";
      state[LEMR2]      :
        statename = "LEMR2";
      state[LEMR3]      :
        statename = "LEMR3";
      state[LEMR_0]     :
        statename = "LEMR_0";
      state[LEMR_1]     :
        statename = "LEMR_1";
      state[LEMR_2]     :
        statename = "LEMR_2";
      state[LMR_0]      :
        statename = "LMR_0";
      state[LMR_1]      :
        statename = "LMR_1";
      state[NOP0]       :
        statename = "NOP0";
      state[NOP1]       :
        statename = "NOP1";
      state[NOP10]      :
        statename = "NOP10";
      state[NOP11]      :
        statename = "NOP11";
      state[NOP12]      :
        statename = "NOP12";
      state[NOP14]      :
        statename = "NOP14";
      state[NOP15]      :
        statename = "NOP15";
      state[NOP2]       :
        statename = "NOP2";
      state[NOP20]      :
        statename = "NOP20";
      state[NOP21]      :
        statename = "NOP21";
      state[NOP22]      :
        statename = "NOP22";
      state[NOP3]       :
        statename = "NOP3";
      state[NOP30]      :
        statename = "NOP30";
      state[NOP31]      :
        statename = "NOP31";
      state[NOP32]      :
        statename = "NOP32";
      state[NOP4]       :
        statename = "NOP4";
      state[NOP5]       :
        statename = "NOP5";
      state[NOP6]       :
        statename = "NOP6";
      state[NOP7]       :
        statename = "NOP7";
      state[NOP8]       :
        statename = "NOP8";
      state[NOP9]       :
        statename = "NOP9";
      state[NOP_tRFC]   :
        statename = "NOP_tRFC";
      state[NOP_tWR]    :
        statename = "NOP_tWR";
      state[PRECHARGE]  :
        statename = "PRECHARGE";
      state[PRE_0]      :
        statename = "PRE_0";
      state[PRE_1]      :
        statename = "PRE_1";
      state[READ_ADDR]  :
        statename = "READ_ADDR";
      state[READ_BURST] :
        statename = "READ_BURST";
      state[WRITE_ADDR] :
        statename = "WRITE_ADDR";
      state[WRITE_BURST]:
        statename = "WRITE_BURST";
      default    :
        statename = "XXXXXXXXXXX";
    endcase
  end
endmodule
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
   
endmodule`timescale 1ns/1ns
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

   
`include "versatile_mem_ctrl_defines.v"

module ddr_ff_in
  (
   input  C0,   // clock
   input  C1,   // clock
   input  D,    // data input
   input  CE,   // clock enable
   output Q0,   // data output
   output Q1,   // data output
   input  R,    // reset
   input  S     // set
   );

`ifdef XILINX
   IDDR2 #(
     .DDR_ALIGNMENT("NONE"),
     .INIT_Q0(1'b0),
     .INIT_Q1(1'b0), 
     .SRTYPE("SYNC"))
   IDDR2_inst (
     .Q0(Q0),
     .Q1(Q1),
     .C0(C0),
     .C1(C1),
     .CE(CE),
     .D(D),
     .R(R),
     .S(S)
   );
`endif   // XILINX

`ifdef ALTERA
   altddio_in #(
     .WIDTH(1),
     .POWER_UP_HIGH("OFF"),
     .INTENDED_DEVICE_FAMILY("Stratix III"))
   altddio_in_inst (
     .aset(),
     .datain(D),
     .inclocken(CE),
     .inclock(C0),
     .aclr(R),
     .dataout_h(Q0),
     .dataout_l(Q1)
   );
`endif   // ALTERA

`ifdef GENERIC_PRIMITIVES
   reg Q0_i, Q1_i;
   always @ (posedge R or posedge C0)
     if (R)
       Q0_i <= 1'b0;
     else
       Q0_i <= D;

   assign Q0 = Q0_i;

   always @ (posedge R or posedge C1)
     if (R)
       Q1_i <= 1'b0;
     else
       Q1_i <= D;

   assign Q1 = Q1_i;
`endif   // GENERIC_PRIMITIVES

endmodule   // ddr_ff_in


module ddr_ff_out
  (
   input  C0,   // clock
   input  C1,   // clock
   input  D0,   // data input
   input  D1,   // data input
   input  CE,   // clock enable
   output Q,    // data output
   input  R,    // reset
   input  S     // set
   );

`ifdef XILINX
   ODDR2 #(
     .DDR_ALIGNMENT("NONE"),
     .INIT(1'b0),
     .SRTYPE("SYNC"))
   ODDR2_inst (
     .Q(Q),
     .C0(C0),
     .C1(C1),
     .CE(CE),
     .D0(D0),
     .D1(D1),
     .R(R),
     .S(S)
   );
`endif   // XILINX

`ifdef ALTERA
   altddio_out #(
     .WIDTH(1),
     .POWER_UP_HIGH("OFF"),
     .INTENDED_DEVICE_FAMILY("Stratix III"),
     .OE_REG("UNUSED"))
   altddio_out_inst (
     .aset(),
     .datain_h(D0),
     .datain_l(D1),
     .outclocken(CE),
     .outclock(C0),
     .aclr(R),
     .dataout(Q)
   );
`endif   // ALTERA

`ifdef GENERIC_PRIMITIVES
   reg Q0, Q1;
   always @ (posedge R or posedge C0)
     if (R)
       Q0 <= 1'b0;
     else
       Q0 <= D0;

   always @ (posedge R or posedge C1)
     if (R)
       Q1 <= 1'b0;
     else
       Q1 <= D1;
 
   assign Q = C0 ? Q0 : Q1;
`endif   // GENERIC_PRIMITIVES

endmodule   // ddr_ff_out

`include "versatile_mem_ctrl_defines.v"

module dcm_pll
  (
   input  rst,          // reset
   input  clk_in,       // clock in
   input  clkfb_in,     // feedback clock in
   output clk0_out,     // clock out
   output clk90_out,    // clock out, 90 degree phase shift
   output clk180_out,   // clock out, 180 degree phase shift
   output clk270_out,   // clock out, 270 degree phase shift
   output clkfb_out     // feedback clock out
   );

`ifdef XILINX
   wire clk_in_ibufg;
   wire clk0_bufg, clk90_bufg, clk180_bufg, clk270_bufg;
   // DCM with internal feedback
   DCM #(
      .CLKDV_DIVIDE(2.0),
      .CLKFX_DIVIDE(1),
      .CLKFX_MULTIPLY(4),
      .CLKIN_DIVIDE_BY_2("FALSE"), 
      .CLKIN_PERIOD(8.0),
      .CLKOUT_PHASE_SHIFT("NONE"), 
      .CLK_FEEDBACK("1X"), 
      .DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"), 
      .DLL_FREQUENCY_MODE("LOW"), 
      .DUTY_CYCLE_CORRECTION("TRUE"), 
      .PHASE_SHIFT(0), 
      .STARTUP_WAIT("FALSE")) 
   DCM_internal (
      .CLK0(clk0_bufg),
      .CLK180(clk180_bufg),
      .CLK270(clk270_bufg),
      .CLK2X(),
      .CLK2X180(),
      .CLK90(clk90_bufg),
      .CLKDV(),
      .CLKFX(),
      .CLKFX180(),
      .LOCKED(),
      .PSDONE(),
      .STATUS(),
      .CLKFB(clk0_out),
      .CLKIN(clk_in_ibufg),
      .DSSEN(),
      .PSCLK(),
      .PSEN(),
      .PSINCDEC(),
      .RST(rst)
   );
   // DCM with external feedback
   DCM #(
      .CLKDV_DIVIDE(2.0),
      .CLKFX_DIVIDE(1),
      .CLKFX_MULTIPLY(4),
      .CLKIN_DIVIDE_BY_2("FALSE"), 
      .CLKIN_PERIOD(8.0),
      .CLKOUT_PHASE_SHIFT("NONE"), 
      .CLK_FEEDBACK("1X"), 
      .DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"), 
      .DLL_FREQUENCY_MODE("LOW"), 
      .DUTY_CYCLE_CORRECTION("TRUE"), 
      .PHASE_SHIFT(0), 
      .STARTUP_WAIT("FALSE")) 
   DCM_external (
      .CLK0(clkfb_bufg),
      .CLK180(),
      .CLK270(),
      .CLK2X(),
      .CLK2X180(),
      .CLK90(),
      .CLKDV(),
      .CLKFX(),
      .CLKFX180(),
      .LOCKED(),
      .PSDONE(),
      .STATUS(),
      .CLKFB(clkfb_ibufg),
      .CLKIN(clk_in_ibufg),
      .DSSEN(),
      .PSCLK(),
      .PSEN(),
      .PSINCDEC(),
      .RST(rst)
   );

   // Input buffer on DCM clock source
   IBUFG IBUFG_clk (
     .I(clk_in),
     .O(clk_in_ibufg));

   // Global buffers on DCM generated clocks
   BUFG BUFG_0 (
     .I(clk0_bufg),
     .O(clk0_out));
   BUFG BUFG_90 (
     .I(clk90_bufg),
     .O(clk90_out));
   BUFG BUFG_180 (
     .I(clk180_bufg),
     .O(clk180_out));
   BUFG BUFG_270 (
     .I(clk270_bufg),
     .O(clk270_out));

   // External feedback to DCM
   IBUFG IBUFG_clkfb (
     .I(clkfb_in),
     .O(clkfb_ibufg));
   OBUF OBUF_clkfb (
     .I(clkfb_bufg),
     .O(clkfb_out));
`endif   // XILINX


`ifdef ALTERA
   wire [9:0] sub_wire0;
   wire [0:0] sub_wire8 = 1'h0;
   wire [3:3] sub_wire4 = sub_wire0[3:3];
   wire [2:2] sub_wire3 = sub_wire0[2:2];
   wire [1:1] sub_wire2 = sub_wire0[1:1];
   wire [0:0] sub_wire1 = sub_wire0[0:0];
   wire       sub_wire6 = clk_in;
   wire [1:0] sub_wire7 = {sub_wire8, sub_wire6};

   assign clk0_out   = sub_wire1;	
   assign clk90_out  = sub_wire2;	
   assign clk180_out = sub_wire3;	
   assign clk270_out = sub_wire4;	

   // PLL with external feedback
   altpll #(
     .bandwidth_type("AUTO"),
     .clk0_divide_by(1),
     .clk0_duty_cycle(50),
     .clk0_multiply_by(1),
     .clk0_phase_shift("0"),
     .clk1_divide_by(1),
     .clk1_duty_cycle(50),
     .clk1_multiply_by(1),
     .clk1_phase_shift("1250"),
     .clk2_divide_by(1),
     .clk2_duty_cycle(50),
     .clk2_multiply_by(1),
     .clk2_phase_shift("2500"),
     .clk3_divide_by(1),
     .clk3_duty_cycle(50),
     .clk3_multiply_by(1),
     .clk3_phase_shift("3750"),
     .compensate_clock("CLK0"),
     .inclk0_input_frequency(5000),
     .intended_device_family("Stratix III"),
     .lpm_hint("UNUSED"),
     .lpm_type("altpll"),
     .operation_mode("NORMAL"),
//   .operation_mode("SOURCE_SYNCHRONOUS"),
     .pll_type("AUTO"),
     .port_activeclock("PORT_UNUSED"),
     .port_areset("PORT_USED"),
     .port_clkbad0("PORT_UNUSED"),
     .port_clkbad1("PORT_UNUSED"),
     .port_clkloss("PORT_UNUSED"),
     .port_clkswitch("PORT_UNUSED"),
     .port_configupdate("PORT_UNUSED"),
     .port_fbin("PORT_USED"),
     .port_fbout("PORT_USED"),
     .port_inclk0("PORT_USED"),
     .port_inclk1("PORT_UNUSED"),
     .port_locked("PORT_UNUSED"),
     .port_pfdena("PORT_UNUSED"),
     .port_phasecounterselect("PORT_UNUSED"),
     .port_phasedone("PORT_UNUSED"),
     .port_phasestep("PORT_UNUSED"),
     .port_phaseupdown("PORT_UNUSED"),
     .port_pllena("PORT_UNUSED"),
     .port_scanaclr("PORT_UNUSED"),
     .port_scanclk("PORT_UNUSED"),
     .port_scanclkena("PORT_UNUSED"),
     .port_scandata("PORT_UNUSED"),
     .port_scandataout("PORT_UNUSED"),
     .port_scandone("PORT_UNUSED"),
     .port_scanread("PORT_UNUSED"),
     .port_scanwrite("PORT_UNUSED"),
     .port_clk0("PORT_USED"),
     .port_clk1("PORT_USED"),
     .port_clk2("PORT_USED"),
     .port_clk3("PORT_USED"),
     .port_clk4("PORT_UNUSED"),
     .port_clk5("PORT_UNUSED"),
     .port_clk6("PORT_UNUSED"),
     .port_clk7("PORT_UNUSED"),
     .port_clk8("PORT_UNUSED"),
     .port_clk9("PORT_UNUSED"),
     .port_clkena0("PORT_UNUSED"),
     .port_clkena1("PORT_UNUSED"),
     .port_clkena2("PORT_UNUSED"),
     .port_clkena3("PORT_UNUSED"),
     .port_clkena4("PORT_UNUSED"),
     .port_clkena5("PORT_UNUSED"),
     .using_fbmimicbidir_port("OFF"),
     .width_clock(10))
   altpll_internal (
     .fbin (),//(clkfb_in),
     .inclk (sub_wire7),
     .areset (rst),
     .clk (sub_wire0),
     .fbout (),//(clkfb_out),
     .activeclock (),
     .clkbad (),
     .clkena ({6{1'b1}}),
     .clkloss (),
     .clkswitch (1'b0),
     .configupdate (1'b0),
     .enable0 (),
     .enable1 (),
     .extclk (),
     .extclkena ({4{1'b1}}),
     .fbmimicbidir (),
     .locked (),
     .pfdena (1'b1),
     .phasecounterselect ({4{1'b1}}),
     .phasedone (),
     .phasestep (1'b1),
     .phaseupdown (1'b1),
     .pllena (1'b1),
     .scanaclr (1'b0),
     .scanclk (1'b0),
     .scanclkena (1'b1),
     .scandata (1'b0),
     .scandataout (),
     .scandone (),
     .scanread (1'b0),
     .scanwrite (1'b0),
     .sclkout0 (),
     .sclkout1 (),
     .vcooverrange (),
     .vcounderrange ()
   );
`endif   // ALTERA

//`ifdef GENERIC_PRIMITIVES
//`endif   // GENERIC_PRIMITIVES


endmodule   // dcm_pll


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
module versatile_mem_ctrl_ddr (
  // DDR2 SDRAM side
  ck_o, ck_n_o, 
  dq_io, dqs_io, dqs_n_io, 
  dm_rdqs_io,
  //rdqs_n_i, odt_o, 
  // Memory controller side
  tx_dat_i, rx_dat_o,
  dq_en, dqm_en,
  rst, clk_0, clk_90, clk_180, clk_270
  );

  output        ck_o;
  output        ck_n_o;
  inout  [15:0] dq_io;
  inout   [1:0] dqs_io;
  inout   [1:0] dqs_n_io;
  inout   [1:0] dm_rdqs_io;
  //input   [1:0] rdqs_n_i;
  //output        odt_o;
  input  [35:0] tx_dat_i;
  output [31:0] rx_dat_o;
  input         dq_en;
  input         dqm_en;
  input         rst;
  input         clk_0;
  input         clk_90;
  input         clk_180;
  input         clk_270;

  reg    [31:0] dq_rx_reg;
  wire   [31:0] dq_rx;
  wire    [1:0] dqs_o, dqs_n_o, dqm_o;
  wire   [15:0] dq_o;
  wire    [1:0] dqs_delayed, dqs_n_delayed;

  wire   [15:0] dq_iobuf;
  wire    [1:0] dqs_iobuf, dqs_n_iobuf;

  genvar        i;

///////////////////////////////////////////////////////////////////////////////
// Common for both Xilinx and Altera
///////////////////////////////////////////////////////////////////////////////

  // Generate clock with equal delay as data
  ddr_ff_out ddr_ff_out_ck (
    .Q(ck_o),
    .C0(clk_0),
    .C1(clk_180),
    .CE(1'b1),
    .D0(1'b1),
    .D1(1'b0),
    .R(1'b0),
    .S(1'b0));

  ddr_ff_out ddr_ff_out_ck_n (
    .Q(ck_n_o),
    .C0(clk_0),
    .C1(clk_180),
    .CE(1'b1),
    .D0(1'b0),
    .D1(1'b1),
    .R(wb_rst),
    .S(1'b0));

  // Generate strobe with equal delay as data
  generate
    for (i=0; i<2; i=i+1) begin:dqs_oddr
      ddr_ff_out ddr_ff_out_dqs (
        .Q(dqs_o[i]),
        .C0(clk_0),
        .C1(clk_180),
        .CE(1'b1),
        .D0(1'b1),
        .D1(1'b0),
        .R(1'b0),
        .S(1'b0));
    end
  endgenerate

  generate
    for (i=0; i<2; i=i+1) begin:dqs_n_oddr
      ddr_ff_out ddr_ff_out_dqs_n (
        .Q(dqs_n_o[i]),
        .C0(clk_0),
        .C1(clk_180),
        .CE(1'b1),
        .D0(1'b0),
        .D1(1'b1),
        .R(wb_rst),
        .S(1'b0));
    end
  endgenerate



///////////////////////////////////////////////////////////////////////////////
// Xilinx
///////////////////////////////////////////////////////////////////////////////

`ifdef XILINX   

  reg  [15:0] dq_tx_reg;
  wire [15:0] dq_tx;
  reg   [3:0] dqm_tx_reg;
  wire  [3:0] dqm_tx;

  // IO BUFFER
  // DDR data to/from DDR2 SDRAM
  generate
    for (i=0; i<16; i=i+1) begin:iobuf_dq
      IOBUF u_iobuf_dq (
        .I(dq_o[i]),
        .T(!dq_en),
        .IO(dq_io[i]),
        .O(dq_iobuf[i]));
    end
  endgenerate

  // DQS strobe to/from DDR2 SDRAM
  generate
    for (i=0; i<2; i=i+1) begin:iobuf_dqs
      IOBUF u_iobuf_dqs (
        .I(dqs_o[i]),
        .T(!dq_en),
        .IO(dqs_io[i]),
        .O(dqs_iobuf[i]));
    end
  endgenerate

  // DQS strobe to/from DDR2 SDRAM
  generate
    for (i=0; i<2; i=i+1) begin:iobuf_dqs_n
      IOBUF u_iobuf_dqs_n (
        .I(dqs_n_o[i]),
        .T(!dq_en),
        .IO(dqs_n_io[i]),
        .O(dqs_n_iobuf[i]));
    end
  endgenerate


  // Data from Tx FIFO
  always @ (posedge clk_270 or posedge wb_rst)
    if (wb_rst)
      dq_tx_reg[15:0] <= 16'h0;
    else
      if (dqm_en)
        dq_tx_reg[15:0] <= tx_dat_i[19:4];
      else
        dq_tx_reg[15:0] <= tx_dat_i[19:4];

  assign dq_tx[15:0] = tx_dat_i[35:20];

  // Output Data DDR flip-flops
  generate
    for (i=0; i<16; i=i+1) begin:data_out_oddr
      ddr_ff_out ddr_ff_out_inst_0 (
        .Q(dq_o[i]),
        .C0(clk_270),
        .C1(clk_90),
        .CE(dq_en),
        .D0(dq_tx[i]),
        .D1(dq_tx_reg[i]),
        .R(wb_rst),
        .S(1'b0));
    end
  endgenerate

  // Data mask from Tx FIFO
  always @ (posedge clk_270 or posedge wb_rst)
    if (wb_rst)
      dqm_tx_reg[1:0] <= 2'b00;
    else
      if (dqm_en)
        dqm_tx_reg[1:0] <= 2'b00;
      else
        dqm_tx_reg[1:0] <= tx_dat_i[1:0];

  always @ (posedge clk_180 or posedge wb_rst)
    if (wb_rst)
      dqm_tx_reg[3:2] <= 2'b00;
    else
      if (dqm_en)
        dqm_tx_reg[3:2] <= 2'b00;
      else
        dqm_tx_reg[3:2] <= tx_dat_i[3:2];

  assign dqm_tx[1:0] = (dqm_en) ? 2'b00 : tx_dat_i[3:2];

  // Mask output DDR flip-flops
  generate
    for (i=0; i<2; i=i+1) begin:data_mask_oddr
      ddr_ff_out ddr_ff_out_inst_1 (
        .Q(dqm_o[i]),
        .C0(clk_270),
        .C1(clk_90),
        .CE(dq_en),
        .D0(!dqm_tx[i]),
        .D1(!dqm_tx_reg[i]),
        .R(wb_rst),
        .S(1'b0));
    end
  endgenerate

  // Data mask to DDR2 SDRAM
  generate
    for (i=0; i<2; i=i+1) begin:iobuf_dqm
      IOBUF u_iobuf_dqm (
        .I(dqm_o[i]),
        .T(!dq_en),
        .IO(dm_rdqs_io[i]),
        .O());
    end
  endgenerate

    
`ifdef INT_CLOCKED_DATA_CAPTURE
  // Data in
  // DDR flip-flops
  generate
    for (i=0; i<16; i=i+1) begin:iddr2gen
      ddr_ff_in ddr_ff_in_inst_0 (
        .Q0(dq_rx[i]), 
        .Q1(dq_rx[i+16]), 
        .C0(clk_270), 
        .C1(clk_90),
        .CE(1'b1), 
        .D(dq_io[i]),   
        .R(wb_rst),  
        .S(1'b0));
    end
  endgenerate

  // Data to Rx FIFO
  always @ (posedge clk_0 or posedge wb_rst)
    if (wb_rst)
      dq_rx_reg[31:16] <= 16'h0;
    else
      dq_rx_reg[31:16] <= dq_rx[31:16];

  always @ (posedge clk_180 or posedge wb_rst)
    if (wb_rst)
      dq_rx_reg[15:0] <= 16'h0;
    else
      dq_rx_reg[15:0] <= dq_rx[15:0];

  assign rx_dat_o = dq_rx_reg;
`endif   // INT_CLOCKED_DATA_CAPTURE


`ifdef DEL_DQS_DATA_CAPTURE_1

  wire  [1:0] dqs_iodelay, dqs_n_iodelay;

  // Delay DQS
  assign # 2 dqs_iodelay   = dqs_iobuf;
  assign # 2 dqs_n_iodelay = dqs_n_iobuf;

  // IDDR FF
  generate
    for (i=0; i<16; i=i+1) begin:iddr_dq
      ddr_ff_in ddr_ff_in_inst_0 (
        .Q0(dq_rx[i]), 
        .Q1(dq_rx[i+16]), 
        .C0(dqs_iodelay[0]), 
        .C1(dqs_n_iodelay[0]), 
        .CE(1'b1), 
        .D(dq_iobuf[i]),
        .R(wb_rst),  
        .S(1'b0));
    end
  endgenerate

  // Data to Rx FIFO
  always @ (posedge clk_0 or posedge wb_rst)
    if (wb_rst)
      dq_rx_reg[31:16] <= 16'h0;
    else
      dq_rx_reg[31:16] <= dq_rx[31:16];

  always @ (posedge clk_0 or posedge wb_rst)
    if (wb_rst)
      dq_rx_reg[15:0] <= 16'h0;
    else
      dq_rx_reg[15:0] <= dq_rx[15:0];

  assign rx_dat_o = dq_rx_reg;
  
`endif   // DEL_DQS_DATA_CAPTURE_1


`ifdef DEL_DQS_DATA_CAPTURE_2

  wire [15:0] dq_iodelay;
  wire  [1:0] dqs_iodelay, dqs_n_iodelay;
  wire [15:0] dq_iddr_fall, dq_iddr_rise;
  reg  [15:0] dq_fall_1, dq_rise_1;
  reg  [15:0] dq_fall_2, dq_rise_2;
  reg  [15:0] dq_fall_3, dq_rise_3;


  // Delay data
  // IODELAY is available in the Xilinx Virtex FPGAs
  /*IODELAY # (
    .DELAY_SRC(),
    .IDELAY_TYPE(),
    .HIGH_PERFORMANCE_MODE(),
    .IDELAY_VALUE(),
    .ODELAY_VALUE())
   u_idelay_dq (
      .DATAOUT(),
      .C(),
      .CE(),
      .DATAIN(),
      .IDATAIN(),
      .INC(),
      .ODATAIN(),
      .RST(),
      .T());*/
  // IODELAY is NOT available in the Xilinx Spartan FPGAs, 
  // equivalent delay can be implemented using a chain of LUT
  /*lut_delay lut_delay_dq (
    .clk_i(),
    .d_i(dq_iobuf),
    .d_o(dq_iodelay));*/

  // IDDR FF
  generate
    for (i=0; i<16; i=i+1) begin:iddr_dq
      ddr_ff_in ddr_ff_in_inst_0 (
        .Q0(dq_iddr_fall[i]), 
        .Q1(dq_iddr_rise[i]), 
        .C0(dqs_iodelay[0]), 
        .C1(dqs_n_iodelay[0]),
        .CE(1'b1), 
        .D(dq_iobuf[i]),
        .R(wb_rst),  
        .S(1'b0));
    end
  endgenerate
   
  // Rise & fall clocked FF
  always @ (posedge clk_0 or posedge wb_rst)
    if (wb_rst) begin
      dq_fall_1 <= 16'h0;
      dq_rise_1 <= 16'h0;
    end else begin
      dq_fall_1 <= dq_iddr_fall;
      dq_rise_1 <= dq_iddr_rise;
    end

  always @ (posedge clk_180 or posedge wb_rst)
    if (wb_rst) begin
      dq_fall_2 <= 16'h0;
      dq_rise_2 <= 16'h0;
    end else begin
      dq_fall_2 <= dq_iddr_fall;
      dq_rise_2 <= dq_iddr_rise;
    end
   
  // Fall sync FF
  always @ (posedge clk_0 or posedge wb_rst)
    if (wb_rst) begin
      dq_fall_3 <= 16'h0;
      dq_rise_3 <= 16'h0;
    end else begin
      dq_fall_3 <= dq_fall_2;
      dq_rise_3 <= dq_rise_2;
    end
  
  // Mux
  assign rx_dat_o[31:16] = dq_fall_1;
  assign rx_dat_o[15:0]  = dq_rise_1;

  // DDR DQS to IODUFDS
  // Delay DQS
  // IODELAY is NOT available in the Xilinx Spartan FPGAs, 
  // equivalent delay can be implemented using a chain of LUTs
/*
  generate
    for (i=0; i<2; i=i+1) begin:lut_delay_dqs
      lut_delay lut_delay_dqs (
        .d_i(dqs_iobuf[i]),
        .d_o(dqs_iodelay[i]));
    end
  endgenerate
  generate
    for (i=0; i<2; i=i+1) begin:lut_delay_dqs_n
      lut_delay lut_delay_dqs_n (
        .d_i(dqs_n_iobuf[i]),
        .d_o(dqs_n_iodelay[i]));
    end
  endgenerate
*/

  assign # 2 dqs_iodelay   = dqs_iobuf;
  assign # 2 dqs_n_iodelay = dqs_n_iobuf;
  

  // BUFIO (?)
`endif   // DEL_DQS_DATA_CAPTURE_2

`endif   // XILINX


///////////////////////////////////////////////////////////////////////////////
// Altera
///////////////////////////////////////////////////////////////////////////////

`ifdef ALTERA

  wire  [3:0] dqm_tx;

  // Data out
  // DDR flip-flops
  generate
    for (i=0; i<16; i=i+1) begin:data_out_oddr
      ddr_ff_out ddr_ff_out_inst_0 (
        .Q(dq_o[i]),
        .C0(clk_270),
        .C1(clk_90),
        .CE(dq_en),
        .D0(tx_dat_i[i+16+4]),
        .D1(tx_dat_i[i+4]),
        .R(wb_rst),
        .S(1'b0));
    end
  endgenerate

  // Assign outport
  assign dq_io = dq_en ? dq_o : {16{1'bz}};

  // Data mask
  // Data mask from Tx FIFO
  assign dqm_tx = dqm_en ? {4{1'b0}} : tx_dat_i[3:0];

  // DDR flip-flops
  generate
    for (i=0; i<2; i=i+1) begin:data_mask_oddr
      ddr_ff_out ddr_ff_out_inst_1 (
        .Q(dqm_o[i]),
        .C0(clk_270),
        .C1(clk_90),
        .CE(dq_en),
        .D0(!dqm_tx[i+2]),
        .D1(!dqm_tx[i]),
        .R(wb_rst),
        .S(1'b0));
    end
  endgenerate

  // Assign outport
  assign dm_rdqs_io = dq_en ? dqm_o : 2'bzz;


  // Data in
`ifdef INT_CLOCKED_DATA_CAPTURE
  // DDR flip-flops
  generate
    for (i=0; i<16; i=i+1) begin:iddr2gen
      ddr_ff_in ddr_ff_in_inst_0 (
        .Q0(dq_rx[i]), 
        .Q1(dq_rx[i+16]), 
        .C0(clk_270), 
        .C1(clk_90),
        .CE(1'b1), 
        .D(dq_io[i]),   
        .R(wb_rst),  
        .S(1'b0));
    end
  endgenerate

  // Data to Rx FIFO
  always @ (posedge clk_180 or posedge wb_rst)
    if (wb_rst)
      dq_rx_reg <= 32'h0;
    else
      dq_rx_reg <= dq_rx;

  assign rx_dat_o = dq_rx_reg;
`endif   // INT_CLOCKED_DATA_CAPTURE

`ifdef DEL_DQS_DATA_CAPTURE_1
   // Delay DQS
   // DDR FF
`endif   // DEL_DQS_DATA_CAPTURE_1

`ifdef DEL_DQS_DATA_CAPTURE_2
   // DDR data to IOBUFFER
   // Delay data (?)
   // DDR FF
   // Rise & fall clocked FF
   // Fall sync FF
   // Mux
   // DDR DQS to IODUFDS
   // Delay DQS
   // BUFIO (?)
`endif   // DEL_DQS_DATA_CAPTURE_2

`endif   // ALTERA


endmodule   // versatile_mem_ctrl_ddr


`timescale 1ns/1ns


//
// Specify either type of memory
// or
// BA_SIZE, ROW_SIZE, COL_SIZE and SDRAM_DATA_WIDTH
//
// either in this file or as command line option; +define+MT48LC16M16
//

// number of adr lines to use
// 2^2 = 4 32 bit word burst
//`define BURST_SIZE 2


// DDR2 SDRAM
// MT47H32M16 – 8 Meg x 16 x 4 banks
`define MT47H32M16
`ifdef MT47H32M16
// using 1 of MT47H32M16
// SDRAM data width is 16
`define BURST_SIZE 4  
`define SDRAM_DATA_WIDTH 16
`define COL_SIZE 10  
`define ROW_SIZE 13
`define BA_SIZE 2

`define SDRAM16
`define BA tx_fifo_dat_o[28:27]
`define ROW tx_fifo_dat_o[26:14]
`define COL {4'b0000,tx_fifo_dat_o[13:10],burst_adr,1'b0}
`define WORD_SIZE 1
`define WB_ADR_HI 24
`define WB_ADR_LO 2

// Mode Register (MR) Definition
// [16]    (BA2)   1'b0
// [15:14] (BA1-0) Mode Register Definition (MR): 2'b00 - Mode Register (MR)
// [13]    (A13)   1'b0
// [12]    (A12)   PD Mode (PD): 1'b0 - Fast exit (normal), 1'b1 - Slow exit (low power)
// [11:9]  (A11-9) Write Recovery (WR): 3'b000 - reserved, 3b'001 - 2, ... , 3b'111 - 8
// [8]     (A8)    DLL Reset (DLL): 1'b0 - No, 1'b1 - Yes
// [7]     (A7)    Mode (TM): 1'b0 - Normal, 1'b1 - Test
// [6:4]   (A5-4)  CAS Latency (CL): 3'b011 - 3, ... , 3'b111 - 7
// [3]     (A3)    Burst Type (BT): 1'b0 - Sequential, 1'b1 - Interleaved
// [2:0]   (A2-0)  Burst Length (BL): 3'b010 - 4, 3'b011 - 8
`define MR  2'b00
`define PD  1'b0
`define WR  3'b001
`define DLL 1'b0
`define DLL_RST 1'b1
`define TM  1'b0
`define CL  3'b100
`define BT  1'b0
`define BL  3'b011

// Extended Mode Register (EMR) Definition
// [16]    (BA2)    1'b0
// [15:14] (BA1-0)  Mode Register Set (MRS): 2'b01 - Extended Mode Register (EMR)
// [13]    (A13)    1'b0
// [12]    (A12)    Outputs (OUT): 1'b0 - Enabled, 1'b1 - Disabled
// [11]    (A11)    RDQS Enable (RDQS): 1'b0 - Enabled, 1'b1 - Disabled
// [10]    (A10)    DQS# Enable (DQS): 1'b0 - Enabled, 1'b1 - Disabled
// [9:7]   (A9-7)   OCD Opearation (OCD): 3'b000 - OCD exit, 3b'111 - Enable OCD defaults
// [6,2]   (A6, A2) RTT Nominal (RTT6,2): 2'b00 - Disabled, 2'b01 - 75 ohm, 
//                                        2'b10 - 150 ohm, 2'b11 - 50 ohm,
// [5:3]   (A5-3)   Posted CAS# Additive Latenct (AL): 3'b000 - 0, ... , 3'b110 - 6
// [1]     (A1)     Output Drive Strength (ODS): 1'b0 - Full, 1'b1 - Reduced
// [0]     (A0)     DLL Enable (DLL_EN): 1'b0 - Enable (normal), 1'b1 - Disable (test/debug)
`define MRS    2'b01
`define OUT    1'b0
`define RDQS   1'b0
`define DQS    1'b0
`define OCD    3'b000
`define OCD_DEFAULT 3'b111
`define RTT6   1'b0
`define RTT2   1'b0
`define AL     3'b000
`define ODS    1'b0
`define DLL_EN 1'b0

// Extended Mode Register 2 (EMR2) Definition
// [16]    (BA2)    1'b0
// [15:14] (BA1-0)  Mode Register Set (MRS2): 2'b10 - Extended Mode Register 2 (EMR2)
// [13:8]  (A13-8)  6'b000000
// [7]     (A7)     SRT Enable (SRT): 1'b0 - 1x refresh rate (0 - 85 C), 
//                                    1'b1 - 2x refresh rate (> 85 C)
// [6:0]   (A6-0)   7'b0000000
`define MRS2 2'b10
`define SRT  1'b0

// Extended Mode Register 3 (EMR3) Definition
// [16]    (BA2)    1'b0
// [15:14] (BA1-0)  Mode Register Set (MRS): 2'b11 - Extended Mode Register 2 (EMR2)
// [13:0]  (A13-0)  14'b00000000000000
`define MRS3 2'b11

// Addr to SDRAM {ba[1:0],a[12:0]}
`define A_LMR     {`MR,`PD,`WR,`DLL,`TM,`CL,`BT,`BL}
`define A_LMR_DLL_RST {`MR,`PD,`WR,`DLL_RST,`TM,`CL,`BT,`BL}
`define A_LEMR    {`MRS,`OUT,`RDQS,`DQS,`OCD,`RTT6,`AL,`RTT2,`ODS,`DLL_EN}
`define A_LEMR_OCD_DEFAULT {`MRS,`OUT,`RDQS,`DQS,`OCD_DEFAULT,`RTT6,`AL,`RTT2,`ODS,`DLL}
`define A_LEMR2   {`MRS2,5'b00000,`SRT,7'b0000000}
`define A_LEMR3   {`MRS3,13'b0000000000000}
`define A_PRE     {2'b00,13'b0010000000000}
`define A_ACT     {`BA,`ROW}
`define A_READ    {`BA,`COL}
`define A_WRITE   {`BA,`COL}
`define A_DEFAULT {2'b00,13'b0000000000000}

// Command
`define CMD {ras, cas, we}
`define CMD_NOP   3'b111
`define CMD_AREF  3'b001
`define CMD_LMR   3'b000
`define CMD_LEMR  3'b000
`define CMD_LEMR2 3'b000
`define CMD_LEMR3 3'b000
`define CMD_PRE   3'b010
`define CMD_ACT   3'b011
`define CMD_READ  3'b101
`define CMD_WRITE 3'b100
`define CMD_BT    3'b110

`endif //  `ifdef MT47H32M16

//
// Specify either type of memory
// or
// BA_SIZE, ROW_SIZE, COL_SIZE and SDRAM_DATA_WIDTH
//
// either in this file or as command line option; +define+MT48LC16M16
//

// Most of these defines have an effect on things in fsm_sdr_16.v

//`define MT48LC32M16   // 64MB part
`define MT48LC16M16   // 32MB part
//`define MT48LC4M16    //  8MB part

// Define this to allow indication that a burst read is still going
// to the wishbone state machine, so it doesn't start emptying the
// ingress fifo after a aborted burst before the burst read is
// actually finished.
`define SDRAM_WB_SAME_CLOCKS

// If intending to burst write, and the wishbone clock is about 1/4 the speed
// of the SDRAM clock, then the data may come late, and this triggers a bug
// during write. To avoid this we can just wait a little longer for data when
// burst reading (there's no almost_empty signal from the FIFO)
`define SLOW_WB_CLOCK


`ifdef MT48LC32M16
// using 1 of MT48LC32M16
// SDRAM data width is 16
  
`define SDRAM_DATA_WIDTH 16
`define COL_SIZE 10
`define ROW_SIZE 13
`define BA_SIZE 2

`endif //  `ifdef MT48LC16M16

`ifdef MT48LC16M16
// using 1 of MT48LC16M16
// SDRAM data width is 16
  
`define SDRAM_DATA_WIDTH 16
`define COL_SIZE 9  
`define ROW_SIZE 13
`define BA_SIZE 2

`endif //  `ifdef MT48LC16M16

`ifdef MT48LC4M16
// using 1 of MT48LC4M16
// SDRAM data width is 16
  
`define SDRAM_DATA_WIDTH 16
`define COL_SIZE 8  
`define ROW_SIZE 12
`define BA_SIZE 2

`endif //  `ifdef MT48LC4M16

// LMR
// [12:10] reserved
// [9]     WB, write burst; 0 - programmed burst length, 1 - single location
// [8:7]   OP Mode, 2'b00
// [6:4]   CAS Latency; 3'b010 - 2, 3'b011 - 3
// [3]     BT, Burst Type; 1'b0 - sequential, 1'b1 - interleaved
// [2:0]   Burst length; 3'b000 - 1, 3'b001 - 2, 3'b010 - 4, 3'b011 - 8, 3'b111 - full page
`define INIT_WB 1'b0
`define INIT_CL 3'b010
`define INIT_BT 1'b0
`define INIT_BL 3'b001
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
// async FIFO with multiple queues, multiple data
`define ORIGINAL_EGRESS_FIFO
`ifdef ORIGINAL_EGRESS_FIFO
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
`else // !`ifdef ORIGINAL_EGRESS_FIFO
module egress_fifo (
    d, fifo_full, write, write_enable, clk1, rst1,
    q, fifo_empty, read_adr, read_data, read_enable, clk2, rst2
);

parameter a_hi_size = 2;
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
wire [a_lo_size-1:0] wadr;
wire [a_lo_size-1:0] radr;
wire [data_width-1:0] wdata;
wire [data_width-1:0] wdataa[0:nr_of_queues-1];

reg read_adr_reg;
reg [0:nr_of_queues-1] read_enable_reg;

genvar i;
integer j,k,l;

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
        
   // 0        
   gray_counter wadrcnt0
     (
      .cke(write & write_enable[0]),
      .q(fifo_wadr_gray[0]),
      .q_bin(fifo_wadr_bin[0]),
      .rst(rst1),
      .clk(clk1)
      );
   
   gray_counter radrcnt0
     (
      .cke((read_adr_reg | read_data) & read_enable_reg[0]),
      .q(fifo_radr_gray[0]),
      .q_bin(fifo_radr_bin[0]),
      .rst(rst2),
      .clk(clk2)
      );
   
   versatile_fifo_async_cmp
     #(
      .ADDR_WIDTH(a_lo_size)
      )
   egresscmp0
     ( 
       .wptr(fifo_wadr_gray[0]), 
       .rptr(fifo_radr_gray[0]), 
       .fifo_empty(fifo_empty[0]), 
       .fifo_full(fifo_full[0]), 
       .wclk(clk1), 
       .rclk(clk2), 
       .rst(rst1)
       );

   // 1
      gray_counter wadrcnt1
     (
      .cke(write & write_enable[1]),
      .q(fifo_wadr_gray[1]),
      .q_bin(fifo_wadr_bin[1]),
      .rst(rst1),
      .clk(clk1)
      );
   
   gray_counter radrcnt1
     (
      .cke((read_adr_reg | read_data) & read_enable_reg[1]),
      .q(fifo_radr_gray[1]),
      .q_bin(fifo_radr_bin[1]),
      .rst(rst2),
      .clk(clk2)
      );
   
   versatile_fifo_async_cmp
     #(
      .ADDR_WIDTH(a_lo_size)
      )
   egresscmp1
     ( 
       .wptr(fifo_wadr_gray[1]), 
       .rptr(fifo_radr_gray[1]), 
       .fifo_empty(fifo_empty[1]), 
       .fifo_full(fifo_full[1]), 
       .wclk(clk1), 
       .rclk(clk2), 
       .rst(rst1)
       );

   // 2
      gray_counter wadrcnt2
     (
      .cke(write & write_enable[2]),
      .q(fifo_wadr_gray[2]),
      .q_bin(fifo_wadr_bin[2]),
      .rst(rst1),
      .clk(clk1)
      );
   
   gray_counter radrcnt2
     (
      .cke((read_adr_reg | read_data) & read_enable_reg[2]),
      .q(fifo_radr_gray[2]),
      .q_bin(fifo_radr_bin[2]),
      .rst(rst2),
      .clk(clk2)
      );
   
   versatile_fifo_async_cmp
     #(
      .ADDR_WIDTH(a_lo_size)
      )
   egresscmp2
     ( 
       .wptr(fifo_wadr_gray[2]), 
       .rptr(fifo_radr_gray[2]), 
       .fifo_empty(fifo_empty[2]), 
       .fifo_full(fifo_full[2]), 
       .wclk(clk1), 
       .rclk(clk2), 
       .rst(rst1)
       );

   
   assign wadr = (fifo_wadr_bin[0] & {a_lo_size{write_enable[0]}}) |
		 (fifo_wadr_bin[1] & {a_lo_size{write_enable[1]}}) |
		 (fifo_wadr_bin[2] & {a_lo_size{write_enable[2]}});
   
   assign radr = (fifo_radr_bin[0] & {a_lo_size{read_enable_reg[0]}}) |
		 (fifo_radr_bin[1] & {a_lo_size{read_enable_reg[1]}}) |
		 (fifo_radr_bin[2] & {a_lo_size{read_enable_reg[2]}});
   
     
   assign wdataa[0] = d[108-1:72];
   assign wdataa[1] = d[72-1:36];
   assign wdataa[2] = d[36-1:0];
   
   assign wdata = ( d[108-1:72] & {data_width{write_enable[0]}}) |
		  ( d[72-1:36]  & {data_width{write_enable[1]}}) |
		  ( d[36-1:0]   & {data_width{write_enable[2]}});   

   wire [1:0] wadr_top;
   assign wadr_top = write_enable[1] ? 2'b01 :
		     write_enable[2] ? 2'b10 :
		     2'b00;
   wire [1:0] radr_top;
   assign radr_top = read_enable_reg[1] ? 2'b01 :
		     read_enable_reg[2] ? 2'b10 :
		     2'b00;
      
vfifo_dual_port_ram_dc_sw 
  # ( 
      .DATA_WIDTH(data_width), 
      .ADDR_WIDTH(2+a_lo_size)
      )
    dpram (
    .d_a(wdata),
    .adr_a({wadr_top,wadr}), 
    .we_a(write),
    .clk_a(clk1),
    .q_b(fifo_q),
    .adr_b({radr_top,radr}),
    .clk_b(clk2) );

   // Added registering of FIFO output to break a timing path
   always@(posedge clk2)
     q <= fifo_q;
   

endmodule
`endif // !`ifdef ORIGINAL_EGRESS_FIFO
// true dual port RAM, sync

`ifdef ACTEL
	`define SYN 
`endif
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
`timescale 1ns/1ns
`include "sdr_16_defines.v"
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
   
   input [`BA_SIZE+`ROW_SIZE+`COL_SIZE-1:0] adr_i;
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

   wire [`BA_SIZE-1:0] 			 bank;
   wire [`ROW_SIZE-1:0] 			 row;
   wire [`COL_SIZE-1:0] 			 col;
   wire [12:0] 				 col_reg_a10_fix;
   reg [0:31] 				 shreg;
   wire 				 stall; // active if write burst need data

   reg [0:15] 				 fifo_sel_reg_int;
   reg [1:0] 				 fifo_sel_domain_reg_int;

   // adr_reg {ba,row,col,we}
   reg [1:0] 				 ba_reg;  
   reg [`ROW_SIZE-1:0] 			 row_reg;
   reg [`COL_SIZE-1:0] 			 col_reg;
   reg 					 we_reg;
   reg [1:0] 				 bte_reg;
   reg [2:0] 				 cti_reg;

   // to keep track of open rows per bank
   reg [`ROW_SIZE-1:0] 			 open_row[0:3];
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
`define FSM_INIT 3'b000
`define FSM_IDLE 3'b001
`define FSM_RFR  3'b010
`define FSM_ADR  3'b011
`define FSM_PCH  3'b100
`define FSM_ACT  3'b101
`define FSM_W4D  3'b110
`define FSM_RW   3'b111
   
   reg [2:0] 				 state, next;

   assign debug_state = state;

   function [12:0] a10_fix;
      input [`COL_SIZE-1:0] 		 a;
      integer 				 i;
      begin
	 for (i=0;i<13;i=i+1) begin
            if (i<10)
              if (i<`COL_SIZE)
                a10_fix[i] = a[i];
              else
                a10_fix[i] = 1'b0;
            else if (i==10)
              a10_fix[i] = 1'b0;
            else
              if (i<`COL_SIZE)
                a10_fix[i] = a[i-1];
              else
                a10_fix[i] = 1'b0;
	 end
      end
   endfunction


   assign {bank,row,col} = adr_i;

   always @ (posedge sdram_clk or posedge sdram_rst)
     if (sdram_rst)
       state <= `FSM_INIT;
     else
       state <= next;
   
   always @*
     begin
	next = 3'bx;
	case (state)
	  `FSM_INIT:
	    if (shreg[31])          
	      next = `FSM_IDLE;
            else                    
	      next = `FSM_INIT;
	  `FSM_IDLE:   
	    if (refresh_req)        
	      next = `FSM_RFR;
            else if (!shreg[0] & !fifo_empty)   
	      next = `FSM_ADR;
            else                    
	      next = `FSM_IDLE;
	  `FSM_RFR: 
	    if (shreg[5])           
	      next = `FSM_IDLE;
            else                    
	      next = `FSM_RFR;
	  `FSM_ADR:
	    if (shreg[5])
	      begin
		 if (current_bank_closed_reg)   
		   next = `FSM_ACT;
		 else if (current_row_open_reg)
		   next = (we_reg) ?  `FSM_W4D : `FSM_RW;
		 else 		                     
		   next = `FSM_PCH;
	      end
            else                                            
	      next = `FSM_ADR;
	  `FSM_PCH:    
	    if (shreg[1])         
	      next = `FSM_ACT;
            else                    
	      next = `FSM_PCH;
	  `FSM_ACT:
	    if (shreg[2])
	      begin
`ifdef SLOW_WB_CLOCK
		 // Automatiacally go to wait for data if burst writing
		 if ((|bte_reg) & we_reg & cti_reg==increment) 
		   next = `FSM_W4D;
		 else if ((!fifo_empty | !we_reg)) 
		   next = `FSM_RW;
`else
		 if ((!fifo_empty | !we_reg)) 
		   next = `FSM_RW;
`endif
		 else if (fifo_empty)         
		   next = `FSM_W4D;
	      end
            else                                    
	      next = `FSM_ACT;
`ifdef SLOW_WB_CLOCK
	  // Add some wait here if bursting and the wishbone clock is slow
	  `FSM_W4D:    
	    if (!fifo_empty & ((cti_reg!=increment)|(cti_reg==increment /*& bte_reg==beat4*/  & shreg[14])))
	      next = `FSM_RW;
`else
	  `FSM_W4D:    
	    if (!fifo_empty) 
	      next = `FSM_RW;
`endif	  
            else             
	      next = `FSM_W4D;
	  `FSM_RW:     
	    if ((bte_reg==linear | !(cti_reg==increment)) & shreg[1])
              next = `FSM_IDLE;
            else if (bte_reg==beat4 & shreg[7])
              next = `FSM_IDLE;
`ifdef BEAT8
            else if (bte_reg==beat8 & shreg[15])
              next = `FSM_IDLE;
`endif
`ifdef BEAT16
            else if (bte_reg==beat16 & shreg[31])
              next = `FSM_IDLE;
`endif
            else
              next = `FSM_RW;
	endcase
     end // always @ *
   

   // active if write burst need data
   assign stall = state==`FSM_RW & next==`FSM_RW & fifo_empty & count0 & we_reg;

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
                                                  {4'b0000,{`ROW_SIZE*4{1'b0}}};
           {ba_reg,row_reg,col_reg,we_reg,cti_reg,bte_reg} <= 
                     {2'b00, {`ROW_SIZE{1'b0}}, {`COL_SIZE{1'b0}}, 1'b0,3'b000, 2'b00 };
	end else begin
           {ba,a,cmd} <= {2'b00,13'd0,cmd_nop};
           dqm <= 2'b11;
           cmd_aref <= 1'b0;
           cmd_read <= 1'b0;
           dq_oe <= 1'b0;
           case (state)
             `FSM_INIT:
               if (shreg[3]) begin
                  {ba,a,cmd} <= {2'b00, 13'b0010000000000, cmd_pch};
                  open_ba[ba_reg] <= 1'b0;
               end else if (shreg[7] | shreg[19])
                 {ba,a,cmd,cmd_aref} <= {2'b00, 13'd0, cmd_rfr,1'b1};
               else if (shreg[31])
                 {ba,a,cmd} <= 
		  {2'b00,3'b000,`INIT_WB,2'b00,`INIT_CL,`INIT_BT,`INIT_BL, cmd_lmr};
             `FSM_RFR:
               if (shreg[0]) begin
                  {ba,a,cmd} <= {2'b00, 13'b0010000000000, cmd_pch};
                  open_ba <= 4'b0000;
               end else if (shreg[2])
                 {ba,a,cmd,cmd_aref} <= {2'b00, 13'd0, cmd_rfr,1'b1};
             `FSM_ADR:
               if (shreg[4])
                 {ba_reg,row_reg,col_reg,we_reg,cti_reg,bte_reg} <= 
		                                {bank,row,col,we_i,cti_i,bte_i};
             `FSM_PCH:
               if (shreg[0]) begin
                  {ba,a,cmd} <= {ba_reg,13'd0,cmd_pch};
                  //open_ba <= 4'b0000;
		  open_ba[ba_reg] <= 1'b0;
               end
             `FSM_ACT:
               if (shreg[0]) begin
                  {ba,a,cmd} <= {ba_reg,(13'd0 | row_reg),cmd_act};
                  {open_ba[ba_reg],open_row[ba_reg]} <= {1'b1,row_reg};
               end
             `FSM_RW:
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
          `ifdef BEAT8
			   beat8:  {ba,a,col_reg[3:0]} <= 
				  {ba_reg,col_reg_a10_fix, col_reg[3:0] + 4'd1};
          `endif
          `ifdef BEAT16
			   beat16: {ba,a,col_reg[4:0]} <= 
				  {ba_reg,col_reg_a10_fix, col_reg[4:0] + 5'd1};
          `endif
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
     else if (next==`FSM_RW)
       fifo_read_data_en <= ~fifo_read_data_en;
     else
       fifo_read_data_en <= 1;

   reg [3:0] beat4_data_read_limiter; // Use this to record how many times we've pulsed fifo_rd_data
   // Only 3 bits, becuase we're looking at when fifo_read_data_en goes low - should only happen 3
   // times for a 4-beat burst
   always @(posedge sdram_clk)
     if (sdram_rst)
       beat4_data_read_limiter <= 0;
     else if(state==`FSM_ADR)
       beat4_data_read_limiter <= 0;
     else if (!fifo_read_data_en)
       beat4_data_read_limiter <= {beat4_data_read_limiter[2:0],1'b1};
   
   

   // rd_adr goes high when next adr is fetched from sync RAM and during write burst
   assign fifo_rd_adr  = state==`FSM_ADR & shreg[1];

   assign fifo_rd_data = (((state!=`FSM_RW & next==`FSM_RW)|(state==`FSM_RW & (cti_reg==increment && bte_reg==beat4 & fifo_read_data_en & !(&beat4_data_read_limiter)))) & we_reg & !fifo_empty);
   
   /*
   assign fifo_rd_data = ((state==`FSM_RW & next==`FSM_RW) & 
			  we_reg & !count0 & !fifo_empty);
*/
   assign state_idle = (state==`FSM_IDLE);

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
     else if (next==`FSM_RW & ((state==`FSM_ADR)|(state==`FSM_ACT)) & 
	      cti_reg==increment & (bte_reg==beat4) & !we_reg)
       fifo_we_record <= 4'b0001;
     else if (sdram_fifo_wr)
       fifo_we_record <= {fifo_we_record[2:0],1'b0};
`ifdef SDRAM_WB_SAME_CLOCKS   
   assign sdram_burst_reading = |fifo_we_record;
`else   
   assign sdram_burst_reading = 0;
`endif
   

endmodule
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

`define CTI_I 2:0
`define BTE_I 4:3
`define WE_I  5

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

`define INDEX (nr_of_wb_ports-i)*36-1:(nr_of_wb_ports-1-i)*36 
generate
    for (i=0;i<nr_of_wb_ports;i=i+1) begin : vector2array
        assign wb_adr_i[i] = wb_adr_i_v[`INDEX];
        assign wb_dat_i[i] = wb_dat_i_v[`INDEX];
        assign egress_fifo_di[`INDEX] = (state_idle[i]) ? 
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
           .we_i (wb_adr_i[i][`WE_I]),
           .cti_i(wb_adr_i[i][`CTI_I]),
           .bte_i(wb_adr_i[i][`BTE_I]),
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

endmodule`timescale 1ns/1ns
`ifdef DDR_16
 `include "ddr_16_defines.v"
`endif
`ifdef SDR_16
 `include "sdr_16_defines.v"
`endif
module versatile_mem_ctrl_top
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

`ifdef SDR_16
   ba_pad_o, a_pad_o, cs_n_pad_o, ras_pad_o, cas_pad_o, we_pad_o, dq_o, dqm_pad_o, dq_i, dq_oe, cke_pad_o,
`endif

`ifdef DDR_16
   ck_pad_o, ck_n_pad_o, cke_pad_o, ck_fb_pad_o, ck_fb_pad_i,
   cs_n_pad_o, ras_pad_o, cas_pad_o,  we_pad_o,
   dm_rdqs_pad_io,  ba_pad_o, addr_pad_o, dq_pad_io, dqs_pad_io, dqs_oe, dqs_n_pad_io, rdqs_n_pad_i, odt_pad_o,
`endif
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
   
`ifdef SDR_16
   output [1:0] 		       ba_pad_o;
   output [12:0] 		       a_pad_o;
   output 			       cs_n_pad_o;
   output 			       ras_pad_o;
   output 			       cas_pad_o;
   output 			       we_pad_o;
   output reg [(`SDRAM_DATA_WIDTH)-1:0] dq_o /*synthesis syn_useioff=1 syn_allow_retiming=0 */;
   output [1:0] 		       dqm_pad_o;
   input [(`SDRAM_DATA_WIDTH)-1:0]     dq_i ;
   output 			       dq_oe;
   output 			       cke_pad_o;
`endif
`ifdef DDR_16
   output 			       ck_pad_o;
   output 			       ck_n_pad_o;
   output 			       cke_pad_o;
   output 			       ck_fb_pad_o;
   input 			       ck_fb_pad_i;
   output 			       cs_n_pad_o;
   output 			       ras_pad_o;
   output 			       cas_pad_o;
   output 			       we_pad_o;
   inout [1:0] 			       dm_rdqs_pad_io;
   output [1:0] 		       ba_pad_o;
   output [12:0] 		       addr_pad_o;
   inout [15:0] 		       dq_pad_io;
   inout [1:0] 			       dqs_pad_io;
   output 			       dqs_oe;
   inout [1:0] 			       dqs_n_pad_io;
   input [1:0] 			       rdqs_n_pad_i;
   output 			       odt_pad_o;
`endif
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

`ifdef SDR_16

   wire ref_cnt_zero;
   reg [(`SDRAM_DATA_WIDTH)-1:0] dq_i_reg /*synthesis syn_useioff=1 syn_allow_retiming=0 */;
   reg [(`SDRAM_DATA_WIDTH)-1:0] dq_i_tmp_reg;
   reg [17:0] dq_o_tmp_reg;
   wire       cmd_aref, cmd_read;
   
   // refresch counter
   //ref_counter ref_counter0( .zq(ref_cnt_zero), .rst(sdram_rst), .clk(sdram_clk));
   ref_counter
`ifdef MT48LC32M16     
     #(.length(9), .wrap_value(67))
`endif   
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
      .adr_i({fifo_dat_o[0][`BA_SIZE+`ROW_SIZE+`COL_SIZE+6-2:6],1'b0}),
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

         defparam delay0.depth=`INIT_CL+2;   
         defparam delay0.width=1;
         delay delay0 (
		       .d(fifo_sel_reg[i]),
		       .q(fifo_sel_dly[i]),
		       .clk(sdram_clk),
		       .rst(sdram_rst)
		       );
      end
      
      defparam delay1.depth=`INIT_CL+2;   
      defparam delay1.width=2;
      delay delay1 (
		    .d(fifo_sel_domain_reg),
		    .q(fifo_sel_domain_dly),
		    .clk(sdram_clk),
		    .rst(sdram_rst)
		    );
      
      defparam delay2.depth=`INIT_CL+2;   
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


`endif //  `ifdef SDR_16


`ifdef DDR_16
   wire        read, write;
   wire        sdram_clk_90, sdram_clk_180, sdram_clk_270;
   wire        ck_fb;
   reg         cke, ras, cas, we, cs_n;
   wire        cke_d, ras_d, cas_d, we_d, cs_n_d;
   wire        ras_o, cas_o, we_o, cs_n_o;
   wire [1:0]  ba_o;
   wire [12:0] addr_o;
   reg  [1:0]  ba;
   wire [1:0]  ba_d;
   reg [12:0]  addr;
   wire [12:0] addr_d;
   wire        dq_en, dqm_en;
   reg [15:0]  dq_tx_reg;
   wire [15:0] dq_tx;
   reg [31:0]  dq_rx_reg;
   wire [31:0] dq_rx;
   wire [15:0] dq_o;
   reg [3:0]   dqm_tx_reg;
   wire [3:0]  dqm_tx;
   wire [1:0]  dqm_o, dqs_o, dqs_n_o;
   wire        ref_delay, ref_delay_ack;
   wire        bl_en, bl_ack;
   wire        tx_fifo_re, tx_fifo_re_i;
   //wire        adr_init_delay;
   //reg         adr_init_delay_i;
   reg [3:0]   burst_cnt;
   wire [3:0]  burst_next_cnt, burst_length;
   //wire        burst_mask;
   reg         burst_mask;
   wire [12:0] cur_row;
   wire  [3:0] burst_adr;
   //wire  [2:0] tx_fifo_b_sel_i_cur;
   wire  [2:0] rx_fifo_a_sel_i;
   //wire  [7:0] tx_fifo_empty;
   wire        rx_fifo_we;

   wire ref_cnt_zero;
   wire cmd_aref;
      
   // refresh counter
   ref_counter ref_counter0( 
     .zq(ref_cnt_zero),
     .rst(sdram_rst),
     .clk(sdram_clk));
   always @ (posedge sdram_clk or posedge sdram_rst)
   if (sdram_rst)
     refresh_req <= 1'b0;
   else
     if (ref_cnt_zero)
       refresh_req <= 1'b1;
     else if (cmd_aref)
       refresh_req <= 1'b0;

   // DDR SDRAM 16 FSM
   ddr_16 ddr_16_0
     (
      .adr_init(adr_init),
      .fifo_re(tx_fifo_re_i),
      .fifo_re_d(tx_fifo_re),
      .tx_fifo_dat_o(fifo_dat_o[fifo_sel_domain_reg]),
      .burst_adr(burst_adr),
      .fifo_empty(current_fifo_empty),
      .fifo_sel(),
      .read(read),
      .write(write),
      .ref_req(refresh_req),
      .ref_ack(cmd_aref),
      .ref_delay(ref_delay),
      .state_idle(idle),
      .ref_delay_ack(ref_delay_ack),
      .bl_en(bl_en),
      .bl_ack(bl_ack),
      .a({ba_o,addr_o}),
      .cmd({ras_o,cas_o,we_o}),
      .cs_n(cs_n_o),
      .cur_row(cur_row),
      .clk(sdram_clk_0),
      .rst(sdram_rst)
      );

   inc_adr inc_adr0
     (
      .adr_i(fifo_dat_o[fifo_sel_domain_reg][9:6]),
      .bte_i(fifo_dat_o[fifo_sel_domain_reg][4:3]),
      .cti_i(fifo_dat_o[fifo_sel_domain_reg][2:0]),
      .init(adr_init),
      .inc(),
      .adr_o(burst_adr),
      .done(done),
      .clk(sdram_clk_0),
      .rst(sdram_rst)
      );

   // Delay, refresh to activate/refresh
   ref_delay_counter ref_delay_counter0
     (
      .cke(ref_delay),
      .zq(ref_delay_ack),
      .clk(sdram_clk_0),
      .rst(sdram_rst)
      );
   
   // Burst length, DDR2 SDRAM
   burst_length_counter burst_length_counter0
     (
      .cke(bl_en),
      .zq(bl_ack),
      .clk(sdram_clk_0),
      .rst(sdram_rst)
      );

   // Wishbone burst length
   assign burst_length = (adr_init && fifo_dat_o[fifo_sel_domain_reg][2:0] == 3'b000) ? 4'd1 :   // classic cycle
                         (adr_init && fifo_dat_o[fifo_sel_domain_reg][2:0] == 3'b010) ? 4'd4 :   // incremental burst cycle
                         burst_length;

   // Burst mask
   // Burst length counter
   assign burst_next_cnt = (burst_cnt == 3) ? 4'd0 : burst_cnt + 4'd1;
   always @ (posedge sdram_clk_0 or posedge sdram_rst)
     if (sdram_rst)
       burst_cnt <= 4'h0;
     else
       if (bl_en)
         burst_cnt <= burst_next_cnt;
   // Burst Mask
   //assign burst_mask = (burst_cnt >= burst_length) ? 1'b1 : 1'b0;

   // Burst Mask
   always @ (posedge sdram_clk_0 or posedge sdram_rst)
     if (sdram_rst)
       burst_mask <= 1'b0;
     else
       burst_mask <= (burst_cnt >= burst_length) ? 1'b1 : 1'b0;

   // Delay address and control to compensate for delay in Tx FIOFs
   defparam delay0.depth=3; 
   defparam delay0.width=20;
   delay delay0 (
      .d({cs_n_o,1'b1,ras_o,cas_o,we_o,ba_o,addr_o}),
      .q({cs_n_d,cke_d,ras_d,cas_d,we_d,ba_d,addr_d}),
      .clk(sdram_clk_180),
      .rst(sdram_rst));

   // Assing outputs
   // Non-DDR outputs
   assign cs_n_pad_o  = cs_n_d;
   assign cke_pad_o   = cke_d;
   assign ras_pad_o   = ras_d;
   assign cas_pad_o   = cas_d;
   assign we_pad_o    = we_d;
   assign ba_pad_o    = ba_d;
   assign addr_pad_o  = addr_d;
   assign ck_fb_pad_o = ck_fb;
   assign dqs_oe      = dq_en;

   // Read latency, delay the control signals to fit latency of the DDR2 SDRAM
   defparam delay1.depth=`CL+`AL+4; 
   defparam delay1.width=1;
   delay delay1 
     (
      .d(read && !burst_mask),
      .q(fifo_wr),
      .clk(sdram_clk_0),
      .rst(sdram_rst)
      );
   
   // write latency, delay the control signals to fit latency of the DDR2 SDRAM
   defparam delay2.depth=`CL+`AL+1;
   defparam delay2.width=1;
   delay delay2 
     (
      .d(write),
      .q(dq_en),
      .clk(sdram_clk_270),
      .rst(sdram_rst)
      );

   // write latency, delay the control signals to fit latency of the DDR2 SDRAM
   defparam delay21.depth=`CL+`AL;
   defparam delay21.width=1;
   delay delay21 
     (
      .d(burst_mask),
      .q(dqm_en),
      .clk(sdram_clk_270),
      .rst(sdram_rst)
      );

/*   // if CL>3 delay read from Tx FIFO
   defparam delay3.depth=`CL+`AL-3;
   defparam delay3.width=1;
   delay delay3 
     (		 
		 .d(tx_fifo_re_i && !burst_mask),
		 .q(tx_fifo_re),
		 .clk(sdram_clk_0),
		 .rst(sdram_rst)
		 );
*/

   // if CL=3, no delay
   assign tx_fifo_re = tx_fifo_re_i && !burst_mask;
   assign fifo_rd_adr = tx_fifo_re;

   //
   genvar i;
   generate
     for (i=0; i < 16; i=i+1) begin : dly

       defparam delay4.depth=`CL+2;   
       defparam delay4.width=1;
       delay delay4 (
         .d(fifo_sel_reg[i]),
         .q(fifo_sel_dly[i]),
         .clk(sdram_clk),
         .rst(sdram_rst)
       );
     end
    
     defparam delay5.depth=`CL+2;   
     defparam delay5.width=2;
     delay delay5 (
       .d(fifo_sel_domain_reg),
       .q(fifo_sel_domain_dly),
       .clk(sdram_clk),
       .rst(sdram_rst)
     );
endgenerate  


   // Increment address
   defparam delay6.depth=`CL+`AL-1;
   defparam delay6.width=1;
   delay delay6 
     (
      .d({write|read}),
      .q({adr_inc}),
      .clk(sdram_clk_0),
      .rst(sdram_rst)
      );

   // DCM/PLL with internal and external feedback
   // Remove skew from internal and external clock
   // Parameters are set in dcm_pll.v
   dcm_pll dcm_pll_0 
     (
      .rst(sdram_rst),
      .clk_in(sdram_clk),
      .clkfb_in(ck_fb_pad_i),
      .clk0_out(sdram_clk_0),
      .clk90_out(sdram_clk_90),
      .clk180_out(sdram_clk_180),
      .clk270_out(sdram_clk_270),
      .clkfb_out(ck_fb)
      );

   // DDR2 IF
   versatile_mem_ctrl_ddr versatile_mem_ctrl_ddr_0 
     (
      // DDR2 SDRAM ports
      .ck_o(ck_pad_o),
      .ck_n_o(ck_n_pad_o),
      .dq_io(dq_pad_io),
      .dqs_io(dqs_pad_io),
      .dqs_n_io(dqs_n_pad_io), 
      .dm_rdqs_io(dm_rdqs_pad_io),
      // Memory controller side
      .tx_dat_i(fifo_dat_o[fifo_sel_domain_reg]),
      .rx_dat_o(fifo_dat_i),
      .dq_en(dq_en),
      .dqm_en(dqm_en),
      .rst(sdram_rst),
      .clk_0(sdram_clk_0),
      .clk_90(sdram_clk_90),
      .clk_180(sdram_clk_180),
      .clk_270(sdram_clk_270));

`endif //  `ifdef DDR_16
   
endmodule // wb_sdram_ctrl_top
