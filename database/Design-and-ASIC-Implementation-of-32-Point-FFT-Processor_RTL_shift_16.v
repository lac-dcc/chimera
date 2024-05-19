// This program was cloned from: https://github.com/abdelazeem201/Design-and-ASIC-Implementation-of-32-Point-FFT-Processor
// License: MIT License

// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Author: Ahmed Abdelazeem
// Github: https://github.com/abdelazeem201
// Email: ahmed_abdelazeem@outlook.com
// Description: shift_16 module
// Dependencies: 
// Since: 2021-12-22 2:22:03
// LastEditors: ahmed abdelazeem
// LastEditTime: 2021-12-22 2:22:03
// ********************************************************************
// Module Function
module shift_16(
		input wire clk,
		input wire reset,
		input wire in_valid,
		input wire signed [23:0] din_r,
		input wire signed [23:0] din_i,
		output wire signed [23:0] dout_r,
		output wire signed [23:0] dout_i
	);
	integer i ;
	reg [383:0] shift_reg_r ;
	reg [383:0] shift_reg_i ;
	reg [383:0] tmp_reg_r ;
	reg [383:0] tmp_reg_i ;
	reg [5:0] counter_16,next_counter_16;
	reg valid,next_valid;

	assign dout_r    = shift_reg_r[383:360];
	assign dout_i    = shift_reg_i[383:360];

	always@(posedge clk or posedge reset)begin
		if(reset)begin
			shift_reg_r <= 0;
			shift_reg_i <= 0;
			counter_16  <= 0;
			valid       <= 0;
		end
		else 
		if (in_valid)begin
			counter_16       <= next_counter_16;
			shift_reg_r      <= (tmp_reg_r<<24) + din_r;
			shift_reg_i      <= (tmp_reg_i<<24) + din_i;
			valid            <= in_valid;
		end
		else if (valid)begin
			counter_16       <= next_counter_16;
			shift_reg_r      <= (tmp_reg_r<<24) + din_r;
			shift_reg_i      <= (tmp_reg_i<<24) + din_i;
			valid            <= next_valid;
		end
	end
	
	
	always@(*)begin
		next_counter_16 = counter_16 + 5'd1;
		tmp_reg_r = shift_reg_r;
		tmp_reg_i = shift_reg_i;
		next_valid = valid;
	end
	

endmodule
