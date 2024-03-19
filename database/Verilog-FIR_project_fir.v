`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  
// Engineer: anxu chan
// 
// Create Date:    16:17:14 08/02/2017 
// Design Name:    FIR filter
// Module Name:    fir 
// Project Name:   FirDesign
// Target Devices: Xilinix V5
// Description: fir res file
// Revision: 1.0
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fir(
	input clk,
	input rst,
	input wire signed [15:0] filter_in,
	output reg signed [31:0] filter_out
    );
	
	parameter word_width = 16;
	parameter order = 16;

	// define delay unit , input width is 16  , filter order is 16
	reg signed [word_width-1:0] delay_pipeline[order:0];
	
	// define coef
	wire signed [word_width-1:0]  coef[order:0];
	assign coef[0] = -17;
	assign coef[1] = 62;
	assign coef[2] = 456;
	assign coef[3] = 1482;
	assign coef[4] = 3367;
	assign coef[5] = 6013;
	assign coef[6] = 8880;
	assign coef[7] = 11129;
	assign coef[8] = 11983;
	assign coef[9] = 11129;
	assign coef[10] = 8880;
	assign coef[11] = 6013;
	assign coef[12] = 3367;
	assign coef[13] = 1482;
	assign coef[14] = 456;
	assign coef[15] = 62;
	assign coef[16] = -17;

	// define multipler
	reg signed [31:0]  product[16:0];

	// define sum buffer
	reg signed [31:0]  sum_buf;	

	// define input data buffer
	reg signed [15:0] data_in_buf;

	// data buffer
	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			data_in_buf <= 0;
		end
		else begin
			data_in_buf <= filter_in;
		end
	end

	// delay units pipeline
	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			delay_pipeline[0] <= 0 ;
			delay_pipeline[1] <= 0 ;
			delay_pipeline[2] <= 0 ;
			delay_pipeline[3] <= 0 ;
			delay_pipeline[4] <= 0 ;
			delay_pipeline[5] <= 0 ;
			delay_pipeline[6] <= 0 ;
			delay_pipeline[7] <= 0 ;
			delay_pipeline[8] <= 0 ;
			delay_pipeline[9] <= 0 ;
			delay_pipeline[10] <= 0 ;
			delay_pipeline[11] <= 0 ;
			delay_pipeline[12] <= 0 ;
			delay_pipeline[13] <= 0 ;
			delay_pipeline[14] <= 0 ;
			delay_pipeline[15] <= 0 ;
			delay_pipeline[16] <= 0 ;
		end 
		else begin
			delay_pipeline[0] <= data_in_buf ;
			delay_pipeline[1] <= delay_pipeline[0] ;
			delay_pipeline[2] <= delay_pipeline[1] ;
			delay_pipeline[3] <= delay_pipeline[2] ;
			delay_pipeline[4] <= delay_pipeline[3] ;
			delay_pipeline[5] <= delay_pipeline[4] ;
			delay_pipeline[6] <= delay_pipeline[5] ;
			delay_pipeline[7] <= delay_pipeline[6] ;
			delay_pipeline[8] <= delay_pipeline[7] ;
			delay_pipeline[9] <= delay_pipeline[8] ;
			delay_pipeline[10] <= delay_pipeline[9] ;
			delay_pipeline[11] <= delay_pipeline[10] ;
			delay_pipeline[12] <= delay_pipeline[11] ;
			delay_pipeline[13] <= delay_pipeline[12] ;
			delay_pipeline[14] <= delay_pipeline[13] ;
			delay_pipeline[15] <= delay_pipeline[14] ;
			delay_pipeline[16] <= delay_pipeline[15] ;
		end
	end

	// implement product with coef 
	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			product[0] <= 0;
			product[1] <= 0;
			product[2] <= 0;
			product[3] <= 0;
			product[4] <= 0;
			product[5] <= 0;
			product[6] <= 0;
			product[7] <= 0;
			product[8] <= 0;
			product[9] <= 0;
			product[10] <= 0;
			product[11] <= 0;
			product[12] <= 0;
			product[13] <= 0;
			product[14] <= 0;
			product[15] <= 0;
			product[16] <= 0;
		end
		else begin
			product[0] <= coef[0] * delay_pipeline[0];
			product[1] <= coef[1] * delay_pipeline[1];
			product[2] <= coef[2] * delay_pipeline[2];
			product[3] <= coef[3] * delay_pipeline[3];
			product[4] <= coef[4] * delay_pipeline[4];
			product[5] <= coef[5] * delay_pipeline[5];
			product[6] <= coef[6] * delay_pipeline[6];
			product[7] <= coef[7] * delay_pipeline[7];
			product[8] <= coef[8] * delay_pipeline[8];
			product[9] <= coef[9] * delay_pipeline[9];
			product[10] <= coef[10] * delay_pipeline[10];
			product[11] <= coef[11] * delay_pipeline[11];
			product[12] <= coef[12] * delay_pipeline[12];
			product[13] <= coef[13] * delay_pipeline[13];
			product[14] <= coef[14] * delay_pipeline[14];
			product[15] <= coef[15] * delay_pipeline[15];
			product[16] <= coef[16] * delay_pipeline[16];
		end
	end

	// accumulation
	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			sum_buf <= 0;
		end
		else begin
			sum_buf <= product[0] + product[1]+ product[2]+ product[3]+ product[4]
			+ product[5]+ product[6]+ product[7]+ product[8]+ product[9]+ product[10]
			+ product[11]+ product[12]+ product[13]+ product[14]+ product[15]+ product[16];
		end
	end

	always @(sum_buf) begin
		if (!rst) begin
			filter_out = 0;
		end
		else begin
			filter_out = sum_buf;
		end
	end

endmodule
