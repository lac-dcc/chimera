// This program was cloned from: https://github.com/matrix-io/matrix-creator-fpga
// License: GNU General Public License v3.0

/*
* Wishbone Arbiter and Address Decoder
* Copyright (C) 2008, 2009, 2010 Sebastien Bourdeauducq
* Copyright (C) 2000 Johny Chi - chisuhua@yahoo.com.cn
* This file is part of Milkymist.
*
* This source file may be used and distributed without
* restriction provided that this copyright statement is not
* removed from the file and that any derivative work contains
* the original copyright notice and the associated disclaimer.
*
* This source file is free software; you can redistribute it
* and/or modify it under the terms of the GNU Lesser General
* Public License as published by the Free Software Foundation;
* either version 2.1 of the License, or (at your option) any
* later version.
*
* This source is distributed in the hope that it will be
* useful, but WITHOUT ANY WARRANTY; without even the implied
* warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
* PURPOSE.  See the GNU Lesser General Public License for more
* details.
*
* You should have received a copy of the GNU Lesser General
* Public License along with this source; if not, download it
* from http://www.opencores.org/lgpl.shtml.
*/

module conbus #(
	parameter ADDR_WIDTH = "mandatory" ,
	parameter DATA_WIDTH    = "mandatory" ,
	parameter s_addr_w = 4   ,
	parameter s0_addr  = 4'h0,
	parameter s1_addr  = 4'h1,
	parameter s2_addr  = 4'h2,
	parameter s3_addr  = 4'h3,
	parameter s4_addr  = 4'h5,
	parameter s5_addr  = 4'h6,
	parameter s6_addr  = 4'h7,
	parameter s7_addr  = 4'h8
) (
	input                   sys_clk ,
	input                   sys_rst ,
	// Master 0 Interface
	input  [DATA_WIDTH-1:0] m0_dat_i,
	output [DATA_WIDTH-1:0] m0_dat_o,
	input  [ADDR_WIDTH-1:0] m0_adr_i,
	input  [           2:0] m0_cti_i,
	input  [           1:0] m0_sel_i,
	input                   m0_we_i ,
	input                   m0_cyc_i,
	input                   m0_stb_i,
	output                  m0_ack_o,
	// Master 1 Interface
	input  [DATA_WIDTH-1:0] m1_dat_i,
	output [DATA_WIDTH-1:0] m1_dat_o,
	input  [ADDR_WIDTH-1:0] m1_adr_i,
	input  [           2:0] m1_cti_i,
	input  [           1:0] m1_sel_i,
	input                   m1_we_i ,
	input                   m1_cyc_i,
	input                   m1_stb_i,
	output                  m1_ack_o,
	// Slave 0 Interface
	input  [DATA_WIDTH-1:0] s0_dat_i,
	output [DATA_WIDTH-1:0] s0_dat_o,
	output [ADDR_WIDTH-1:0] s0_adr_o,
	output [           2:0] s0_cti_o,
	output [           1:0] s0_sel_o,
	output                  s0_we_o ,
	output                  s0_cyc_o,
	output                  s0_stb_o,
	input                   s0_ack_i,
	// Slave 1 Interface
	input  [DATA_WIDTH-1:0] s1_dat_i,
	output [DATA_WIDTH-1:0] s1_dat_o,
	output [ADDR_WIDTH-1:0] s1_adr_o,
	output [           2:0] s1_cti_o,
	output [           1:0] s1_sel_o,
	output                  s1_we_o ,
	output                  s1_cyc_o,
	output                  s1_stb_o,
	input                   s1_ack_i,
	// Slave 2 Interface
	input  [DATA_WIDTH-1:0] s2_dat_i,
	output [DATA_WIDTH-1:0] s2_dat_o,
	output [ADDR_WIDTH-1:0] s2_adr_o,
	output [           2:0] s2_cti_o,
	output [           1:0] s2_sel_o,
	output                  s2_we_o ,
	output                  s2_cyc_o,
	output                  s2_stb_o,
	input                   s2_ack_i,
	// Slave 3 Interface
	input  [DATA_WIDTH-1:0] s3_dat_i,
	output [DATA_WIDTH-1:0] s3_dat_o,
	output [ADDR_WIDTH-1:0] s3_adr_o,
	output [           2:0] s3_cti_o,
	output [           1:0] s3_sel_o,
	output                  s3_we_o ,
	output                  s3_cyc_o,
	output                  s3_stb_o,
	input                   s3_ack_i,
	// Slave 4 Interface
	input  [DATA_WIDTH-1:0] s4_dat_i,
	output [DATA_WIDTH-1:0] s4_dat_o,
	output [ADDR_WIDTH-1:0] s4_adr_o,
	output [           2:0] s4_cti_o,
	output [           1:0] s4_sel_o,
	output                  s4_we_o ,
	output                  s4_cyc_o,
	output                  s4_stb_o,
	input                   s4_ack_i,
	// Slave 5 Interface
	input  [DATA_WIDTH-1:0] s5_dat_i,
	output [DATA_WIDTH-1:0] s5_dat_o,
	output [ADDR_WIDTH-1:0] s5_adr_o,
	output [           2:0] s5_cti_o,
	output [           1:0] s5_sel_o,
	output                  s5_we_o ,
	output                  s5_cyc_o,
	output                  s5_stb_o,
	input                   s5_ack_i,
	// Slave 6 Interface
	input  [DATA_WIDTH-1:0] s6_dat_i,
	output [DATA_WIDTH-1:0] s6_dat_o,
	output [ADDR_WIDTH-1:0] s6_adr_o,
	output [           2:0] s6_cti_o,
	output [           1:0] s6_sel_o,
	output                  s6_we_o ,
	output                  s6_cyc_o,
	output                  s6_stb_o,
	input                   s6_ack_i,
	// Slave 7 Interface
	input  [DATA_WIDTH-1:0] s7_dat_i,
	output [DATA_WIDTH-1:0] s7_dat_o,
	output [ADDR_WIDTH-1:0] s7_adr_o,
	output [           2:0] s7_cti_o,
	output [           1:0] s7_sel_o,
	output                  s7_we_o ,
	output                  s7_cyc_o,
	output                  s7_stb_o,
	input                   s7_ack_i
);

