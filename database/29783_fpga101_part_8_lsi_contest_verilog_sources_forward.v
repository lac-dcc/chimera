// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date:    22:28:44 10/13/2017 
// Design Name:    Neural Network (using backpropagation)
// Module Name:    forward
// Project Name:   LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool versions: 
//
// Description: 
// 		Calculation of a2 and a3 
// 
// Input:(i=1,2,3 , j=1,2)
//		clk	                : 1 bit
//		res 	            : 1 bit : high active
//		din	                : 1 bit : read enable signal
//      select_initial      : 1 bit : select initial signal
//		update_coeff        : 1 bit : read enable signal (for memory) high active
//      input_k_j           : 16 bits 00_0000.0000_0000_00 unsigned : input value of k_j
//  	capital_delta_b2_i  : 16 bits 00_0000.0000_0000_00 signed : amount of change of b2_i 
//  	capital_delta_w2_ji : 16 bits 00_0000.0000_0000_00 signed : amount of change of w2_ji 
//  	capital_delta_b3_j  : 16 bits 00_0000.0000_0000_00 signed : amount of change of b3_j 
//  	capital_delta_w3_ij : 16 bits 00_0000.0000_0000_00 signed : amount of change of w3_ij  
//
// Output:(i=1,2,3 , j=1,2) 
//  	w3_ij 	            : 16 bits 00_0000.0000_0000_00 signed : weight for third layer
//  	a3_j 	            : 16 bits 00_0000.0000_0000_00 signed : third_layer_output
//  	a2_i 	            : 16 bits 00_0000.0000_0000_00 signed : second_layer_output
//  	k_j   	            : 16 bits 00_0000.0000_0000_00 signed : supervisor data
// 	    t_j    	            : 16 bits 00_0000.0000_0000_00 signed : supervisor value
//      finish_updating     : 1 bit : active when the parameter finished updating
//
// Latency: 
//      4 clocks
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
////////////////////////////////////////////////////////////////////////////////////
module forward(
	input clk,
	input reset,
	input din,
	input select_initial,
	input update_coeff,
	input [15:0] input_k_1,
	input [15:0] input_k_2,
	input signed [15:0] cap_delta_b2_1,
	input signed [15:0] cap_delta_b2_2,
	input signed [15:0] cap_delta_b2_3,
	input signed [15:0] cap_delta_w2_11,
	input signed [15:0] cap_delta_w2_12,
	input signed [15:0] cap_delta_w2_13,
	input signed [15:0] cap_delta_w2_21,
	input signed [15:0] cap_delta_w2_22,
	input signed [15:0] cap_delta_w2_23,
	input signed [15:0] cap_delta_b3_1,
	input signed [15:0] cap_delta_b3_2,
	input signed [15:0] cap_delta_w3_11,
	input signed [15:0] cap_delta_w3_12,
	input signed [15:0] cap_delta_w3_21,
	input signed [15:0] cap_delta_w3_22,
	input signed [15:0] cap_delta_w3_31,
	input signed [15:0] cap_delta_w3_32,
	output signed [15:0] w3_11,
	output signed [15:0] w3_12,
	output signed [15:0] w3_21,
	output signed [15:0] w3_22,
	output signed [15:0] w3_31,
	output signed [15:0] w3_32,
	output signed [15:0] a2_1,
	output signed [15:0] a2_2,
	output signed [15:0] a2_3,
	output signed [15:0] a3_1,
	output signed [15:0] a3_2,
	output signed [15:0] k1,
	output signed [15:0] k2,
	output signed [15:0] t1,
	output signed [15:0] t2,
	output finish_updating
    );

wire select_update;
wire [3:0] out;		
wire signed [7:0] z2_1, z2_2, z2_3;
wire signed [7:0] z3_1, z3_2;
wire signed [15:0] b2_1;
wire signed [15:0] b2_2;
wire signed [15:0] b2_3;
wire signed [15:0] b3_1;
wire signed [15:0] b3_2;
wire signed [15:0] w2_11;
wire signed [15:0] w2_12;
wire signed [15:0] w2_13;
wire signed [15:0] w2_21;
wire signed [15:0] w2_22;
wire signed [15:0] w2_23;

wire signed [15:0] k1_temp;
wire signed [15:0] k2_temp;

//first layer (input layer) , insert the supervisor data and supervisor value
counter COUNTER(.clk(clk), .reset(reset), .out(out), .finish_updating(finish_updating));
k1	K1(.clk(clk), .din(din), .addr(out), .k1(k1_temp));
k2	K2(.clk(clk), .din(din), .addr(out), .k2(k2_temp));
t1	T1(.clk(clk), .din(din), .addr(out), .t1(t1));
t2	T2(.clk(clk), .din(din), .addr(out), .t2(t2));

sel_k SEL_K1(.input_k(input_k_1), .update_k(k1_temp), .update_coeff(update_coeff), .k(k1));
sel_k SEL_K2(.input_k(input_k_2), .update_k(k2_temp), .update_coeff(update_coeff), .k(k2));

selector	SELECTOR(.clk(clk), .reset(reset), .update_coeff(update_coeff), .enable_update(select_update));

