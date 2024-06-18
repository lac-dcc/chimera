// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date:   15:45:16 10/16/2017 
// Design Name:   Neural Network (using backpropagation)
// Module Name:   NN_CORE
// Project Name:  LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool versions: 
// Description: 
//			Calculation and renewal of w and b.
//Input:
//			clk    	       : 1 bit	: clock signal
//			res	           : 1 bit 	: reset signal - high active
//			update_coeff   : 1 bit 	: read enable signal (for memory) high active
//          input_k_j      : 16 bits 00_0000.0000_0000_00 unsigned : input value of k_j
// Output:
//      finish_updating    : 1 bit : active when the parameter finished updating
//  	a3_j 	           : 16 bits 00_0000.0000_0000_00 signed : third_layer_output
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module NN_CORE(
	input clk,
	input res,
	input update_coeff,
	input signed [15:0] input_k_1,
	input signed [15:0] input_k_2,
	output finish_updating,
	output signed [15:0] a3_1,
	output signed [15:0] a3_2
	);
	
	wire din;
	wire select_initial;
	
	wire signed [15:0] t_1;
	wire signed [15:0] t_2;
	wire signed [15:0] k_1;
	wire signed [15:0] k_2;
	
	wire signed [15:0] w3_11;
	wire signed [15:0] w3_12;
	wire signed [15:0] w3_21;
	wire signed [15:0] w3_22;
	wire signed [15:0] w3_31;
	wire signed [15:0] w3_32;

	wire signed [15:0] a2_1;
	wire signed [15:0] a2_2;
	wire signed [15:0] a2_3;
	
    wire signed [15:0] cap_delta_w3_11;
	wire signed [15:0] cap_delta_w3_21;
	wire signed [15:0] cap_delta_w3_31;
	wire signed [15:0] cap_delta_w3_12;
	wire signed [15:0] cap_delta_w3_22;
	wire signed [15:0] cap_delta_w3_32;
	wire signed [15:0] cap_delta_w2_11; 
	wire signed [15:0] cap_delta_w2_21;
	wire signed [15:0] cap_delta_w2_12; 
	wire signed [15:0] cap_delta_w2_22;
	wire signed [15:0] cap_delta_w2_13; 
	wire signed [15:0] cap_delta_w2_23;
	wire signed [15:0] cap_delta_b3_1;
	wire signed [15:0] cap_delta_b3_2;
	wire signed [15:0] cap_delta_b2_1;
	wire signed [15:0] cap_delta_b2_2;
	wire signed [15:0] cap_delta_b2_3;
	
	//delay
	
	wire signed[15:0] tmp_a2_1;
	wire signed[15:0] tmp2_a2_1;
	wire signed[15:0] tmp_a2_2;
	wire signed[15:0] tmp2_a2_2;
	wire signed[15:0] tmp_a2_3;
	wire signed[15:0] tmp2_a2_3;
	
	wire signed[15:0] tmp_k_1;
	wire signed[15:0] tmp2_k_1;
	wire signed[15:0] tmp3_k_1;
	wire signed[15:0] tmp4_k_1;	
	wire signed[15:0] tmp5_k_1;	
	
	wire signed[15:0] tmp_k_2;
	wire signed[15:0] tmp2_k_2;
	wire signed[15:0] tmp3_k_2;
	wire signed[15:0] tmp4_k_2;	
	wire signed[15:0] tmp5_k_2;	
	
	wire signed[15:0] tmp_t_1;
	wire signed[15:0] tmp2_t_1;
	wire signed[15:0] tmp3_t_1;
	wire signed[15:0] tmp4_t_1;
	wire signed[15:0] tmp5_t_1;
	
	wire signed[15:0] tmp_t_2;
	wire signed[15:0] tmp2_t_2;
	wire signed[15:0] tmp3_t_2;
	wire signed[15:0] tmp4_t_2;
	wire signed[15:0] tmp5_t_2;

    gen_din_sel GEN_DIN_SEL(.clk(clk), .res(res), .din(din), .select_initial(select_initial));
		
	forward FORWARD(
	.clk(clk), 
	.reset(res),
	.din(din),
	.select_initial(select_initial),
	.update_coeff(update_coeff),
	.input_k_1(input_k_1),
	.input_k_2(input_k_2),
	.cap_delta_b2_1(cap_delta_b2_1),
	.cap_delta_b2_2(cap_delta_b2_2),
	.cap_delta_b2_3(cap_delta_b2_3),
	.cap_delta_w2_11(cap_delta_w2_11),
	.cap_delta_w2_12(cap_delta_w2_12),
	.cap_delta_w2_13(cap_delta_w2_13),
	.cap_delta_w2_21(cap_delta_w2_21),
	.cap_delta_w2_22(cap_delta_w2_22),
	.cap_delta_w2_23(cap_delta_w2_23),
	.cap_delta_b3_1(cap_delta_b3_1),
	.cap_delta_b3_2(cap_delta_b3_2),
	.cap_delta_w3_11(cap_delta_w3_11),
	.cap_delta_w3_12(cap_delta_w3_12),
	.cap_delta_w3_21(cap_delta_w3_21),
	.cap_delta_w3_22(cap_delta_w3_22),
	.cap_delta_w3_31(cap_delta_w3_31),
	.cap_delta_w3_32(cap_delta_w3_32),
	.w3_11(w3_11),
	.w3_12(w3_12),
	.w3_21(w3_21),
    .w3_22(w3_22),
	.w3_31(w3_31),
	.w3_32(w3_32),
	.a2_1(a2_1),
	.a2_2(a2_2),
	.a2_3(a2_3),
	.a3_1(a3_1),
	.a3_2(a3_2),
	.k1(k_1),
	.k2(k_2),
	.t1(t_1),
	.t2(t_2),
	.finish_updating(finish_updating)
    );

	delay1 DELAY_A2_1(.clk(clk), .res(res), .inputdata(a2_1), .outputdata(tmp_a2_1) );
	delay1 DELAY_A2_2(.clk(clk), .res(res), .inputdata(a2_2), .outputdata(tmp_a2_2) );
	delay1 DELAY_A2_3(.clk(clk), .res(res), .inputdata(a2_3), .outputdata(tmp_a2_3) );
	
	delay1 DELAY2_A2_1(.clk(clk), .res(res), .inputdata(tmp_a2_1), .outputdata(tmp2_a2_1) );
	delay1 DELAY2_A2_2(.clk(clk), .res(res), .inputdata(tmp_a2_2), .outputdata(tmp2_a2_2) );
	delay1 DELAY2_A2_3(.clk(clk), .res(res), .inputdata(tmp_a2_3), .outputdata(tmp2_a2_3) );
	
	delay1 DELAY_K_1(.clk(clk), .res(res), .inputdata(k_1), .outputdata(tmp_k_1) );
	delay1 DELAY_K_2(.clk(clk), .res(res), .inputdata(k_2), .outputdata(tmp_k_2) );	
	
	delay1 DELAY2_K_1(.clk(clk), .res(res), .inputdata(tmp_k_1), .outputdata(tmp2_k_1) );
	delay1 DELAY2_K_2(.clk(clk), .res(res), .inputdata(tmp_k_2), .outputdata(tmp2_k_2) );

	delay1 DELAY3_K_1(.clk(clk), .res(res), .inputdata(tmp2_k_1), .outputdata(tmp3_k_1) );
	delay1 DELAY3_K_2(.clk(clk), .res(res), .inputdata(tmp2_k_2), .outputdata(tmp3_k_2) );
	
	delay1 DELAY4_K_1(.clk(clk), .res(res), .inputdata(tmp3_k_1), .outputdata(tmp4_k_1) );
	delay1 DELAY4_K_2(.clk(clk), .res(res), .inputdata(tmp3_k_2), .outputdata(tmp4_k_2) );	
		
	delay1 DELAY_T_1(.clk(clk), .res(res), .inputdata(t_1), .outputdata(tmp_t_1));
	delay1 DELAY_T_2(.clk(clk), .res(res), .inputdata(t_2), .outputdata(tmp_t_2));	
	
	delay1 DELAY2_T_1(.clk(clk), .res(res), .inputdata(tmp_t_1), .outputdata(tmp2_t_1));
	delay1 DELAY2_T_2(.clk(clk), .res(res), .inputdata(tmp_t_2), .outputdata(tmp2_t_2));

	delay1 DELAY3_T_1(.clk(clk), .res(res), .inputdata(tmp2_t_1), .outputdata(tmp3_t_1));
	delay1 DELAY3_T_2(.clk(clk), .res(res), .inputdata(tmp2_t_2), .outputdata(tmp3_t_2));
	
	delay1 DELAY4_T_1(.clk(clk), .res(res), .inputdata(tmp3_t_1), .outputdata(tmp4_t_1));
	delay1 DELAY4_T_2(.clk(clk), .res(res), .inputdata(tmp3_t_2), .outputdata(tmp4_t_2));	
	 
	backward BACKWARD(
	 .clk(clk),
	 .res(res),
    .a3_1(a3_1),
    .a3_2(a3_2),
    .a2_1(tmp2_a2_1),
    .a2_2(tmp2_a2_2),
    .a2_3(tmp2_a2_3),
    .k_1(tmp4_k_1),
    .k_2(tmp4_k_2),
	 .t_1(tmp4_t_1),
    .t_2(tmp4_t_2),
    .w3_11(w3_11),
    .w3_21(w3_21),
    .w3_31(w3_31),
    .w3_12(w3_12),
    .w3_22(w3_22),
    .w3_32(w3_32), 
	 .cap_delta_w3_11(cap_delta_w3_11), 
	 .cap_delta_w3_21(cap_delta_w3_21),  
	 .cap_delta_w3_31(cap_delta_w3_31),
	 .cap_delta_w3_12(cap_delta_w3_12), 
	 .cap_delta_w3_22(cap_delta_w3_22),  
	 .cap_delta_w3_32(cap_delta_w3_32),
	 .cap_delta_w2_11(cap_delta_w2_11), 
	 .cap_delta_w2_21(cap_delta_w2_21),
	 .cap_delta_w2_12(cap_delta_w2_12), 
	 .cap_delta_w2_22(cap_delta_w2_22),
	 .cap_delta_w2_13(cap_delta_w2_13), 
	 .cap_delta_w2_23(cap_delta_w2_23),
	 .cap_delta_b3_1(cap_delta_b3_1), 
	 .cap_delta_b3_2(cap_delta_b3_2),
	 .cap_delta_b2_1(cap_delta_b2_1), 
	 .cap_delta_b2_2(cap_delta_b2_2), 
	 .cap_delta_b2_3(cap_delta_b2_3)
	 );
	
	
endmodule
