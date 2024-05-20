// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date:    22:28:44 10/13/2017 
// Design Name:    Neural Network (using backpropagation)
// Module Name:    backward
// Project Name:   LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool versions: 
//
// Description: 
// 		Calculation of capital_delta_w(and b)
// 
// Input:(i=1,2,3 , j=1,2)
//  	a3_j 		    : 16 bits 00_0000.0000_0000_00 signed : output_layer_output
//  	a2_i 		    : 16 bits 00_0000.0000_0000_00 signed : hidden_layer_output
//  	k_i   	        : 16 bits 00_0000.0000_0000_00 signed : supervisor data
//  	t_j    	        : 16 bits 00_0000.0000_0000_00 signed : supervisor value
//  	w3_ij 	        : 16 bits 00_0000.0000_0000_00 signed : weight
//  	w2_ji 	        : 16 bits 00_0000.0000_0000_00 signed : bias
//
// Output:(i=1,2,3 , j=1,2) 
//  	capital_delta_w3_ij : 16 bits 00_0000.0000_0000_00 signed : amount of w3_ij change 
//  	capital_delta_w2_ij : 16 bits 00_0000.0000_0000_00 signed : amount of w2_ji change
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
////////////////////////////////////////////////////////////////////////////////////
module backward(
    input clk,
	 input res,
    input signed [15:0] a3_1,
    input signed [15:0] a3_2,
    input signed [15:0] a2_1,
    input signed [15:0] a2_2,
    input signed [15:0] a2_3,
    input signed [15:0] k_1,
    input signed [15:0] k_2,
	input signed [15:0] t_1,
    input signed [15:0] t_2,
    input signed [15:0] w3_11,
    input signed [15:0] w3_21,
    input signed [15:0] w3_31,
    input signed [15:0] w3_12,
    input signed [15:0] w3_22,
    input signed [15:0] w3_32, 
	 output signed [15:0] cap_delta_w3_11, 
	 output signed [15:0] cap_delta_w3_21, 
	 output signed [15:0] cap_delta_w3_31,
	 output signed [15:0] cap_delta_w3_12, 
	 output signed [15:0] cap_delta_w3_22, 
	 output signed [15:0] cap_delta_w3_32,
	 output signed [15:0] cap_delta_w2_11, 
	 output signed [15:0] cap_delta_w2_21,
	 output signed [15:0] cap_delta_w2_12, 
	 output signed [15:0] cap_delta_w2_22,
	 output signed [15:0] cap_delta_w2_13, 
	 output signed [15:0] cap_delta_w2_23,
	 output signed [15:0] cap_delta_b3_1, 
	 output signed [15:0] cap_delta_b3_2,
	 output signed [15:0] cap_delta_b2_1, 
	 output signed [15:0] cap_delta_b2_2, 
	 output signed [15:0] cap_delta_b2_3
	 );
	

	wire signed [15:0] delta3_1;
	wire signed [15:0] delta3_2;
	wire signed [15:0] delta2_1;
	wire signed [15:0] delta2_2;
	wire signed [15:0] delta2_3;
	wire signed [15:0] dadz3_1;
	wire signed [15:0] dadz3_2;
	wire signed [15:0] dadz2_1;
	wire signed [15:0] dadz2_2;
	wire signed [15:0] dadz2_3;
	
	wire signed[15:0] dw3_11;
	wire signed[15:0] dw3_21;
	wire signed[15:0] dw3_31;
	wire signed[15:0] dw3_12;
	wire signed[15:0] dw3_22;
	wire signed[15:0] dw3_32;
	wire signed[15:0] dw2_11;
	wire signed[15:0] dw2_21;
	wire signed[15:0] dw2_12;
	wire signed[15:0] dw2_22;
	wire signed[15:0] dw2_13;
	wire signed[15:0] dw2_23;
	 
	//delay parameter
	wire signed[15:0] tmp_k_1; 
	wire signed[15:0] tmp_k_2;
	wire signed[15:0] tmp2_k_1; 
	wire signed[15:0] tmp2_k_2;
	wire signed[15:0] tmp3_k_1; 
	wire signed[15:0] tmp3_k_2;
	
	wire signed[15:0] tmp_a3_1; 
	wire signed[15:0] tmp_a3_2; 
	wire signed[15:0] tmp_t_1; 
	wire signed[15:0] tmp_t_2;

	wire signed[15:0] tmp_dadz2_1; 
	wire signed[15:0] tmp_dadz2_2; 
	wire signed[15:0] tmp_dadz2_3;
	
	wire signed[15:0] tmp_w3_11; 
	wire signed[15:0] tmp_w3_12; 
	wire signed[15:0] tmp_w3_21; 
	wire signed[15:0] tmp_w3_22; 
	wire signed[15:0] tmp_w3_31; 
	wire signed[15:0] tmp_w3_32;
	wire signed[15:0] tmp2_w3_11; 
	wire signed[15:0] tmp2_w3_12; 
	wire signed[15:0] tmp2_w3_21; 
	wire signed[15:0] tmp2_w3_22; 
	wire signed[15:0] tmp2_w3_31; 
	wire signed[15:0] tmp2_w3_32;
	
	wire signed[15:0] tmp_a2_1; 
	wire signed[15:0] tmp_a2_2; 
	wire signed[15:0] tmp_a2_3;
	wire signed[15:0] tmp2_a2_1; 
	wire signed[15:0] tmp2_a2_2; 
	wire signed[15:0] tmp2_a2_3;
	wire signed[15:0] tmp3_a2_1; 
	wire signed[15:0] tmp3_a2_2; 
	wire signed[15:0] tmp3_a2_3;
	
	wire signed[15:0] tmp_delta3_1; 
	wire signed[15:0] tmp_delta3_2;
	wire signed[15:0] tmp2_delta3_1; 
	wire signed[15:0] tmp2_delta3_2;
	wire signed[15:0] tmp_delta2_1; 
	wire signed[15:0] tmp_delta2_2; 
	wire signed[15:0] tmp_delta2_3;

	wire signed[15:0] tmp_cap_delta_w3_11; 
	wire signed[15:0] tmp_cap_delta_w3_21; 
	wire signed[15:0] tmp_cap_delta_w3_31;
	wire signed[15:0] tmp_cap_delta_w3_12; 
	wire signed[15:0] tmp_cap_delta_w3_22; 
	wire signed[15:0] tmp_cap_delta_w3_32;
	
	wire signed[15:0] tmp_cap_delta_b3_1; 
	wire signed[15:0] tmp_cap_delta_b3_2;
	wire signed[15:0] tmp_cap_delta_b2_1; 
	wire signed[15:0] tmp_cap_delta_b2_2; 
	wire signed[15:0] tmp_cap_delta_b2_3;
	wire signed[15:0] tmp2_cap_delta_b3_1; 
	wire signed[15:0] tmp2_cap_delta_b3_2;
	
	// Calculate dadz
	dadz DADZ3_1(.clk(clk), .res(res), .a(a3_1), .dadz(dadz3_1));
	dadz DADZ3_2(.clk(clk), .res(res), .a(a3_2), .dadz(dadz3_2));
	dadz DADZ2_1(.clk(clk), .res(res), .a(a2_1), .dadz(dadz2_1));
	dadz DADZ2_2(.clk(clk), .res(res), .a(a2_2), .dadz(dadz2_2));
	dadz DADZ2_3(.clk(clk), .res(res), .a(a2_3), .dadz(dadz2_3));
	
	// Calculate delta3
	// Delayed input : 1clk : a3, t
	delay1 DELAY_A3_1(.clk(clk), .res(res),  .inputdata(a3_1), .outputdata(tmp_a3_1));
	delay1 DELAY_A3_2(.clk(clk), .res(res),  .inputdata(a3_2), .outputdata(tmp_a3_2));
	delay1 DELAY_T_1(.clk(clk),  .res(res),  .inputdata(t_1),  .outputdata(tmp_t_1));
	delay1 DELAY_T_2(.clk(clk),  .res(res),  .inputdata(t_2),  .outputdata(tmp_t_2));

	delta3 DELTA3_1(.clk(clk), .res(res), .a3_i(tmp_a3_1), .t_i(tmp_t_1), .dadz3_i(dadz3_1), .delta3_i(delta3_1));
	delta3 DELTA3_2(.clk(clk), .res(res), .a3_i(tmp_a3_2), .t_i(tmp_t_2), .dadz3_i(dadz3_2), .delta3_i(delta3_2));
	
	// Calculate delta2
	// Delayed input　: 1clk  : dadz2
	//                 2clks : w3 
	delay1 DELAY_DADZ2_1(.clk(clk), .res(res),  .inputdata(dadz2_1), .outputdata(tmp_dadz2_1));
	delay1 DELAY_DADZ2_2(.clk(clk), .res(res),  .inputdata(dadz2_2), .outputdata(tmp_dadz2_2));	
	delay1 DELAY_DADZ2_3(.clk(clk), .res(res),  .inputdata(dadz2_3), .outputdata(tmp_dadz2_3));		

	delay1 DELAY_W3_11(.clk(clk), .res(res),  .inputdata(w3_11), .outputdata(tmp_w3_11));
	delay1 DELAY_W3_12(.clk(clk), .res(res),  .inputdata(w3_12), .outputdata(tmp_w3_12));
	delay1 DELAY_W3_21(.clk(clk), .res(res),  .inputdata(w3_21), .outputdata(tmp_w3_21));
	delay1 DELAY_W3_22(.clk(clk), .res(res),  .inputdata(w3_22), .outputdata(tmp_w3_22));
	delay1 DELAY_W3_31(.clk(clk), .res(res),  .inputdata(w3_31), .outputdata(tmp_w3_31));
	delay1 DELAY_W3_32(.clk(clk), .res(res),  .inputdata(w3_32), .outputdata(tmp_w3_32));
	delay1 DELAY2_W3_11(.clk(clk), .res(res),  .inputdata(tmp_w3_11), .outputdata(tmp2_w3_11));
	delay1 DELAY2_W3_12(.clk(clk), .res(res),  .inputdata(tmp_w3_12), .outputdata(tmp2_w3_12));
	delay1 DELAY2_W3_21(.clk(clk), .res(res),  .inputdata(tmp_w3_21), .outputdata(tmp2_w3_21));
	delay1 DELAY2_W3_22(.clk(clk), .res(res),  .inputdata(tmp_w3_22), .outputdata(tmp2_w3_22));
	delay1 DELAY2_W3_31(.clk(clk), .res(res),  .inputdata(tmp_w3_31), .outputdata(tmp2_w3_31));
	delay1 DELAY2_W3_32(.clk(clk), .res(res),  .inputdata(tmp_w3_32), .outputdata(tmp2_w3_32));
	
	delta2 DELTA2_1(.clk(clk), .res(res), .dadz2_i(tmp_dadz2_1), .w3_i1(tmp2_w3_11), .w3_i2(tmp2_w3_12), .delta3_1(delta3_1), .delta3_2(delta3_2), .delta2_i(delta2_1));
	delta2 DELTA2_2(.clk(clk), .res(res), .dadz2_i(tmp_dadz2_2), .w3_i1(tmp2_w3_21), .w3_i2(tmp2_w3_22), .delta3_1(delta3_1), .delta3_2(delta3_2), .delta2_i(delta2_2));
	delta2 DELTA2_3(.clk(clk), .res(res), .dadz2_i(tmp_dadz2_3), .w3_i1(tmp2_w3_31), .w3_i2(tmp2_w3_32), .delta3_1(delta3_1), .delta3_2(delta3_2), .delta2_i(delta2_3));
	
	// dw3
	// Delayed input　: 1clk  : delta3
	//                 3clks : a2 
	delay1 DELAY_A2_1(.clk(clk), .res(res),  .inputdata(a2_1), .outputdata(tmp_a2_1));
	delay1 DELAY_A2_2(.clk(clk), .res(res),  .inputdata(a2_2), .outputdata(tmp_a2_2));
	delay1 DELAY_A2_3(.clk(clk), .res(res),  .inputdata(a2_3), .outputdata(tmp_a2_3));
	delay1 DELAY2_A2_1(.clk(clk), .res(res),  .inputdata(tmp_a2_1), .outputdata(tmp2_a2_1));
	delay1 DELAY2_A2_2(.clk(clk), .res(res),  .inputdata(tmp_a2_2), .outputdata(tmp2_a2_2));
	delay1 DELAY2_A2_3(.clk(clk), .res(res),  .inputdata(tmp_a2_3), .outputdata(tmp2_a2_3));
	delay1 DELAY3_A2_1(.clk(clk), .res(res),  .inputdata(tmp2_a2_1), .outputdata(tmp3_a2_1));
	delay1 DELAY3_A2_2(.clk(clk), .res(res),  .inputdata(tmp2_a2_2), .outputdata(tmp3_a2_2));
	delay1 DELAY3_A2_3(.clk(clk), .res(res),  .inputdata(tmp2_a2_3), .outputdata(tmp3_a2_3));
	
    delay1 DELAY_DELTA3_1(.clk(clk), .res(res),  .inputdata(delta3_1), .outputdata(tmp_delta3_1));
	delay1 DELAY_DELTA3_2(.clk(clk), .res(res),  .inputdata(delta3_2), .outputdata(tmp_delta3_2));
	
	dw DW3_11( .clk(clk), .res(res), .unit_error(tmp_delta3_1), .input_signal(tmp3_a2_1), .renew_parameter(dw3_11) );
	dw DW3_21( .clk(clk), .res(res), .unit_error(tmp_delta3_1), .input_signal(tmp3_a2_2), .renew_parameter(dw3_21) );
	dw DW3_31( .clk(clk), .res(res), .unit_error(tmp_delta3_1), .input_signal(tmp3_a2_3), .renew_parameter(dw3_31) );
	dw DW3_12( .clk(clk), .res(res), .unit_error(tmp_delta3_2), .input_signal(tmp3_a2_1), .renew_parameter(dw3_12) );
	dw DW3_22( .clk(clk), .res(res), .unit_error(tmp_delta3_2), .input_signal(tmp3_a2_2), .renew_parameter(dw3_22) );
	dw DW3_32( .clk(clk), .res(res), .unit_error(tmp_delta3_2), .input_signal(tmp3_a2_3), .renew_parameter(dw3_32) );
	
	// dw2
	// Delayed input　: 3clk  : k
	delay1 DELAY_K_1(.clk(clk),  .res(res), .inputdata(k_1), .outputdata(tmp_k_1));
	delay1 DELAY_K_2(.clk(clk),  .res(res), .inputdata(k_2), .outputdata(tmp_k_2));
	delay1 DELAY2_K_1(.clk(clk),  .res(res), .inputdata(tmp_k_1), .outputdata(tmp2_k_1));
	delay1 DELAY2_K_2(.clk(clk),  .res(res), .inputdata(tmp_k_2), .outputdata(tmp2_k_2));
	delay1 DELAY3_K_1(.clk(clk),  .res(res), .inputdata(tmp2_k_1), .outputdata(tmp3_k_1));
	delay1 DELAY3_K_2(.clk(clk),  .res(res), .inputdata(tmp2_k_2), .outputdata(tmp3_k_2));

	dw DW2_11( .clk(clk), .res(res), .unit_error(delta2_1), .input_signal(tmp3_k_1), .renew_parameter(dw2_11) );
	dw DW2_21( .clk(clk), .res(res), .unit_error(delta2_1), .input_signal(tmp3_k_2), .renew_parameter(dw2_21) );
	dw DW2_12( .clk(clk), .res(res), .unit_error(delta2_2), .input_signal(tmp3_k_1), .renew_parameter(dw2_12) );
	dw DW2_22( .clk(clk), .res(res), .unit_error(delta2_2), .input_signal(tmp3_k_2), .renew_parameter(dw2_22) );
	dw DW2_13( .clk(clk), .res(res), .unit_error(delta2_3), .input_signal(tmp3_k_1), .renew_parameter(dw2_13) );
	dw DW2_23( .clk(clk), .res(res), .unit_error(delta2_3), .input_signal(tmp3_k_2), .renew_parameter(dw2_23) );
	
	// Cap_delta_w3
	dw_adder DW_ADDER3_11( .clk(clk), .res(res), .dw(dw3_11), .dcdw3(cap_delta_w3_11) );
	dw_adder DW_ADDER3_21( .clk(clk), .res(res), .dw(dw3_21), .dcdw3(cap_delta_w3_21) );
	dw_adder DW_ADDER3_31( .clk(clk), .res(res), .dw(dw3_31), .dcdw3(cap_delta_w3_31) );
	dw_adder DW_ADDER3_12( .clk(clk), .res(res), .dw(dw3_12), .dcdw3(cap_delta_w3_12) );
	dw_adder DW_ADDER3_22( .clk(clk), .res(res), .dw(dw3_22), .dcdw3(cap_delta_w3_22) );
	dw_adder DW_ADDER3_32( .clk(clk), .res(res), .dw(dw3_32), .dcdw3(cap_delta_w3_32) );
		
	// Cap_delta_w2
	dw_adder DW_ADDER2_11( .clk(clk), .res(res), .dw(dw2_11), .dcdw3(cap_delta_w2_11) );
	dw_adder DW_ADDER2_21( .clk(clk), .res(res), .dw(dw2_21), .dcdw3(cap_delta_w2_21) );
	dw_adder DW_ADDER2_12( .clk(clk), .res(res), .dw(dw2_12), .dcdw3(cap_delta_w2_12) );
	dw_adder DW_ADDER2_22( .clk(clk), .res(res), .dw(dw2_22), .dcdw3(cap_delta_w2_22) );
	dw_adder DW_ADDER2_13( .clk(clk), .res(res), .dw(dw2_13), .dcdw3(cap_delta_w2_13) );
	dw_adder DW_ADDER2_23( .clk(clk), .res(res), .dw(dw2_23), .dcdw3(cap_delta_w2_23) );
	
	// Cap_delta_b3
	// Delayed input　: 2clk  : delta3
    delay1 DELAY2_DELTA3_1(.clk(clk),  .res(res), .inputdata(tmp_delta3_1), .outputdata(tmp2_delta3_1));
	delay1 DELAY2_DELTA3_2(.clk(clk),  .res(res), .inputdata(tmp_delta3_2), .outputdata(tmp2_delta3_2));
	//
	db_adder DB_ADDER3_1( .clk(clk), .res(res), .delta(tmp2_delta3_1), .dcdb(cap_delta_b3_1) );
	db_adder DB_ADDER3_2( .clk(clk), .res(res), .delta(tmp2_delta3_2), .dcdb(cap_delta_b3_2) );

	
	// Cap_delta_b2
	// Delayed input : 1clk : delta2
	delay1 DELAY_DELTA2_1(.clk(clk),  .res(res), .inputdata(delta2_1), .outputdata(tmp_delta2_1));
	delay1 DELAY_DELTA2_2(.clk(clk),  .res(res), .inputdata(delta2_2), .outputdata(tmp_delta2_2));
	delay1 DELAY_DELTA2_3(.clk(clk),  .res(res), .inputdata(delta2_3), .outputdata(tmp_delta2_3));
	//
	db_adder DB_ADDER2_1( .clk(clk), .res(res), .delta(tmp_delta2_1), .dcdb(cap_delta_b2_1) );
	db_adder DB_ADDER2_2( .clk(clk), .res(res), .delta(tmp_delta2_2), .dcdb(cap_delta_b2_2) );
	db_adder DB_ADDER2_3( .clk(clk), .res(res), .delta(tmp_delta2_3), .dcdb(cap_delta_b2_3) );	


endmodule
