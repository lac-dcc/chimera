module traffic_light(clk,rst,out,dot_row,dot_col);
	input clk,rst;
	output reg [6:0] out;
	output reg [7:0] dot_row,dot_col;
	
	reg [31:0] clk_count;
	reg [31:0] clk_count_2;
	reg [1:0] cur_state,next_state;
	reg [3:0] counter;
	reg [2:0] row_count;
	reg clk_div;
	
	parameter [1:0] GREEN = 2'b00;
	parameter [1:0] RED = 2'b01;
	parameter [1:0] YELLOW = 2'b10;
	
	always@(posedge clk ) begin
		if (~rst) begin
			clk_count <= 32'b0;
			cur_state <= GREEN;
			counter <= 4'b1;
			clk_div <= 1'b0;
			clk_count_2 <= 32'b0;
		end
		else begin
			if (clk_count_2 == 5000 ) begin
				clk_div <= ~clk_div;
				clk_count_2 <= 32'b0;
			end
			else begin
				clk_count_2 <= clk_count_2 + 32'b1;
			end
		
			if (clk_count == 50000000 ) begin
				clk_count <= 32'b0; 
				cur_state <= next_state;
				if ( next_state != cur_state)
					counter <= 4'b1;
				else
					counter <= counter + 4'b1;
			end
			else 
				clk_count <= clk_count + 32'b1;
		end
	end
	
	
	
	always@(*) begin
		case (cur_state)
			GREEN : begin
				if ( counter == 15 ) // 15
					next_state = YELLOW;
				else
					next_state = GREEN;
			end
			YELLOW : begin
				if ( counter == 5 ) // 3
					next_state = RED;
				else
					next_state = YELLOW;
			end
			default : begin
				if ( counter == 10 ) // 8
					next_state = GREEN;
				else
					next_state = RED;
			end
		endcase
	end

	
	always@ (posedge clk_div or negedge rst ) begin
		if (~rst) begin
			dot_row <= 8'b0;
			dot_col <= 8'b0;
			row_count <= 0;
		end
		else begin
		   row_count <= row_count + 1;
			if ( cur_state == GREEN) begin
				case (row_count)
					3'd0: dot_row <= 8'b01111111;
					3'd1: dot_row <= 8'b10111111;
					3'd2: dot_row <= 8'b11011111;
					3'd3: dot_row <= 8'b11101111;
					3'd4: dot_row <= 8'b11110111;
					3'd5: dot_row <= 8'b11111011;
					3'd6: dot_row <= 8'b11111101;
					3'd7: dot_row <= 8'b11111110;
				endcase
				case (row_count)
					3'd0: dot_col <= 8'b00001100;
					3'd1: dot_col <= 8'b00001100;
					3'd2: dot_col <= 8'b00011001;
					3'd3: dot_col <= 8'b01111110;
					3'd4: dot_col <= 8'b10011000;
					3'd5: dot_col <= 8'b00011000;
					3'd6: dot_col <= 8'b00101000;
					3'd7: dot_col <= 8'b01001000;
				endcase
			end
			else if (cur_state == RED) begin
				case (row_count)
					3'd0: dot_row <= 8'b01111111;
					3'd1: dot_row <= 8'b10111111;
					3'd2: dot_row <= 8'b11011111;
					3'd3: dot_row <= 8'b11101111;
					3'd4: dot_row <= 8'b11110111;
					3'd5: dot_row <= 8'b11111011;
					3'd6: dot_row <= 8'b11111101;
					3'd7: dot_row <= 8'b11111110;
				endcase
				case (row_count)
					3'd0: dot_col <= 8'b00011000;
					3'd1: dot_col <= 8'b00011000;
					3'd2: dot_col <= 8'b00111100;
					3'd3: dot_col <= 8'b00111100;
					3'd4: dot_col <= 8'b01011010;
					3'd5: dot_col <= 8'b00011000;
					3'd6: dot_col <= 8'b00011000;
					3'd7: dot_col <= 8'b00100100;
				endcase
			end
			else if (cur_state == YELLOW) begin
				case (row_count)
					3'd0: dot_row <= 8'b01111111;
					3'd1: dot_row <= 8'b10111111;
					3'd2: dot_row <= 8'b11011111;
					3'd3: dot_row <= 8'b11101111;
					3'd4: dot_row <= 8'b11110111;
					3'd5: dot_row <= 8'b11111011;
					3'd6: dot_row <= 8'b11111101;
					3'd7: dot_row <= 8'b11111110;
				endcase
				case (row_count)
					3'd0: dot_col <= 8'b00000000;
					3'd1: dot_col <= 8'b00100100;
					3'd2: dot_col <= 8'b00111100;
					3'd3: dot_col <= 8'b10111101;
					3'd4: dot_col <= 8'b11111111;
					3'd5: dot_col <= 8'b00111100;
					3'd6: dot_col <= 8'b00111100;
					3'd7: dot_col <= 8'b00000000;
				endcase
			end
		end
	end
	always@(*) begin
		case (counter)
			0 : begin
				out = 7'b0000001;
			end
			1 : begin
				out = 7'b1001111;
			end
			2 : begin
				out = 7'b0010010;
			end
			3 : begin
				out = 7'b0000110;
			end
			4 : begin
				out = 7'b1001100;
			end
			5 : begin
				out = 7'b0100100;
			end
			6 : begin
				out = 7'b0100000;
			end
			7 : begin
				out = 7'b0001111;
			end
			8 : begin
				out = 7'b0000000;
			end
			9 : begin
				out = 7'b0000100;
			end
			10 : begin
				out = 7'b0001000;
			end
			11 : begin
				out = 7'b1100000;
			end
			12 : begin
				out = 7'b0110001;
			end
			13 : begin
				out = 7'b1000010;
			end
			14 : begin
				out = 7'b0110000;
			end
			15 : begin
				out = 7'b0111000;
			end
		endcase
	end
endmodule