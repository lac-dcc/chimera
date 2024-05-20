// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 230703

`default_nettype none
module ROM(
	input wire Clock,
	input wire ReadEnable_i,
	input wire [3:0] Address_i,
	output reg [7:0] Data_o
);
	
	always @(posedge Clock) begin
		if(ReadEnable_i) begin
			case(Address_i)
				4'h0:		Data_o <= 8'h00;
				4'h1:		Data_o <= 8'h10;
				4'h2:		Data_o <= 8'h02;
				4'h3:		Data_o <= 8'h30;
				4'h4:		Data_o <= 8'h04;
				4'h5:		Data_o <= 8'h55;
				4'h6:		Data_o <= 8'h60;
				4'h7:		Data_o <= 8'h07;
				4'h8:		Data_o <= 8'h88;
				4'h9:		Data_o <= 8'h90;
				4'hA:		Data_o <= 8'h0A;
				4'hB:		Data_o <= 8'hB0;
				4'hC:		Data_o <= 8'hCC;
				4'hD:		Data_o <= 8'h0D;
				4'hE:		Data_o <= 8'hE0;
				4'hF:		Data_o <= 8'hFF;
				default:	Data_o <= 8'hXX;
			endcase
		end
	end
	
endmodule
`default_nettype wire
