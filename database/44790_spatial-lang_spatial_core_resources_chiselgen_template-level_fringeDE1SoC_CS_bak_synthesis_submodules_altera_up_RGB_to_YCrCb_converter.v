// This program was cloned from: https://github.com/stanford-ppl/spatial-lang
// License: MIT License

// (C) 2001-2016 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// THIS FILE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THIS FILE OR THE USE OR OTHER DEALINGS
// IN THIS FILE.

/******************************************************************************
 *                                                                            *
 * This module performs colour space conversion from RGB to YCrCb.            *
 *                                                                            *
 ******************************************************************************/

module altera_up_RGB_to_YCrCb_converter (
	// Inputs
	clk,
	clk_en,
	reset,

	R,
	G,
	B,
	stream_in_startofpacket,
	stream_in_endofpacket,
	stream_in_empty,
	stream_in_valid,

	// Bidirectionals

	// Outputs
	Y,
	Cr,
	Cb,
	stream_out_startofpacket,
	stream_out_endofpacket,
	stream_out_empty,
	stream_out_valid
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/


/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input						clk;
input						clk_en;
input						reset;

input			[ 7: 0]	R;
input			[ 7: 0]	G;
input			[ 7: 0]	B;
input						stream_in_startofpacket;
input						stream_in_endofpacket;
input						stream_in_empty;
input						stream_in_valid;

// Bidirectionals

// Outputs
output reg	[ 7: 0]	Y;
output reg	[ 7: 0]	Cr;
output reg	[ 7: 0]	Cb;
output reg				stream_out_startofpacket;
output reg				stream_out_endofpacket;
output reg				stream_out_empty;
output reg				stream_out_valid;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire			[35: 0]	product_0;
wire			[35: 0]	product_1;
wire			[35: 0]	product_2;
wire			[35: 0]	product_3;
wire			[35: 0]	product_4;
wire			[35: 0]	product_5;
wire			[35: 0]	product_6;
wire			[35: 0]	product_7;
wire			[35: 0]	product_8;

wire			[10: 0]	Y_sum;
wire			[10: 0]	Cr_sum;
wire			[10: 0]	Cb_sum;

// Internal Registers
reg			[ 7: 0]	R_in;
reg			[ 7: 0]	G_in;
reg			[ 7: 0]	B_in;

reg			[10: 0]	R_0d257;
reg			[10: 0]	G_0d504;
reg			[10: 0]	B_0d098;
reg			[10: 0]	R_0d148;
reg			[10: 0]	G_0d291;
reg			[10: 0]	B_0d439;
reg			[10: 0]	R_0d439;
reg			[10: 0]	G_0d368;
reg			[10: 0]	B_0d071;

reg	 		[ 1: 0]	startofpacket_shift_reg;
reg	 		[ 1: 0]	endofpacket_shift_reg;
reg	 		[ 1: 0]	empty_shift_reg;
reg	 		[ 1: 0]	valid_shift_reg;

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

// Output Registers
always @ (posedge clk)
begin
	if (reset == 1'b1)
	begin
		Y  <= 8'h00;
		Cr <= 8'h00;
		Cb <= 8'h00;
	end
	else if (clk_en)
	begin
		if (Y_sum[10] == 1'b1) // Negative number
			Y <= 8'h00;
		else if ((Y_sum[9] | Y_sum[8]) == 1'b1) // Number greater than 255
			Y <= 8'hFF;
		else
			Y <= Y_sum[ 7: 0];

		if (Cr_sum[10] == 1'b1) // Negative number
			Cr <= 8'h00;
		else if ((Cr_sum[9] | Cr_sum[8]) == 1'b1) // Number greater than 255
			Cr <= 8'hFF;
		else
			Cr <= Cr_sum[ 7: 0];

		if (Cb_sum[10] == 1'b1) // Negative number
			Cb <= 8'h00;
		else if ((Cb_sum[9] | Cb_sum[8]) == 1'b1) // Number greater than 255
			Cb <= 8'hFF;
		else
			Cb <= Cb_sum[ 7: 0];
	end
end

always @ (posedge clk)
begin
	if (clk_en)
	begin
		stream_out_startofpacket	<= startofpacket_shift_reg[1];
		stream_out_endofpacket		<= endofpacket_shift_reg[1];
		stream_out_empty				<= empty_shift_reg[1];
		stream_out_valid				<= valid_shift_reg[1];
	end
end

// Internal Registers
// ---------------------------------------------------------------------------
always @ (posedge clk)
begin
	if (reset == 1'b1)
	begin
		R_in	<= 8'h00;
		G_in	<= 8'h00;
		B_in	<= 8'h00;
	end
	else if (clk_en)
	begin
		R_in	<= R;
		G_in	<= G;
		B_in	<= B;
	end
end

always @ (posedge clk)
begin
	if (reset == 1'b1)
	begin
		R_0d257 <= 11'h000;
		G_0d504 <= 11'h000;
		B_0d098 <= 11'h000;
		R_0d148 <= 11'h000;
		G_0d291 <= 11'h000;
		B_0d439 <= 11'h000;
		R_0d439 <= 11'h000;
		G_0d368 <= 11'h000;
		B_0d071 <= 11'h000;
	end
	else if (clk_en)
	begin
		R_0d257 <= product_0[25:15];
		G_0d504 <= product_1[25:15];
		B_0d098 <= product_2[25:15];
		R_0d148 <= product_3[25:15];
		G_0d291 <= product_4[25:15];
		B_0d439 <= product_5[25:15];
		R_0d439 <= product_6[25:15];
		G_0d368 <= product_7[25:15];
		B_0d071 <= product_8[25:15];
	end
end

always @(posedge clk)
begin
	if (reset)
	begin
		startofpacket_shift_reg	<= 2'h0;
		endofpacket_shift_reg	<= 2'h0;
		empty_shift_reg			<= 2'h0;
		valid_shift_reg			<= 2'h0;
	end
	else if (clk_en)
	begin
		startofpacket_shift_reg[1]	<= startofpacket_shift_reg[0];
		endofpacket_shift_reg[1]	<= endofpacket_shift_reg[0];
		empty_shift_reg[1]			<= empty_shift_reg[0];
		valid_shift_reg[1]			<= valid_shift_reg[0];

		startofpacket_shift_reg[0]	<= stream_in_startofpacket;
		endofpacket_shift_reg[0]	<= stream_in_endofpacket;
		empty_shift_reg[0]			<= stream_in_empty;
		valid_shift_reg[0]			<= stream_in_valid;
	end
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments

// Internal Assignments
// ---------------------------------------------------------------------------
//
// Sum the proper outputs from the multiply to form YCrCb
//
assign Y_sum	= 11'd16  + R_0d257 + G_0d504 + B_0d098;
assign Cr_sum	= 11'd128 + R_0d439 - G_0d368 - B_0d071;
assign Cb_sum	= 11'd128 - R_0d148 - G_0d291 + B_0d439;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


// Formula Set #1 (Corrected for 0 to 255 Color Range)
// ---------------------------------------------------------------------------
// Y  =  0.257R + 0.504G + 0.098B + 16
// Cr =  0.439R - 0.368G - 0.071B + 128
// Cb = -0.148R - 0.291G + 0.439B + 128
// 
// use full precision of multiply to experiment with coefficients
// 0.257 -> I[1:0].F[14:0]  .257 X 2^15 = 020E5
// 0.504 -> I[1:0].F[14:0]  .504 X 2^15 = 04083
// 0.098 -> I[1:0].F[14:0]  .098 X 2^15 = 00C8D
// 0.148 -> I[1:0].F[14:0]  .148 X 2^15 = 012F2
// 0.291 -> I[1:0].F[14:0]  .291 X 2^15 = 0253F
// 0.439 -> I[1:0].F[14:0]  .439 X 2^15 = 03831
// 0.368 -> I[1:0].F[14:0]  .368 X 2^15 = 02F1B
// 0.071 -> I[1:0].F[14:0]  .071 X 2^15 = 00917

lpm_mult lpm_mult_component_0 (
	// Inputs
	.dataa	({10'h000, R_in}),
	.datab	(18'h020E5),
	.aclr		(1'b0),
	.clken	(1'b1),
	.clock	(1'b0),
	
	// Bidirectionals
	
	// Outputs
	.result	(product_0),
	.sum		(1'b0)
);
defparam
	lpm_mult_component_0.lpm_widtha 				= 18,
	lpm_mult_component_0.lpm_widthb 				= 18,
	lpm_mult_component_0.lpm_widthp 				= 36,
	lpm_mult_component_0.lpm_widths 				= 1,
	lpm_mult_component_0.lpm_type 				= "LPM_MULT",
	lpm_mult_component_0.lpm_representation 	= "SIGNED",
	lpm_mult_component_0.lpm_hint = "INPUT_B_IS_CONSTANT=YES,MAXIMIZE_SPEED=5";


lpm_mult lpm_mult_component_1 (
	// Inputs
	.dataa	({10'h000, G_in}),
	.datab	(18'h04083),
	.aclr		(1'b0),
	.clken	(1'b1),
	.clock	(1'b0),
	
	// Bidirectionals
	
	// Outputs
	.result	(product_1),
	.sum		(1'b0)
);
defparam
	lpm_mult_component_1.lpm_widtha 				= 18,
	lpm_mult_component_1.lpm_widthb 				= 18,
	lpm_mult_component_1.lpm_widthp 				= 36,
	lpm_mult_component_1.lpm_widths 				= 1,
	lpm_mult_component_1.lpm_type 				= "LPM_MULT",
	lpm_mult_component_1.lpm_representation 	= "SIGNED",
	lpm_mult_component_1.lpm_hint = "INPUT_B_IS_CONSTANT=YES,MAXIMIZE_SPEED=5";


lpm_mult lpm_mult_component_2 (
	// Inputs
	.dataa	({10'h000, B_in}),
	.datab	(18'h00C8D),
	.aclr		(1'b0),
	.clken	(1'b1),
	.clock	(1'b0),	
	
	// Bidirectionals
	
	// Outputs
	.result	(product_2),
	.sum		(1'b0)
);
defparam
	lpm_mult_component_2.lpm_widtha 				= 18,
	lpm_mult_component_2.lpm_widthb 				= 18,
	lpm_mult_component_2.lpm_widthp 				= 36,
	lpm_mult_component_2.lpm_widths 				= 1,
	lpm_mult_component_2.lpm_type 				= "LPM_MULT",
	lpm_mult_component_2.lpm_representation 	= "SIGNED",
	lpm_mult_component_2.lpm_hint = "INPUT_B_IS_CONSTANT=YES,MAXIMIZE_SPEED=5";


lpm_mult lpm_mult_component_6 (
	// Inputs
	.dataa	({10'h000, R_in}),
	.datab	(18'h03831),
	.aclr		(1'b0),
	.clken	(1'b1),
	.clock	(1'b0),
	
	// Bidirectionals
	
	// Outputs
	.result	(product_6),
	.sum		(1'b0)
);
defparam
	lpm_mult_component_6.lpm_widtha 				= 18,
	lpm_mult_component_6.lpm_widthb 				= 18,
	lpm_mult_component_6.lpm_widthp 				= 36,
	lpm_mult_component_6.lpm_widths 				= 1,
	lpm_mult_component_6.lpm_type 				= "LPM_MULT",
	lpm_mult_component_6.lpm_representation 	= "SIGNED",
	lpm_mult_component_6.lpm_hint = "INPUT_B_IS_CONSTANT=YES,MAXIMIZE_SPEED=5";


lpm_mult lpm_mult_component_7 (
	// Inputs
	.dataa	({10'h000, G_in}),
	.datab	(18'h02F1B),
	.aclr		(1'b0),
	.clken	(1'b1),
	.clock	(1'b0),
	
	// Bidirectionals
	
	// Outputs
	.result	(product_7),
	.sum		(1'b0)
);
defparam
	lpm_mult_component_7.lpm_widtha 				= 18,
	lpm_mult_component_7.lpm_widthb 				= 18,
	lpm_mult_component_7.lpm_widthp 				= 36,
	lpm_mult_component_7.lpm_widths 				= 1,
	lpm_mult_component_7.lpm_type 				= "LPM_MULT",
	lpm_mult_component_7.lpm_representation 	= "SIGNED",
	lpm_mult_component_7.lpm_hint = "INPUT_B_IS_CONSTANT=YES,MAXIMIZE_SPEED=5";


lpm_mult lpm_mult_component_8 (
	// Inputs
	.dataa	({10'h000, B_in}),
	.datab	(18'h00917),
	.aclr		(1'b0),
	.clken	(1'b1),
	.clock	(1'b0),
	
	// Bidirectionals
	
	// Outputs
	.result	(product_8),
	.sum		(1'b0)
);
defparam
	lpm_mult_component_8.lpm_widtha 				= 18,
	lpm_mult_component_8.lpm_widthb 				= 18,
	lpm_mult_component_8.lpm_widthp 				= 36,
	lpm_mult_component_8.lpm_widths 				= 1,
	lpm_mult_component_8.lpm_type 				= "LPM_MULT",
	lpm_mult_component_8.lpm_representation 	= "SIGNED",
	lpm_mult_component_8.lpm_hint = "INPUT_B_IS_CONSTANT=YES,MAXIMIZE_SPEED=5";


lpm_mult lpm_mult_component_3 (
	// Inputs
	.dataa	({10'h000, R_in}),
	.datab	(18'h012F2),
	.aclr		(1'b0),
	.clken	(1'b1),
	.clock	(1'b0),
	
	// Bidirectionals
	
	// Outputs
	.result	(product_3),
	.sum		(1'b0)
);
defparam
	lpm_mult_component_3.lpm_widtha 				= 18,
	lpm_mult_component_3.lpm_widthb 				= 18,
	lpm_mult_component_3.lpm_widthp 				= 36,
	lpm_mult_component_3.lpm_widths 				= 1,
	lpm_mult_component_3.lpm_type 				= "LPM_MULT",
	lpm_mult_component_3.lpm_representation 	= "SIGNED",
	lpm_mult_component_3.lpm_hint = "INPUT_B_IS_CONSTANT=YES,MAXIMIZE_SPEED=5";


lpm_mult lpm_mult_component_4 (
	// Inputs
	.dataa	({10'h000, G_in}),
	.datab	(18'h0253F),
	.aclr		(1'b0),
	.clken	(1'b1),
	.clock	(1'b0),
	
	// Bidirectionals
	
	// Outputs
	.result	(product_4),
	.sum		(1'b0)
);
defparam
	lpm_mult_component_4.lpm_widtha 				= 18,
	lpm_mult_component_4.lpm_widthb 				= 18,
	lpm_mult_component_4.lpm_widthp 				= 36,
	lpm_mult_component_4.lpm_widths 				= 1,
	lpm_mult_component_4.lpm_type 				= "LPM_MULT",
	lpm_mult_component_4.lpm_representation 	= "SIGNED",
	lpm_mult_component_4.lpm_hint = "INPUT_B_IS_CONSTANT=YES,MAXIMIZE_SPEED=5";


lpm_mult lpm_mult_component_5 (
	// Inputs
	.dataa	({10'h000, B_in}),
	.datab	(18'h03831),
	.aclr		(1'b0),
	.clken	(1'b1),
	.clock	(1'b0),
	
	// Bidirectionals
	
	// Outputs
	.result	(product_5),
	.sum		(1'b0)
);
defparam
	lpm_mult_component_5.lpm_widtha 				= 18,
	lpm_mult_component_5.lpm_widthb 				= 18,
	lpm_mult_component_5.lpm_widthp 				= 36,
	lpm_mult_component_5.lpm_widths 				= 1,
	lpm_mult_component_5.lpm_type 				= "LPM_MULT",
	lpm_mult_component_5.lpm_representation 	= "SIGNED",
	lpm_mult_component_5.lpm_hint = "INPUT_B_IS_CONSTANT=YES,MAXIMIZE_SPEED=5";

// Formula Set #2 (BT.601 Gamma Corrected Color Conversion)
// ---------------------------------------------------------------------------
// Y  =  ( 77 / 256)R + (150 / 256)G + ( 29 / 256)B
// Cr = -( 44 / 256)R - ( 87 / 256)G + (131 / 256)B + 128
// Cb =  (131 / 256)R - (110 / 256)G - ( 21 / 256)B + 128
// 
// use full precision of multiply to experiment with coefficients
// ( 77 / 256) -> I[1:0].F[14:0]  0.30078 X 2^15 = 02680  
// (150 / 256) -> I[1:0].F[14:0]  0.58594 X 2^15 = 04B00 
// ( 29 / 256) -> I[1:0].F[14:0]  0.11328 X 2^15 = 00E80 
// ( 44 / 256) -> I[1:0].F[14:0]  0.17188 X 2^15 = 01600 
// ( 87 / 256) -> I[1:0].F[14:0]  0.33984 X 2^15 = 02B80 
// (131 / 256) -> I[1:0].F[14:0]  0.51172 X 2^15 = 04180 
// (110 / 256) -> I[1:0].F[14:0]  0.42969 X 2^15 = 03700 
// ( 21 / 256) -> I[1:0].F[14:0]  0.08103 X 2^15 = 00A80 

endmodule

