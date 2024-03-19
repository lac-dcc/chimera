// marin.v - Top level Marin Simulation module.
//
// Copyright (c) 2012  Anthony Green.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it
// and/or modify it under the terms of the GNU General Public License
// version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty
// of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
// 02110-1301, USA.


module marinsim (/*AUTOARG*/);
 
  reg         clk;
  reg         rst;

  always #4 clk = ~clk;

  initial
    begin
      clk <= 1'b1;
      rst <= 1'b0;
      #1000 rst <= 1'b1;
      #1000 rst <= 1'b0;
    end

  wire       clk_cpu = clk;
    
  // MoxieLite/Wishbone interface
  wire [15:0] wb2mx_dat;
  wire [15:0] mx2wb_dat;
  wire [31:0] mx2wb_adr;
  wire [1:0]  mx2wb_sel;
  wire        mx2wb_we;
  wire        mx2wb_cyc;
  wire        mx2wb_stb;
  wire        wb2mx_ack;
   
  // Bootrom/Wishbone interface
  wire [15:0] wb2br_dat;
  wire [15:0] br2wb_dat;
  wire [31:0] wb2br_adr;
  wire [1:0]  wb2br_sel;
  wire 	      wb2br_we;
  wire 	      wb2br_cyc;
  wire        wb2br_stb;
  wire 	      br2wb_ack;

  // Display/Wishbone interface
  wire [15:0] wb2dp_dat;
  wire [31:0] wb2dp_adr;
  wire [1:0]  wb2dp_sel;
  wire 	      wb2dp_we;
  wire 	      wb2dp_cyc;
  wire        wb2dp_stb;
  wire 	      dp2wb_ack;

  // RAM/Wishbone interface
  wire [15:0] wb2rm_dat;
  wire [15:0] rm2wb_dat;
  wire [31:0] wb2rm_adr;
  wire [1:0]  wb2rm_sel;
  wire 	      wb2rm_we;
  wire 	      wb2rm_cyc;
  wire        wb2rm_stb;
  wire 	      rm2wb_ack;

  wb_intercon #(.data_width (16),
		.slave_0_mask (32'b1111_1111_1111_1111_1111_0000_0000_0000),
	        .slave_0_addr (32'b0000_0000_0000_0000_0001_0000_0000_0000),
		.slave_1_mask (32'b1111_1111_1111_1111_1111_1111_1111_0000),
	        .slave_1_addr (32'b0000_0000_0001_0000_0000_0000_0000_0000),
		.slave_2_mask (32'b0000_0000_0000_0000_0000_0000_0000_0000),
	        .slave_2_addr (32'b1111_1111_1111_1111_1111_1111_1111_1111),
		.slave_3_mask (32'b1111_1111_1111_1111_1111_0000_0000_0000),
	        .slave_3_addr (32'b0001_0000_0000_0000_0000_0000_0000_0000))

  bus_intercon (.wbm_dat_o (wb2mx_dat),
		.wbm_dat_i (mx2wb_dat),
		.wbm_adr_i (mx2wb_adr),
		.wbm_sel_i (mx2wb_sel),
		.wbm_we_i (mx2wb_we),
		.wbm_cyc_i (mx2wb_cyc),
		.wbm_stb_i (mx2wb_stb),
		.wbm_ack_o (wb2mx_ack),
		
		.wbs_0_dat_o (),
		.wbs_0_dat_i (br2wb_dat),
		.wbs_0_adr_o (wb2br_adr),
		.wbs_0_sel_o (wb2br_sel),
		.wbs_0_we_o (wb2br_we),
		.wbs_0_cyc_o (wb2br_cyc),
		.wbs_0_stb_o (wb2br_stb),
		.wbs_0_ack_i (br2wb_ack),
		
		.wbs_1_dat_o (wb2dp_dat),
		.wbs_1_dat_i (),
		.wbs_1_adr_o (wb2dp_adr),
		.wbs_1_sel_o (wb2dp_sel),
		.wbs_1_we_o (wb2dp_we),
		.wbs_1_cyc_o (wb2dp_cyc),
		.wbs_1_stb_o (wb2dp_stb),
		.wbs_1_ack_i (dp2wb_ack),

		.wbs_2_ack_i (1'b0),

		.wbs_3_dat_o (wb2rm_dat),
		.wbs_3_dat_i (rm2wb_dat),
		.wbs_3_adr_o (wb2rm_adr),
		.wbs_3_sel_o (wb2rm_sel),
		.wbs_3_we_o (wb2rm_we),
		.wbs_3_cyc_o (wb2rm_cyc),
		.wbs_3_stb_o (wb2rm_stb),
		.wbs_3_ack_i (rm2wb_ack)); 

   wire [7:0] ml_debug;
   
  bootrom16 rom (.clk_i (clk_cpu),
		 .wb_dat_i (wb2br_dat),
		 .wb_dat_o (br2wb_dat),
		 .wb_adr_i (wb2br_adr),
		 .wb_sel_i (wb2br_sel),
		 .wb_we_i (wb2br_we),
		 .wb_cyc_i (wb2br_cyc),
		 .wb_stb_i (wb2br_stb),
		 .wb_ack_o (br2wb_ack));

  ram16bit_wb ram (.clk_i (clk_cpu),
		   .wb_dat_i (wb2rm_dat),
		   .wb_dat_o (rm2wb_dat),
		   .wb_adr_i (wb2rm_adr),
		   .wb_sel_i (wb2rm_sel),
		   .wb_we_i (wb2rm_we),
		   .wb_cyc_i (wb2rm_cyc),
		   .wb_stb_i (wb2rm_stb),
		   .wb_ack_o (rm2wb_ack));

  nexys7seg_wb disp (.rst_i (rst_i),
		     .clk_i (clk_cpu),
		     .wb_dat_i (wb2dp_dat),
		     .wb_sel_i (wb2dp_sel),
		     .wb_we_i (wb2dp_we),
		     .wb_cyc_i (wb2dp_cyc),
		     .wb_stb_i (wb2dp_stb),
		     .wb_ack_o (dp2wb_ack),
		     .clk_100mhz_i (clk_cpu),
		     .seg (seg),
		     .an (an));
   
  moxielite_wb core (.rst_i (rst),
		     .clk_i (clk_cpu),
		     .wb_dat_i (wb2mx_dat),
		     .wb_dat_o (mx2wb_dat),
		     .wb_adr_o (mx2wb_adr),
		     .wb_sel_o (mx2wb_sel),
		     .wb_we_o (mx2wb_we),
		     .wb_cyc_o (mx2wb_cyc),
		     .wb_stb_o (mx2wb_stb),
		     .wb_ack_i (wb2mx_ack),
		     .debug_o (ml_debug));

  wire 	      rx_i;
  wire 	      tx_o;
     
  gdbtarget gdb (.rst_i (rst),
		 .clk_i (clk_cpu),
		 .wb_dat_i (),
		 .wb_dat_o (),
		 .wb_adr_o (),
		 .wb_sel_o (),
		 .wb_we_o (),
		 .wb_cyc_o (),
		 .wb_stb_o (),
		 .wb_ack_i (),
		 .rx_i (rx_i),
		 .tx_o (tx_o));

endmodule
