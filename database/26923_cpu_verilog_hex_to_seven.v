// This program was cloned from: https://github.com/tioluwanimofe/cpu_verilog
// License: MIT License

module hex_to_seven (hex, eight_out);

input [3:0] hex;
output [7:0] eight_out;
reg [6:0] seven;


always @(hex)
begin
	case (hex)
		0 : seven = 7'b0111111;
		1 : seven = 7'b0000110;
		2 : seven = 7'b1011011;
		3 : seven = 7'b1001111;
		4 : seven = 7'b1100110;
		5 : seven = 7'b1101101;
		6 : seven = 7'b1111101;
		7 : seven = 7'b0000111;
		8 : seven = 7'b1111111;
		9 : seven = 7'b1101111;
		10 : seven = 7'b1110111;
		11 : seven = 7'b1111100;
		12 : seven = 7'b0111001;
		13 : seven = 7'b1011110;
		14 : seven = 7'b1111001;
		15 : seven = 7'b1110001;
		default : seven = 7'b0000000;
	endcase
end

// Note : Upper-most bit (8th bit) of seven segment display is the period "." and is just being set to 0 (off) in all cases
//    Assigning eight_out as inverted value, since 7-segment display on the FPGA board has inverted logic drivers
assign eight_out = ~{1'b0, seven};

endmodule	
