// Copyright (C) 2020-2021  The SymbiFlow Authors.
//
// Use of this source code is governed by a ISC-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/ISC
//
// SPDX-License-Identifier:ISC

`define MODE_36 3'b011	// 36 or 32-bit
`define MODE_18 3'b010	// 18 or 16-bit
`define MODE_9  3'b001	// 9 or 8-bit
`define MODE_4  3'b100	// 4-bit
`define MODE_2  3'b110	// 32-bit
`define MODE_1  3'b101	// 32-bit

module BRAM2x18_TDP (A1ADDR, A1DATA, A1EN, B1ADDR, B1DATA, B1EN, C1ADDR, C1DATA, C1EN, CLK1, CLK2, CLK3, CLK4, D1ADDR, D1DATA, D1EN, E1ADDR, E1DATA, E1EN, F1ADDR, F1DATA, F1EN, G1ADDR, G1DATA, G1EN, H1ADDR, H1DATA, H1EN);
	parameter CFG_ABITS = 11;
	parameter CFG_DBITS = 18;
	parameter CFG_ENABLE_B = 4;
	parameter CFG_ENABLE_D = 4;
	parameter CFG_ENABLE_F = 4;
	parameter CFG_ENABLE_H = 4;

	parameter CLKPOL2 = 1;
	parameter CLKPOL3 = 1;
	parameter [18431:0] INIT0 = 18432'bx;
	parameter [18431:0] INIT1 = 18432'bx;

	input CLK1;
	input CLK2;
	input CLK3;
	input CLK4;

	input [CFG_ABITS-1:0] A1ADDR;
	output [CFG_DBITS-1:0] A1DATA;
	input A1EN;

	input [CFG_ABITS-1:0] B1ADDR;
	input [CFG_DBITS-1:0] B1DATA;
	input [CFG_ENABLE_B-1:0] B1EN;

	input [CFG_ABITS-1:0] C1ADDR;
	output [CFG_DBITS-1:0] C1DATA;
	input C1EN;

	input [CFG_ABITS-1:0] D1ADDR;
	input [CFG_DBITS-1:0] D1DATA;
	input [CFG_ENABLE_D-1:0] D1EN;

	input [CFG_ABITS-1:0] E1ADDR;
	output [CFG_DBITS-1:0] E1DATA;
	input E1EN;

	input [CFG_ABITS-1:0] F1ADDR;
	input [CFG_DBITS-1:0] F1DATA;
	input [CFG_ENABLE_F-1:0] F1EN;

	input [CFG_ABITS-1:0] G1ADDR;
	output [CFG_DBITS-1:0] G1DATA;
	input G1EN;

	input [CFG_ABITS-1:0] H1ADDR;
	input [CFG_DBITS-1:0] H1DATA;
	input [CFG_ENABLE_H-1:0] H1EN;

	wire FLUSH1;
	wire FLUSH2;

	wire [13:CFG_ABITS] A1ADDR_CMPL = {14-CFG_ABITS{1'b0}};
	wire [13:CFG_ABITS] B1ADDR_CMPL = {14-CFG_ABITS{1'b0}};
	wire [13:CFG_ABITS] C1ADDR_CMPL = {14-CFG_ABITS{1'b0}};
	wire [13:CFG_ABITS] D1ADDR_CMPL = {14-CFG_ABITS{1'b0}};
	wire [13:CFG_ABITS] E1ADDR_CMPL = {14-CFG_ABITS{1'b0}};
	wire [13:CFG_ABITS] F1ADDR_CMPL = {14-CFG_ABITS{1'b0}};
	wire [13:CFG_ABITS] G1ADDR_CMPL = {14-CFG_ABITS{1'b0}};
	wire [13:CFG_ABITS] H1ADDR_CMPL = {14-CFG_ABITS{1'b0}};

	wire [13:0] A1ADDR_TOTAL = {A1ADDR_CMPL, A1ADDR};
	wire [13:0] B1ADDR_TOTAL = {B1ADDR_CMPL, B1ADDR};
	wire [13:0] C1ADDR_TOTAL = {C1ADDR_CMPL, C1ADDR};
	wire [13:0] D1ADDR_TOTAL = {D1ADDR_CMPL, D1ADDR};
	wire [13:0] E1ADDR_TOTAL = {E1ADDR_CMPL, E1ADDR};
	wire [13:0] F1ADDR_TOTAL = {F1ADDR_CMPL, F1ADDR};
	wire [13:0] G1ADDR_TOTAL = {G1ADDR_CMPL, G1ADDR};
	wire [13:0] H1ADDR_TOTAL = {H1ADDR_CMPL, H1ADDR};

	wire [17:CFG_DBITS] A1_RDATA_CMPL;
	wire [17:CFG_DBITS] C1_RDATA_CMPL;
	wire [17:CFG_DBITS] E1_RDATA_CMPL;
	wire [17:CFG_DBITS] G1_RDATA_CMPL;

	wire [17:CFG_DBITS] B1_WDATA_CMPL;
	wire [17:CFG_DBITS] D1_WDATA_CMPL;
	wire [17:CFG_DBITS] F1_WDATA_CMPL;
	wire [17:CFG_DBITS] H1_WDATA_CMPL;

	wire [13:0] PORT_A1_ADDR;
	wire [13:0] PORT_A2_ADDR;
	wire [13:0] PORT_B1_ADDR;
	wire [13:0] PORT_B2_ADDR;

	case (CFG_DBITS)
		1: begin
			assign PORT_A1_ADDR = A1EN ? A1ADDR_TOTAL : (B1EN ? B1ADDR_TOTAL : 14'd0);
			assign PORT_B1_ADDR = C1EN ? C1ADDR_TOTAL : (D1EN ? D1ADDR_TOTAL : 14'd0);
			assign PORT_A2_ADDR = E1EN ? E1ADDR_TOTAL : (F1EN ? F1ADDR_TOTAL : 14'd0);
			assign PORT_B2_ADDR = G1EN ? G1ADDR_TOTAL : (H1EN ? H1ADDR_TOTAL : 14'd0);
			defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b1,
				11'd10, 11'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0,
				12'd10, 12'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0
			};
		end

		2: begin
			assign PORT_A1_ADDR = A1EN ? (A1ADDR_TOTAL << 1) : (B1EN ? (B1ADDR_TOTAL << 1) : 14'd0);
			assign PORT_B1_ADDR = C1EN ? (C1ADDR_TOTAL << 1) : (D1EN ? (D1ADDR_TOTAL << 1) : 14'd0);
			assign PORT_A2_ADDR = E1EN ? (E1ADDR_TOTAL << 1) : (F1EN ? (F1ADDR_TOTAL << 1) : 14'd0);
			assign PORT_B2_ADDR = G1EN ? (G1ADDR_TOTAL << 1) : (H1EN ? (H1ADDR_TOTAL << 1) : 14'd0);
			defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b1,
				11'd10, 11'd10, 4'd0, `MODE_2, `MODE_2, `MODE_2, `MODE_2, 1'd0,
				12'd10, 12'd10, 4'd0, `MODE_2, `MODE_2, `MODE_2, `MODE_2, 1'd0
			};
		end

		4: begin
			assign PORT_A1_ADDR = A1EN ? (A1ADDR_TOTAL << 2) : (B1EN ? (B1ADDR_TOTAL << 2) : 14'd0);
			assign PORT_B1_ADDR = C1EN ? (C1ADDR_TOTAL << 2) : (D1EN ? (D1ADDR_TOTAL << 2) : 14'd0);
			assign PORT_A2_ADDR = E1EN ? (E1ADDR_TOTAL << 2) : (F1EN ? (F1ADDR_TOTAL << 2) : 14'd0);
			assign PORT_B2_ADDR = G1EN ? (G1ADDR_TOTAL << 2) : (H1EN ? (H1ADDR_TOTAL << 2) : 14'd0);
			defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b1,
				11'd10, 11'd10, 4'd0, `MODE_4, `MODE_4, `MODE_4, `MODE_4, 1'd0,
				12'd10, 12'd10, 4'd0, `MODE_4, `MODE_4, `MODE_4, `MODE_4, 1'd0
			};
		end

		8, 9: begin
			assign PORT_A1_ADDR = A1EN ? (A1ADDR_TOTAL << 3) : (B1EN ? (B1ADDR_TOTAL << 3) : 14'd0);
			assign PORT_B1_ADDR = C1EN ? (C1ADDR_TOTAL << 3) : (D1EN ? (D1ADDR_TOTAL << 3) : 14'd0);
			assign PORT_A2_ADDR = E1EN ? (E1ADDR_TOTAL << 3) : (F1EN ? (F1ADDR_TOTAL << 3) : 14'd0);
			assign PORT_B2_ADDR = G1EN ? (G1ADDR_TOTAL << 3) : (H1EN ? (H1ADDR_TOTAL << 3) : 14'd0);
			defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b1,
				11'd10, 11'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0,
				12'd10, 12'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0
			};
		end

		16, 18: begin
			assign PORT_A1_ADDR = A1EN ? (A1ADDR_TOTAL << 4) : (B1EN ? (B1ADDR_TOTAL << 4) : 14'd0);
			assign PORT_B1_ADDR = C1EN ? (C1ADDR_TOTAL << 4) : (D1EN ? (D1ADDR_TOTAL << 4) : 14'd0);
			assign PORT_A2_ADDR = E1EN ? (E1ADDR_TOTAL << 4) : (F1EN ? (F1ADDR_TOTAL << 4) : 14'd0);
			assign PORT_B2_ADDR = G1EN ? (G1ADDR_TOTAL << 4) : (H1EN ? (H1ADDR_TOTAL << 4) : 14'd0);
			defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b1,
				11'd10, 11'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0,
				12'd10, 12'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0
			};
		end

		default: begin
			assign PORT_A1_ADDR = A1EN ? A1ADDR_TOTAL : (B1EN ? B1ADDR_TOTAL : 14'd0);
			assign PORT_B1_ADDR = C1EN ? C1ADDR_TOTAL : (D1EN ? D1ADDR_TOTAL : 14'd0);
			assign PORT_A2_ADDR = E1EN ? E1ADDR_TOTAL : (F1EN ? F1ADDR_TOTAL : 14'd0);
			assign PORT_B2_ADDR = G1EN ? G1ADDR_TOTAL : (H1EN ? H1ADDR_TOTAL : 14'd0);
			defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b1,
				11'd10, 11'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0,
				12'd10, 12'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0
			};
		end
	endcase

	assign FLUSH1 = 1'b0;
	assign FLUSH2 = 1'b0;

	wire [17:0] PORT_A1_RDATA;
	wire [17:0] PORT_B1_RDATA;
	wire [17:0] PORT_A2_RDATA;
	wire [17:0] PORT_B2_RDATA;

	wire [17:0] PORT_A1_WDATA;
	wire [17:0] PORT_B1_WDATA;
	wire [17:0] PORT_A2_WDATA;
	wire [17:0] PORT_B2_WDATA;

	// Assign read/write data - handle special case for 9bit mode
	// parity bit for 9bit mode is placed in R/W port on bit #16
	case (CFG_DBITS)
		9: begin
			assign A1DATA = {PORT_A1_RDATA[16], PORT_A1_RDATA[7:0]};
			assign C1DATA = {PORT_B1_RDATA[16], PORT_B1_RDATA[7:0]};
			assign E1DATA = {PORT_A2_RDATA[16], PORT_A2_RDATA[7:0]};
			assign G1DATA = {PORT_B2_RDATA[16], PORT_B2_RDATA[7:0]};
			assign PORT_A1_WDATA = {B1_WDATA_CMPL[17], B1DATA[8], B1_WDATA_CMPL[16:9], B1DATA[7:0]};
			assign PORT_B1_WDATA = {D1_WDATA_CMPL[17], D1DATA[8], D1_WDATA_CMPL[16:9], D1DATA[7:0]};
			assign PORT_A2_WDATA = {F1_WDATA_CMPL[17], F1DATA[8], F1_WDATA_CMPL[16:9], F1DATA[7:0]};
			assign PORT_B2_WDATA = {H1_WDATA_CMPL[17], H1DATA[8], H1_WDATA_CMPL[16:9], H1DATA[7:0]};
		end
		default: begin
			assign A1DATA = PORT_A1_RDATA[CFG_DBITS-1:0];
			assign C1DATA = PORT_B1_RDATA[CFG_DBITS-1:0];
			assign E1DATA = PORT_A2_RDATA[CFG_DBITS-1:0];
			assign G1DATA = PORT_B2_RDATA[CFG_DBITS-1:0];
			assign PORT_A1_WDATA = {B1_WDATA_CMPL, B1DATA};
			assign PORT_B1_WDATA = {D1_WDATA_CMPL, D1DATA};
			assign PORT_A2_WDATA = {F1_WDATA_CMPL, F1DATA};
			assign PORT_B2_WDATA = {H1_WDATA_CMPL, H1DATA};

		end
	endcase

	wire PORT_A1_CLK = CLK1;
	wire PORT_A2_CLK = CLK3;
	wire PORT_B1_CLK = CLK2;
	wire PORT_B2_CLK = CLK4;

	wire PORT_A1_REN = A1EN;
	wire PORT_A1_WEN = B1EN[0];
	wire [CFG_ENABLE_B-1:0] PORT_A1_BE = {B1EN[1],B1EN[0]};

	wire PORT_A2_REN = E1EN;
	wire PORT_A2_WEN = F1EN[0];
	wire [CFG_ENABLE_F-1:0] PORT_A2_BE = {F1EN[1],F1EN[0]};

	wire PORT_B1_REN = C1EN;
	wire PORT_B1_WEN = D1EN[0];
	wire [CFG_ENABLE_D-1:0] PORT_B1_BE = {D1EN[1],D1EN[0]};

	wire PORT_B2_REN = G1EN;
	wire PORT_B2_WEN = H1EN[0];
	wire [CFG_ENABLE_H-1:0] PORT_B2_BE = {H1EN[1],H1EN[0]};

    (* is_split = 1 *)
    (* rd_data_width = CFG_DBITS *)
    (* wr_data_width = CFG_DBITS *)
	TDP36K  _TECHMAP_REPLACE_ (
		.WDATA_A1_i(PORT_A1_WDATA),
		.RDATA_A1_o(PORT_A1_RDATA),
		.ADDR_A1_i(PORT_A1_ADDR),
		.CLK_A1_i(PORT_A1_CLK),
		.REN_A1_i(PORT_A1_REN),
		.WEN_A1_i(PORT_A1_WEN),
		.BE_A1_i(PORT_A1_BE),

		.WDATA_A2_i(PORT_A2_WDATA),
		.RDATA_A2_o(PORT_A2_RDATA),
		.ADDR_A2_i(PORT_A2_ADDR),
		.CLK_A2_i(PORT_A2_CLK),
		.REN_A2_i(PORT_A2_REN),
		.WEN_A2_i(PORT_A2_WEN),
		.BE_A2_i(PORT_A2_BE),

		.WDATA_B1_i(PORT_B1_WDATA),
		.RDATA_B1_o(PORT_B1_RDATA),
		.ADDR_B1_i(PORT_B1_ADDR),
		.CLK_B1_i(PORT_B1_CLK),
		.REN_B1_i(PORT_B1_REN),
		.WEN_B1_i(PORT_B1_WEN),
		.BE_B1_i(PORT_B1_BE),

		.WDATA_B2_i(PORT_B2_WDATA),
		.RDATA_B2_o(PORT_B2_RDATA),
		.ADDR_B2_i(PORT_B2_ADDR),
		.CLK_B2_i(PORT_B2_CLK),
		.REN_B2_i(PORT_B2_REN),
		.WEN_B2_i(PORT_B2_WEN),
		.BE_B2_i(PORT_B2_BE),

		.FLUSH1_i(FLUSH1),
		.FLUSH2_i(FLUSH2)
	);
endmodule

module BRAM2x18_SDP (A1ADDR, A1DATA, A1EN, B1ADDR, B1DATA, B1EN, C1ADDR, C1DATA, C1EN, CLK1, CLK2, D1ADDR, D1DATA, D1EN);
	parameter CFG_ABITS = 11;
	parameter CFG_DBITS = 18;
	parameter CFG_ENABLE_B = 4;
	parameter CFG_ENABLE_D = 4;

	parameter CLKPOL2 = 1;
	parameter CLKPOL3 = 1;
	parameter [18431:0] INIT0 = 18432'bx;
	parameter [18431:0] INIT1 = 18432'bx;

	input CLK1;
	input CLK2;

	input [CFG_ABITS-1:0] A1ADDR;
	output [CFG_DBITS-1:0] A1DATA;
	input A1EN;

	input [CFG_ABITS-1:0] B1ADDR;
	input [CFG_DBITS-1:0] B1DATA;
	input [CFG_ENABLE_B-1:0] B1EN;

	input [CFG_ABITS-1:0] C1ADDR;
	output [CFG_DBITS-1:0] C1DATA;
	input C1EN;

	input [CFG_ABITS-1:0] D1ADDR;
	input [CFG_DBITS-1:0] D1DATA;
	input [CFG_ENABLE_D-1:0] D1EN;

	wire FLUSH1;
	wire FLUSH2;

	wire [13:CFG_ABITS] A1ADDR_CMPL = {14-CFG_ABITS{1'b0}};
	wire [13:CFG_ABITS] B1ADDR_CMPL = {14-CFG_ABITS{1'b0}};
	wire [13:CFG_ABITS] C1ADDR_CMPL = {14-CFG_ABITS{1'b0}};
	wire [13:CFG_ABITS] D1ADDR_CMPL = {14-CFG_ABITS{1'b0}};

	wire [13:0] A1ADDR_TOTAL = {A1ADDR_CMPL, A1ADDR};
	wire [13:0] B1ADDR_TOTAL = {B1ADDR_CMPL, B1ADDR};
	wire [13:0] C1ADDR_TOTAL = {C1ADDR_CMPL, C1ADDR};
	wire [13:0] D1ADDR_TOTAL = {D1ADDR_CMPL, D1ADDR};

	wire [17:CFG_DBITS] A1_RDATA_CMPL;
	wire [17:CFG_DBITS] C1_RDATA_CMPL;

	wire [17:CFG_DBITS] B1_WDATA_CMPL;
	wire [17:CFG_DBITS] D1_WDATA_CMPL;

	wire [13:0] PORT_A1_ADDR;
	wire [13:0] PORT_A2_ADDR;
	wire [13:0] PORT_B1_ADDR;
	wire [13:0] PORT_B2_ADDR;

	case (CFG_DBITS)
		1: begin
			assign PORT_A1_ADDR = A1ADDR_TOTAL;
			assign PORT_B1_ADDR = B1ADDR_TOTAL;
			assign PORT_A2_ADDR = C1ADDR_TOTAL;
			assign PORT_B2_ADDR = D1ADDR_TOTAL;
			defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b1,
				11'd10, 11'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0,
				12'd10, 12'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0
			};
		end

		2: begin
			assign PORT_A1_ADDR = A1ADDR_TOTAL << 1;
			assign PORT_B1_ADDR = B1ADDR_TOTAL << 1;
			assign PORT_A2_ADDR = C1ADDR_TOTAL << 1;
			assign PORT_B2_ADDR = D1ADDR_TOTAL << 1;
			defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b1,
				11'd10, 11'd10, 4'd0, `MODE_2, `MODE_2, `MODE_2, `MODE_2, 1'd0,
				12'd10, 12'd10, 4'd0, `MODE_2, `MODE_2, `MODE_2, `MODE_2, 1'd0
			};
		end

		4: begin
			assign PORT_A1_ADDR = A1ADDR_TOTAL << 2;
			assign PORT_B1_ADDR = B1ADDR_TOTAL << 2;
			assign PORT_A2_ADDR = C1ADDR_TOTAL << 2;
			assign PORT_B2_ADDR = D1ADDR_TOTAL << 2;
			defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b1,
				11'd10, 11'd10, 4'd0, `MODE_4, `MODE_4, `MODE_4, `MODE_4, 1'd0,
				12'd10, 12'd10, 4'd0, `MODE_4, `MODE_4, `MODE_4, `MODE_4, 1'd0
			};
		end

		8, 9: begin
			assign PORT_A1_ADDR = A1ADDR_TOTAL << 3;
			assign PORT_B1_ADDR = B1ADDR_TOTAL << 3;
			assign PORT_A2_ADDR = C1ADDR_TOTAL << 3;
			assign PORT_B2_ADDR = D1ADDR_TOTAL << 3;
			defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b1,
				11'd10, 11'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0,
				12'd10, 12'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0
			};
		end

		16, 18: begin
			assign PORT_A1_ADDR = A1ADDR_TOTAL << 4;
			assign PORT_B1_ADDR = B1ADDR_TOTAL << 4;
			assign PORT_A2_ADDR = C1ADDR_TOTAL << 4;
			assign PORT_B2_ADDR = D1ADDR_TOTAL << 4;
			defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b1,
				11'd10, 11'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0,
				12'd10, 12'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0
			};
		end

		default: begin
			assign PORT_A1_ADDR = A1ADDR_TOTAL;
			assign PORT_B1_ADDR = B1ADDR_TOTAL;
			assign PORT_A2_ADDR = D1ADDR_TOTAL;
			assign PORT_B2_ADDR = C1ADDR_TOTAL;
			defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b1,
				11'd10, 11'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0,
				12'd10, 12'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0
			};
		end
	endcase

	assign FLUSH1 = 1'b0;
	assign FLUSH2 = 1'b0;

	wire [17:0] PORT_A1_RDATA;
	wire [17:0] PORT_B1_RDATA;
	wire [17:0] PORT_A2_RDATA;
	wire [17:0] PORT_B2_RDATA;

	wire [17:0] PORT_A1_WDATA;
	wire [17:0] PORT_B1_WDATA;
	wire [17:0] PORT_A2_WDATA;
	wire [17:0] PORT_B2_WDATA;

	// Assign read/write data - handle special case for 9bit mode
	// parity bit for 9bit mode is placed in R/W port on bit #16
	case (CFG_DBITS)
		9: begin
			assign A1DATA = {PORT_A1_RDATA[16], PORT_A1_RDATA[7:0]};
			assign C1DATA = {PORT_A2_RDATA[16], PORT_A2_RDATA[7:0]};
			assign PORT_A1_WDATA = {18{1'b0}};
			assign PORT_B1_WDATA = {B1_WDATA_CMPL[17], B1DATA[8], B1_WDATA_CMPL[16:9], B1DATA[7:0]};
			assign PORT_A2_WDATA = {18{1'b0}};
			assign PORT_B2_WDATA = {D1_WDATA_CMPL[17], D1DATA[8], D1_WDATA_CMPL[16:9], D1DATA[7:0]};
		end
		default: begin
			assign A1DATA = PORT_A1_RDATA[CFG_DBITS-1:0];
			assign C1DATA = PORT_A2_RDATA[CFG_DBITS-1:0];
			assign PORT_A1_WDATA = {18{1'b1}};
			assign PORT_B1_WDATA = {B1_WDATA_CMPL, B1DATA};
			assign PORT_A2_WDATA = {18{1'b1}};
			assign PORT_B2_WDATA = {D1_WDATA_CMPL, D1DATA};

		end
	endcase

	wire PORT_A1_CLK = CLK1;
	wire PORT_A2_CLK = CLK2;
	wire PORT_B1_CLK = CLK1;
	wire PORT_B2_CLK = CLK2;

	wire PORT_A1_REN = A1EN;
	wire PORT_A1_WEN = 1'b0;
	wire [CFG_ENABLE_B-1:0] PORT_A1_BE = {PORT_A1_WEN,PORT_A1_WEN};

	wire PORT_A2_REN = C1EN;
	wire PORT_A2_WEN = 1'b0;
	wire [CFG_ENABLE_D-1:0] PORT_A2_BE = {PORT_A2_WEN,PORT_A2_WEN};

	wire PORT_B1_REN = 1'b0;
	wire PORT_B1_WEN = B1EN[0];
	wire [CFG_ENABLE_B-1:0] PORT_B1_BE = {B1EN[1],B1EN[0]};

	wire PORT_B2_REN = 1'b0;
	wire PORT_B2_WEN = D1EN[0];
	wire [CFG_ENABLE_D-1:0] PORT_B2_BE = {D1EN[1],D1EN[0]};

    (* is_split = 1 *)
    (* rd_data_width = CFG_DBITS *)
    (* wr_data_width = CFG_DBITS *)
	TDP36K  _TECHMAP_REPLACE_ (
		.WDATA_A1_i(PORT_A1_WDATA),
		.RDATA_A1_o(PORT_A1_RDATA),
		.ADDR_A1_i(PORT_A1_ADDR),
		.CLK_A1_i(PORT_A1_CLK),
		.REN_A1_i(PORT_A1_REN),
		.WEN_A1_i(PORT_A1_WEN),
		.BE_A1_i(PORT_A1_BE),

		.WDATA_A2_i(PORT_A2_WDATA),
		.RDATA_A2_o(PORT_A2_RDATA),
		.ADDR_A2_i(PORT_A2_ADDR),
		.CLK_A2_i(PORT_A2_CLK),
		.REN_A2_i(PORT_A2_REN),
		.WEN_A2_i(PORT_A2_WEN),
		.BE_A2_i(PORT_A2_BE),

		.WDATA_B1_i(PORT_B1_WDATA),
		.RDATA_B1_o(PORT_B1_RDATA),
		.ADDR_B1_i(PORT_B1_ADDR),
		.CLK_B1_i(PORT_B1_CLK),
		.REN_B1_i(PORT_B1_REN),
		.WEN_B1_i(PORT_B1_WEN),
		.BE_B1_i(PORT_B1_BE),

		.WDATA_B2_i(PORT_B2_WDATA),
		.RDATA_B2_o(PORT_B2_RDATA),
		.ADDR_B2_i(PORT_B2_ADDR),
		.CLK_B2_i(PORT_B2_CLK),
		.REN_B2_i(PORT_B2_REN),
		.WEN_B2_i(PORT_B2_WEN),
		.BE_B2_i(PORT_B2_BE),

		.FLUSH1_i(FLUSH1),
		.FLUSH2_i(FLUSH2)
	);
endmodule

module BRAM2x18_SFIFO (
    DIN1,
    PUSH1,
    POP1,
    CLK1,
    Async_Flush1,
    Overrun_Error1,
    Full_Watermark1,
    Almost_Full1,
    Full1,
    Underrun_Error1,
    Empty_Watermark1,
    Almost_Empty1,
    Empty1,
    DOUT1,
    
    DIN2,
    PUSH2,
    POP2,
    CLK2,
    Async_Flush2,
    Overrun_Error2,
    Full_Watermark2,
    Almost_Full2,
    Full2,
    Underrun_Error2,
    Empty_Watermark2,
    Almost_Empty2,
    Empty2,
    DOUT2
);

  parameter WR_DATA_WIDTH = 18;
  parameter RD_DATA_WIDTH = 18;

  
  parameter UPAE_DBITS1 = 11'd10;
  parameter UPAF_DBITS1 = 11'd10;
  
  parameter UPAE_DBITS2 = 11'd10;
  parameter UPAF_DBITS2 = 11'd10;

  input CLK1;
  input PUSH1, POP1;
  input [WR_DATA_WIDTH-1:0] DIN1;
  input Async_Flush1;
  output [RD_DATA_WIDTH-1:0] DOUT1;
  output Almost_Full1, Almost_Empty1;
  output Full1, Empty1;
  output Full_Watermark1, Empty_Watermark1;
  output Overrun_Error1, Underrun_Error1;
  
  input CLK2;
  input PUSH2, POP2;
  input [WR_DATA_WIDTH-1:0] DIN2;
  input Async_Flush2;
  output [RD_DATA_WIDTH-1:0] DOUT2;
  output Almost_Full2, Almost_Empty2;
  output Full2, Empty2;
  output Full_Watermark2, Empty_Watermark2;
  output Overrun_Error2, Underrun_Error2;
  
  wire [17:0] in_reg1;
  wire [17:0] out_reg1;
  wire [17:0] fifo1_flags;
  
  wire [17:0] in_reg2;
  wire [17:0] out_reg2;
  wire [17:0] fifo2_flags;
  
  wire Push_Clk1, Pop_Clk1;
  wire Push_Clk2, Pop_Clk2;
  assign Push_Clk1 = CLK1;
  assign Pop_Clk1 = CLK1;
  assign Push_Clk2 = CLK2;
  assign Pop_Clk2 = CLK2;
  
  assign Overrun_Error1 = fifo1_flags[0];
  assign Full_Watermark1 = fifo1_flags[1];
  assign Almost_Full1 = fifo1_flags[2];
  assign Full1 = fifo1_flags[3];
  assign Underrun_Error1 = fifo1_flags[4];
  assign Empty_Watermark1 = fifo1_flags[5];
  assign Almost_Empty1 = fifo1_flags[6];
  assign Empty1 = fifo1_flags[7];
  
  assign Overrun_Error2 = fifo2_flags[0];
  assign Full_Watermark2 = fifo2_flags[1];
  assign Almost_Full2 = fifo2_flags[2];
  assign Full2 = fifo2_flags[3];
  assign Underrun_Error2 = fifo2_flags[4];
  assign Empty_Watermark2 = fifo2_flags[5];
  assign Almost_Empty2 = fifo2_flags[6];
  assign Empty2 = fifo2_flags[7];
  
  generate
    if (WR_DATA_WIDTH == 18) begin
      assign in_reg1[17:0] = DIN1[17:0];
      assign in_reg2[17:0] = DIN2[17:0];
    end else if (WR_DATA_WIDTH == 9) begin
      assign in_reg1[17:0] = {1'b0, DIN1[8], 8'h0, DIN1[7:0]};
      assign in_reg2[17:0] = {1'b0, DIN2[8], 8'h0, DIN2[7:0]};
    end else begin
      assign in_reg1[17:WR_DATA_WIDTH]  = 0;
      assign in_reg1[WR_DATA_WIDTH-1:0] = DIN1[WR_DATA_WIDTH-1:0];
      assign in_reg2[17:WR_DATA_WIDTH]  = 0;
      assign in_reg2[WR_DATA_WIDTH-1:0] = DIN2[WR_DATA_WIDTH-1:0];
    end
  endgenerate     
  
 case (RD_DATA_WIDTH)
	8, 9: begin
		case (WR_DATA_WIDTH)
			8, 9: begin
				defparam U1.MODE_BITS = { 1'b1,
					UPAF_DBITS2, UPAE_DBITS2, 4'h1, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'b1,
					1'b0, UPAF_DBITS1, 1'b0, UPAE_DBITS1, 4'h1, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'b1
				};
			end
			16, 18: begin
				defparam U1.MODE_BITS = { 1'b1,
					UPAF_DBITS2, UPAE_DBITS2, 4'h1, `MODE_9, `MODE_18, `MODE_9, `MODE_18, 1'b1,
					1'b0, UPAF_DBITS1, 1'b0, UPAE_DBITS1, 4'h1, `MODE_9, `MODE_18, `MODE_9, `MODE_18, 1'b1
				};
			end
			default: begin
				defparam U1.MODE_BITS = { 1'b1,
					UPAF_DBITS2, UPAE_DBITS2, 4'h1, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'b1,
					1'b0, UPAF_DBITS1, 1'b0, UPAE_DBITS1, 4'h1, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'b1
				};
			end
		endcase
	end
	16, 18: begin
		case (WR_DATA_WIDTH)
			8, 9: begin
				defparam U1.MODE_BITS = { 1'b1,
					UPAF_DBITS2, UPAE_DBITS2, 4'h1, `MODE_18, `MODE_9, `MODE_18, `MODE_9, 1'b1,
					1'b0, UPAF_DBITS1, 1'b0, UPAE_DBITS1, 4'h1, `MODE_18, `MODE_9, `MODE_18, `MODE_9, 1'b1
				};
			end
			16, 18: begin
				defparam U1.MODE_BITS = { 1'b1,
					UPAF_DBITS2, UPAE_DBITS2, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b1,
					1'b0, UPAF_DBITS1, 1'b0, UPAE_DBITS1, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b1
				};
			end
			default: begin
				defparam U1.MODE_BITS = { 1'b1,
					UPAF_DBITS2, UPAE_DBITS2, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b1,
					1'b0, UPAF_DBITS1, 1'b0, UPAE_DBITS1, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b1
				};
			end
		endcase
	end
	default: begin
		case (WR_DATA_WIDTH)
			8, 9: begin
				defparam U1.MODE_BITS = { 1'b1,
					UPAF_DBITS2, UPAE_DBITS2, 4'h1, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'b1,
					1'b0, UPAF_DBITS1, 1'b0, UPAE_DBITS1, 4'h1, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'b1
				};
			end
			16, 18: begin
				defparam U1.MODE_BITS = { 1'b1,
					UPAF_DBITS2, UPAE_DBITS2, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b1,
					1'b0, UPAF_DBITS1, 1'b0, UPAE_DBITS1, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b1
				};
			end
			default: begin
				defparam U1.MODE_BITS = { 1'b1,
					UPAF_DBITS2, UPAE_DBITS2, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b1,
					1'b0, UPAF_DBITS1, 1'b0, UPAE_DBITS1, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b1
				};
			end
		endcase
	end
  endcase

  (* is_fifo = 1 *) 
  (* sync_fifo = 1 *) 
  (* is_split = 1 *)
  (* rd_data_width = RD_DATA_WIDTH *)
  (* wr_data_width = WR_DATA_WIDTH *) 
 	TDP36K U1 (
		.RESET_ni(1'b1),
		.WDATA_A1_i(in_reg1[17:0]),
		.WDATA_A2_i(in_reg2[17:0]),
		.RDATA_A1_o(fifo1_flags),
		.RDATA_A2_o(fifo2_flags),
		.ADDR_A1_i(14'h0),
		.ADDR_A2_i(14'h0),
		.CLK_A1_i(Push_Clk1),
		.CLK_A2_i(Push_Clk2),
		.REN_A1_i(1'b1),
		.REN_A2_i(1'b1),
		.WEN_A1_i(PUSH1),
		.WEN_A2_i(PUSH2),
		.BE_A1_i(2'b11),
		.BE_A2_i(2'b11),

		.WDATA_B1_i(18'h0),
		.WDATA_B2_i(18'h0),
		.RDATA_B1_o(out_reg1[17:0]),
		.RDATA_B2_o(out_reg2[17:0]),
		.ADDR_B1_i(14'h0),
		.ADDR_B2_i(14'h0),
		.CLK_B1_i(Pop_Clk1),
		.CLK_B2_i(Pop_Clk2),
		.REN_B1_i(POP1),
		.REN_B2_i(POP2),
		.WEN_B1_i(1'b0),
		.WEN_B2_i(1'b0),
		.BE_B1_i(2'b11),
		.BE_B2_i(2'b11),

		.FLUSH1_i(Async_Flush1),
		.FLUSH2_i(Async_Flush2)
	);

  generate
    if (RD_DATA_WIDTH == 9) begin
      assign DOUT1[RD_DATA_WIDTH-1:0] = {out_reg1[16], out_reg1[7:0]};
      assign DOUT2[RD_DATA_WIDTH-1:0] = {out_reg2[16], out_reg2[7:0]};
    end else begin
      assign DOUT1[RD_DATA_WIDTH-1:0] = out_reg1[RD_DATA_WIDTH-1:0];
      assign DOUT2[RD_DATA_WIDTH-1:0] = out_reg2[RD_DATA_WIDTH-1:0];
    end
  endgenerate 

endmodule

module BRAM2x18_AFIFO (
    DIN1,
    PUSH1,
    POP1,
    Push_Clk1,
    Pop_Clk1,
    Async_Flush1,
    Overrun_Error1,
    Full_Watermark1,
    Almost_Full1,
    Full1,
    Underrun_Error1,
    Empty_Watermark1,
    Almost_Empty1,
    Empty1,
    DOUT1,
    
    DIN2,
    PUSH2,
    POP2,
    Push_Clk2,
    Pop_Clk2,
    Async_Flush2,
    Overrun_Error2,
    Full_Watermark2,
    Almost_Full2,
    Full2,
    Underrun_Error2,
    Empty_Watermark2,
    Almost_Empty2,
    Empty2,
    DOUT2
);

  parameter WR_DATA_WIDTH = 18;
  parameter RD_DATA_WIDTH = 18;

  
  parameter UPAE_DBITS1 = 11'd10;
  parameter UPAF_DBITS1 = 11'd10;
  
  parameter UPAE_DBITS2 = 11'd10;
  parameter UPAF_DBITS2 = 11'd10;

  input Push_Clk1, Pop_Clk1;
  input PUSH1, POP1;
  input [WR_DATA_WIDTH-1:0] DIN1;
  input Async_Flush1;
  output [RD_DATA_WIDTH-1:0] DOUT1;
  output Almost_Full1, Almost_Empty1;
  output Full1, Empty1;
  output Full_Watermark1, Empty_Watermark1;
  output Overrun_Error1, Underrun_Error1;
  
  input Push_Clk2, Pop_Clk2;
  input PUSH2, POP2;
  input [WR_DATA_WIDTH-1:0] DIN2;
  input Async_Flush2;
  output [RD_DATA_WIDTH-1:0] DOUT2;
  output Almost_Full2, Almost_Empty2;
  output Full2, Empty2;
  output Full_Watermark2, Empty_Watermark2;
  output Overrun_Error2, Underrun_Error2;
  
  wire [17:0] in_reg1;
  wire [17:0] out_reg1;
  wire [17:0] fifo1_flags;
  
  wire [17:0] in_reg2;
  wire [17:0] out_reg2;
  wire [17:0] fifo2_flags;
  
  assign Overrun_Error1 = fifo1_flags[0];
  assign Full_Watermark1 = fifo1_flags[1];
  assign Almost_Full1 = fifo1_flags[2];
  assign Full1 = fifo1_flags[3];
  assign Underrun_Error1 = fifo1_flags[4];
  assign Empty_Watermark1 = fifo1_flags[5];
  assign Almost_Empty1 = fifo1_flags[6];
  assign Empty1 = fifo1_flags[7];
  
  assign Overrun_Error2 = fifo2_flags[0];
  assign Full_Watermark2 = fifo2_flags[1];
  assign Almost_Full2 = fifo2_flags[2];
  assign Full2 = fifo2_flags[3];
  assign Underrun_Error2 = fifo2_flags[4];
  assign Empty_Watermark2 = fifo2_flags[5];
  assign Almost_Empty2 = fifo2_flags[6];
  assign Empty2 = fifo2_flags[7];
  
  generate
    if (WR_DATA_WIDTH == 18) begin
      assign in_reg1[17:0] = DIN1[17:0];
      assign in_reg2[17:0] = DIN2[17:0];
    end else if (WR_DATA_WIDTH == 9) begin
      assign in_reg1[17:0] = {1'b0, DIN1[8], 8'h0, DIN1[7:0]};
      assign in_reg2[17:0] = {1'b0, DIN2[8], 8'h0, DIN2[7:0]};
    end else begin
      assign in_reg1[17:WR_DATA_WIDTH]  = 0;
      assign in_reg1[WR_DATA_WIDTH-1:0] = DIN1[WR_DATA_WIDTH-1:0];
      assign in_reg2[17:WR_DATA_WIDTH]  = 0;
      assign in_reg2[WR_DATA_WIDTH-1:0] = DIN2[WR_DATA_WIDTH-1:0];
    end
  endgenerate     
  
 case (RD_DATA_WIDTH)
	8, 9: begin
		case (WR_DATA_WIDTH)
			8, 9: begin
				defparam U1.MODE_BITS = { 1'b1,
					UPAF_DBITS2, UPAE_DBITS2, 4'h1, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'b0,
					1'b0, UPAF_DBITS1, 1'b0, UPAE_DBITS1, 4'h1, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'b0
				};
			end
			16, 18: begin
				defparam U1.MODE_BITS = { 1'b1,
					UPAF_DBITS2, UPAE_DBITS2, 4'h1, `MODE_9, `MODE_18, `MODE_9, `MODE_18, 1'b0,
					1'b0, UPAF_DBITS1, 1'b0, UPAE_DBITS1, 4'h1, `MODE_9, `MODE_18, `MODE_9, `MODE_18, 1'b0
				};
			end
			default: begin
				defparam U1.MODE_BITS = { 1'b1,
					UPAF_DBITS2, UPAE_DBITS2, 4'h1, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'b0,
					1'b0, UPAF_DBITS1, 1'b0, UPAE_DBITS1, 4'h1, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'b0
				};
			end
		endcase
	end
	16, 18: begin
		case (WR_DATA_WIDTH)
			8, 9: begin
				defparam U1.MODE_BITS = { 1'b1,
					UPAF_DBITS2, UPAE_DBITS2, 4'h1, `MODE_18, `MODE_9, `MODE_18, `MODE_9, 1'b0,
					1'b0, UPAF_DBITS1, 1'b0, UPAE_DBITS1, 4'h1, `MODE_18, `MODE_9, `MODE_18, `MODE_9, 1'b0
				};
			end
			16, 18: begin
				defparam U1.MODE_BITS = { 1'b1,
					UPAF_DBITS2, UPAE_DBITS2, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b0,
					1'b0, UPAF_DBITS1, 1'b0, UPAE_DBITS1, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b0
				};
			end
			default: begin
				defparam U1.MODE_BITS = { 1'b1,
					UPAF_DBITS2, UPAE_DBITS2, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b0,
					1'b0, UPAF_DBITS1, 1'b0, UPAE_DBITS1, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b0
				};
			end
		endcase
	end
	default: begin
		case (WR_DATA_WIDTH)
			8, 9: begin
				defparam U1.MODE_BITS = { 1'b1,
					UPAF_DBITS2, UPAE_DBITS2, 4'h1, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'b0,
					1'b0, UPAF_DBITS1, 1'b0, UPAE_DBITS1, 4'h1, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'b0
				};
			end
			16, 18: begin
				defparam U1.MODE_BITS = { 1'b1,
					UPAF_DBITS2, UPAE_DBITS2, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b0,
					1'b0, UPAF_DBITS1, 1'b0, UPAE_DBITS1, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b0
				};
			end
			default: begin
				defparam U1.MODE_BITS = { 1'b1,
					UPAF_DBITS2, UPAE_DBITS2, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b0,
					1'b0, UPAF_DBITS1, 1'b0, UPAE_DBITS1, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b0
				};
			end
		endcase
	end
  endcase

  (* is_fifo = 1 *) 
  (* sync_fifo = 0 *) 
  (* is_split = 1 *)
  (* rd_data_width = RD_DATA_WIDTH *)
  (* wr_data_width = WR_DATA_WIDTH *) 
 	TDP36K U1 (
		.RESET_ni(1'b1),
		.WDATA_A1_i(in_reg1[17:0]),
		.WDATA_A2_i(in_reg2[17:0]),
		.RDATA_A1_o(fifo1_flags),
		.RDATA_A2_o(fifo2_flags),
		.ADDR_A1_i(14'h0),
		.ADDR_A2_i(14'h0),
		.CLK_A1_i(Push_Clk1),
		.CLK_A2_i(Push_Clk2),
		.REN_A1_i(1'b1),
		.REN_A2_i(1'b1),
		.WEN_A1_i(PUSH1),
		.WEN_A2_i(PUSH2),
		.BE_A1_i(2'b11),
		.BE_A2_i(2'b11),

		.WDATA_B1_i(18'h0),
		.WDATA_B2_i(18'h0),
		.RDATA_B1_o(out_reg1[17:0]),
		.RDATA_B2_o(out_reg2[17:0]),
		.ADDR_B1_i(14'h0),
		.ADDR_B2_i(14'h0),
		.CLK_B1_i(Pop_Clk1),
		.CLK_B2_i(Pop_Clk2),
		.REN_B1_i(POP1),
		.REN_B2_i(POP2),
		.WEN_B1_i(1'b0),
		.WEN_B2_i(1'b0),
		.BE_B1_i(2'b11),
		.BE_B2_i(2'b11),

		.FLUSH1_i(Async_Flush1),
		.FLUSH2_i(Async_Flush2)
	);

  generate
    if (RD_DATA_WIDTH == 9) begin
      assign DOUT1[RD_DATA_WIDTH-1:0] = {out_reg1[16], out_reg1[7:0]};
      assign DOUT2[RD_DATA_WIDTH-1:0] = {out_reg2[16], out_reg2[7:0]};
    end else begin
      assign DOUT1[RD_DATA_WIDTH-1:0] = out_reg1[RD_DATA_WIDTH-1:0];
      assign DOUT2[RD_DATA_WIDTH-1:0] = out_reg2[RD_DATA_WIDTH-1:0];
    end
  endgenerate  

endmodule

module BRAM2x18_SP (
    RESET_ni,
    
    WEN1_i,
    REN1_i,
    WR1_CLK_i,
    RD1_CLK_i,
    WR1_BE_i,
    WR1_ADDR_i,
    RD1_ADDR_i,
    WDATA1_i,
    RDATA1_o,
    
    WEN2_i,
    REN2_i,
    WR2_CLK_i,
    RD2_CLK_i,
    WR2_BE_i,
    WR2_ADDR_i,
    RD2_ADDR_i,
    WDATA2_i,
    RDATA2_o
);

parameter WR_ADDR_WIDTH = 10;
parameter RD_ADDR_WIDTH = 10;
parameter WR_DATA_WIDTH = 18;
parameter RD_DATA_WIDTH = 18;
parameter BE1_WIDTH = 2;
parameter BE2_WIDTH = 2;

input wire RESET_ni;

input wire WEN1_i;
input wire REN1_i;
input wire WR1_CLK_i;
input wire RD1_CLK_i;
input wire [BE1_WIDTH-1:0] WR1_BE_i;
input wire [WR_ADDR_WIDTH-1 :0] WR1_ADDR_i;
input wire [RD_ADDR_WIDTH-1 :0] RD1_ADDR_i;
input wire [WR_DATA_WIDTH-1 :0] WDATA1_i;
output wire [RD_DATA_WIDTH-1 :0] RDATA1_o;

input wire WEN2_i;
input wire REN2_i;
input wire WR2_CLK_i;
input wire RD2_CLK_i;
input wire [BE2_WIDTH-1:0] WR2_BE_i;
input wire [WR_ADDR_WIDTH-1 :0] WR2_ADDR_i;
input wire [RD_ADDR_WIDTH-1 :0] RD2_ADDR_i;
input wire [WR_DATA_WIDTH-1 :0] WDATA2_i;
output wire [RD_DATA_WIDTH-1 :0] RDATA2_o;

//localparam READ_DATA_BITS_TO_SKIP = 18 - RD_DATA_WIDTH;

wire [14:RD_ADDR_WIDTH] RD1_ADDR_CMPL;
wire [14:WR_ADDR_WIDTH] WR1_ADDR_CMPL;
wire [17:RD_DATA_WIDTH] RD1_DATA_CMPL;
wire [17:WR_DATA_WIDTH] WR1_DATA_CMPL;
           
wire [14:RD_ADDR_WIDTH] RD2_ADDR_CMPL;
wire [14:WR_ADDR_WIDTH] WR2_ADDR_CMPL;
wire [17:RD_DATA_WIDTH] RD2_DATA_CMPL;
wire [17:WR_DATA_WIDTH] WR2_DATA_CMPL;

wire [14:0] RD1_ADDR_TOTAL;
wire [14:0] WR1_ADDR_TOTAL;

wire [14:0] RD2_ADDR_TOTAL;
wire [14:0] WR2_ADDR_TOTAL;

wire [14:0] RD1_ADDR_SHIFTED;
wire [14:0] WR1_ADDR_SHIFTED;

wire [14:0] RD2_ADDR_SHIFTED;
wire [14:0] WR2_ADDR_SHIFTED;

wire [1:0] WR1_BE;
wire [1:0] WR2_BE;

wire FLUSH1;
wire FLUSH2;

generate
  if (WR_ADDR_WIDTH == 15) begin
    assign WR1_ADDR_TOTAL = WR1_ADDR_i;
    assign WR2_ADDR_TOTAL = WR2_ADDR_i;
  end else begin
    assign WR1_ADDR_TOTAL[14:WR_ADDR_WIDTH] = 0;
    assign WR1_ADDR_TOTAL[WR_ADDR_WIDTH-1:0] = WR1_ADDR_i;
    assign WR2_ADDR_TOTAL[14:WR_ADDR_WIDTH] = 0;
    assign WR2_ADDR_TOTAL[WR_ADDR_WIDTH-1:0] = WR2_ADDR_i;
  end
endgenerate

generate
  if (RD_ADDR_WIDTH == 15) begin
    assign RD1_ADDR_TOTAL = RD1_ADDR_i;
    assign RD2_ADDR_TOTAL = RD2_ADDR_i;
  end else begin
    assign RD1_ADDR_TOTAL[14:RD_ADDR_WIDTH] = 0;
    assign RD1_ADDR_TOTAL[RD_ADDR_WIDTH-1:0] = RD1_ADDR_i;
    assign RD2_ADDR_TOTAL[14:RD_ADDR_WIDTH] = 0;
    assign RD2_ADDR_TOTAL[RD_ADDR_WIDTH-1:0] = RD2_ADDR_i;
  end
endgenerate

// Assign parameters
case (RD_DATA_WIDTH)
	1: begin
		case (WR_DATA_WIDTH)
			1: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0
				};
			end
			2: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_2, `MODE_1, `MODE_2, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_2, `MODE_1, `MODE_2, 1'd0
				};
			end
			4: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_4, `MODE_1, `MODE_4, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_4, `MODE_1, `MODE_4, 1'd0
				};
			end
			8, 9: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_9, `MODE_1, `MODE_9, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_9, `MODE_1, `MODE_9, 1'd0
				};
			end
			16, 18: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_18, `MODE_1, `MODE_18, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_18, `MODE_1, `MODE_18, 1'd0
				};
			end
			default: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0
				};
			end
		endcase
	end
	2: begin
		case (WR_DATA_WIDTH)
			1: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_2, `MODE_1, `MODE_2, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_2, `MODE_1, `MODE_2, `MODE_1, 1'd0
				};
			end
			2: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_2, `MODE_2, `MODE_2, `MODE_2, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_2, `MODE_2, `MODE_2, `MODE_2, 1'd0
				};
			end
			4: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_2, `MODE_4, `MODE_2, `MODE_4, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_2, `MODE_4, `MODE_2, `MODE_4, 1'd0
				};
			end
			8, 9: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_2, `MODE_9, `MODE_2, `MODE_9, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_2, `MODE_9, `MODE_2, `MODE_9, 1'd0
				};
			end
			16, 18: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_2, `MODE_18, `MODE_2, `MODE_18, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_2, `MODE_18, `MODE_2, `MODE_18, 1'd0
				};
			end
			default: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_2, `MODE_1, `MODE_2, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_2, `MODE_1, `MODE_2, `MODE_1, 1'd0
				};
			end
		endcase
	end
	4: begin
		case (WR_DATA_WIDTH)
			1: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_4, `MODE_1, `MODE_4, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_4, `MODE_1, `MODE_4, `MODE_1, 1'd0
				};
			end
			2: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_4, `MODE_2, `MODE_4, `MODE_2, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_4, `MODE_2, `MODE_4, `MODE_2, 1'd0
				};
			end
			4: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_4, `MODE_4, `MODE_4, `MODE_4, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_4, `MODE_4, `MODE_4, `MODE_4, 1'd0
				};
			end
			8, 9: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_4, `MODE_9, `MODE_4, `MODE_9, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_4, `MODE_9, `MODE_4, `MODE_9, 1'd0
				};
			end
			16, 18: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_4, `MODE_18, `MODE_4, `MODE_18, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_4, `MODE_18, `MODE_4, `MODE_18, 1'd0
				};
			end
			default: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_4, `MODE_1, `MODE_4, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_4, `MODE_1, `MODE_4, `MODE_1, 1'd0
				};
			end
		endcase
	end
	8, 9: begin
		case (WR_DATA_WIDTH)
			1: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_1, `MODE_9, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_9, `MODE_1, `MODE_9, `MODE_1, 1'd0
				};
			end
			2: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_2, `MODE_9, `MODE_2, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_9, `MODE_2, `MODE_9, `MODE_2, 1'd0
				};
			end
			4: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_4, `MODE_9, `MODE_4, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_9, `MODE_4, `MODE_9, `MODE_4, 1'd0
				};
			end
			8, 9: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0
				};
			end
			16, 18: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_18, `MODE_9, `MODE_18, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_9, `MODE_18, `MODE_9, `MODE_18, 1'd0
				};
			end
			default: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_1, `MODE_9, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_9, `MODE_1, `MODE_9, `MODE_1, 1'd0
				};
			end
		endcase
	end
	16, 18: begin
		case (WR_DATA_WIDTH)
			1: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_1, `MODE_18, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_18, `MODE_1, `MODE_18, `MODE_1, 1'd0
				};
			end
			2: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_2, `MODE_18, `MODE_2, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_18, `MODE_2, `MODE_18, `MODE_2, 1'd0
				};
			end
			4: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_4, `MODE_18, `MODE_4, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_18, `MODE_4, `MODE_18, `MODE_4, 1'd0
				};
			end
			8, 9: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_9, `MODE_18, `MODE_9, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_18, `MODE_9, `MODE_18, `MODE_9, 1'd0
				};
			end
			16, 18: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0
				};
			end
			default: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_1, `MODE_18, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_18, `MODE_1, `MODE_18, `MODE_1, 1'd0
				};
			end
		endcase
	end
	default: begin
		case (WR_DATA_WIDTH)
			1: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0
				};
			end
			2: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_2, `MODE_1, `MODE_2, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_2, `MODE_1, `MODE_2, 1'd0
				};
			end
			4: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_4, `MODE_1, `MODE_4, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_4, `MODE_1, `MODE_4, 1'd0
				};
			end
			8, 9: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_9, `MODE_1, `MODE_9, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_9, `MODE_1, `MODE_9, 1'd0
				};
			end
			16, 18: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_18, `MODE_1, `MODE_18, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_18, `MODE_1, `MODE_18, 1'd0
				};
			end
			default: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b1,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0
				};
			end
		endcase
	end
endcase

// Apply shift
case (RD_DATA_WIDTH)
	1: begin
		assign RD1_ADDR_SHIFTED = RD1_ADDR_TOTAL;
	end
	2: begin
		assign RD1_ADDR_SHIFTED = RD1_ADDR_TOTAL << 1;
	end
	4: begin
		assign RD1_ADDR_SHIFTED = RD1_ADDR_TOTAL << 2;
	end
	8, 9: begin
		assign RD1_ADDR_SHIFTED = RD1_ADDR_TOTAL << 3;
	end
	16, 18: begin
		assign RD1_ADDR_SHIFTED = RD1_ADDR_TOTAL << 4;
	end
	default: begin
		assign RD1_ADDR_SHIFTED = RD1_ADDR_TOTAL;
	end
endcase

case (WR_DATA_WIDTH)
	1: begin
		assign WR1_ADDR_SHIFTED = WR1_ADDR_TOTAL;
	end
	2: begin
		assign WR1_ADDR_SHIFTED = WR1_ADDR_TOTAL << 1;
	end
	4: begin
		assign WR1_ADDR_SHIFTED = WR1_ADDR_TOTAL << 2;
	end
	8, 9: begin
		assign WR1_ADDR_SHIFTED = WR1_ADDR_TOTAL << 3;
	end
	16, 18: begin
		assign WR1_ADDR_SHIFTED = WR1_ADDR_TOTAL << 4;
	end
	default: begin
		assign WR1_ADDR_SHIFTED = WR1_ADDR_TOTAL;
	end
endcase

case (RD_DATA_WIDTH)
	1: begin
		assign RD2_ADDR_SHIFTED = RD2_ADDR_TOTAL;
	end
	2: begin
		assign RD2_ADDR_SHIFTED = RD2_ADDR_TOTAL << 1;
	end
	4: begin
		assign RD2_ADDR_SHIFTED = RD2_ADDR_TOTAL << 2;
	end
	8, 9: begin
		assign RD2_ADDR_SHIFTED = RD2_ADDR_TOTAL << 3;
	end
	16, 18: begin
		assign RD2_ADDR_SHIFTED = RD2_ADDR_TOTAL << 4;
	end
	default: begin
		assign RD2_ADDR_SHIFTED = RD2_ADDR_TOTAL;
	end
endcase

case (WR_DATA_WIDTH)
	1: begin
		assign WR2_ADDR_SHIFTED = WR2_ADDR_TOTAL;
	end
	2: begin
		assign WR2_ADDR_SHIFTED = WR2_ADDR_TOTAL << 1;
	end
	4: begin
		assign WR2_ADDR_SHIFTED = WR2_ADDR_TOTAL << 2;
	end
	8, 9: begin
		assign WR2_ADDR_SHIFTED = WR2_ADDR_TOTAL << 3;
	end
	16, 18: begin
		assign WR2_ADDR_SHIFTED = WR2_ADDR_TOTAL << 4;
	end
	default: begin
		assign WR2_ADDR_SHIFTED = WR2_ADDR_TOTAL;
	end
endcase

case (BE1_WIDTH)
	2: begin
		assign WR1_BE = WR1_BE_i[BE1_WIDTH-1 :0];
	end
	default: begin
		assign WR1_BE[1:BE1_WIDTH] = 0;
    assign WR1_BE[BE1_WIDTH-1 :0] = WR1_BE_i[BE1_WIDTH-1 :0];
	end
endcase

case (BE2_WIDTH)
	2: begin
		assign WR2_BE = WR2_BE_i[BE2_WIDTH-1 :0];
	end
	default: begin
		assign WR2_BE[1:BE2_WIDTH] = 0;
    assign WR2_BE[BE2_WIDTH-1 :0] = WR2_BE_i[BE2_WIDTH-1 :0];
	end
endcase

assign FLUSH1 = 1'b0;
assign FLUSH2 = 1'b0;

// TODO configure per width
wire [17:0] PORT_B1_RDATA;
wire [17:0] PORT_B2_RDATA;
wire [17:0] PORT_A1_WDATA;
wire [17:0] PORT_A2_WDATA;

generate
  if (WR_DATA_WIDTH == 18) begin
    assign PORT_A1_WDATA[WR_DATA_WIDTH-1:0] = WDATA1_i[WR_DATA_WIDTH-1:0];
    assign PORT_A2_WDATA[WR_DATA_WIDTH-1:0] = WDATA2_i[WR_DATA_WIDTH-1:0];
  end else if (WR_DATA_WIDTH == 9) begin
    assign PORT_A1_WDATA = {19'h0, WDATA1_i[8], 8'h0, WDATA1_i[7:0]};
    assign PORT_A2_WDATA = {19'h0, WDATA2_i[8], 8'h0, WDATA2_i[7:0]};
  end else begin
    assign PORT_A1_WDATA[17:WR_DATA_WIDTH] = 0;
    assign PORT_A1_WDATA[WR_DATA_WIDTH-1:0] = WDATA1_i[WR_DATA_WIDTH-1:0];
    assign PORT_A2_WDATA[17:WR_DATA_WIDTH] = 0;
    assign PORT_A2_WDATA[WR_DATA_WIDTH-1:0] = WDATA2_i[WR_DATA_WIDTH-1:0];
  end
endgenerate

case (RD_DATA_WIDTH)
	9: begin
		assign RDATA1_o = {PORT_B1_RDATA[16], PORT_B1_RDATA[7:0]};
    assign RDATA2_o = {PORT_B2_RDATA[16], PORT_B2_RDATA[7:0]};
	end
	default: begin
		assign RDATA1_o = PORT_B1_RDATA[RD_DATA_WIDTH-1:0];
    assign RDATA2_o = PORT_B2_RDATA[RD_DATA_WIDTH-1:0];
	end
endcase

(* is_inferred = 1 *)
(* is_split = 1 *)
(* rd_data_width = RD_DATA_WIDTH *)
(* wr_data_width = WR_DATA_WIDTH *)
TDP36K BRAM_BLK (
	.RESET_ni(RESET_ni),

  .WDATA_A1_i(PORT_A1_WDATA),
  .RDATA_A1_o(),
  .ADDR_A1_i(WR1_ADDR_SHIFTED),
  .CLK_A1_i(WR1_CLK_i),
  .REN_A1_i(),
  .WEN_A1_i(WEN1_i),
  .BE_A1_i(WR1_BE[1:0]),
  
  .WDATA_B1_i(18'h0),
  .RDATA_B1_o(PORT_B1_RDATA),
  .ADDR_B1_i(RD1_ADDR_SHIFTED),
  .CLK_B1_i(RD1_CLK_i),
  .REN_B1_i(REN1_i),
  .WEN_B1_i(1'b0),
  .BE_B1_i({REN1_i,REN1_i}),
  
  .WDATA_A2_i(PORT_A2_WDATA),
  .RDATA_A2_o(),
  .ADDR_A2_i(WR2_ADDR_SHIFTED),
  .CLK_A2_i(WR2_CLK_i),
  .REN_A2_i(1'b0),
  .WEN_A2_i(WEN2_i),
  .BE_A2_i(WR2_BE[1:0]),
  
  .WDATA_B2_i(18'h0),
  .RDATA_B2_o(PORT_B2_RDATA),
  .ADDR_B2_i(RD2_ADDR_SHIFTED),
  .CLK_B2_i(RD2_CLK_i),
  .REN_B2_i(REN2_i),
  .WEN_B2_i(1'b0),
  .BE_B2_i({REN2_i,REN2_i}),

	.FLUSH1_i(FLUSH1),
	.FLUSH2_i(FLUSH2)
);

endmodule

module BRAM2x18_DP (A1ADDR, A1DATA, A1EN, B1ADDR, B1DATA, B1EN, C1ADDR, C1DATA, C1EN, CLK1, CLK2, CLK3, CLK4, D1ADDR, D1DATA, D1EN, E1ADDR, E1DATA, E1EN, F1ADDR, F1DATA, F1EN, G1ADDR, G1DATA, G1EN, H1ADDR, H1DATA, H1EN);
	parameter CFG_ABITS = 11;
	parameter CFG_DBITS = 18;
	parameter CFG_ENABLE_B = 4;
	parameter CFG_ENABLE_D = 4;
	parameter CFG_ENABLE_F = 4;
	parameter CFG_ENABLE_H = 4;

	parameter CLKPOL2 = 1;
	parameter CLKPOL3 = 1;
	parameter [18431:0] INIT0 = 18432'bx;
	parameter [18431:0] INIT1 = 18432'bx;

	input CLK1;
	input CLK2;
	input CLK3;
	input CLK4;

	input [CFG_ABITS-1:0] A1ADDR;
	output [CFG_DBITS-1:0] A1DATA;
	input A1EN;

	input [CFG_ABITS-1:0] B1ADDR;
	input [CFG_DBITS-1:0] B1DATA;
	input [CFG_ENABLE_B-1:0] B1EN;

	input [CFG_ABITS-1:0] C1ADDR;
	output [CFG_DBITS-1:0] C1DATA;
	input C1EN;

	input [CFG_ABITS-1:0] D1ADDR;
	input [CFG_DBITS-1:0] D1DATA;
	input [CFG_ENABLE_D-1:0] D1EN;

	input [CFG_ABITS-1:0] E1ADDR;
	output [CFG_DBITS-1:0] E1DATA;
	input E1EN;

	input [CFG_ABITS-1:0] F1ADDR;
	input [CFG_DBITS-1:0] F1DATA;
	input [CFG_ENABLE_F-1:0] F1EN;

	input [CFG_ABITS-1:0] G1ADDR;
	output [CFG_DBITS-1:0] G1DATA;
	input G1EN;

	input [CFG_ABITS-1:0] H1ADDR;
	input [CFG_DBITS-1:0] H1DATA;
	input [CFG_ENABLE_H-1:0] H1EN;

	wire FLUSH1;
	wire FLUSH2;

	wire [14:0] A1ADDR_TOTAL;
	wire [14:0] B1ADDR_TOTAL;
	wire [14:0] C1ADDR_TOTAL;
	wire [14:0] D1ADDR_TOTAL;
	wire [14:0] E1ADDR_TOTAL;
	wire [14:0] F1ADDR_TOTAL;
	wire [14:0] G1ADDR_TOTAL;
	wire [14:0] H1ADDR_TOTAL;
  
  generate
    if (CFG_ABITS == 15) begin
      assign A1ADDR_TOTAL = A1ADDR;
      assign B1ADDR_TOTAL = B1ADDR;
      assign C1ADDR_TOTAL = C1ADDR;
      assign D1ADDR_TOTAL = D1ADDR;
      assign E1ADDR_TOTAL = E1ADDR;
      assign F1ADDR_TOTAL = F1ADDR;
      assign G1ADDR_TOTAL = G1ADDR;
      assign H1ADDR_TOTAL = H1ADDR;
    end else begin
      assign A1ADDR_TOTAL[14:CFG_ABITS] = 0;
      assign A1ADDR_TOTAL[CFG_ABITS-1:0] = A1ADDR;
      assign B1ADDR_TOTAL[14:CFG_ABITS] = 0;
      assign B1ADDR_TOTAL[CFG_ABITS-1:0] = B1ADDR;
      assign C1ADDR_TOTAL[14:CFG_ABITS] = 0;
      assign C1ADDR_TOTAL[CFG_ABITS-1:0] = C1ADDR;
      assign D1ADDR_TOTAL[14:CFG_ABITS] = 0;
      assign D1ADDR_TOTAL[CFG_ABITS-1:0] = D1ADDR;
      assign E1ADDR_TOTAL[14:CFG_ABITS] = 0;
      assign E1ADDR_TOTAL[CFG_ABITS-1:0] = E1ADDR;
      assign F1ADDR_TOTAL[14:CFG_ABITS] = 0;
      assign F1ADDR_TOTAL[CFG_ABITS-1:0] = F1ADDR;
      assign G1ADDR_TOTAL[14:CFG_ABITS] = 0;
      assign G1ADDR_TOTAL[CFG_ABITS-1:0] = G1ADDR;
      assign H1ADDR_TOTAL[14:CFG_ABITS] = 0;
      assign H1ADDR_TOTAL[CFG_ABITS-1:0] = H1ADDR;
    end
  endgenerate

	wire [17:CFG_DBITS] A1_RDATA_CMPL;
	wire [17:CFG_DBITS] C1_RDATA_CMPL;
	wire [17:CFG_DBITS] E1_RDATA_CMPL;
	wire [17:CFG_DBITS] G1_RDATA_CMPL;

	wire [17:CFG_DBITS] B1_WDATA_CMPL = {17-CFG_DBITS{1'b0}};
	wire [17:CFG_DBITS] D1_WDATA_CMPL = {17-CFG_DBITS{1'b0}};
	wire [17:CFG_DBITS] F1_WDATA_CMPL = {17-CFG_DBITS{1'b0}};
	wire [17:CFG_DBITS] H1_WDATA_CMPL = {17-CFG_DBITS{1'b0}};

	wire [14:0] PORT_A1_ADDR;
	wire [14:0] PORT_A2_ADDR;
	wire [14:0] PORT_B1_ADDR;
	wire [14:0] PORT_B2_ADDR;

	case (CFG_DBITS)
		1: begin
			assign PORT_A1_ADDR = A1EN ? A1ADDR_TOTAL : (B1EN ? B1ADDR_TOTAL : 14'd0);
			assign PORT_B1_ADDR = C1EN ? C1ADDR_TOTAL : (D1EN ? D1ADDR_TOTAL : 14'd0);
			assign PORT_A2_ADDR = E1EN ? E1ADDR_TOTAL : (F1EN ? F1ADDR_TOTAL : 14'd0);
			assign PORT_B2_ADDR = G1EN ? G1ADDR_TOTAL : (H1EN ? H1ADDR_TOTAL : 14'd0);
			defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b1,
				11'd10, 11'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0,
				12'd10, 12'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0
			};
		end

		2: begin
			assign PORT_A1_ADDR = A1EN ? (A1ADDR_TOTAL << 1) : (B1EN ? (B1ADDR_TOTAL << 1) : 14'd0);
			assign PORT_B1_ADDR = C1EN ? (C1ADDR_TOTAL << 1) : (D1EN ? (D1ADDR_TOTAL << 1) : 14'd0);
			assign PORT_A2_ADDR = E1EN ? (E1ADDR_TOTAL << 1) : (F1EN ? (F1ADDR_TOTAL << 1) : 14'd0);
			assign PORT_B2_ADDR = G1EN ? (G1ADDR_TOTAL << 1) : (H1EN ? (H1ADDR_TOTAL << 1) : 14'd0);
			defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b1,
				11'd10, 11'd10, 4'd0, `MODE_2, `MODE_2, `MODE_2, `MODE_2, 1'd0,
				12'd10, 12'd10, 4'd0, `MODE_2, `MODE_2, `MODE_2, `MODE_2, 1'd0
			};
		end

		4: begin
			assign PORT_A1_ADDR = A1EN ? (A1ADDR_TOTAL << 2) : (B1EN ? (B1ADDR_TOTAL << 2) : 14'd0);
			assign PORT_B1_ADDR = C1EN ? (C1ADDR_TOTAL << 2) : (D1EN ? (D1ADDR_TOTAL << 2) : 14'd0);
			assign PORT_A2_ADDR = E1EN ? (E1ADDR_TOTAL << 2) : (F1EN ? (F1ADDR_TOTAL << 2) : 14'd0);
			assign PORT_B2_ADDR = G1EN ? (G1ADDR_TOTAL << 2) : (H1EN ? (H1ADDR_TOTAL << 2) : 14'd0);
			defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b1,
				11'd10, 11'd10, 4'd0, `MODE_4, `MODE_4, `MODE_4, `MODE_4, 1'd0,
				12'd10, 12'd10, 4'd0, `MODE_4, `MODE_4, `MODE_4, `MODE_4, 1'd0
			};
		end

		8, 9: begin
			assign PORT_A1_ADDR = A1EN ? (A1ADDR_TOTAL << 3) : (B1EN ? (B1ADDR_TOTAL << 3) : 14'd0);
			assign PORT_B1_ADDR = C1EN ? (C1ADDR_TOTAL << 3) : (D1EN ? (D1ADDR_TOTAL << 3) : 14'd0);
			assign PORT_A2_ADDR = E1EN ? (E1ADDR_TOTAL << 3) : (F1EN ? (F1ADDR_TOTAL << 3) : 14'd0);
			assign PORT_B2_ADDR = G1EN ? (G1ADDR_TOTAL << 3) : (H1EN ? (H1ADDR_TOTAL << 3) : 14'd0);
			defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b1,
				11'd10, 11'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0,
				12'd10, 12'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0
			};
		end

		16, 18: begin
			assign PORT_A1_ADDR = A1EN ? (A1ADDR_TOTAL << 4) : (B1EN ? (B1ADDR_TOTAL << 4) : 14'd0);
			assign PORT_B1_ADDR = C1EN ? (C1ADDR_TOTAL << 4) : (D1EN ? (D1ADDR_TOTAL << 4) : 14'd0);
			assign PORT_A2_ADDR = E1EN ? (E1ADDR_TOTAL << 4) : (F1EN ? (F1ADDR_TOTAL << 4) : 14'd0);
			assign PORT_B2_ADDR = G1EN ? (G1ADDR_TOTAL << 4) : (H1EN ? (H1ADDR_TOTAL << 4) : 14'd0);
			defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b1,
				11'd10, 11'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0,
				12'd10, 12'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0
			};
		end

		default: begin
			assign PORT_A1_ADDR = A1EN ? A1ADDR_TOTAL : (B1EN ? B1ADDR_TOTAL : 14'd0);
			assign PORT_B1_ADDR = C1EN ? C1ADDR_TOTAL : (D1EN ? D1ADDR_TOTAL : 14'd0);
			assign PORT_A2_ADDR = E1EN ? E1ADDR_TOTAL : (F1EN ? F1ADDR_TOTAL : 14'd0);
			assign PORT_B2_ADDR = G1EN ? G1ADDR_TOTAL : (H1EN ? H1ADDR_TOTAL : 14'd0);
			defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b1,
				11'd10, 11'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0,
				12'd10, 12'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0
			};
		end
	endcase

	assign FLUSH1 = 1'b0;
	assign FLUSH2 = 1'b0;

	wire [17:0] PORT_A1_RDATA;
	wire [17:0] PORT_B1_RDATA;
	wire [17:0] PORT_A2_RDATA;
	wire [17:0] PORT_B2_RDATA;

	wire [17:0] PORT_A1_WDATA;
	wire [17:0] PORT_B1_WDATA;
	wire [17:0] PORT_A2_WDATA;
	wire [17:0] PORT_B2_WDATA;

	// Assign read/write data - handle special case for 9bit mode
	// parity bit for 9bit mode is placed in R/W port on bit #16
	case (CFG_DBITS)
		9: begin
			assign A1DATA = {PORT_A1_RDATA[16], PORT_A1_RDATA[7:0]};
			assign C1DATA = {PORT_B1_RDATA[16], PORT_B1_RDATA[7:0]};
			assign E1DATA = {PORT_A2_RDATA[16], PORT_A2_RDATA[7:0]};
			assign G1DATA = {PORT_B2_RDATA[16], PORT_B2_RDATA[7:0]};
			assign PORT_A1_WDATA = {B1_WDATA_CMPL[17], B1DATA[8], B1_WDATA_CMPL[16:9], B1DATA[7:0]};
			assign PORT_B1_WDATA = {D1_WDATA_CMPL[17], D1DATA[8], D1_WDATA_CMPL[16:9], D1DATA[7:0]};
			assign PORT_A2_WDATA = {F1_WDATA_CMPL[17], F1DATA[8], F1_WDATA_CMPL[16:9], F1DATA[7:0]};
			assign PORT_B2_WDATA = {H1_WDATA_CMPL[17], H1DATA[8], H1_WDATA_CMPL[16:9], H1DATA[7:0]};
		end
		default: begin
			assign A1DATA = PORT_A1_RDATA[CFG_DBITS-1:0];
			assign C1DATA = PORT_B1_RDATA[CFG_DBITS-1:0];
			assign E1DATA = PORT_A2_RDATA[CFG_DBITS-1:0];
			assign G1DATA = PORT_B2_RDATA[CFG_DBITS-1:0];
			assign PORT_A1_WDATA = {B1_WDATA_CMPL, B1DATA};
			assign PORT_B1_WDATA = {D1_WDATA_CMPL, D1DATA};
			assign PORT_A2_WDATA = {F1_WDATA_CMPL, F1DATA};
			assign PORT_B2_WDATA = {H1_WDATA_CMPL, H1DATA};

		end
	endcase

	wire PORT_A1_CLK = CLK1;
	wire PORT_A2_CLK = CLK3;
	wire PORT_B1_CLK = CLK2;
	wire PORT_B2_CLK = CLK4;

	wire PORT_A1_REN = A1EN;
	wire PORT_A1_WEN = B1EN[0];
	wire [CFG_ENABLE_B-1:0] PORT_A1_BE = {B1EN[1],B1EN[0]};

	wire PORT_A2_REN = E1EN;
	wire PORT_A2_WEN = F1EN[0];
	wire [CFG_ENABLE_F-1:0] PORT_A2_BE = {F1EN[1],F1EN[0]};

	wire PORT_B1_REN = C1EN;
	wire PORT_B1_WEN = D1EN[0];
	wire [CFG_ENABLE_D-1:0] PORT_B1_BE = {D1EN[1],D1EN[0]};

	wire PORT_B2_REN = G1EN;
	wire PORT_B2_WEN = H1EN[0];
	wire [CFG_ENABLE_H-1:0] PORT_B2_BE = {H1EN[1],H1EN[0]};

    (* is_split = 1 *)
    (* rd_data_width = CFG_DBITS *)
    (* wr_data_width = CFG_DBITS *)
	TDP36K  _TECHMAP_REPLACE_ (
		.WDATA_A1_i(PORT_A1_WDATA),
		.RDATA_A1_o(PORT_A1_RDATA),
		.ADDR_A1_i(PORT_A1_ADDR),
		.CLK_A1_i(PORT_A1_CLK),
		.REN_A1_i(PORT_A1_REN),
		.WEN_A1_i(PORT_A1_WEN),
		.BE_A1_i(PORT_A1_BE),

		.WDATA_A2_i(PORT_A2_WDATA),
		.RDATA_A2_o(PORT_A2_RDATA),
		.ADDR_A2_i(PORT_A2_ADDR),
		.CLK_A2_i(PORT_A2_CLK),
		.REN_A2_i(PORT_A2_REN),
		.WEN_A2_i(PORT_A2_WEN),
		.BE_A2_i(PORT_A2_BE),

		.WDATA_B1_i(PORT_B1_WDATA),
		.RDATA_B1_o(PORT_B1_RDATA),
		.ADDR_B1_i(PORT_B1_ADDR),
		.CLK_B1_i(PORT_B1_CLK),
		.REN_B1_i(PORT_B1_REN),
		.WEN_B1_i(PORT_B1_WEN),
		.BE_B1_i(PORT_B1_BE),

		.WDATA_B2_i(PORT_B2_WDATA),
		.RDATA_B2_o(PORT_B2_RDATA),
		.ADDR_B2_i(PORT_B2_ADDR),
		.CLK_B2_i(PORT_B2_CLK),
		.REN_B2_i(PORT_B2_REN),
		.WEN_B2_i(PORT_B2_WEN),
		.BE_B2_i(PORT_B2_BE),

		.FLUSH1_i(FLUSH1),
		.FLUSH2_i(FLUSH2)
	);
endmodule