// address + CTI + data + byte select
// + cyc + we + stb
	`define mbusw_ls  ADDR_WIDTH + 3 + DATA_WIDTH + 2 + 3

	wire [           7:0] slave_sel;
	wire [           1:0] gnt      ;
	wire [`mbusw_ls -1:0] i_bus_m  ; // internal shared bus, master data and control to slave
	wire [DATA_WIDTH-1:0] i_dat_s  ; // internal shared bus, slave data to master
	wire                  i_bus_ack; // internal shared bus, ack signal

// master 0
	assign m0_dat_o = i_dat_s;
	assign m0_ack_o = i_bus_ack & gnt[0];

// master 1
	assign m1_dat_o = i_dat_s;
	assign m1_ack_o = i_bus_ack & gnt[1];

	assign i_bus_ack = s0_ack_i | s1_ack_i | s2_ack_i | s3_ack_i | s4_ack_i | s5_ack_i | s6_ack_i | s7_ack_i;

// slave 0
	assign {s0_adr_o, s0_cti_o, s0_sel_o, s0_dat_o, s0_we_o, s0_cyc_o} = i_bus_m[`mbusw_ls -1:1];
	assign s0_stb_o = i_bus_m[1] & i_bus_m[0] & slave_sel[0];  // stb_o = cyc_i & stb_i & slave_sel

// slave 1
	assign {s1_adr_o, s1_cti_o, s1_sel_o, s1_dat_o, s1_we_o, s1_cyc_o} = i_bus_m[`mbusw_ls -1:1];
	assign s1_stb_o = i_bus_m[1] & i_bus_m[0] & slave_sel[1];

