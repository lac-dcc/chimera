// This program was cloned from: https://github.com/yztong/LeNet_RTL
// License: MIT License

//==================================================================================================
//  Filename      : conv_exec.v
//  Created On    : 2017-12-29 19:27:47
//  Last Modified : 2018-03-22 14:30:30
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : Conv 1st Layer Execute Module.
//
//
//==================================================================================================
module conv1_exec(/*autoport*/
//output
			f2_wdata,
//input
			clk,
			rst_n,
			mac_1);
	input  clk;
	input  rst_n;

	input	[137:0] mac_1;		//mac result  mac1_1 ~ mac1_6
	output	[95:0] f2_wdata;	//f2_wdata	  f2_1_wdata ~ f2_6_wdata

//Bias
parameter b_1 = 16'b0000010111101010;
parameter b_2 = 16'b1111101111001000;
parameter b_3 = 16'b0000000000101011;
parameter b_4 = 16'b1111111000100110;
parameter b_5 = 16'b1111100100101110;
parameter b_6 = 16'b0000000001101010;

wire [15:0]  d_out[5:0];
wire [15:0]  b_in [5:0];
wire [22:0]  d_in [5:0];
generate
	genvar i;
	for(i=0;i<6;i=i+1) begin:conv_unit_gen
		conv_unit conv_unit(/*autoinst*/
				.d_out(d_out[i]),
				.clk(clk),
				.rst_n(rst_n),
				.d_in(d_in[i]),
				.b_in(b_in[i]));
		
		assign d_in[i] = mac_1[23*i+22:23*i];
	end
endgenerate

assign f2_wdata = {d_out[5],d_out[4],d_out[3],d_out[2],d_out[1],d_out[0]};

// bias initial
assign b_in[0] = b_1;
assign b_in[1] = b_2;
assign b_in[2] = b_3;
assign b_in[3] = b_4;
assign b_in[4] = b_5;
assign b_in[5] = b_6;
endmodule 