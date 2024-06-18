// This program was cloned from: https://github.com/abdelazeem201/Design-and-ASIC-Implementation-of-32-Point-FFT-Processor
// License: MIT License

// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Author: Ahmed Abdelazeem
// Github: https://github.com/abdelazeem201
// Email: ahmed_abdelazeem@outlook.com
// Description: shift_2 module
// Dependencies: 
// Since: 2021-12-22 5:16:18
// LastEditors: ahmed abdelazeem
// LastEditTime: 2021-12-22 5:16:18
// ********************************************************************
// Module Function
module shift_2(
		input wire clk,
		input wire reset,
		input wire in_valid,
		input wire signed [23:0] din_r,
		input wire signed [23:0] din_i,
		output wire signed [23:0] dout_r,
		output wire signed [23:0] dout_i
	);
	integer i ;
	reg [47:0] shift_reg_r ;
	reg [47:0] shift_reg_i ;
	reg [47:0] tmp_reg_r ;
	reg [47:0] tmp_reg_i ;
	reg [2:0] counter_2,next_counter_2;
	reg valid,next_valid;

	assign dout_r    = shift_reg_r[47:24];
	assign dout_i    = shift_reg_i[47:24];

	always@(posedge clk or posedge reset)begin
		if(reset)begin
			shift_reg_r <= 0;
			shift_reg_i <= 0;
			counter_2  <= 0;
			valid <= 0;
		end
		else 
		if (in_valid)begin
			counter_2        <= next_counter_2;
			shift_reg_r      <= (tmp_reg_r<<24) + din_r;
			shift_reg_i      <= (tmp_reg_i<<24) + din_i;
			valid            <= in_valid;
		end else if(valid)begin
			counter_2        <= next_counter_2;
			shift_reg_r      <= (tmp_reg_r<<24) + din_r;
			shift_reg_i      <= (tmp_reg_i<<24) + din_i;
			valid            <= next_valid;
		end
	end
	
		always@(*)begin
		next_counter_2 = counter_2 + 2'd1;
		tmp_reg_r = shift_reg_r;
		tmp_reg_i = shift_reg_i;
		next_valid = valid;
	end

endmodule
