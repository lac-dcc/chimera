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
// Since: 2021-12-23 10:18:53
// LastEditors: ahmed abdelazeem
// LastEditTime: 2021-12-23 10:18:53
// ********************************************************************
// Module Function
module shift_8(
		input wire clk,
		input wire reset,
		input wire in_valid,
		input wire signed [23:0] din_r,
		input wire signed [23:0] din_i,
		output wire signed [23:0] dout_r,
		output wire signed [23:0] dout_i
	);
	integer i ;
	reg [191:0] shift_reg_r ;
	reg [191:0] shift_reg_i ;
	reg [191:0] tmp_reg_r ;
	reg [191:0] tmp_reg_i ;
	reg [4:0] counter_8,next_counter_8;
	reg valid,next_valid;

	assign dout_r    = shift_reg_r[191:168];
	assign dout_i    = shift_reg_i[191:168];

	always@(posedge clk or posedge reset)begin
		if(reset)begin
			shift_reg_r <= 0;
			shift_reg_i <= 0;
			counter_8   <= 0;
			valid       <= 0;
		end
		else 
		if (in_valid)begin
			counter_8        <= next_counter_8;
			shift_reg_r      <= (tmp_reg_r<<24) + din_r;
			shift_reg_i      <= (tmp_reg_i<<24) + din_i;
			valid            <= in_valid;
		end else if(valid)begin
			counter_8        <= next_counter_8;
			shift_reg_r      <= (tmp_reg_r<<24) + din_r;
			shift_reg_i      <= (tmp_reg_i<<24) + din_i;
			valid            <= next_valid;
		end
	end


	always@(*)begin
		next_counter_8 = counter_8 + 4'd1;
		tmp_reg_r = shift_reg_r;
		tmp_reg_i = shift_reg_i;
		next_valid = valid;
	end
endmodule
