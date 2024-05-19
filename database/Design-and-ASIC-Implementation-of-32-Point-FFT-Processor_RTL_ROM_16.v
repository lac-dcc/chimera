// This program was cloned from: https://github.com/abdelazeem201/Design-and-ASIC-Implementation-of-32-Point-FFT-Processor
// License: MIT License

// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Author: Ahmed Abdelazeem
// Github: https://github.com/abdelazeem201
// Email: ahmed_abdelazeem@outlook.com
// Description: ROM_16 module
// Dependencies: 
// Since: 2021-12-20 1:19:2
// ********************************************************************
// Module Function
module ROM_16(
		input wire clk,
		input wire in_valid,
		input wire reset,
		output reg [23:0] w_r,
		output reg [23:0] w_i,
		output reg[1:0] state
	);

	reg valid,next_valid;
	reg [5:0] count,next_count;

	always@(posedge clk or posedge reset)begin
		if(reset)begin
			count <= 0;
			valid <= 0;
		end
		else if(in_valid)
		begin
			count <= next_count;
			valid <= in_valid;
		end
		else if (valid)
		begin
			count <= next_count;
			valid <= next_valid;
		end
	end
	
		always @(*) begin
		if(in_valid || valid)next_count = count + 1;
		else next_count = count;
		
		if (count<6'd16) 
			state = 2'd0;
		else if (count >= 6'd16 && count < 6'd32)
			state = 2'd1;
		else if (count >= 6'd32 && count < 6'd48)
			state = 2'd2;
		else state = 2'd3;
		case(count)
		6'd32: begin
			w_r = 24'b 00000000_00000001_00000000;
			w_i = 24'b 00000000_00000000_00000000;
			next_valid = 1'b1;
			end
		6'd33: begin
			w_r = 24'b 00000000_00000000_11111011;
			w_i = 24'b 11111111_11111111_11001110;
			next_valid = 1'b1;
			end
		6'd34: begin
			w_r = 24'b 00000000_00000000_11101101;
			w_i = 24'b 11111111_11111111_10011110;
			next_valid = 1'b1;
			end
		6'd35: begin
			w_r = 24'b 00000000_00000000_11010101;
			w_i = 24'b 11111111_11111111_01110010;
			next_valid = 1'b1;
			end
		6'd36: begin
			w_r = 24'b 00000000_00000000_10110101;
			w_i = 24'b 11111111_11111111_01001011;
			next_valid = 1'b1;
			end
		6'd37: begin
			w_r = 24'b 00000000_00000000_10001110;
			w_i = 24'b 11111111_11111111_00101011;
			next_valid = 1'b1;
			end
		6'd38: begin
			w_r = 24'b 00000000_00000000_01100010;
			w_i = 24'b 11111111_11111111_00010011;
			next_valid = 1'b1;
			end
		6'd39: begin
			w_r = 24'b 00000000_00000000_00110010;
			w_i = 24'b 11111111_11111111_00000101;
			next_valid = 1'b1;
			end
		6'd40: begin
			w_r = 24'b 00000000_00000000_00000000;
			w_i = 24'b 11111111_11111111_00000000;
			next_valid = 1'b1;
			end
		6'd41: begin
			w_r = 24'b 11111111_11111111_11001110;
			w_i = 24'b 11111111_11111111_00000101;
			next_valid = 1'b1;
			end
		6'd42: begin
			w_r = 24'b 11111111_11111111_10011110;
			w_i = 24'b 11111111_11111111_00010011;
			next_valid = 1'b1;
			end
		6'd43: begin
			w_r = 24'b 11111111_11111111_01110010;
			w_i = 24'b 11111111_11111111_00101011;
			next_valid = 1'b1;
			end
		6'd44: begin
			w_r = 24'b 11111111_11111111_01001011;
			w_i = 24'b 11111111_11111111_01001011;
			next_valid = 1'b1;
			end
		6'd45: begin
			w_r = 24'b 11111111_11111111_00101011;
			w_i = 24'b 11111111_11111111_01110010;
			next_valid = 1'b1;
			end
		6'd46: begin
			w_r = 24'b 11111111_11111111_00010011;
			w_i = 24'b 11111111_11111111_10011110;
			next_valid = 1'b1;
			end
		6'd47: begin
			w_r = 24'b 11111111_11111111_00000101;
			w_i = 24'b 11111111_11111111_11001110;
			next_valid = 1'b0;
			end
		default: begin
			w_r = 24'b 00000000_00000001_00000000;
			w_i = 24'b 00000000_00000000_00000000;
			next_valid = 1'b1;
			end
		endcase
	end
endmodule
