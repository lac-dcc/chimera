// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 230711

`default_nettype none
module Decoder7seg #(
	parameter COMMON_CATHODE = 1	// 1 - common cathode, 0 - common anode
)(
	input wire		  Enable_i,		// 1 - on, 0 - off
	input wire	[3:0] Data_i,		// 4-bit input
	output wire	[6:0] Segments_o	// Connect to segment LEDs
);
	
	reg		[6:0] Temp;
	
	always @(*) begin
		if(Enable_i)
			case(Data_i)		   // gfedcba
				4'h0:		Temp = 7'b0111111;
				4'h1:		Temp = 7'b0000110;
				4'h2:		Temp = 7'b1011011;
				4'h3:		Temp = 7'b1001111;
				4'h4:		Temp = 7'b1100110;
				4'h5:		Temp = 7'b1101101;
				4'h6:		Temp = 7'b1111101;
				4'h7:		Temp = 7'b0000111;
				4'h8:		Temp = 7'b1111111;
				4'h9:		Temp = 7'b1101111;
				4'hA:		Temp = 7'b1110111;
				4'hB:		Temp = 7'b1111100;
				4'hC:		Temp = 7'b0111001;
				4'hD:		Temp = 7'b1011110;
				4'hE:		Temp = 7'b1111001;
				4'hF:		Temp = 7'b1110001;
				default:	Temp = 7'b0000000;
			endcase
		else
			Temp = 0;
	end
	
	// If the display has common anode then invert segment bits
	assign Segments_o = COMMON_CATHODE ? Temp : ~Temp;
	
endmodule
`default_nettype wire
