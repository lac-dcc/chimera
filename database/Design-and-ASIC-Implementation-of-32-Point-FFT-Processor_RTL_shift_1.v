// This program was cloned from: https://github.com/abdelazeem201/Design-and-ASIC-Implementation-of-32-Point-FFT-Processor
// License: MIT License

// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Author: Ahmed Abdelazeem
// Github: https://github.com/abdelazeem201
// Email: ahmed_abdelazeem@outlook.com
// Description: shift_1 module
// Dependencies: 
// Since: 2021-12-22 10:12:13
// LastEditors: ahmed abdelazeem
// LastEditTime: 2021-12-2 10:12:53
// ********************************************************************
// Module Function
module shift_1(
		input wire clk,
		input wire reset,
		input wire in_valid,
		input signed [23:0] din_r,
		input signed [23:0] din_i,
		output signed [23:0] dout_r,
		output signed [23:0] dout_i
	);
	integer i ;
	reg [23:0] shift_reg_r ;
	reg [23:0] shift_reg_i ;
	reg [23:0] tmp_reg_r ;
	reg [23:0] tmp_reg_i ;
	reg [1:0] counter_1,next_counter_1;
	reg valid,next_valid;

	assign dout_r    = shift_reg_r[23:0];
	assign dout_i    = shift_reg_i[23:0];

	always@(posedge clk or posedge reset)begin
		if(reset)begin
			shift_reg_r <= 0;
			shift_reg_i <= 0;
			counter_1  <= 0;
			valid      <= 0;
		end
		else 
		if (in_valid)begin
			counter_1        <= next_counter_1;
			shift_reg_r      <= (tmp_reg_r<<24) + din_r;
			shift_reg_i      <= (tmp_reg_i<<24) + din_i;
			valid            <= in_valid;
		end else if(valid)begin
			counter_1        <= next_counter_1;
			shift_reg_r      <= (tmp_reg_r<<24) + din_r;
			shift_reg_i      <= (tmp_reg_i<<24) + din_i;
			valid            <= next_valid;
		end
	end
	
		always@(*)begin
		next_counter_1 = counter_1 + 2'd1;
		tmp_reg_r = shift_reg_r;
		tmp_reg_i = shift_reg_i;
		next_valid = valid;
	end

endmodule
