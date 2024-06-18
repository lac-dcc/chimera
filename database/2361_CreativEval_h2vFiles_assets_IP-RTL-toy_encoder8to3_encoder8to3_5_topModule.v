// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

//Behavioral description of Encoder with priority
//See example 9-6
module top(I,Y,en);
input [7:0]I;
input en;
output [2:0]Y;
reg [2:0]Y;
always @(I)
begin
	casex(I)
	8'b00000001 : Y=3'b000;
	8'b0000001x : Y=3'b001;
	8'b000001xx : Y=3'b010;
	8'b00001xxx : Y=3'b011;
	8'b0001xxxx : Y=3'b100;
	8'b001xxxxx : Y=3'b101;
	8'b01xxxxxx : Y=3'b110;
	8'b1xxxxxxx : Y=3'b111;
	endcase
end	
endmodule