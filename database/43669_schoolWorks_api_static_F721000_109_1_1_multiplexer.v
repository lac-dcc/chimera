// This program was cloned from: https://github.com/Darkborderman/schoolWorks
// License: BSD 2-Clause "Simplified" License

module multiplexer (in,out);
input [3:0]in;
output [6:0]out;
reg [6:0]out;
always @(in)
begin 
	case (in)
	4'd0: out = 7'b1000000;
	4'd1: out = 7'b1111001;
	4'd2: out = 7'b0100100;
	4'd3: out = 7'b0010010;
	4'd4: out = 7'b1111000;
	4'd5: out = 7'b0010000;
	4'd6: out = 7'b0100001;
	4'd7: out = 7'b0001110;
	endcase
end
endmodule