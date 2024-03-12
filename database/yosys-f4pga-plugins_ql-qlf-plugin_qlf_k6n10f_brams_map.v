// Copyright 2020-2022 F4PGA Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0

`define MODE_36 3'b011	// 36 or 32-bit
`define MODE_18 3'b010	// 18 or 16-bit
`define MODE_9  3'b001	// 9 or 8-bit
`define MODE_4  3'b100	// 4-bit
`define MODE_2  3'b110	// 32-bit
`define MODE_1  3'b101	// 32-bit

module \$__QLF_FACTOR_BRAM36_TDP (A1ADDR, A1DATA, A1EN, B1ADDR, B1DATA, B1EN, C1ADDR, C1DATA, C1EN, CLK1, CLK2, D1ADDR, D1DATA, D1EN);
	parameter CFG_ABITS = 10;
	parameter CFG_DBITS = 36;
	parameter CFG_ENABLE_B = 4;
	parameter CFG_ENABLE_D = 4;

	parameter CLKPOL2 = 1;
	parameter CLKPOL3 = 1;
	parameter [36863:0] INIT = 36864'bx;

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
	input [CFG_ENABLE_B-1:0] D1EN;

	wire FLUSH1;
	wire FLUSH2;
	wire SPLIT;

	wire [14:CFG_ABITS] A1ADDR_CMPL = {15-CFG_ABITS{1'b0}};
	wire [14:CFG_ABITS] B1ADDR_CMPL = {15-CFG_ABITS{1'b0}};
	wire [14:CFG_ABITS] C1ADDR_CMPL = {15-CFG_ABITS{1'b0}};
	wire [14:CFG_ABITS] D1ADDR_CMPL = {15-CFG_ABITS{1'b0}};

	wire [14:0] A1ADDR_TOTAL = {A1ADDR_CMPL, A1ADDR};
	wire [14:0] B1ADDR_TOTAL = {B1ADDR_CMPL, B1ADDR};
	wire [14:0] C1ADDR_TOTAL = {C1ADDR_CMPL, C1ADDR};
	wire [14:0] D1ADDR_TOTAL = {D1ADDR_CMPL, D1ADDR};

	wire [35:CFG_DBITS] A1DATA_CMPL;
	wire [35:CFG_DBITS] B1DATA_CMPL;
	wire [35:CFG_DBITS] C1DATA_CMPL;
	wire [35:CFG_DBITS] D1DATA_CMPL;

	wire [35:0] A1DATA_TOTAL;
	wire [35:0] B1DATA_TOTAL;
	wire [35:0] C1DATA_TOTAL;
	wire [35:0] D1DATA_TOTAL;

	wire [14:0] PORT_A_ADDR;
	wire [14:0] PORT_B_ADDR;

	// Assign read/write data - handle special case for 9bit mode
	// parity bit for 9bit mode is placed in R/W port on bit #16
	case (CFG_DBITS)
		9: begin
			assign A1DATA = {A1DATA_TOTAL[16], A1DATA_TOTAL[7:0]};
			assign C1DATA = {C1DATA_TOTAL[16], C1DATA_TOTAL[7:0]};
			assign B1DATA_TOTAL = {B1DATA_CMPL[35:17], B1DATA[8], B1DATA_CMPL[16:9], B1DATA[7:0]};
			assign D1DATA_TOTAL = {D1DATA_CMPL[35:17], D1DATA[8], D1DATA_CMPL[16:9], D1DATA[7:0]};
		end
		default: begin
			assign A1DATA = A1DATA_TOTAL[CFG_DBITS-1:0];
			assign C1DATA = C1DATA_TOTAL[CFG_DBITS-1:0];
			assign B1DATA_TOTAL = {B1DATA_CMPL, B1DATA};
			assign D1DATA_TOTAL = {D1DATA_CMPL, D1DATA};
		end
	endcase

	case (CFG_DBITS)
		1: begin
			assign PORT_A_ADDR = A1EN ? A1ADDR_TOTAL : (B1EN ? B1ADDR_TOTAL : 15'd0);
			assign PORT_B_ADDR = C1EN ? C1ADDR_TOTAL : (D1EN ? D1ADDR_TOTAL : 15'd0);
            defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
                11'd10, 11'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0,
                12'd10, 12'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0
            };
		end

		2: begin
			assign PORT_A_ADDR = A1EN ? (A1ADDR_TOTAL << 1) : (B1EN ? (B1ADDR_TOTAL << 1) : 15'd0);
			assign PORT_B_ADDR = C1EN ? (C1ADDR_TOTAL << 1) : (D1EN ? (D1ADDR_TOTAL << 1) : 15'd0);
            defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
                11'd10, 11'd10, 4'd0, `MODE_2, `MODE_2, `MODE_2, `MODE_2, 1'd0,
                12'd10, 12'd10, 4'd0, `MODE_2, `MODE_2, `MODE_2, `MODE_2, 1'd0
            };
		end

		4: begin
			assign PORT_A_ADDR = A1EN ? (A1ADDR_TOTAL << 2) : (B1EN ? (B1ADDR_TOTAL << 2) : 15'd0);
			assign PORT_B_ADDR = C1EN ? (C1ADDR_TOTAL << 2) : (D1EN ? (D1ADDR_TOTAL << 2) : 15'd0);
            defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
                11'd10, 11'd10, 4'd0, `MODE_4, `MODE_4, `MODE_4, `MODE_4, 1'd0,
                12'd10, 12'd10, 4'd0, `MODE_4, `MODE_4, `MODE_4, `MODE_4, 1'd0
            };
		end

		8, 9: begin
			assign PORT_A_ADDR = A1EN ? (A1ADDR_TOTAL << 3) : (B1EN ? (B1ADDR_TOTAL << 3) : 15'd0);
			assign PORT_B_ADDR = C1EN ? (C1ADDR_TOTAL << 3) : (D1EN ? (D1ADDR_TOTAL << 3) : 15'd0);
            defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
                11'd10, 11'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0,
                12'd10, 12'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0
            };
		end

		16, 18: begin
			assign PORT_A_ADDR = A1EN ? (A1ADDR_TOTAL << 4) : (B1EN ? (B1ADDR_TOTAL << 4) : 15'd0);
			assign PORT_B_ADDR = C1EN ? (C1ADDR_TOTAL << 4) : (D1EN ? (D1ADDR_TOTAL << 4) : 15'd0);
            defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
                11'd10, 11'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0,
                12'd10, 12'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0
            };
		end

		32, 36: begin
			assign PORT_A_ADDR = A1EN ? (A1ADDR_TOTAL << 5) : (B1EN ? (B1ADDR_TOTAL << 5) : 15'd0);
			assign PORT_B_ADDR = C1EN ? (C1ADDR_TOTAL << 5) : (D1EN ? (D1ADDR_TOTAL << 5) : 15'd0);
            defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
                11'd10, 11'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0,
                12'd10, 12'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0
            };
		end
		default: begin
			assign PORT_A_ADDR = A1EN ? A1ADDR_TOTAL : (B1EN ? B1ADDR_TOTAL : 15'd0);
			assign PORT_B_ADDR = C1EN ? C1ADDR_TOTAL : (D1EN ? D1ADDR_TOTAL : 15'd0);
            defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
                11'd10, 11'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0,
                12'd10, 12'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0
            };
		end
	endcase


	assign SPLIT = 1'b0;
	assign FLUSH1 = 1'b0;
	assign FLUSH2 = 1'b0;

    (* is_inferred = 1 *)
    (* rd_data_width = CFG_DBITS *)
    (* wr_data_width = CFG_DBITS *)
	TDP36K _TECHMAP_REPLACE_ (
		.RESET_ni(1'b1),
		.WDATA_A1_i(B1DATA_TOTAL[17:0]),
		.WDATA_A2_i(B1DATA_TOTAL[35:18]),
		.RDATA_A1_o(A1DATA_TOTAL[17:0]),
		.RDATA_A2_o(A1DATA_TOTAL[35:18]),
		.ADDR_A1_i(PORT_A_ADDR),
		.ADDR_A2_i(PORT_A_ADDR),
		.CLK_A1_i(CLK1),
		.CLK_A2_i(CLK1),
		.REN_A1_i(A1EN),
		.REN_A2_i(A1EN),
		.WEN_A1_i(B1EN[0]),
		.WEN_A2_i(B1EN[0]),
		.BE_A1_i({B1EN[1],B1EN[0]}),
		.BE_A2_i({B1EN[3],B1EN[2]}),

		.WDATA_B1_i(D1DATA_TOTAL[17:0]),
		.WDATA_B2_i(D1DATA_TOTAL[35:18]),
		.RDATA_B1_o(C1DATA_TOTAL[17:0]),
		.RDATA_B2_o(C1DATA_TOTAL[35:18]),
		.ADDR_B1_i(PORT_B_ADDR),
		.ADDR_B2_i(PORT_B_ADDR),
		.CLK_B1_i(CLK2),
		.CLK_B2_i(CLK2),
		.REN_B1_i(C1EN),
		.REN_B2_i(C1EN),
		.WEN_B1_i(D1EN[0]),
		.WEN_B2_i(D1EN[0]),
		.BE_B1_i({D1EN[1],D1EN[0]}),
		.BE_B2_i({D1EN[3],D1EN[2]}),

		.FLUSH1_i(FLUSH1),
		.FLUSH2_i(FLUSH2)
	);
endmodule

// ------------------------------------------------------------------------

module \$__QLF_FACTOR_BRAM18_TDP (A1ADDR, A1DATA, A1EN, B1ADDR, B1DATA, B1EN, C1ADDR, C1DATA, C1EN, CLK1, CLK2, CLK3, CLK4, D1ADDR, D1DATA, D1EN);
	parameter CFG_ABITS = 11;
	parameter CFG_DBITS = 18;
	parameter CFG_ENABLE_B = 4;
	parameter CFG_ENABLE_D = 4;

	parameter CLKPOL2 = 1;
	parameter CLKPOL3 = 1;
	parameter [18431:0] INIT = 18432'bx;

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

    (* is_inferred = 1 *)
	BRAM2x18_TDP #(
		.CFG_ABITS(CFG_ABITS),
		.CFG_DBITS(CFG_DBITS),
		.CFG_ENABLE_B(CFG_ENABLE_B),
		.CFG_ENABLE_D(CFG_ENABLE_D),
		.CLKPOL2(CLKPOL2),
		.CLKPOL3(CLKPOL3),
		.INIT0(INIT)
	) _TECHMAP_REPLACE_ (
		.A1ADDR(A1ADDR),
		.A1DATA(A1DATA),
		.A1EN(A1EN),
		.B1ADDR(B1ADDR),
		.B1DATA(B1DATA),
		.B1EN(B1EN),
		.CLK1(CLK1),

		.C1ADDR(C1ADDR),
		.C1DATA(C1DATA),
		.C1EN(C1EN),
		.D1ADDR(D1ADDR),
		.D1DATA(D1DATA),
		.D1EN(D1EN),
		.CLK2(CLK2),

		.E1ADDR(),
		.E1DATA(),
		.E1EN(),
		.F1ADDR(),
		.F1DATA(),
		.F1EN(),
		.CLK3(),

		.G1ADDR(),
		.G1DATA(),
		.G1EN(),
		.H1ADDR(),
		.H1DATA(),
		.H1EN(),
		.CLK4()
	);
endmodule

module \$__QLF_FACTOR_BRAM18_SDP (A1ADDR, A1DATA, A1EN, B1ADDR, B1DATA, B1EN, CLK1, CLK2);
	parameter CFG_ABITS = 11;
	parameter CFG_DBITS = 18;
	parameter CFG_ENABLE_B = 4;

	parameter CLKPOL2 = 1;
	parameter CLKPOL3 = 1;
	parameter [18431:0] INIT = 18432'bx;

	input CLK1;
	input CLK2;

	input [CFG_ABITS-1:0] A1ADDR;
	output [CFG_DBITS-1:0] A1DATA;
	input A1EN;

	input [CFG_ABITS-1:0] B1ADDR;
	input [CFG_DBITS-1:0] B1DATA;
	input [CFG_ENABLE_B-1:0] B1EN;

    (* is_inferred = 1 *)
	BRAM2x18_SDP #(
		.CFG_ABITS(CFG_ABITS),
		.CFG_DBITS(CFG_DBITS),
		.CFG_ENABLE_B(CFG_ENABLE_B),
		.CLKPOL2(CLKPOL2),
		.CLKPOL3(CLKPOL3),
		.INIT0(INIT)
	) _TECHMAP_REPLACE_ (
		.A1ADDR(A1ADDR),
		.A1DATA(A1DATA),
		.A1EN(A1EN),
		.CLK1(CLK1),

		.B1ADDR(B1ADDR),
		.B1DATA(B1DATA),
		.B1EN(B1EN),
		.CLK2(CLK2)
	);
endmodule

module \$__QLF_FACTOR_BRAM36_SDP (CLK2, CLK3, A1ADDR, A1DATA, A1EN, B1ADDR, B1DATA, B1EN);
	parameter CFG_ABITS = 10;
	parameter CFG_DBITS = 36;
	parameter CFG_ENABLE_B = 4;

	parameter CLKPOL2 = 1;
	parameter CLKPOL3 = 1;
	parameter [36863:0] INIT = 36864'bx;

	localparam MODE_36  = 3'b111;	// 36 or 32-bit
	localparam MODE_18  = 3'b110;	// 18 or 16-bit
	localparam MODE_9   = 3'b101;	// 9 or 8-bit
	localparam MODE_4   = 3'b100;	// 4-bit
	localparam MODE_2   = 3'b010;	// 32-bit
	localparam MODE_1   = 3'b001;	// 32-bit

	input CLK2;
	input CLK3;

	input [CFG_ABITS-1:0] A1ADDR;
	output [CFG_DBITS-1:0] A1DATA;
	input A1EN;

	input [CFG_ABITS-1:0] B1ADDR;
	input [CFG_DBITS-1:0] B1DATA;
	input [CFG_ENABLE_B-1:0] B1EN;

	wire [14:0] A1ADDR_15;
	wire [14:0] B1ADDR_15;

	wire [35:0] DOBDO;

	wire [14:CFG_ABITS] A1ADDR_CMPL;
	wire [14:CFG_ABITS] B1ADDR_CMPL;
	wire [35:CFG_DBITS] A1DATA_CMPL;
	wire [35:CFG_DBITS] B1DATA_CMPL;

	wire [14:0] A1ADDR_TOTAL;
	wire [14:0] B1ADDR_TOTAL;
	wire [35:0] A1DATA_TOTAL;
	wire [35:0] B1DATA_TOTAL;

	wire FLUSH1;
	wire FLUSH2;

	assign A1ADDR_CMPL = {15-CFG_ABITS{1'b0}};
	assign B1ADDR_CMPL = {15-CFG_ABITS{1'b0}};

	assign A1ADDR_TOTAL = {A1ADDR_CMPL, A1ADDR};
	assign B1ADDR_TOTAL = {B1ADDR_CMPL, B1ADDR};

	// Assign read/write data - handle special case for 9bit mode
	// parity bit for 9bit mode is placed in R/W port on bit #16
	case (CFG_DBITS)
		9: begin
			assign A1DATA = {A1DATA_TOTAL[16], A1DATA_TOTAL[7:0]};
			assign B1DATA_TOTAL = {B1DATA_CMPL[35:17], B1DATA[8], B1DATA_CMPL[16:9], B1DATA[7:0]};
		end
		default: begin
			assign A1DATA = A1DATA_TOTAL[CFG_DBITS-1:0];
			assign B1DATA_TOTAL = {B1DATA_CMPL, B1DATA};
		end
	endcase

	case (CFG_DBITS)
		1: begin
			assign A1ADDR_15 = A1ADDR_TOTAL;
			assign B1ADDR_15 = B1ADDR_TOTAL;
            defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
                11'd10, 11'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0,
                12'd10, 12'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0
            };
		end

		2: begin
			assign A1ADDR_15 = A1ADDR_TOTAL << 1;
			assign B1ADDR_15 = B1ADDR_TOTAL << 1;
            defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
                11'd10, 11'd10, 4'd0, `MODE_2, `MODE_2, `MODE_2, `MODE_2, 1'd0,
                12'd10, 12'd10, 4'd0, `MODE_2, `MODE_2, `MODE_2, `MODE_2, 1'd0
            };
		end

		4: begin
			assign A1ADDR_15 = A1ADDR_TOTAL << 2;
			assign B1ADDR_15 = B1ADDR_TOTAL << 2;
            defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
                11'd10, 11'd10, 4'd0, `MODE_4, `MODE_4, `MODE_4, `MODE_4, 1'd0,
                12'd10, 12'd10, 4'd0, `MODE_4, `MODE_4, `MODE_4, `MODE_4, 1'd0
            };
		end
		8, 9: begin
			assign A1ADDR_15 = A1ADDR_TOTAL << 3;
			assign B1ADDR_15 = B1ADDR_TOTAL << 3;
            defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
                11'd10, 11'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0,
                12'd10, 12'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0
            };
		end

		16, 18: begin
			assign A1ADDR_15 = A1ADDR_TOTAL << 4;
			assign B1ADDR_15 = B1ADDR_TOTAL << 4;
            defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
                11'd10, 11'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0,
                12'd10, 12'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0
            };
		end
		32, 36: begin
			assign A1ADDR_15 = A1ADDR_TOTAL << 5;
			assign B1ADDR_15 = B1ADDR_TOTAL << 5;
            defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
                11'd10, 11'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0,
                12'd10, 12'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0
            };
		end
		default: begin
			assign A1ADDR_15 = A1ADDR_TOTAL;
			assign B1ADDR_15 = B1ADDR_TOTAL;
            defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
                11'd10, 11'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0,
                12'd10, 12'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0
            };
		end
	endcase


	assign FLUSH1 = 1'b0;
	assign FLUSH2 = 1'b0;

    (* is_inferred = 1 *)
    (* rd_data_width = CFG_DBITS *)
    (* wr_data_width = CFG_DBITS *)
	TDP36K _TECHMAP_REPLACE_ (
		.RESET_ni(1'b1),
		.WDATA_A1_i(18'h3FFFF),
		.WDATA_A2_i(18'h3FFFF),
		.RDATA_A1_o(A1DATA_TOTAL[17:0]),
		.RDATA_A2_o(A1DATA_TOTAL[35:18]),
		.ADDR_A1_i(A1ADDR_15),
		.ADDR_A2_i(A1ADDR_15),
		.CLK_A1_i(CLK2),
		.CLK_A2_i(CLK2),
		.REN_A1_i(A1EN),
		.REN_A2_i(A1EN),
		.WEN_A1_i(1'b0),
		.WEN_A2_i(1'b0),
		.BE_A1_i({A1EN, A1EN}),
		.BE_A2_i({A1EN, A1EN}),

		.WDATA_B1_i(B1DATA_TOTAL[17:0]),
		.WDATA_B2_i(B1DATA_TOTAL[35:18]),
		.RDATA_B1_o(DOBDO[17:0]),
		.RDATA_B2_o(DOBDO[35:18]),
		.ADDR_B1_i(B1ADDR_15),
		.ADDR_B2_i(B1ADDR_15),
		.CLK_B1_i(CLK3),
		.CLK_B2_i(CLK3),
		.REN_B1_i(1'b0),
		.REN_B2_i(1'b0),
		.WEN_B1_i(B1EN[0]),
		.WEN_B2_i(B1EN[0]),
		.BE_B1_i(B1EN[1:0]),
		.BE_B2_i(B1EN[3:2]),

		.FLUSH1_i(FLUSH1),
		.FLUSH2_i(FLUSH2)
	);
endmodule

(* techmap_celltype = "_$_mem_v2_asymmetric" *)
module \$__QLF_FACTOR_BRAM36_SDP_ASYMMETRIC (RD_ADDR, RD_ARST, RD_CLK, RD_DATA, RD_EN, RD_SRST, WR_ADDR, WR_CLK, WR_DATA, WR_EN);
	parameter CFG_ABITS = 10;
	parameter CFG_DBITS = 36;
	parameter CFG_ENABLE_B = 4;

	parameter CLKPOL2 = 1;
	parameter CLKPOL3 = 1;

	parameter RD_ADDR_WIDTH = 11;
	parameter RD_DATA_WIDTH = 16;
	parameter WR_ADDR_WIDTH = 10;
	parameter WR_DATA_WIDTH = 32;

	parameter ABITS = 0;
	parameter MEMID = 0;
	parameter [36863:0] INIT = 36864'bx;
	parameter OFFSET = 0;
	parameter RD_ARST_VALUE = 0;
	parameter RD_CE_OVER_SRST = 0;
	parameter RD_CLK_ENABLE = 0;
	parameter RD_CLK_POLARITY = 0;
	parameter RD_COLLISION_X_MASK = 0;
	parameter RD_INIT_VALUE = 0;
	parameter RD_PORTS = 0;
	parameter RD_SRST_VALUE = 0;
	parameter RD_TRANSPARENCY_MASK = 0;
	parameter RD_WIDE_CONTINUATION = 0;
	parameter SIZE = 0;
	parameter WIDTH = 0;
	parameter WR_CLK_ENABLE = 0;
	parameter WR_CLK_POLARITY = 0;
	parameter WR_PORTS = 0;
	parameter WR_PRIORITY_MASK = 0;
	parameter WR_WIDE_CONTINUATION = 0;

	localparam MODE_36  = 3'b111;	// 36 or 32-bit
	localparam MODE_18  = 3'b110;	// 18 or 16-bit
	localparam MODE_9   = 3'b101;	// 9 or 8-bit
	localparam MODE_4   = 3'b100;	// 4-bit
	localparam MODE_2   = 3'b010;	// 32-bit
	localparam MODE_1   = 3'b001;	// 32-bit

	localparam READ_DATA_BITS_TO_SKIP = 36 - RD_DATA_WIDTH;

	input RD_CLK;
	input WR_CLK;
	input RD_ARST;
	input RD_SRST;

	input [RD_ADDR_WIDTH-1:0] RD_ADDR;
	output reg [RD_DATA_WIDTH-1:0] RD_DATA;
	input RD_EN;

	input [WR_ADDR_WIDTH-1:0] WR_ADDR;
	input [WR_DATA_WIDTH-1:0] WR_DATA;
	input [CFG_ENABLE_B-1:0] WR_EN;

	wire [14:RD_ADDR_WIDTH] RD_ADDR_CMPL;
	wire [14:WR_ADDR_WIDTH] WR_ADDR_CMPL;
	reg [35:RD_DATA_WIDTH] RD_DATA_CMPL;
	wire [35:WR_DATA_WIDTH] WR_DATA_CMPL;

	wire [14:0] RD_ADDR_TOTAL;
	wire [14:0] WR_ADDR_TOTAL;
	wire [35:0] RD_DATA_TOTAL;
	wire [35:0] WR_DATA_TOTAL;

	wire [14:0] RD_ADDR_SHIFTED;
	wire [14:0] WR_ADDR_SHIFTED;

	wire FLUSH1;
	wire FLUSH2;

	assign RD_ADDR_CMPL = {15-RD_ADDR_WIDTH{1'b0}};
	assign WR_ADDR_CMPL = {15-WR_ADDR_WIDTH{1'b0}};

	assign RD_ADDR_TOTAL = {RD_ADDR_CMPL, RD_ADDR};
	assign WR_ADDR_TOTAL = {WR_ADDR_CMPL, WR_ADDR};

	assign WR_DATA_TOTAL = {WR_DATA_CMPL, WR_DATA};

	// Assign parameters
	case (RD_DATA_WIDTH)
		1: begin
			case (WR_DATA_WIDTH)
				1: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0
					};
				end
				2: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_1, `MODE_2, `MODE_1, `MODE_2, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_1, `MODE_2, `MODE_1, `MODE_2, 1'd0
					};
				end
				4: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_1, `MODE_4, `MODE_1, `MODE_4, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_1, `MODE_4, `MODE_1, `MODE_4, 1'd0
					};
				end
				8, 9: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_1, `MODE_9, `MODE_1, `MODE_9, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_1, `MODE_9, `MODE_1, `MODE_9, 1'd0
					};
				end
				16, 18: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_1, `MODE_18, `MODE_1, `MODE_18, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_1, `MODE_18, `MODE_1, `MODE_18, 1'd0
					};
				end
				32, 36: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_1, `MODE_36, `MODE_1, `MODE_36, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_1, `MODE_36, `MODE_1, `MODE_36, 1'd0
					};
				end
				default: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0
					};
				end
			endcase
		end
		2: begin
			case (WR_DATA_WIDTH)
				1: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_2, `MODE_1, `MODE_2, `MODE_1, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_2, `MODE_1, `MODE_2, `MODE_1, 1'd0
					};
				end
				2: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_2, `MODE_2, `MODE_2, `MODE_2, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_2, `MODE_2, `MODE_2, `MODE_2, 1'd0
					};
				end
				4: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_2, `MODE_4, `MODE_2, `MODE_4, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_2, `MODE_4, `MODE_2, `MODE_4, 1'd0
					};
				end
				8, 9: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_2, `MODE_9, `MODE_2, `MODE_9, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_2, `MODE_9, `MODE_2, `MODE_9, 1'd0
					};
				end
				16, 18: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_2, `MODE_18, `MODE_2, `MODE_18, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_2, `MODE_18, `MODE_2, `MODE_18, 1'd0
					};
				end
				32, 36: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_2, `MODE_36, `MODE_2, `MODE_36, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_2, `MODE_36, `MODE_2, `MODE_36, 1'd0
					};
				end
				default: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_2, `MODE_1, `MODE_2, `MODE_1, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_2, `MODE_1, `MODE_2, `MODE_1, 1'd0
					};
				end
			endcase
		end
		4: begin
			case (WR_DATA_WIDTH)
				1: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_4, `MODE_1, `MODE_4, `MODE_1, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_4, `MODE_1, `MODE_4, `MODE_1, 1'd0
					};
				end
				2: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_4, `MODE_2, `MODE_4, `MODE_2, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_4, `MODE_2, `MODE_4, `MODE_2, 1'd0
					};
				end
				4: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_4, `MODE_4, `MODE_4, `MODE_4, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_4, `MODE_4, `MODE_4, `MODE_4, 1'd0
					};
				end
				8, 9: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_4, `MODE_9, `MODE_4, `MODE_9, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_4, `MODE_9, `MODE_4, `MODE_9, 1'd0
					};
				end
				16, 18: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_4, `MODE_18, `MODE_4, `MODE_18, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_4, `MODE_18, `MODE_4, `MODE_18, 1'd0
					};
				end
				32, 36: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_4, `MODE_36, `MODE_4, `MODE_36, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_4, `MODE_36, `MODE_4, `MODE_36, 1'd0
					};
				end
				default: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_4, `MODE_1, `MODE_4, `MODE_1, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_4, `MODE_1, `MODE_4, `MODE_1, 1'd0
					};
				end
			endcase
		end
		8, 9: begin
			case (WR_DATA_WIDTH)
				1: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_9, `MODE_1, `MODE_9, `MODE_1, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_9, `MODE_1, `MODE_9, `MODE_1, 1'd0
					};
				end
				2: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_9, `MODE_2, `MODE_9, `MODE_2, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_9, `MODE_2, `MODE_9, `MODE_2, 1'd0
					};
				end
				4: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_9, `MODE_4, `MODE_9, `MODE_4, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_9, `MODE_4, `MODE_9, `MODE_4, 1'd0
					};
				end
				8, 9: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0
					};
				end
				16, 18: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_9, `MODE_18, `MODE_9, `MODE_18, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_9, `MODE_18, `MODE_9, `MODE_18, 1'd0
					};
				end
				32, 36: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_9, `MODE_36, `MODE_9, `MODE_36, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_9, `MODE_36, `MODE_9, `MODE_36, 1'd0
					};
				end
				default: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_9, `MODE_1, `MODE_9, `MODE_1, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_9, `MODE_1, `MODE_9, `MODE_1, 1'd0
					};
				end
			endcase
		end
		16, 18: begin
			case (WR_DATA_WIDTH)
				1: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_18, `MODE_1, `MODE_18, `MODE_1, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_18, `MODE_1, `MODE_18, `MODE_1, 1'd0
					};
				end
				2: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_18, `MODE_2, `MODE_18, `MODE_2, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_18, `MODE_2, `MODE_18, `MODE_2, 1'd0
					};
				end
				4: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_18, `MODE_4, `MODE_18, `MODE_4, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_18, `MODE_4, `MODE_18, `MODE_4, 1'd0
					};
				end
				8, 9: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_18, `MODE_9, `MODE_18, `MODE_9, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_18, `MODE_9, `MODE_18, `MODE_9, 1'd0
					};
				end
				16, 18: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0
					};
				end
				32, 36: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_18, `MODE_36, `MODE_18, `MODE_36, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_18, `MODE_36, `MODE_18, `MODE_36, 1'd0
					};
				end
				default: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_18, `MODE_1, `MODE_18, `MODE_1, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_18, `MODE_1, `MODE_18, `MODE_1, 1'd0
					};
				end
			endcase
		end
		32, 36: begin
			case (WR_DATA_WIDTH)
				1: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_36, `MODE_1, `MODE_36, `MODE_1, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_36, `MODE_1, `MODE_36, `MODE_1, 1'd0
					};
				end
				2: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_36, `MODE_2, `MODE_36, `MODE_2, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_36, `MODE_2, `MODE_36, `MODE_2, 1'd0
					};
				end
				4: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_36, `MODE_4, `MODE_36, `MODE_4, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_36, `MODE_4, `MODE_36, `MODE_4, 1'd0
					};
				end
				8, 9: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_36, `MODE_9, `MODE_36, `MODE_9, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_36, `MODE_9, `MODE_36, `MODE_9, 1'd0
					};
				end
				16, 18: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_36, `MODE_18, `MODE_36, `MODE_18, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_36, `MODE_18, `MODE_36, `MODE_18, 1'd0
					};
				end
				32, 36: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0
					};
				end
				default: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_36, `MODE_1, `MODE_36, `MODE_1, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_36, `MODE_1, `MODE_36, `MODE_1, 1'd0
					};
				end
			endcase
		end
		default: begin
			case (WR_DATA_WIDTH)
				1: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0
					};
				end
				2: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_1, `MODE_2, `MODE_1, `MODE_2, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_1, `MODE_2, `MODE_1, `MODE_2, 1'd0
					};
				end
				4: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_1, `MODE_4, `MODE_1, `MODE_4, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_1, `MODE_4, `MODE_1, `MODE_4, 1'd0
					};
				end
				8, 9: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_1, `MODE_9, `MODE_1, `MODE_9, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_1, `MODE_9, `MODE_1, `MODE_9, 1'd0
					};
				end
				16, 18: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_1, `MODE_18, `MODE_1, `MODE_18, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_1, `MODE_18, `MODE_1, `MODE_18, 1'd0
					};
				end
				32, 36: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
						11'd10, 11'd10, 4'd0, `MODE_1, `MODE_36, `MODE_1, `MODE_36, 1'd0,
						12'd10, 12'd10, 4'd0, `MODE_1, `MODE_36, `MODE_1, `MODE_36, 1'd0
					};
				end
				default: begin
					defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
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
			assign RD_ADDR_SHIFTED = RD_ADDR_TOTAL;
		end
		2: begin
			assign RD_ADDR_SHIFTED = RD_ADDR_TOTAL << 1;
		end
		4: begin
			assign RD_ADDR_SHIFTED = RD_ADDR_TOTAL << 2;
		end
		8, 9: begin
			assign RD_ADDR_SHIFTED = RD_ADDR_TOTAL << 3;
		end
		16, 18: begin
			assign RD_ADDR_SHIFTED = RD_ADDR_TOTAL << 4;
		end
		32, 36: begin
			assign RD_ADDR_SHIFTED = RD_ADDR_TOTAL << 5;
		end
		default: begin
			assign RD_ADDR_SHIFTED = RD_ADDR_TOTAL;
		end
	endcase

	case (WR_DATA_WIDTH)
		1: begin
			assign WR_ADDR_SHIFTED = WR_ADDR_TOTAL;
		end
		2: begin
			assign WR_ADDR_SHIFTED = WR_ADDR_TOTAL << 1;
		end
		4: begin
			assign WR_ADDR_SHIFTED = WR_ADDR_TOTAL << 2;
		end
		8, 9: begin
			assign WR_ADDR_SHIFTED = WR_ADDR_TOTAL << 3;
		end
		16, 18: begin
			assign WR_ADDR_SHIFTED = WR_ADDR_TOTAL << 4;
		end
		32, 36: begin
			assign WR_ADDR_SHIFTED = WR_ADDR_TOTAL << 5;
		end
		default: begin
			assign WR_ADDR_SHIFTED = WR_ADDR_TOTAL;
		end
	endcase

	assign FLUSH1 = 1'b0;
	assign FLUSH2 = 1'b0;

	// TODO configure per width
	wire [17:0] PORT_A1_RDATA;
	wire [17:0] PORT_A2_RDATA;
	always @(PORT_A1_RDATA, PORT_A2_RDATA) begin
		if (RD_DATA_WIDTH > 18)
			{RD_DATA_CMPL, RD_DATA} <= {PORT_A2_RDATA[17 - (READ_DATA_BITS_TO_SKIP / 2):17 - (READ_DATA_BITS_TO_SKIP / 2)], PORT_A1_RDATA[17 - (READ_DATA_BITS_TO_SKIP / 2):17 - (READ_DATA_BITS_TO_SKIP / 2)],PORT_A2_RDATA[17 - (READ_DATA_BITS_TO_SKIP / 2):0], PORT_A1_RDATA[17 - (READ_DATA_BITS_TO_SKIP / 2):0]};
		else
			{RD_DATA_CMPL, RD_DATA} <= {PORT_A1_RDATA[17 - (READ_DATA_BITS_TO_SKIP-18):17 - (READ_DATA_BITS_TO_SKIP-18)], PORT_A1_RDATA[17 - (READ_DATA_BITS_TO_SKIP-18):0]};
	end

	wire [17:0] PORT_A1_WDATA = {WR_DATA_CMPL, WR_DATA[15:0]};
	wire [17:0] PORT_A2_WDATA = {WR_DATA_CMPL, WR_DATA[31:16]};
	// TODO configure per width

	wire PORT_A1_CLK = RD_CLK;
	wire PORT_A2_CLK = RD_CLK;

	wire PORT_A1_REN = RD_EN;
	wire PORT_A1_WEN = WR_EN;
	wire [1:0] PORT_A1_BE = {PORT_A1_WEN, PORT_A1_WEN};

	wire PORT_A2_REN = RD_EN;
	wire PORT_A2_WEN = WR_EN;
	wire [1:0] PORT_A2_BE = {PORT_A2_WEN, PORT_A2_WEN};

    (* is_inferred = 1 *)
    (* rd_data_width = RD_DATA_WIDTH *)
    (* wr_data_width = WR_DATA_WIDTH *)
	TDP36K _TECHMAP_REPLACE_ (
		.RESET_ni(1'b1),

		.WDATA_A1_i(PORT_A1_WDATA),
		.RDATA_A1_o(),
		.ADDR_A1_i(WR_ADDR_SHIFTED),
		.CLK_A1_i(PORT_A1_CLK),
		.REN_A1_i(1'b0),
		.WEN_A1_i(PORT_A1_WEN),
		.BE_A1_i(PORT_A1_BE),

		.WDATA_B1_i(),
		.RDATA_B1_o(PORT_A1_RDATA),
		.ADDR_B1_i(RD_ADDR_SHIFTED),
		.CLK_B1_i(PORT_A1_CLK),
		.REN_B1_i(PORT_A1_REN),
		.WEN_B1_i(1'b0),
		.BE_B1_i(PORT_A1_BE),

		.WDATA_A2_i(PORT_A2_WDATA),
		.RDATA_A2_o(),
		.ADDR_A2_i(WR_ADDR_SHIFTED),
		.CLK_A2_i(PORT_A2_CLK),
		.REN_A2_i(1'b0),
		.WEN_A2_i(PORT_A2_WEN),
		.BE_A2_i(PORT_A2_BE),

		.WDATA_B2_i(),
		.RDATA_B2_o(PORT_A2_RDATA),
		.ADDR_B2_i(RD_ADDR_SHIFTED),
		.CLK_B2_i(PORT_A2_CLK),
		.REN_B2_i(PORT_A2_REN),
		.WEN_B2_i(1'b0),
		.BE_B2_i(PORT_A2_BE),

		.FLUSH1_i(FLUSH1),
		.FLUSH2_i(FLUSH2)
	);
endmodule

module SFIFO_36K_BLK (
    DIN,
    PUSH,
    POP,
    CLK,
    Async_Flush,
    Overrun_Error,
    Full_Watermark,
    Almost_Full,
    Full,
    Underrun_Error,
    Empty_Watermark,
    Almost_Empty,
    Empty,
    DOUT
);

  parameter WR_DATA_WIDTH = 36;
  parameter RD_DATA_WIDTH = 36;
  parameter UPAE_DBITS = 12'd10;
  parameter UPAF_DBITS = 12'd10;

  input wire CLK;
  input wire PUSH, POP;
  input wire [WR_DATA_WIDTH-1:0] DIN;
  input wire Async_Flush;
  output wire [RD_DATA_WIDTH-1:0] DOUT;
  output wire Almost_Full, Almost_Empty;
  output wire Full, Empty;
  output wire Full_Watermark, Empty_Watermark;
  output wire Overrun_Error, Underrun_Error;
  
  wire [35:0] in_reg;
  wire [35:0] out_reg;
  wire [17:0] fifo_flags;
  
  wire [35:0] RD_DATA_CMPL;
  wire [35:WR_DATA_WIDTH] WR_DATA_CMPL;
  
  wire Push_Clk, Pop_Clk;
  
  assign Push_Clk = CLK;
  assign Pop_Clk = CLK;
  
  assign Overrun_Error = fifo_flags[0];
  assign Full_Watermark = fifo_flags[1];
  assign Almost_Full = fifo_flags[2];
  assign Full = fifo_flags[3];
  assign Underrun_Error = fifo_flags[4];
  assign Empty_Watermark = fifo_flags[5];
  assign Almost_Empty = fifo_flags[6];
  assign Empty = fifo_flags[7];
   
  generate
    if (WR_DATA_WIDTH == 36) begin
      assign in_reg[WR_DATA_WIDTH-1:0] = DIN[WR_DATA_WIDTH-1:0];
    end else if (WR_DATA_WIDTH > 18 && WR_DATA_WIDTH < 36) begin
      assign in_reg[WR_DATA_WIDTH+1:18] = DIN[WR_DATA_WIDTH-1:16];
      assign in_reg[17:0] = {2'b00,DIN[15:0]};
    end else if (WR_DATA_WIDTH == 9) begin
      assign in_reg[35:0] = {19'h0, DIN[8], 8'h0, DIN[7:0]};
    end else begin
      assign in_reg[35:WR_DATA_WIDTH]  = 0;
      assign in_reg[WR_DATA_WIDTH-1:0] = DIN[WR_DATA_WIDTH-1:0];
    end
  endgenerate
  
  generate
    if (RD_DATA_WIDTH == 36) begin
      assign RD_DATA_CMPL = out_reg;
    end else if (RD_DATA_WIDTH > 18 && RD_DATA_WIDTH < 36) begin
      assign RD_DATA_CMPL  = {2'b00,out_reg[35:18],out_reg[15:0]};
    end else if (RD_DATA_WIDTH == 9) begin
      assign RD_DATA_CMPL = { 27'h0, out_reg[16], out_reg[7:0]};
    end else begin
      assign RD_DATA_CMPL = {18'h0, out_reg[17:0]};
    end
  endgenerate
  
  case (RD_DATA_WIDTH)
	8, 9: begin
		case (WR_DATA_WIDTH)
			8, 9: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'b1
				};
			end
			16, 18: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_18, `MODE_9, `MODE_18, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_9, `MODE_18, `MODE_9, `MODE_18, 1'b1
				};
			end
			32, 36: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_36, `MODE_9, `MODE_36, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_9, `MODE_36, `MODE_9, `MODE_36, 1'b1
				};
			end
			default: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'b1
				};
			end
		endcase
	end
	16, 18: begin
		case (WR_DATA_WIDTH)
			8, 9: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_9, `MODE_18, `MODE_9, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_18, `MODE_9, `MODE_18, `MODE_9, 1'b1
				};
			end
			16, 18: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b1
				};
			end
			32, 36: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_36, `MODE_18, `MODE_36, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_18, `MODE_36, `MODE_18, `MODE_36, 1'b1
				};
			end
			default: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b1
				};
			end
		endcase
	end
	32, 36: begin
		case (WR_DATA_WIDTH)
			8, 9: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_36, `MODE_9, `MODE_36, `MODE_9, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_36, `MODE_9, `MODE_36, `MODE_9, 1'b1
				};
			end
			16, 18: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_36, `MODE_18, `MODE_36, `MODE_18, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_36, `MODE_18, `MODE_36, `MODE_18, 1'b1
				};
			end
			32, 36: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'b1
				};
			end
			default: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'b1
				};
			end
		endcase
	end
	default: begin
		case (WR_DATA_WIDTH)
			8, 9: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'b1
				};
			end
			16, 18: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b1
				};
			end
			32, 36: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'b1
				};
			end
			default: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'b1
				};
			end
		endcase
	end
 endcase
 
  (* is_fifo = 1 *)
  (* sync_fifo = 1 *)
  (* rd_data_width = RD_DATA_WIDTH *) 
  (* wr_data_width = WR_DATA_WIDTH *)
 	TDP36K U1 (
		.RESET_ni(1'b1),
		.WDATA_A1_i(in_reg[17:0]),
		.WDATA_A2_i(in_reg[35:18]),
		.RDATA_A1_o(fifo_flags),
		.RDATA_A2_o(),
		.ADDR_A1_i(14'h0),
		.ADDR_A2_i(14'h0),
		.CLK_A1_i(Push_Clk),
		.CLK_A2_i(1'b0),
		.REN_A1_i(1'b1),
		.REN_A2_i(1'b0),
		.WEN_A1_i(PUSH),
		.WEN_A2_i(1'b0),
		.BE_A1_i(2'b11),
		.BE_A2_i(2'b11),

		.WDATA_B1_i(18'h0),
		.WDATA_B2_i(18'h0),
		.RDATA_B1_o(out_reg[17:0]),
		.RDATA_B2_o(out_reg[35:18]),
		.ADDR_B1_i(14'h0),
		.ADDR_B2_i(14'h0),
		.CLK_B1_i(Pop_Clk),
		.CLK_B2_i(1'b0),
		.REN_B1_i(POP),
		.REN_B2_i(1'b0),
		.WEN_B1_i(1'b0),
		.WEN_B2_i(1'b0),
		.BE_B1_i(2'b11),
		.BE_B2_i(2'b11),

		.FLUSH1_i(Async_Flush),
		.FLUSH2_i(1'b0)
	);

  assign DOUT[RD_DATA_WIDTH-1 : 0] = RD_DATA_CMPL[RD_DATA_WIDTH-1 : 0];

endmodule 

module AFIFO_36K_BLK (
    DIN,
    PUSH,
    POP,
    Push_Clk,
    Pop_Clk,
    Async_Flush,
    Overrun_Error,
    Full_Watermark,
    Almost_Full,
    Full,
    Underrun_Error,
    Empty_Watermark,
    Almost_Empty,
    Empty,
    DOUT
);

  parameter WR_DATA_WIDTH = 36;
  parameter RD_DATA_WIDTH = 36;
  parameter UPAE_DBITS = 12'd10;
  parameter UPAF_DBITS = 12'd10;

  input wire Push_Clk, Pop_Clk;
  input wire PUSH, POP;
  input wire [WR_DATA_WIDTH-1:0] DIN;
  input wire Async_Flush;
  output wire [RD_DATA_WIDTH-1:0] DOUT;
  output wire Almost_Full, Almost_Empty;
  output wire Full, Empty;
  output wire Full_Watermark, Empty_Watermark;
  output wire Overrun_Error, Underrun_Error;
  
  wire [35:0] in_reg;
  wire [35:0] out_reg;
  wire [17:0] fifo_flags;
  
  wire [35:0] RD_DATA_CMPL;
  wire [35:WR_DATA_WIDTH] WR_DATA_CMPL;
  
  assign Overrun_Error = fifo_flags[0];
  assign Full_Watermark = fifo_flags[1];
  assign Almost_Full = fifo_flags[2];
  assign Full = fifo_flags[3];
  assign Underrun_Error = fifo_flags[4];
  assign Empty_Watermark = fifo_flags[5];
  assign Almost_Empty = fifo_flags[6];
  assign Empty = fifo_flags[7];
   
  generate
    if (WR_DATA_WIDTH == 36) begin
      assign in_reg[WR_DATA_WIDTH-1:0] = DIN[WR_DATA_WIDTH-1:0];
    end else if (WR_DATA_WIDTH > 18 && WR_DATA_WIDTH < 36) begin
      assign in_reg[WR_DATA_WIDTH+1:18] = DIN[WR_DATA_WIDTH-1:16];
      assign in_reg[17:0] = {2'b00,DIN[15:0]};
    end else if (WR_DATA_WIDTH == 9) begin
      assign in_reg[35:0] = {19'h0, DIN[8], 8'h0, DIN[7:0]};
    end else begin
      assign in_reg[35:WR_DATA_WIDTH]  = 0;
      assign in_reg[WR_DATA_WIDTH-1:0] = DIN[WR_DATA_WIDTH-1:0];
    end
  endgenerate
  
  generate
    if (RD_DATA_WIDTH == 36) begin
      assign RD_DATA_CMPL = out_reg;
    end else if (RD_DATA_WIDTH > 18 && RD_DATA_WIDTH < 36) begin
      assign RD_DATA_CMPL  = {2'b00,out_reg[35:18],out_reg[15:0]};
    end else if (RD_DATA_WIDTH == 9) begin
      assign RD_DATA_CMPL = { 27'h0, out_reg[16], out_reg[7:0]};
    end else begin
      assign RD_DATA_CMPL = {18'h0, out_reg[17:0]};
    end
  endgenerate
  
  case (RD_DATA_WIDTH)
	8, 9: begin
		case (WR_DATA_WIDTH)
			8, 9: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'b0
				};
			end
			16, 18: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_18, `MODE_9, `MODE_18, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_9, `MODE_18, `MODE_9, `MODE_18, 1'b0
				};
			end
			32, 36: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_36, `MODE_9, `MODE_36, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_9, `MODE_36, `MODE_9, `MODE_36, 1'b0
				};
			end
			default: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'b0
				};
			end
		endcase
	end
	16, 18: begin
		case (WR_DATA_WIDTH)
			8, 9: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_9, `MODE_18, `MODE_9, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_18, `MODE_9, `MODE_18, `MODE_9, 1'b0
				};
			end
			16, 18: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b0
				};
			end
			32, 36: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_36, `MODE_18, `MODE_36, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_18, `MODE_36, `MODE_18, `MODE_36, 1'b0
				};
			end
			default: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b0
				};
			end
		endcase
	end
	32, 36: begin
		case (WR_DATA_WIDTH)
			8, 9: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_36, `MODE_9, `MODE_36, `MODE_9, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_36, `MODE_9, `MODE_36, `MODE_9, 1'b0
				};
			end
			16, 18: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_36, `MODE_18, `MODE_36, `MODE_18, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_36, `MODE_18, `MODE_36, `MODE_18, 1'b0
				};
			end
			32, 36: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'b0
				};
			end
			default: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'b0
				};
			end
		endcase
	end
	default: begin
		case (WR_DATA_WIDTH)
			8, 9: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'b0
				};
			end
			16, 18: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'b0
				};
			end
			32, 36: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'b0
				};
			end
			default: begin
				defparam U1.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0,
					UPAF_DBITS, UPAE_DBITS, 4'h1, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'b0
				};
			end
		endcase
	end
 endcase
 
  (* is_fifo = 1 *)
  (* sync_fifo = 0 *)
  (* rd_data_width = RD_DATA_WIDTH *) 
  (* wr_data_width = WR_DATA_WIDTH *)
 	TDP36K U1 (
		.RESET_ni(1'b1),
		.WDATA_A1_i(in_reg[17:0]),
		.WDATA_A2_i(in_reg[35:18]),
		.RDATA_A1_o(fifo_flags),
		.RDATA_A2_o(),
		.ADDR_A1_i(14'h0),
		.ADDR_A2_i(14'h0),
		.CLK_A1_i(Push_Clk),
		.CLK_A2_i(1'b0),
		.REN_A1_i(1'b1),
		.REN_A2_i(1'b0),
		.WEN_A1_i(PUSH),
		.WEN_A2_i(1'b0),
		.BE_A1_i(2'b11),
		.BE_A2_i(2'b11),

		.WDATA_B1_i(18'h0),
		.WDATA_B2_i(18'h0),
		.RDATA_B1_o(out_reg[17:0]),
		.RDATA_B2_o(out_reg[35:18]),
		.ADDR_B1_i(14'h0),
		.ADDR_B2_i(14'h0),
		.CLK_B1_i(Pop_Clk),
		.CLK_B2_i(1'b0),
		.REN_B1_i(POP),
		.REN_B2_i(1'b0),
		.WEN_B1_i(1'b0),
		.WEN_B2_i(1'b0),
		.BE_B1_i(2'b11),
		.BE_B2_i(2'b11),

		.FLUSH1_i(Async_Flush),
		.FLUSH2_i(1'b0)
	);

  assign DOUT[RD_DATA_WIDTH-1 : 0] = RD_DATA_CMPL[RD_DATA_WIDTH-1 : 0];

endmodule 

module SFIFO_18K_BLK (
    DIN,
    PUSH,
    POP,
    CLK,
    Async_Flush,
    Overrun_Error,
    Full_Watermark,
    Almost_Full,
    Full,
    Underrun_Error,
    Empty_Watermark,
    Almost_Empty,
    Empty,
    DOUT
);
  
  parameter WR_DATA_WIDTH = 18;
  parameter RD_DATA_WIDTH = 18;
  parameter UPAE_DBITS = 11'd10;
  parameter UPAF_DBITS = 11'd10;

  input wire CLK;
  input wire PUSH, POP;
  input wire [WR_DATA_WIDTH-1:0] DIN;
  input wire Async_Flush;
  output wire [RD_DATA_WIDTH-1:0] DOUT;
  output wire Almost_Full, Almost_Empty;
  output wire Full, Empty;
  output wire Full_Watermark, Empty_Watermark;
  output wire Overrun_Error, Underrun_Error;
 
 	BRAM2x18_SFIFO  #(
      .WR_DATA_WIDTH(WR_DATA_WIDTH), 
      .RD_DATA_WIDTH(RD_DATA_WIDTH),
      .UPAE_DBITS1(UPAE_DBITS),
      .UPAF_DBITS1(UPAF_DBITS),
      .UPAE_DBITS2(),
      .UPAF_DBITS2()   
       ) U1
      (
      .DIN1(DIN),
      .PUSH1(PUSH),
      .POP1(POP),
      .CLK1(CLK),
      .Async_Flush1(Async_Flush),
      .Overrun_Error1(Overrun_Error),
      .Full_Watermark1(Full_Watermark),
      .Almost_Full1(Almost_Full),
      .Full1(Full),
      .Underrun_Error1(Underrun_Error),
      .Empty_Watermark1(Empty_Watermark),
      .Almost_Empty1(Almost_Empty),
      .Empty1(Empty),
      .DOUT1(DOUT),
      
      .DIN2(),
      .PUSH2(),
      .POP2(),
      .CLK2(),
      .Async_Flush2(),
      .Overrun_Error2(),
      .Full_Watermark2(),
      .Almost_Full2(),
      .Full2(),
      .Underrun_Error2(),
      .Empty_Watermark2(),
      .Almost_Empty2(),
      .Empty2(),
      .DOUT2()
	);

endmodule

module AFIFO_18K_BLK (
    DIN,
    PUSH,
    POP,
    Push_Clk,
    Pop_Clk,
    Async_Flush,
    Overrun_Error,
    Full_Watermark,
    Almost_Full,
    Full,
    Underrun_Error,
    Empty_Watermark,
    Almost_Empty,
    Empty,
    DOUT
);
  
  parameter WR_DATA_WIDTH = 18;
  parameter RD_DATA_WIDTH = 18;
  parameter UPAE_DBITS = 11'd10;
  parameter UPAF_DBITS = 11'd10;

  input wire Push_Clk, Pop_Clk;
  input wire PUSH, POP;
  input wire [WR_DATA_WIDTH-1:0] DIN;
  input wire Async_Flush;
  output wire [RD_DATA_WIDTH-1:0] DOUT;
  output wire Almost_Full, Almost_Empty;
  output wire Full, Empty;
  output wire Full_Watermark, Empty_Watermark;
  output wire Overrun_Error, Underrun_Error;
 
 	BRAM2x18_AFIFO  #(
      .WR_DATA_WIDTH(WR_DATA_WIDTH), 
      .RD_DATA_WIDTH(RD_DATA_WIDTH),
      .UPAE_DBITS1(UPAE_DBITS),
      .UPAF_DBITS1(UPAF_DBITS),
      .UPAE_DBITS2(),
      .UPAF_DBITS2()
       ) U1
      (
      .DIN1(DIN),
      .PUSH1(PUSH),
      .POP1(POP),
      .Push_Clk1(Push_Clk),
      .Pop_Clk1(Pop_Clk),
      .Async_Flush1(Async_Flush),
      .Overrun_Error1(Overrun_Error),
      .Full_Watermark1(Full_Watermark),
      .Almost_Full1(Almost_Full),
      .Full1(Full),
      .Underrun_Error1(Underrun_Error),
      .Empty_Watermark1(Empty_Watermark),
      .Almost_Empty1(Almost_Empty),
      .Empty1(Empty),
      .DOUT1(DOUT),
      
      .DIN2(),
      .PUSH2(),
      .POP2(),
      .Push_Clk2(),
      .Pop_Clk2(),
      .Async_Flush2(),
      .Overrun_Error2(),
      .Full_Watermark2(),
      .Almost_Full2(),
      .Full2(),
      .Underrun_Error2(),
      .Empty_Watermark2(),
      .Almost_Empty2(),
      .Empty2(),
      .DOUT2()
	);

endmodule

module RAM_36K_BLK (
    WEN_i,
    REN_i,
    WR_CLK_i,
    RD_CLK_i,
    WR_BE_i,
    WR_ADDR_i,
    RD_ADDR_i,
    WDATA_i,
    RDATA_o
);

parameter WR_ADDR_WIDTH = 10;
parameter RD_ADDR_WIDTH = 10;
parameter WR_DATA_WIDTH = 36;
parameter RD_DATA_WIDTH = 36;
parameter BE_WIDTH = 4;

input wire WEN_i;
input wire REN_i;
input wire WR_CLK_i;
input wire RD_CLK_i;
input wire [BE_WIDTH-1:0] WR_BE_i;
input wire [WR_ADDR_WIDTH-1 :0] WR_ADDR_i;
input wire [RD_ADDR_WIDTH-1 :0] RD_ADDR_i;
input wire [WR_DATA_WIDTH-1 :0] WDATA_i;
output wire [RD_DATA_WIDTH-1 :0] RDATA_o;

wire [14:RD_ADDR_WIDTH] RD_ADDR_CMPL;
wire [14:WR_ADDR_WIDTH] WR_ADDR_CMPL;
wire [35:0] RD_DATA_CMPL;
wire [35:WR_DATA_WIDTH] WR_DATA_CMPL;

wire [14:0] RD_ADDR_TOTAL;
wire [14:0] WR_ADDR_TOTAL;

wire [14:0] RD_ADDR_SHIFTED;
wire [14:0] WR_ADDR_SHIFTED;

wire [3:0] WR_BE;

wire FLUSH1;
wire FLUSH2;

generate
  if (WR_ADDR_WIDTH == 15) begin
    assign WR_ADDR_TOTAL = WR_ADDR_i;
  end else begin
    assign WR_ADDR_TOTAL[14:WR_ADDR_WIDTH] = 0;
    assign WR_ADDR_TOTAL[WR_ADDR_WIDTH-1:0] = WR_ADDR_i;
  end
endgenerate

generate
  if (RD_ADDR_WIDTH == 15) begin
    assign RD_ADDR_TOTAL = RD_ADDR_i;
  end else begin
    assign RD_ADDR_TOTAL[14:RD_ADDR_WIDTH] = 0;
    assign RD_ADDR_TOTAL[RD_ADDR_WIDTH-1:0] = RD_ADDR_i;
  end
endgenerate

// Assign parameters
case (RD_DATA_WIDTH)
	1: begin
		case (WR_DATA_WIDTH)
			1: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0
				};
			end
			2: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_2, `MODE_1, `MODE_2, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_2, `MODE_1, `MODE_2, 1'd0
				};
			end
			4: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_4, `MODE_1, `MODE_4, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_4, `MODE_1, `MODE_4, 1'd0
				};
			end
			8, 9: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_9, `MODE_1, `MODE_9, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_9, `MODE_1, `MODE_9, 1'd0
				};
			end
			16, 18: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_18, `MODE_1, `MODE_18, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_18, `MODE_1, `MODE_18, 1'd0
				};
			end
			32, 36: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_36, `MODE_1, `MODE_36, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_36, `MODE_1, `MODE_36, 1'd0
				};
			end
			default: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0
				};
			end
		endcase
	end
	2: begin
		case (WR_DATA_WIDTH)
			1: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_2, `MODE_1, `MODE_2, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_2, `MODE_1, `MODE_2, `MODE_1, 1'd0
				};
			end
			2: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_2, `MODE_2, `MODE_2, `MODE_2, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_2, `MODE_2, `MODE_2, `MODE_2, 1'd0
				};
			end
			4: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_2, `MODE_4, `MODE_2, `MODE_4, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_2, `MODE_4, `MODE_2, `MODE_4, 1'd0
				};
			end
			8, 9: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_2, `MODE_9, `MODE_2, `MODE_9, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_2, `MODE_9, `MODE_2, `MODE_9, 1'd0
				};
			end
			16, 18: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_2, `MODE_18, `MODE_2, `MODE_18, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_2, `MODE_18, `MODE_2, `MODE_18, 1'd0
				};
			end
			32, 36: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_2, `MODE_36, `MODE_2, `MODE_36, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_2, `MODE_36, `MODE_2, `MODE_36, 1'd0
				};
			end
			default: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_2, `MODE_1, `MODE_2, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_2, `MODE_1, `MODE_2, `MODE_1, 1'd0
				};
			end
		endcase
	end
	4: begin
		case (WR_DATA_WIDTH)
			1: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_4, `MODE_1, `MODE_4, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_4, `MODE_1, `MODE_4, `MODE_1, 1'd0
				};
			end
			2: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_4, `MODE_2, `MODE_4, `MODE_2, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_4, `MODE_2, `MODE_4, `MODE_2, 1'd0
				};
			end
			4: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_4, `MODE_4, `MODE_4, `MODE_4, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_4, `MODE_4, `MODE_4, `MODE_4, 1'd0
				};
			end
			8, 9: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_4, `MODE_9, `MODE_4, `MODE_9, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_4, `MODE_9, `MODE_4, `MODE_9, 1'd0
				};
			end
			16, 18: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_4, `MODE_18, `MODE_4, `MODE_18, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_4, `MODE_18, `MODE_4, `MODE_18, 1'd0
				};
			end
			32, 36: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_4, `MODE_36, `MODE_4, `MODE_36, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_4, `MODE_36, `MODE_4, `MODE_36, 1'd0
				};
			end
			default: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_4, `MODE_1, `MODE_4, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_4, `MODE_1, `MODE_4, `MODE_1, 1'd0
				};
			end
		endcase
	end
	8, 9: begin
		case (WR_DATA_WIDTH)
			1: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_1, `MODE_9, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_9, `MODE_1, `MODE_9, `MODE_1, 1'd0
				};
			end
			2: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_2, `MODE_9, `MODE_2, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_9, `MODE_2, `MODE_9, `MODE_2, 1'd0
				};
			end
			4: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_4, `MODE_9, `MODE_4, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_9, `MODE_4, `MODE_9, `MODE_4, 1'd0
				};
			end
			8, 9: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0
				};
			end
			16, 18: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_18, `MODE_9, `MODE_18, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_9, `MODE_18, `MODE_9, `MODE_18, 1'd0
				};
			end
			32, 36: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_36, `MODE_9, `MODE_36, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_9, `MODE_36, `MODE_9, `MODE_36, 1'd0
				};
			end
			default: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_9, `MODE_1, `MODE_9, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_9, `MODE_1, `MODE_9, `MODE_1, 1'd0
				};
			end
		endcase
	end
	16, 18: begin
		case (WR_DATA_WIDTH)
			1: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_1, `MODE_18, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_18, `MODE_1, `MODE_18, `MODE_1, 1'd0
				};
			end
			2: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_2, `MODE_18, `MODE_2, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_18, `MODE_2, `MODE_18, `MODE_2, 1'd0
				};
			end
			4: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_4, `MODE_18, `MODE_4, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_18, `MODE_4, `MODE_18, `MODE_4, 1'd0
				};
			end
			8, 9: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_9, `MODE_18, `MODE_9, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_18, `MODE_9, `MODE_18, `MODE_9, 1'd0
				};
			end
			16, 18: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0
				};
			end
			32, 36: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_36, `MODE_18, `MODE_36, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_18, `MODE_36, `MODE_18, `MODE_36, 1'd0
				};
			end
			default: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_18, `MODE_1, `MODE_18, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_18, `MODE_1, `MODE_18, `MODE_1, 1'd0
				};
			end
		endcase
	end
	32, 36: begin
		case (WR_DATA_WIDTH)
			1: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_36, `MODE_1, `MODE_36, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_36, `MODE_1, `MODE_36, `MODE_1, 1'd0
				};
			end
			2: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_36, `MODE_2, `MODE_36, `MODE_2, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_36, `MODE_2, `MODE_36, `MODE_2, 1'd0
				};
			end
			4: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_36, `MODE_4, `MODE_36, `MODE_4, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_36, `MODE_4, `MODE_36, `MODE_4, 1'd0
				};
			end
			8, 9: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_36, `MODE_9, `MODE_36, `MODE_9, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_36, `MODE_9, `MODE_36, `MODE_9, 1'd0
				};
			end
			16, 18: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_36, `MODE_18, `MODE_36, `MODE_18, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_36, `MODE_18, `MODE_36, `MODE_18, 1'd0
				};
			end
			32, 36: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0
				};
			end
			default: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_36, `MODE_1, `MODE_36, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_36, `MODE_1, `MODE_36, `MODE_1, 1'd0
				};
			end
		endcase
	end
	default: begin
		case (WR_DATA_WIDTH)
			1: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0
				};
			end
			2: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_2, `MODE_1, `MODE_2, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_2, `MODE_1, `MODE_2, 1'd0
				};
			end
			4: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_4, `MODE_1, `MODE_4, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_4, `MODE_1, `MODE_4, 1'd0
				};
			end
			8, 9: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_9, `MODE_1, `MODE_9, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_9, `MODE_1, `MODE_9, 1'd0
				};
			end
			16, 18: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_18, `MODE_1, `MODE_18, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_18, `MODE_1, `MODE_18, 1'd0
				};
			end
			32, 36: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
					11'd10, 11'd10, 4'd0, `MODE_1, `MODE_36, `MODE_1, `MODE_36, 1'd0,
					12'd10, 12'd10, 4'd0, `MODE_1, `MODE_36, `MODE_1, `MODE_36, 1'd0
				};
			end
			default: begin
				defparam BRAM_BLK.MODE_BITS = { 1'b0,
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
		assign RD_ADDR_SHIFTED = RD_ADDR_TOTAL;
	end
	2: begin
		assign RD_ADDR_SHIFTED = RD_ADDR_TOTAL << 1;
	end
	4: begin
		assign RD_ADDR_SHIFTED = RD_ADDR_TOTAL << 2;
	end
	8, 9: begin
		assign RD_ADDR_SHIFTED = RD_ADDR_TOTAL << 3;
	end
	16, 18: begin
		assign RD_ADDR_SHIFTED = RD_ADDR_TOTAL << 4;
	end
	32, 36: begin
		assign RD_ADDR_SHIFTED = RD_ADDR_TOTAL << 5;
	end
	default: begin
		assign RD_ADDR_SHIFTED = RD_ADDR_TOTAL;
	end
endcase

case (WR_DATA_WIDTH)
	1: begin
		assign WR_ADDR_SHIFTED = WR_ADDR_TOTAL;
	end
	2: begin
		assign WR_ADDR_SHIFTED = WR_ADDR_TOTAL << 1;
	end
	4: begin
		assign WR_ADDR_SHIFTED = WR_ADDR_TOTAL << 2;
	end
	8, 9: begin
		assign WR_ADDR_SHIFTED = WR_ADDR_TOTAL << 3;
	end
	16, 18: begin
		assign WR_ADDR_SHIFTED = WR_ADDR_TOTAL << 4;
	end
	32, 36: begin
		assign WR_ADDR_SHIFTED = WR_ADDR_TOTAL << 5;
	end
	default: begin
		assign WR_ADDR_SHIFTED = WR_ADDR_TOTAL;
	end
endcase

case (BE_WIDTH)
	4: begin
		assign WR_BE = WR_BE_i[BE_WIDTH-1 :0];
	end
	default: begin
		assign WR_BE[3:BE_WIDTH] = 0;
    assign WR_BE[BE_WIDTH-1 :0] = WR_BE_i[BE_WIDTH-1 :0];
	end
endcase

assign FLUSH1 = 1'b0;
assign FLUSH2 = 1'b0;

// TODO configure per width
wire [17:0] PORT_B1_RDATA;
wire [17:0] PORT_B2_RDATA;
wire [35:0] PORT_A_WDATA;

generate
  if (WR_DATA_WIDTH == 36) begin
    assign PORT_A_WDATA[WR_DATA_WIDTH-1:0] = WDATA_i[WR_DATA_WIDTH-1:0];
  end else if (WR_DATA_WIDTH > 18 && WR_DATA_WIDTH < 36) begin
    assign PORT_A_WDATA[WR_DATA_WIDTH+1:18]  = WDATA_i[WR_DATA_WIDTH-1:16];
    assign PORT_A_WDATA[17:0] = {2'b00,WDATA_i[15:0]};
  end else if (WR_DATA_WIDTH == 9) begin
    assign PORT_A_WDATA = {19'h0, WDATA_i[8], 8'h0, WDATA_i[7:0]};
  end else begin
    assign PORT_A_WDATA[35:WR_DATA_WIDTH] = 0;
    assign PORT_A_WDATA[WR_DATA_WIDTH-1:0] = WDATA_i[WR_DATA_WIDTH-1:0];
  end
endgenerate

generate
  if (RD_DATA_WIDTH == 36) begin
    assign RD_DATA_CMPL = {PORT_B2_RDATA, PORT_B1_RDATA};
  end else if (RD_DATA_WIDTH > 18 && RD_DATA_WIDTH < 36) begin
    assign RD_DATA_CMPL  = {2'b00,PORT_B2_RDATA[17:0],PORT_B1_RDATA[15:0]};
  end else if (RD_DATA_WIDTH == 9) begin
    assign RD_DATA_CMPL = { 27'h0, PORT_B1_RDATA[16], PORT_B1_RDATA[7:0]};
  end else begin
    assign RD_DATA_CMPL = {18'h0, PORT_B1_RDATA};
  end
endgenerate

assign RDATA_o = RD_DATA_CMPL[RD_DATA_WIDTH-1:0];

(* is_inferred = 1 *)
(* rd_data_width = RD_DATA_WIDTH *)
(* wr_data_width = WR_DATA_WIDTH *)
TDP36K BRAM_BLK (
	.RESET_ni(1'b1),

	.WDATA_A1_i(PORT_A_WDATA[17:0]),
	.RDATA_A1_o(),
	.ADDR_A1_i(WR_ADDR_SHIFTED),
	.CLK_A1_i(WR_CLK_i),
	.REN_A1_i(1'b0),
	.WEN_A1_i(WEN_i),
	.BE_A1_i(WR_BE[1:0]),

	.WDATA_B1_i(18'h0),
	.RDATA_B1_o(PORT_B1_RDATA[17:0]),
	.ADDR_B1_i(RD_ADDR_SHIFTED),
	.CLK_B1_i(RD_CLK_i),
	.REN_B1_i(REN_i),
	.WEN_B1_i(1'b0),
	.BE_B1_i({REN_i,REN_i}),

	.WDATA_A2_i(PORT_A_WDATA[35:18]),
	.RDATA_A2_o(),
	.ADDR_A2_i(WR_ADDR_SHIFTED),
	.CLK_A2_i(WR_CLK_i),
	.REN_A2_i(1'b0),
	.WEN_A2_i(WEN_i),
	.BE_A2_i(WR_BE[3:2]),

	.WDATA_B2_i(18'h0),
	.RDATA_B2_o(PORT_B2_RDATA[17:0]),
	.ADDR_B2_i(RD_ADDR_SHIFTED),
	.CLK_B2_i(RD_CLK_i),
	.REN_B2_i(REN_i),
	.WEN_B2_i(1'b0),
	.BE_B2_i({REN_i,REN_i}),

	.FLUSH1_i(FLUSH1),
	.FLUSH2_i(FLUSH2)
);

endmodule

module RAM_18K_BLK (
    WEN_i,
    REN_i,
    WR_CLK_i,
    RD_CLK_i,
    WR_BE_i,
    WR_ADDR_i,
    RD_ADDR_i,
    WDATA_i,
    RDATA_o
);

parameter WR_ADDR_WIDTH = 10;
parameter RD_ADDR_WIDTH = 10;
parameter WR_DATA_WIDTH = 18;
parameter RD_DATA_WIDTH = 18;
parameter BE_WIDTH = 2;

input wire WEN_i;
input wire REN_i;
input wire WR_CLK_i;
input wire RD_CLK_i;
input wire [BE_WIDTH-1:0] WR_BE_i;
input wire [WR_ADDR_WIDTH-1 :0] WR_ADDR_i;
input wire [RD_ADDR_WIDTH-1 :0] RD_ADDR_i;
input wire [WR_DATA_WIDTH-1 :0] WDATA_i;
output wire [RD_DATA_WIDTH-1 :0] RDATA_o;

  BRAM2x18_SP  #(
      .WR_ADDR_WIDTH(WR_ADDR_WIDTH), 
      .RD_ADDR_WIDTH(RD_ADDR_WIDTH),
      .WR_DATA_WIDTH(WR_DATA_WIDTH), 
      .RD_DATA_WIDTH(RD_DATA_WIDTH),
      .BE1_WIDTH(BE_WIDTH),
      .BE2_WIDTH()      
       ) U1
      (
      .RESET_ni(1'b1),
      
      .WEN1_i(WEN_i),
      .REN1_i(REN_i),
      .WR1_CLK_i(WR_CLK_i),
      .RD1_CLK_i(RD_CLK_i),
      .WR1_BE_i(WR_BE_i),
      .WR1_ADDR_i(WR_ADDR_i),
      .RD1_ADDR_i(RD_ADDR_i),
      .WDATA1_i(WDATA_i),
      .RDATA1_o(RDATA_o),
      
      .WEN2_i(),
      .REN2_i(),
      .WR2_CLK_i(),
      .RD2_CLK_i(),
      .WR2_BE_i(),
      .WR2_ADDR_i(),
      .RD2_ADDR_i(),
      .WDATA2_i(),
      .RDATA2_o()
      );
    
endmodule

module DPRAM_36K_BLK (   
    CLK1_i,
    WEN1_i,
    WR1_BE_i,
    REN1_i,
    WR1_ADDR_i,
    RD1_ADDR_i,
    WDATA1_i,
    RDATA1_o,
    
    CLK2_i,
    WEN2_i,
    WR2_BE_i,
    REN2_i,
    WR2_ADDR_i,
    RD2_ADDR_i,
    WDATA2_i,
    RDATA2_o
);

parameter ADDR_WIDTH = 10;
parameter DATA_WIDTH = 36;
parameter BE1_WIDTH = 4;
parameter BE2_WIDTH = 4;

input wire CLK1_i;
input wire WEN1_i;
input wire [BE1_WIDTH-1 :0] WR1_BE_i;
input wire REN1_i;
input wire [ADDR_WIDTH-1 :0] WR1_ADDR_i;
input wire [ADDR_WIDTH-1 :0] RD1_ADDR_i;
input wire [DATA_WIDTH-1 :0] WDATA1_i;
output wire [DATA_WIDTH-1 :0] RDATA1_o;

input wire CLK2_i;
input wire WEN2_i;
input wire [BE2_WIDTH-1 :0] WR2_BE_i;
input wire REN2_i;
input wire [ADDR_WIDTH-1 :0] WR2_ADDR_i;
input wire [ADDR_WIDTH-1 :0] RD2_ADDR_i;
input wire [DATA_WIDTH-1 :0] WDATA2_i;
output wire [DATA_WIDTH-1 :0] RDATA2_o;

wire FLUSH1;
wire FLUSH2;

wire [14:0] A1ADDR_TOTAL;
wire [14:0] B1ADDR_TOTAL;
wire [14:0] C1ADDR_TOTAL;
wire [14:0] D1ADDR_TOTAL;

generate
  if (ADDR_WIDTH == 15) begin
    assign A1ADDR_TOTAL = RD1_ADDR_i;
    assign B1ADDR_TOTAL = WR1_ADDR_i;
    assign C1ADDR_TOTAL = RD2_ADDR_i;
    assign D1ADDR_TOTAL = WR2_ADDR_i;
  end else begin
    assign A1ADDR_TOTAL[14:ADDR_WIDTH] = 0;
    assign A1ADDR_TOTAL[ADDR_WIDTH-1:0] = RD1_ADDR_i;
    assign B1ADDR_TOTAL[14:ADDR_WIDTH] = 0;
    assign B1ADDR_TOTAL[ADDR_WIDTH-1:0] = WR1_ADDR_i;
    assign C1ADDR_TOTAL[14:ADDR_WIDTH] = 0;
    assign C1ADDR_TOTAL[ADDR_WIDTH-1:0] = RD2_ADDR_i;
    assign D1ADDR_TOTAL[14:ADDR_WIDTH] = 0;
    assign D1ADDR_TOTAL[ADDR_WIDTH-1:0] = WR2_ADDR_i;
  end
endgenerate

wire [35:DATA_WIDTH] A1DATA_CMPL;
wire [35:DATA_WIDTH] B1DATA_CMPL;
wire [35:DATA_WIDTH] C1DATA_CMPL;
wire [35:DATA_WIDTH] D1DATA_CMPL;

wire [35:0] A1DATA_TOTAL;
wire [35:0] B1DATA_TOTAL;
wire [35:0] C1DATA_TOTAL;
wire [35:0] D1DATA_TOTAL;

wire [14:0] PORT_A_ADDR;
wire [14:0] PORT_B_ADDR;

wire [3:0] WR1_BE;
wire [3:0] WR2_BE;

generate
  if (BE1_WIDTH == 4) begin
    assign WR1_BE = WR1_BE_i;
  end else begin
    assign WR1_BE[3:BE1_WIDTH] = 0;
    assign WR1_BE[BE1_WIDTH-1:0] = WR1_BE_i[BE1_WIDTH-1:0];
  end
endgenerate

generate
  if (BE2_WIDTH == 4) begin
    assign WR2_BE = WR2_BE_i;
  end else begin
    assign WR2_BE[3:BE2_WIDTH] = 0;
    assign WR2_BE[BE2_WIDTH-1:0] = WR2_BE_i[BE2_WIDTH-1:0];
  end
endgenerate

// Assign read/write data - handle special case for 9bit mode
// parity bit for 9bit mode is placed in R/W port on bit #16
case (DATA_WIDTH)
	9: begin
		assign RDATA1_o = {A1DATA_TOTAL[16], A1DATA_TOTAL[7:0]};
		assign RDATA2_o = {C1DATA_TOTAL[16], C1DATA_TOTAL[7:0]};
		assign B1DATA_TOTAL = {B1DATA_CMPL[35:17], WDATA1_i[8], B1DATA_CMPL[16:9], WDATA1_i[7:0]};
		assign D1DATA_TOTAL = {D1DATA_CMPL[35:17], WDATA2_i[8], D1DATA_CMPL[16:9], WDATA2_i[7:0]};
	end
	default: begin
		assign RDATA1_o = A1DATA_TOTAL[DATA_WIDTH-1:0];
		assign RDATA2_o = C1DATA_TOTAL[DATA_WIDTH-1:0];
		assign B1DATA_TOTAL = {B1DATA_CMPL, WDATA1_i};
		assign D1DATA_TOTAL = {D1DATA_CMPL, WDATA2_i};
	end
endcase

case (DATA_WIDTH)
	1: begin
		assign PORT_A_ADDR = REN1_i ? A1ADDR_TOTAL : (WEN1_i ? B1ADDR_TOTAL : 15'd0);
		assign PORT_B_ADDR = REN2_i ? C1ADDR_TOTAL : (WEN2_i ? D1ADDR_TOTAL : 15'd0);
          defparam U1.MODE_BITS = { 1'b0,
              11'd10, 11'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0,
              12'd10, 12'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0
          };
	end

	2: begin
		assign PORT_A_ADDR = REN1_i ? (A1ADDR_TOTAL << 1) : (WEN1_i ? (B1ADDR_TOTAL << 1) : 15'd0);
		assign PORT_B_ADDR = REN2_i ? (C1ADDR_TOTAL << 1) : (WEN2_i ? (D1ADDR_TOTAL << 1) : 15'd0);
          defparam U1.MODE_BITS = { 1'b0,
              11'd10, 11'd10, 4'd0, `MODE_2, `MODE_2, `MODE_2, `MODE_2, 1'd0,
              12'd10, 12'd10, 4'd0, `MODE_2, `MODE_2, `MODE_2, `MODE_2, 1'd0
          };
	end

	4: begin
		assign PORT_A_ADDR = REN1_i ? (A1ADDR_TOTAL << 2) : (WEN1_i ? (B1ADDR_TOTAL << 2) : 15'd0);
		assign PORT_B_ADDR = REN2_i ? (C1ADDR_TOTAL << 2) : (WEN2_i ? (D1ADDR_TOTAL << 2) : 15'd0);
          defparam U1.MODE_BITS = { 1'b0,
              11'd10, 11'd10, 4'd0, `MODE_4, `MODE_4, `MODE_4, `MODE_4, 1'd0,
              12'd10, 12'd10, 4'd0, `MODE_4, `MODE_4, `MODE_4, `MODE_4, 1'd0
          };
	end

	8, 9: begin
		assign PORT_A_ADDR = REN1_i ? (A1ADDR_TOTAL << 3) : (WEN1_i ? (B1ADDR_TOTAL << 3) : 15'd0);
		assign PORT_B_ADDR = REN2_i ? (C1ADDR_TOTAL << 3) : (WEN2_i ? (D1ADDR_TOTAL << 3) : 15'd0);
          defparam U1.MODE_BITS = { 1'b0,
              11'd10, 11'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0,
              12'd10, 12'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0
          };
	end

	16, 18: begin
		assign PORT_A_ADDR = REN1_i ? (A1ADDR_TOTAL << 4) : (WEN1_i ? (B1ADDR_TOTAL << 4) : 15'd0);
		assign PORT_B_ADDR = REN2_i ? (C1ADDR_TOTAL << 4) : (WEN2_i ? (D1ADDR_TOTAL << 4) : 15'd0);
          defparam U1.MODE_BITS = { 1'b0,
              11'd10, 11'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0,
              12'd10, 12'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0
          };
	end

	32, 36: begin
		assign PORT_A_ADDR = REN1_i ? (A1ADDR_TOTAL << 5) : (WEN1_i ? (B1ADDR_TOTAL << 5) : 15'd0);
		assign PORT_B_ADDR = REN2_i ? (C1ADDR_TOTAL << 5) : (WEN2_i ? (D1ADDR_TOTAL << 5) : 15'd0);
          defparam U1.MODE_BITS = { 1'b0,
              11'd10, 11'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0,
              12'd10, 12'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0
          };
	end
	default: begin
		assign PORT_A_ADDR = REN1_i ? (A1ADDR_TOTAL << 5) : (WEN1_i ? (B1ADDR_TOTAL << 5) : 15'd0);
		assign PORT_B_ADDR = REN2_i ? (C1ADDR_TOTAL << 5) : (WEN2_i ? (D1ADDR_TOTAL << 5) : 15'd0);
          defparam U1.MODE_BITS = { 1'b0,
              11'd10, 11'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0,
              12'd10, 12'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0
          };
	end
endcase

assign FLUSH1 = 1'b0;
assign FLUSH2 = 1'b0;

(* is_inferred = 1 *)
(* rd_data_width = DATA_WIDTH *)
(* wr_data_width = DATA_WIDTH *)
TDP36K U1 (
	.RESET_ni(1'b1),
	.WDATA_A1_i(B1DATA_TOTAL[17:0]),
	.WDATA_A2_i(B1DATA_TOTAL[35:18]),
	.RDATA_A1_o(A1DATA_TOTAL[17:0]),
	.RDATA_A2_o(A1DATA_TOTAL[35:18]),
	.ADDR_A1_i(PORT_A_ADDR),
	.ADDR_A2_i(PORT_A_ADDR),
	.CLK_A1_i(CLK1_i),
	.CLK_A2_i(CLK1_i),
	.REN_A1_i(REN1_i),
	.REN_A2_i(REN1_i),
	.WEN_A1_i(WEN1_i),
	.WEN_A2_i(WEN1_i),
	.BE_A1_i(WR1_BE[1:0]),
	.BE_A2_i(WR1_BE[3:0]),

	.WDATA_B1_i(D1DATA_TOTAL[17:0]),
	.WDATA_B2_i(D1DATA_TOTAL[35:18]),
	.RDATA_B1_o(C1DATA_TOTAL[17:0]),
	.RDATA_B2_o(C1DATA_TOTAL[35:18]),
	.ADDR_B1_i(PORT_B_ADDR),
	.ADDR_B2_i(PORT_B_ADDR),
	.CLK_B1_i(CLK2_i),
	.CLK_B2_i(CLK2_i),
	.REN_B1_i(REN2_i),
	.REN_B2_i(REN2_i),
	.WEN_B1_i(WEN2_i),
	.WEN_B2_i(WEN2_i),
	.BE_B1_i(WR2_BE[1:0]),
	.BE_B2_i(WR2_BE[3:0]),

	.FLUSH1_i(FLUSH1),
	.FLUSH2_i(FLUSH2)
);
endmodule

module DPRAM_18K_BLK (   
    CLK1_i,
    WEN1_i,
    REN1_i,
    WR1_ADDR_i,
    RD1_ADDR_i,
    WDATA1_i,
    RDATA1_o,
    
    CLK2_i,
    WEN2_i,
    REN2_i,
    WR2_ADDR_i,
    RD2_ADDR_i,
    WDATA2_i,
    RDATA2_o
);

parameter ADDR_WIDTH = 10;
parameter DATA_WIDTH = 18;
parameter BE1_WIDTH = 2;
parameter BE2_WIDTH = 2;

input wire CLK1_i;
input wire WEN1_i;
input wire REN1_i;
input wire [ADDR_WIDTH-1 :0] WR1_ADDR_i;
input wire [ADDR_WIDTH-1 :0] RD1_ADDR_i;
input wire [DATA_WIDTH-1 :0] WDATA1_i;
output wire [DATA_WIDTH-1 :0] RDATA1_o;

input wire CLK2_i;
input wire WEN2_i;
input wire REN2_i;
input wire [ADDR_WIDTH-1 :0] WR2_ADDR_i;
input wire [ADDR_WIDTH-1 :0] RD2_ADDR_i;
input wire [DATA_WIDTH-1 :0] WDATA2_i;
output wire [DATA_WIDTH-1 :0] RDATA2_o;

(* is_inferred = 1 *)
BRAM2x18_DP #(
	.CFG_ABITS(ADDR_WIDTH),
	.CFG_DBITS(DATA_WIDTH),
	.CFG_ENABLE_B(BE1_WIDTH),
	.CFG_ENABLE_D(BE2_WIDTH)
) bram2x18_inst (
	.A1ADDR(RD1_ADDR_i),
	.A1DATA(RDATA1_o),
	.A1EN(REN1_i),
	.B1ADDR(WR1_ADDR_i),
	.B1DATA(WDATA1_i),
	.B1EN({WEN1_i,WEN1_i}),
	.CLK1(CLK1_i),

	.C1ADDR(RD2_ADDR_i),
	.C1DATA(RDATA2_o),
	.C1EN(REN2_i),
	.D1ADDR(WR2_ADDR_i),
	.D1DATA(WDATA2_i),
	.D1EN({WEN2_i,WEN2_i}),
	.CLK2(CLK2_i),

	.E1ADDR(),
	.E1DATA(),
	.E1EN(),
	.F1ADDR(),
	.F1DATA(),
	.F1EN(),
	.CLK3(),

	.G1ADDR(),
	.G1DATA(),
	.G1EN(),
	.H1ADDR(),
	.H1DATA(),
	.H1EN(),
	.CLK4()
);
endmodule