//declaration of initial parameter (weight and bias) for second layer (hidden layer) and to update these parameter
b2_1	B2_1(.clk(clk), .reset(reset), .db2_1(cap_delta_b2_1), .select_initial(select_initial), .select_update(select_update), .b2_1(b2_1));
b2_2	B2_2(.clk(clk), .reset(reset), .db2_2(cap_delta_b2_2), .select_initial(select_initial), .select_update(select_update), .b2_2(b2_2));
b2_3	B2_3(.clk(clk), .reset(reset), .db2_3(cap_delta_b2_3), .select_initial(select_initial), .select_update(select_update), .b2_3(b2_3));

w2_11	W2_11(.clk(clk), .reset(reset), .dw2_11(cap_delta_w2_11), .select_initial(select_initial), .select_update(select_update), .w2_11(w2_11));
w2_12	W2_12(.clk(clk), .reset(reset), .dw2_12(cap_delta_w2_12), .select_initial(select_initial), .select_update(select_update), .w2_12(w2_12));
w2_13	W2_13(.clk(clk), .reset(reset), .dw2_13(cap_delta_w2_13), .select_initial(select_initial), .select_update(select_update), .w2_13(w2_13));
w2_21	W2_21(.clk(clk), .reset(reset), .dw2_21(cap_delta_w2_21), .select_initial(select_initial), .select_update(select_update), .w2_21(w2_21));
w2_22	W2_22(.clk(clk), .reset(reset), .dw2_22(cap_delta_w2_22), .select_initial(select_initial), .select_update(select_update), .w2_22(w2_22));
w2_23	W2_23(.clk(clk), .reset(reset), .dw2_23(cap_delta_w2_23), .select_initial(select_initial), .select_update(select_update), .w2_23(w2_23));

//declaration of initial parameter (weight and bias) for third layer (output layer) and to update these parameter
b3_1	B3_1(.clk(clk), .reset(reset), .db3_1(cap_delta_b3_1), .select_initial(select_initial), .select_update(select_update), .b3_1(b3_1));
b3_2	B3_2(.clk(clk), .reset(reset), .db3_2(cap_delta_b3_2), .select_initial(select_initial), .select_update(select_update), .b3_2(b3_2));

w3_11	W3_11(.clk(clk), .reset(reset), .dw3_11(cap_delta_w3_11), .select_initial(select_initial), .select_update(select_update), .w3_11(w3_11));
w3_12	W3_12(.clk(clk), .reset(reset), .dw3_12(cap_delta_w3_12), .select_initial(select_initial), .select_update(select_update), .w3_12(w3_12));
w3_21	W3_21(.clk(clk), .reset(reset), .dw3_21(cap_delta_w3_21), .select_initial(select_initial), .select_update(select_update), .w3_21(w3_21));
w3_22	W3_22(.clk(clk), .reset(reset), .dw3_22(cap_delta_w3_22), .select_initial(select_initial), .select_update(select_update), .w3_22(w3_22));
w3_31	W3_31(.clk(clk), .reset(reset), .dw3_31(cap_delta_w3_31), .select_initial(select_initial), .select_update(select_update), .w3_31(w3_31));
w3_32	W3_32(.clk(clk), .reset(reset), .dw3_32(cap_delta_w3_32), .select_initial(select_initial), .select_update(select_update), .w3_32(w3_32));

//calculation of weight, input and bias for second layer
z2	Z2_1(.clk(clk), .reset(reset), .k1(k1), .k2(k2), .w2_1(w2_11), .w2_2(w2_21), .b2(b2_1), .z2(z2_1));
z2	Z2_2(.clk(clk), .reset(reset), .k1(k1), .k2(k2), .w2_1(w2_12), .w2_2(w2_22), .b2(b2_2), .z2(z2_2));
z2	Z2_3(.clk(clk), .reset(reset), .k1(k1), .k2(k2), .w2_1(w2_13), .w2_2(w2_23), .b2(b2_3), .z2(z2_3));

//activation function for second layer
mem	A2_1(.clk(clk), .din(din), .addr(z2_1), .dout(a2_1));
mem	A2_2(.clk(clk), .din(din), .addr(z2_2), .dout(a2_2));
mem	A2_3(.clk(clk), .din(din), .addr(z2_3), .dout(a2_3));

//calculation of weight, input and bias for third layer
z3	Z3_1(.clk(clk), .reset(reset), .a2_1(a2_1), .a2_2(a2_2), .a2_3(a2_3), .w3_1(w3_11), .w3_2(w3_21), .w3_3(w3_31), .b3(b3_1), .z3(z3_1));
z3	Z3_2(.clk(clk), .reset(reset), .a2_1(a2_1), .a2_2(a2_2), .a2_3(a2_3), .w3_1(w3_12), .w3_2(w3_22), .w3_3(w3_32), .b3(b3_2), .z3(z3_2));

//activation function for third layer
mem	A3_1(.clk(clk), .din(din), .addr(z3_1), .dout(a3_1));
mem	A3_2(.clk(clk), .din(din), .addr(z3_2), .dout(a3_2));

endmodule