// LUT and DFF are combined to a GENERIC_SLICE

module LUT #(
	parameter K = 4,
	parameter [2**K-1:0] INIT = 0,
) (
	input [K-1:0] I,
	output Q
);
	assign Q = INIT[I];
endmodule

module DFF (
	input CLK, D,
	output reg Q
);
	always @(posedge CLK)
		Q <= D;
endmodule

module GENERIC_SLICE #(
	parameter K = 4,
	parameter [2**K-1:0] INIT = 0,
	parameter FF_USED = 1'b0
) (
	input CLK,
	input [K-1:0] I,
	output F,
	output Q
);
	wire f_wire;
	
	LUT #(.K(K), .INIT(INIT)) lut_i(.I(I), .Q(f_wire));

	DFF dff_i(.CLK(CLK), .D(f_wire), .Q(Q));

	assign F = f_wire;
endmodule

module GENERIC_IOB #(
	parameter INPUT_USED = 1'b0,
	parameter OUTPUT_USED = 1'b0,
	parameter ENABLE_USED = 1'b0
) (
	inout PAD,
	input I, EN,
	output O
);
	generate if (OUTPUT_USED && ENABLE_USED)
		assign PAD = EN ? I : 1'bz;
	else if (OUTPUT_USED)
		assign PAD = I;
	endgenerate

	generate if (INPUT_USED)
		assign O = PAD;
	endgenerate
endmodule

(* blackbox *)
module alta_bram #(
	parameter INIT_VAL        = 4608'b0,
	parameter CLKMODE         = 1'b0,
	parameter PORTA_WIDTH     = 4'b0000,
	parameter PORTB_WIDTH     = 4'b0000,
	parameter PORTA_WRITEMODE = 1'b0,
	parameter PORTB_WRITEMODE = 1'b0,
	parameter PORTA_WRITETHRU = 1'b0,
	parameter PORTB_WRITETHRU = 1'b0,
	parameter PORTA_OUTREG    = 1'b0,
	parameter PORTB_OUTREG    = 1'b0,
	parameter PORTB_READONLY  = 1'b0,
	parameter Clk0CFG         = 2'b00,
	parameter Clk1CFG         = 2'b00
) (
	input  [17:0]  DataInA,  DataInB,
	input  [11:0] AddressA, AddressB,
	output [17:0] DataOutA, DataOutB,
	input  Clk0, ClkEn0, AsyncReset0,
	input  Clk1, ClkEn1, AsyncReset1,
	input  WeRenA, WeRenB
);
endmodule

(* blackbox *)
module alta_bram9k #(
	parameter CLKMODE = 2'b00,
	parameter PACKEDMODE = 1'b0,
	parameter PORTA_CLKIN_EN = 1'b0,
	parameter PORTA_CLKOUT_EN = 1'b0,
	parameter PORTB_CLKIN_EN = 1'b0,
	parameter PORTB_CLKOUT_EN = 1'b0,
	parameter PORTA_RSTIN_EN = 1'b0,
	parameter PORTA_RSTOUT_EN = 1'b0,
	parameter PORTB_RSTIN_EN = 1'b0,
	parameter PORTB_RSTOUT_EN = 1'b0,
	parameter PORTA_WIDTH = 5'b0,
	parameter PORTB_WIDTH = 5'b00000,
	parameter PORTA_WRITETHRU = 1'b0,
	parameter PORTB_WRITETHRU = 1'b0,
	parameter PORTA_OUTREG = 1'b0,
	parameter PORTB_OUTREG = 1'b0,
	parameter RSEN_DLY = 2'b00,
	parameter DLYTIME = 2'b00,
	parameter INIT_VAL = 9216'b0,
	parameter Clk0CFG = 2'b00,
	parameter Clk1CFG = 2'b00,
)(
	input [17:0] DataInA,
	input [17:0] DataInB,
	input [12:0] AddressA,
	input [12:0] AddressB,
	input [1:0] ByteEnA,
	input [1:0] ByteEnB,
	input Clk0,
	input Clk1,
	input ClkEn0,
	input ClkEn1,
	input AsyncReset0,
	input AsyncReset1,
	input AddressStallA,
	input AddressStallB, 
	input WeA,
	input ReA,
	input WeB,
	input ReB,
	output [17:0] DataOutA,
	output [17:0] DataOutB,
);
endmodule

module alta_pllx #(
  parameter CLKOUT0_DIV = 6'b000000,
  parameter CLKOUT1_DIV = 6'b000000,
  parameter CLKOUT2_DIV = 6'b000000,
  parameter CLKOUT3_DIV = 6'b000000,
  parameter CLKOUT0_DEL = 6'b000000,
  parameter CLKOUT1_DEL = 6'b000000,
  parameter CLKOUT2_DEL = 6'b000000,
  parameter CLKOUT3_DEL = 6'b000000,
) (
	input clkin,
	input clkout0en, clkout1en, clkout2en, clkout3en,
	output clkout0, clkout1, clkout2, clkout3,
	input pllen,
	input resetn,
	input clkfb,
	output lock,
);

endmodule

(* blackbox *)
module alta_boot (
  input i_osc_enb,
  output o_osc,
);
endmodule
