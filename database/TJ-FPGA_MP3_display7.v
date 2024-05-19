// This program was cloned from: https://github.com/DinoMax00/TJ-FPGA_MP3
// License: MIT License

//----------------- time show module ----------------------
//------------------ author : Dino ------------------------
module display7(
	input CLK,
	input [15: 0] DATA,
	output reg [6: 0] SEG,
	output reg [7: 0] SHIFT,
	output reg DOT
);
	wire clk_div;
	Divider #(.Time(200000)) CLKDIV(CLK, clk_div);
	initial SHIFT = 8'b01111111;
	reg [31: 0] _DATA;
	
	reg [4: 0] cnt;
	always @ (posedge clk_div) begin 
		SHIFT <= {SHIFT[6:0], SHIFT[7]};
		cnt <= cnt+4;
		// flash the DOT
		if(SHIFT[1]==0) DOT <= 0;
		else DOT <= 1;
		// time format 
		_DATA[3: 0] <= DATA%10;
		_DATA[7: 4] <= (DATA/10)%6;
		_DATA[11: 8] <= (DATA/60)%10;
		_DATA[15: 12] <= DATA/600;
		if(DATA%2) _DATA[31: 16] <= 16'b1101111011011110;
		else  _DATA[31: 16] = 16'b1110110111101101;
		case ({_DATA[cnt+3], _DATA[cnt+2], _DATA[cnt+1], _DATA[cnt]}) 
			4'b0000: begin
                SEG<=7'b1000000;
            end
            4'b0001: begin
                SEG<=7'b1111001;
            end
            4'b0010: begin
                SEG<=7'b0100100;
            end
            4'b0011: begin
                SEG<=7'b0110000;
            end
            4'b0100: begin
                SEG<=7'b0011001;
            end
            4'b0101: begin
                SEG<=7'b0010010;
            end
            4'b0110: begin
                SEG<=7'b0000010;
            end
            4'b0111: begin
                SEG<=7'b1111000;
            end
            4'b1000: begin
                SEG<=7'b0000000;
            end
            4'b1001: begin
                SEG<=7'b0010000;
            end
			4'b1101: begin 
				SEG<=7'b0101011;
			end
			4'b1110: begin 
				SEG<=7'b0011101;
			end
            default: begin
                SEG<=7'b1111111;
            end
		endcase
	end
endmodule
