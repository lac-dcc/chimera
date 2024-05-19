// This program was cloned from: https://github.com/abdelazeem201/Design-and-ASIC-Implementation-of-32-Point-FFT-Processor
// License: MIT License

// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Author: Ahmed Abdelazeem
// Github: https://github.com/abdelazeem201
// Email: ahmed_abdelazeem@outlook.com
// Description: radix2 module
// Dependencies: 
// Since: 2021-12-24 05:10:50
// LastEditors: ahmed abdelazeem
// LastEditTime: 2021-12-24 05:10:50
// ********************************************************************
// Module Function
module radix2(
		input wire [1:0] state,
		input wire signed [23:0] din_a_r,
		input wire signed [23:0] din_a_i,
		input wire signed [23:0] din_b_r,//a
		input wire signed [23:0] din_b_i,//b
		input wire signed [23:0] w_r,//c
		input wire signed [23:0] w_i,//d
		output reg signed[23:0] op_r,
		output reg signed[23:0] op_i,
		output reg signed[23:0] delay_r,
		output reg signed[23:0] delay_i,
		output reg outvalid
	);

	reg signed [41:0] inter,mul_r,mul_i;//was 27
	reg signed [23:0] a,b,c,d;

	always@(*)begin
		op_r = 0;
		op_i = 0;
		delay_r = din_b_r;
		delay_i = din_b_i;
		case(state)
		2'b00:begin
		//waiting
		delay_r = din_b_r;
		delay_i = din_b_i;
		outvalid = 1'b0;
		end
		2'b01:begin
		//first half
		a = din_a_r + din_b_r;
		b = din_a_i + din_b_i;
		
		c = (din_a_r - din_b_r);//a-b
		d = (din_a_i - din_b_i);//a-b

		op_r = a;
		op_i = b;
		delay_r = c;
		delay_i = d;
		outvalid = 1'b1;
		end
		2'b10:begin
		//second half
		a = din_a_r;
		b = din_a_i;
		delay_r = din_b_r;
		delay_i = din_b_i;

		inter = b * (w_r - w_i); //b(c-d)
		mul_r  = w_r * (a - b) + inter;
		mul_i  = w_i * (a + b) + inter;

		op_r = (mul_r[31:8]);
		op_i = (mul_i[31:8]);
		outvalid = 1'b1;
		end
		2'b11:begin
		//disable
		outvalid = 1'b0;
		end
		default:begin
		delay_r = din_b_r;
		delay_i = din_b_i;
		end
		endcase
		
	end


endmodule
