// This program was cloned from: https://github.com/Darkborderman/schoolWorks
// License: BSD 2-Clause "Simplified" License

module lab11(clk,rst,keypad_row,keypad_col,dot_row,dot_col,seven_seg);
	input clk,rst;
	output [3:0] keypad_row;
	input [3:0] keypad_col;
	output reg [7:0] dot_row,dot_col;
	output reg [6:0] seven_seg;

	reg [31:0] cnt_div,cnt_dot;
	reg [7:0] dot_col_buf[0:7];
	wire [4:0] keypad_buf;
	reg [2:0] row_count;
	wire clk_div,clk_dot;
	
	
	clk_divi myclk (clk,rst,32'd6250000, clk_div); // for button
	clk_divi myclk2 (clk,rst,32'd10000, clk_dot); // for dot matrix
	
	checkkeypad keypad_detect(clk,rst,keypad_row,keypad_col,keypad_buf);
	
	always@ (posedge clk_dot or negedge rst)
	begin
		if (~rst)
		begin
			dot_row <= 8'd0;
			dot_col <= 8'd0;
			row_count <= 3'd0;
		end
		else
		begin
		    row_count <= row_count + 1;
		    dot_col <= dot_col_buf[row_count];
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
		end
	end
	
	always@(posedge clk_div or negedge rst)
	begin
		if (~rst)
		begin
			dot_col_buf[0] <= 8'd0;
			dot_col_buf[1] <= 8'd0;
			dot_col_buf[2] <= 8'd0;
			dot_col_buf[3] <= 8'd0;
			dot_col_buf[4] <= 8'd0;
			dot_col_buf[5] <= 8'd0;
			dot_col_buf[6] <= 8'd0;
			dot_col_buf[7] <= 8'd0;
		end
		else
		begin
			case (keypad_buf)
			5'h0:
			begin
				dot_col_buf[0] <= 8'b00000000 | dot_col_buf[0];
				dot_col_buf[1] <= 8'b00000000 | dot_col_buf[1];
				dot_col_buf[2] <= 8'b00000000 | dot_col_buf[2];
				dot_col_buf[3] <= 8'b00000000 | dot_col_buf[3];
				dot_col_buf[4] <= 8'b00000000 | dot_col_buf[4];
				dot_col_buf[5] <= 8'b00000000 | dot_col_buf[5];
				dot_col_buf[6] <= 8'b11000000 | dot_col_buf[6];
				dot_col_buf[7] <= 8'b11000000 | dot_col_buf[7];
			end
			5'h1:
			begin
				dot_col_buf[0] <= 8'b00000000 | dot_col_buf[0];
				dot_col_buf[1] <= 8'b00000000	| dot_col_buf[1];
				dot_col_buf[2] <= 8'b00000000	| dot_col_buf[2];
				dot_col_buf[3] <= 8'b00000000	| dot_col_buf[3];
				dot_col_buf[4] <= 8'b00000000	| dot_col_buf[4];
				dot_col_buf[5] <= 8'b00000000	| dot_col_buf[5];
				dot_col_buf[6] <= 8'b00110000	| dot_col_buf[6];
				dot_col_buf[7] <= 8'b00110000	| dot_col_buf[7];
			end
			5'h2:
			begin
				dot_col_buf[0] <= 8'b00000000 | dot_col_buf[0];
				dot_col_buf[1] <= 8'b00000000 | dot_col_buf[1];
				dot_col_buf[2] <= 8'b00000000 | dot_col_buf[2];
				dot_col_buf[3] <= 8'b00000000 | dot_col_buf[3];
				dot_col_buf[4] <= 8'b00110000 | dot_col_buf[4];
				dot_col_buf[5] <= 8'b00110000 | dot_col_buf[5];
				dot_col_buf[6] <= 8'b00000000 | dot_col_buf[6];
				dot_col_buf[7] <= 8'b00000000 | dot_col_buf[7];
			end
			5'h3:
			begin
				dot_col_buf[0] <= 8'b00000000 | dot_col_buf[0];
				dot_col_buf[1] <= 8'b00000000 | dot_col_buf[1];
				dot_col_buf[2] <= 8'b00110000 | dot_col_buf[2];
				dot_col_buf[3] <= 8'b00110000 | dot_col_buf[3];
				dot_col_buf[4] <= 8'b00000000 | dot_col_buf[4];
				dot_col_buf[5] <= 8'b00000000 | dot_col_buf[5];
				dot_col_buf[6] <= 8'b00000000 | dot_col_buf[6];
				dot_col_buf[7] <= 8'b00000000 | dot_col_buf[7];
			end
			5'h4:
			begin
				dot_col_buf[0] <= 8'b00000000 | dot_col_buf[0];
				dot_col_buf[1] <= 8'b00000000 | dot_col_buf[1];
				dot_col_buf[2] <= 8'b00000000 | dot_col_buf[2];
				dot_col_buf[3] <= 8'b00000000 | dot_col_buf[3];
				dot_col_buf[4] <= 8'b00000000 | dot_col_buf[4];
				dot_col_buf[5] <= 8'b00000000 | dot_col_buf[5];
				dot_col_buf[6] <= 8'b00001100 | dot_col_buf[6];
				dot_col_buf[7] <= 8'b00001100 | dot_col_buf[7];
			end
			5'h5:
			begin
				dot_col_buf[0] <= 8'b00000000 | dot_col_buf[0];
				dot_col_buf[1] <= 8'b00000000 | dot_col_buf[1];
				dot_col_buf[2] <= 8'b00000000 | dot_col_buf[2];
				dot_col_buf[3] <= 8'b00000000 | dot_col_buf[3];
				dot_col_buf[4] <= 8'b00001100 | dot_col_buf[4];
				dot_col_buf[5] <= 8'b00001100 | dot_col_buf[5];
				dot_col_buf[6] <= 8'b00000000 | dot_col_buf[6];
				dot_col_buf[7] <= 8'b00000000 | dot_col_buf[7];
			end
			5'h6:
			begin
				dot_col_buf[0] <= 8'b00000000 | dot_col_buf[0];
				dot_col_buf[1] <= 8'b00000000 | dot_col_buf[1];
				dot_col_buf[2] <= 8'b00001100 | dot_col_buf[2];
				dot_col_buf[3] <= 8'b00001100 | dot_col_buf[3];
				dot_col_buf[4] <= 8'b00000000 | dot_col_buf[4];
				dot_col_buf[5] <= 8'b00000000 | dot_col_buf[5];
				dot_col_buf[6] <= 8'b00000000 | dot_col_buf[6];
				dot_col_buf[7] <= 8'b00000000 | dot_col_buf[7];
			end
			5'h7:
			begin
				dot_col_buf[0] <= 8'b00000000 | dot_col_buf[0];
				dot_col_buf[1] <= 8'b00000000 | dot_col_buf[1];
				dot_col_buf[2] <= 8'b00000000 | dot_col_buf[2];
				dot_col_buf[3] <= 8'b00000000 | dot_col_buf[3];
				dot_col_buf[4] <= 8'b00000000 | dot_col_buf[4];
				dot_col_buf[5] <= 8'b00000000 | dot_col_buf[5];
				dot_col_buf[6] <= 8'b00000011 | dot_col_buf[6];
				dot_col_buf[7] <= 8'b00000011 | dot_col_buf[7];
			end
			5'h8:
			begin
				dot_col_buf[0] <= 8'b00000000 | dot_col_buf[0];
				dot_col_buf[1] <= 8'b00000000 | dot_col_buf[1];
				dot_col_buf[2] <= 8'b00000000 | dot_col_buf[2];
				dot_col_buf[3] <= 8'b00000000 | dot_col_buf[3];
				dot_col_buf[4] <= 8'b00000011 | dot_col_buf[4];
				dot_col_buf[5] <= 8'b00000011 | dot_col_buf[5];
				dot_col_buf[6] <= 8'b00000000 | dot_col_buf[6];
				dot_col_buf[7] <= 8'b00000000 | dot_col_buf[7];
			end
			5'h9:
			begin
				dot_col_buf[0] <= 8'b00000000 | dot_col_buf[0];
				dot_col_buf[1] <= 8'b00000000 | dot_col_buf[1];
				dot_col_buf[2] <= 8'b00000011 | dot_col_buf[2];
				dot_col_buf[3] <= 8'b00000011 | dot_col_buf[3];
				dot_col_buf[4] <= 8'b00000000 | dot_col_buf[4];
				dot_col_buf[5] <= 8'b00000000 | dot_col_buf[5];
				dot_col_buf[6] <= 8'b00000000 | dot_col_buf[6];
				dot_col_buf[7] <= 8'b00000000 | dot_col_buf[7];
			end
			5'ha:
			begin
				dot_col_buf[0] <= 8'b00000000| dot_col_buf[0];
				dot_col_buf[1] <= 8'b00000000| dot_col_buf[1];
				dot_col_buf[2] <= 8'b00000000| dot_col_buf[2];
				dot_col_buf[3] <= 8'b00000000| dot_col_buf[3];
				dot_col_buf[4] <= 8'b11000000| dot_col_buf[4];
				dot_col_buf[5] <= 8'b11000000| dot_col_buf[5];
				dot_col_buf[6] <= 8'b00000000| dot_col_buf[6];
				dot_col_buf[7] <= 8'b00000000| dot_col_buf[7];
			end
			5'hb:
			begin
				dot_col_buf[0] <= 8'b00000000| dot_col_buf[0];
				dot_col_buf[1] <= 8'b00000000| dot_col_buf[1];
				dot_col_buf[2] <= 8'b11000000| dot_col_buf[2];
				dot_col_buf[3] <= 8'b11000000| dot_col_buf[3];
				dot_col_buf[4] <= 8'b00000000| dot_col_buf[4];
				dot_col_buf[5] <= 8'b00000000| dot_col_buf[5];
				dot_col_buf[6] <= 8'b00000000| dot_col_buf[6];
				dot_col_buf[7] <= 8'b00000000| dot_col_buf[7];
			end
			5'hc:
			begin
				dot_col_buf[0] <= 8'b00000011| dot_col_buf[0];
				dot_col_buf[1] <= 8'b00000011| dot_col_buf[1];
				dot_col_buf[2] <= 8'b00000000| dot_col_buf[2];
				dot_col_buf[3] <= 8'b00000000| dot_col_buf[3];
				dot_col_buf[4] <= 8'b00000000| dot_col_buf[4];
				dot_col_buf[5] <= 8'b00000000| dot_col_buf[5];
				dot_col_buf[6] <= 8'b00000000| dot_col_buf[6];
				dot_col_buf[7] <= 8'b00000000| dot_col_buf[7];
			end
			5'hd:
			begin
				dot_col_buf[0] <= 8'b00001100| dot_col_buf[0];
				dot_col_buf[1] <= 8'b00001100| dot_col_buf[1];
				dot_col_buf[2] <= 8'b00000000| dot_col_buf[2];
				dot_col_buf[3] <= 8'b00000000| dot_col_buf[3];
				dot_col_buf[4] <= 8'b00000000| dot_col_buf[4];
				dot_col_buf[5] <= 8'b00000000| dot_col_buf[5];
				dot_col_buf[6] <= 8'b00000000| dot_col_buf[6];
				dot_col_buf[7] <= 8'b00000000| dot_col_buf[7];
			end
			5'he:
			begin
				dot_col_buf[0] <= 8'b00110000| dot_col_buf[0];
				dot_col_buf[1] <= 8'b00110000| dot_col_buf[1];
				dot_col_buf[2] <= 8'b00000000| dot_col_buf[2];
				dot_col_buf[3] <= 8'b00000000| dot_col_buf[3];
				dot_col_buf[4] <= 8'b00000000| dot_col_buf[4];
				dot_col_buf[5] <= 8'b00000000| dot_col_buf[5];
				dot_col_buf[6] <= 8'b00000000| dot_col_buf[6];
				dot_col_buf[7] <= 8'b00000000| dot_col_buf[7];
			end
			5'hf:
			begin
				dot_col_buf[0] <= 8'b11000000 | dot_col_buf[0];
				dot_col_buf[1] <= 8'b11000000 | dot_col_buf[1];
				dot_col_buf[2] <= 8'b00000000 | dot_col_buf[2];
				dot_col_buf[3] <= 8'b00000000 | dot_col_buf[3];
				dot_col_buf[4] <= 8'b00000000 | dot_col_buf[4];
				dot_col_buf[5] <= 8'b00000000 | dot_col_buf[5];
				dot_col_buf[6] <= 8'b00000000 | dot_col_buf[6];
				dot_col_buf[7] <= 8'b00000000 | dot_col_buf[7];
			end
			default
			begin
				dot_col_buf[0] <= 8'b00000000 | dot_col_buf[0];
				dot_col_buf[1] <= 8'b00000000 | dot_col_buf[1];
				dot_col_buf[2] <= 8'b00000000 | dot_col_buf[2];
				dot_col_buf[3] <= 8'b00000000 | dot_col_buf[3];
				dot_col_buf[4] <= 8'b00000000 | dot_col_buf[4];
				dot_col_buf[5] <= 8'b00000000 | dot_col_buf[5];
				dot_col_buf[6] <= 8'b00000000 | dot_col_buf[6];
				dot_col_buf[7] <= 8'b00000000 | dot_col_buf[7];
			end
			endcase
		end
	end
	
	always@(*)
	begin
		case(keypad_buf)
		5'h0:seven_seg = 7'b1000000;
		5'h1:seven_seg = 7'b1111001;
		5'h2:seven_seg = 7'b0100100;
		5'h3:seven_seg = 7'b0110000;
		5'h4:seven_seg = 7'b0011001;
		5'h5:seven_seg = 7'b0010010;
		5'h6:seven_seg = 7'b0000010;
		5'h7:seven_seg = 7'b1111000;
		5'h8:seven_seg = 7'b0000000;
		5'h9:seven_seg = 7'b0010000;
		5'ha:seven_seg = 7'b0100000;
		5'hb:seven_seg = 7'b0000011;
		5'hc:seven_seg = 7'b1000110;
		5'hd:seven_seg = 7'b0100001;
		5'he:seven_seg = 7'b0000100;
		5'hf:seven_seg = 7'b0001110;
		default: seven_seg = 7'b1000000;
		endcase
	end
endmodule

module checkkeypad (clk,rst,keypadRow,keypadCol,keypadBuf);  // output keypad buffer
	input clk,rst;
	input [3:0]keypadCol;
	output reg[3:0]keypadRow;
	output reg [4:0]keypadBuf;
	reg [31:0]keypadDelay;
	
	always @(posedge clk or negedge rst)
	begin 
		if (!rst)
		begin
			keypadRow <= 4'b1110;
			keypadBuf <= 5'b11111;
			keypadDelay <= 31'd0;
		end
		else
		begin
			if (keypadDelay == 32'd250000) 
			begin 
				keypadDelay <= 31'd0;
				case ({keypadRow, keypadCol})
					8'b1110_1110: keypadBuf <= 5'h7;
					8'b1110_1101: keypadBuf <= 5'h4;
					8'b1110_1011: keypadBuf <= 5'h1;
					8'b1110_0111: keypadBuf <= 5'h0;
					8'b1101_1110: keypadBuf <= 5'h8;
					8'b1101_1101: keypadBuf <= 5'h5;
					8'b1101_1011: keypadBuf <= 5'h2;
					8'b1101_0111: keypadBuf <= 5'ha;
					8'b1011_1110: keypadBuf <= 5'h9;
					8'b1011_1101: keypadBuf <= 5'h6;
					8'b1011_1011: keypadBuf <= 5'h3;
					8'b1011_0111: keypadBuf <= 5'hb;
					8'b0111_1110: keypadBuf <= 5'hc;
					8'b0111_1101: keypadBuf <= 5'hd;
					8'b0111_1011: keypadBuf <= 5'he;
					8'b0111_0111: keypadBuf <= 5'hf;
					default: keypadBuf <= keypadBuf;
				endcase
				case (keypadRow)
					4'b1110: keypadRow <= 4'b1101;
					4'b1101: keypadRow <= 4'b1011;
					4'b1011: keypadRow <= 4'b0111;
					4'b0111: keypadRow <= 4'b1110;
					default: keypadRow <= 4'b1110;
				endcase
			end
			else
				keypadDelay <= keypadDelay + 1'b1;
		end
	end
endmodule

module clk_divi (clk,rst,counter,div_clk);
	input clk,rst;
	input [31:0]counter;
	output div_clk;
	reg div_clk;
	reg [31:0]count;
	always @ (posedge clk)
	begin 
		if (!rst)
		begin 
		count <= 32'd0;
		div_clk <=1'b0;
		end
		else
		begin 
			if (count == counter)
			begin 
			count<=32'd0;
			div_clk <=~div_clk;
			end
			else
			begin 
				count <= count + 32'd1;
			end
		end
   end
endmodule
