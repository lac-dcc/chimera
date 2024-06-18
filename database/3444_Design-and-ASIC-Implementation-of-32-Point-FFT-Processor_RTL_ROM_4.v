// This program was cloned from: https://github.com/abdelazeem201/Design-and-ASIC-Implementation-of-32-Point-FFT-Processor
// License: MIT License

// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Author: Ahmed Abdelazeem
// Github: https://github.com/abdelazeem201
// Email: ahmed_abdelazeem@outlook.com
// Description: ROM_4 module
// Dependencies: 
// Since: 2021-12-20 07:10:20
// ********************************************************************
// Module Function
module ROM_4(
		input wire clk,
		input wire in_valid,
		input wire reset,
		output reg [23:0] w_r,
		output reg [23:0] w_i,
		output reg[1:0] state
	);

	reg valid,next_valid;
	reg [5:0] count,next_count;
	reg [2:0] s_count,next_s_count;

	always@(posedge clk or posedge reset)begin
		if(reset)begin
			count <= 0;
			s_count <= 0;
		end
		else begin
			count <= next_count;
			s_count <= next_s_count;
		end
	end
	
		always @(*) begin
		if(in_valid || valid)
		begin 
			next_count = count + 1;
			next_s_count = s_count;
		end
		else begin
			next_count = count;
			next_s_count = s_count;  
		end

		if (count<6'd4) 
			state = 2'd0;
		else if (count >= 6'd4 && s_count < 3'd4)begin
			state = 2'd1;
			next_s_count = s_count + 1;
		end
		else if (count >= 6'd4 && s_count >= 3'd4)begin
			state = 2'd2;
			next_s_count = s_count + 1;
		end
		case(s_count)
		3'd4: begin
			w_r = 24'b 00000000_00000001_00000000;
			w_i = 24'b 00000000_00000000_00000000;
			end
		3'd5: begin
			w_r = 24'b 00000000_00000000_10110101;
			w_i = 24'b 11111111_11111111_01001011;
			end
		3'd6: begin
			w_r = 24'b 00000000_00000000_00000000;
			w_i = 24'b 11111111_11111111_00000000;
			end
		3'd7: begin
			w_r = 24'b 11111111_11111111_01001011;
			w_i = 24'b 11111111_11111111_01001011;
			end
		default: begin
			w_r = 24'b 00000000_00000001_00000000;
			w_i = 24'b 00000000_00000000_00000000;
			end
		endcase
	end
endmodule