// slave 2
	assign {s2_adr_o, s2_cti_o, s2_sel_o, s2_dat_o, s2_we_o, s2_cyc_o} = i_bus_m[`mbusw_ls -1:1];
	assign s2_stb_o = i_bus_m[1] & i_bus_m[0] & slave_sel[2];

// slave 3
	assign {s3_adr_o, s3_cti_o, s3_sel_o, s3_dat_o, s3_we_o, s3_cyc_o} = i_bus_m[`mbusw_ls -1:1];
	assign s3_stb_o = i_bus_m[1] & i_bus_m[0] & slave_sel[3];

// slave 4
	assign {s4_adr_o, s4_cti_o, s4_sel_o, s4_dat_o, s4_we_o, s4_cyc_o} = i_bus_m[`mbusw_ls -1:1];
	assign s4_stb_o = i_bus_m[1] & i_bus_m[0] & slave_sel[4];

// slave 5
	assign {s5_adr_o, s5_cti_o, s5_sel_o, s5_dat_o, s5_we_o, s5_cyc_o} = i_bus_m[`mbusw_ls -1:1];
	assign s5_stb_o = i_bus_m[1] & i_bus_m[0] & slave_sel[5];

// slave 6
	assign {s6_adr_o, s6_cti_o, s6_sel_o, s6_dat_o, s6_we_o, s6_cyc_o} = i_bus_m[`mbusw_ls -1:1];
	assign s6_stb_o = i_bus_m[1] & i_bus_m[0] & slave_sel[6];

// slave 7
	assign {s7_adr_o, s7_cti_o, s7_sel_o, s7_dat_o, s7_we_o, s7_cyc_o} = i_bus_m[`mbusw_ls -1:1];
	assign s7_stb_o = i_bus_m[1] & i_bus_m[0] & slave_sel[7];

	assign i_bus_m =
		({`mbusw_ls{gnt[0]}} & {m0_adr_i, m0_cti_i, m0_sel_i, m0_dat_i, m0_we_i, m0_cyc_i, m0_stb_i})
		|({`mbusw_ls{gnt[1]}} & {m1_adr_i, m1_cti_i, m1_sel_i, m1_dat_i, m1_we_i, m1_cyc_i, m1_stb_i});

	assign i_dat_s =
		({16{slave_sel[0]}} & s0_dat_i)
		|({16{slave_sel[1]}} & s1_dat_i)
		|({16{slave_sel[2]}} & s2_dat_i)
		|({16{slave_sel[3]}} & s3_dat_i)
		|({16{slave_sel[4]}} & s4_dat_i)
		|({16{slave_sel[5]}} & s5_dat_i)
		|({16{slave_sel[6]}} & s6_dat_i)
		|({16{slave_sel[7]}} & s7_dat_i);


	wire [1:0] req = {m1_cyc_i, m0_cyc_i};

	conbus_arb conbus_arb (
		.sys_clk(sys_clk),
		.sys_rst(sys_rst),
		.req    (req    ),
		.gnt    (gnt    )
	);

	wire [`mbusw_ls-1 : `mbusw_ls-s_addr_w] a = (i_bus_m[`mbusw_ls-1 : `mbusw_ls-s_addr_w]);

	wire [3:0] b = s2_addr;
	assign slave_sel[0] = (i_bus_m[`mbusw_ls-1 : `mbusw_ls-s_addr_w] == s0_addr);
	assign slave_sel[1] = (i_bus_m[`mbusw_ls-1 : `mbusw_ls-s_addr_w] == s1_addr);
	assign slave_sel[2] = (i_bus_m[`mbusw_ls-1 : `mbusw_ls-s_addr_w] == s2_addr);
	assign slave_sel[3] = (i_bus_m[`mbusw_ls-1 : `mbusw_ls-s_addr_w] == s3_addr);
	assign slave_sel[4] = (i_bus_m[`mbusw_ls-1 : `mbusw_ls-s_addr_w] == s4_addr);
	assign slave_sel[5] = (i_bus_m[`mbusw_ls-1 : `mbusw_ls-s_addr_w] == s5_addr);
	assign slave_sel[6] = (i_bus_m[`mbusw_ls-1 : `mbusw_ls-s_addr_w] == s6_addr);
	assign slave_sel[7] = (i_bus_m[`mbusw_ls-1 : `mbusw_ls-s_addr_w] == s7_addr);


endmodule
