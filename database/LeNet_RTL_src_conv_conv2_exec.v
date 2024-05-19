// This program was cloned from: https://github.com/yztong/LeNet_RTL
// License: MIT License

//==================================================================================================
//  Filename      : conv2_exec.v
//  Created On    : 2018-01-02 13:26:16
//  Last Modified : 2018-03-22 14:32:17
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : Conv 2nd Layer Execute Module.
//
//
//==================================================================================================
module conv2_exec(/*autoport*/
//output
			f4_wdata,
//input
			mac_2,
			clk,
			rst_n);

	input [2207:0] mac_2; //mac result. mac2_1_1 ~ mac2_16_6
	

	input clk;
	input rst_n;

	output [255:0] f4_wdata; //f4_wdata. f4_1_wdata ~ f4_16_wdata

//Bias
parameter b_1 = 16'b0000001100101101;
parameter b_2 = 16'b1111111010111110;
parameter b_3 = 16'b0000000010100000;
parameter b_4 = 16'b1111100101000010;
parameter b_5 = 16'b1111111011101010;
parameter b_6 = 16'b1111011001101101;
parameter b_7 = 16'b1111111111100000;
parameter b_8 = 16'b1111110100101000;
parameter b_9 = 16'b0000000011011001;
parameter b_10 = 16'b1111010010111100;
parameter b_11 = 16'b1111100011001010;
parameter b_12 = 16'b1111011101010010;
parameter b_13 = 16'b1111100100100110;
parameter b_14 = 16'b1111110010101111;
parameter b_15 = 16'b1111110111000000;
parameter b_16 = 16'b1111011100110000;




wire [22:0] mac2[95:0];
wire [22:0] d_in[15:0];
wire [15:0] d_out[15:0];
wire [15:0]  b_in[15:0];
generate
	genvar k,l;
	for(k=0;k<16;k=k+1) begin:loop16
		channel_adder channel_adder(/*autoinst*/
			.result(d_in[k]),
			.clk(clk),
			.rst_n(rst_n),
			.d1(mac2[k*6+0]),
			.d2(mac2[k*6+1]),
			.d3(mac2[k*6+2]),
			.d4(mac2[k*6+3]),
			.d5(mac2[k*6+4]),
			.d6(mac2[k*6+5]));
		conv_unit conv_unit(/*autoinst*/
			.d_out(d_out[k]),
			.clk(clk),
			.rst_n(rst_n),
			.d_in(d_in[k]),
			.b_in(b_in[k]));
	end
	for(l=0;l<96;l=l+1) begin:loop96
		assign mac2[l] = mac_2[23*l+22:23*l];
	end
endgenerate

assign f4_wdata = {d_out[15],d_out[14],d_out[13],d_out[12],
	d_out[11],d_out[10],d_out[9],d_out[8],d_out[7],d_out[6],
	d_out[5],d_out[4],d_out[3],d_out[2],d_out[1],d_out[0]};

//Bias initial
assign b_in[0] = b_1;
assign b_in[1] = b_2;
assign b_in[2] = b_3;
assign b_in[3] = b_4;
assign b_in[4] = b_5;
assign b_in[5] = b_6;
assign b_in[6] = b_7;
assign b_in[7] = b_8;
assign b_in[8] = b_9;
assign b_in[9] = b_10;
assign b_in[10] = b_11;
assign b_in[11] = b_12;
assign b_in[12] = b_13;
assign b_in[13] = b_14;
assign b_in[14] = b_15;
assign b_in[15] = b_16;

endmodule 