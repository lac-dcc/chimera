module number_display (select,out1, out2, out3);
input [1:0]select;
output [6:0]out1;
output [6:0]out2;
output [6:0]out3;
reg [6:0]out1;
reg [6:0]out2;
reg [6:0]out3;
always @ (select)
begin 
	case (select)
	2'b00:begin
		out1 = 7'b1000000;
		out2 = 7'b1111001;
		out3 = 7'b0100100;
	end
	2'b01:begin
		out1 = 7'b0000010;
		out2 = 7'b1111000;
		out3 = 7'b0000000;
	end
	2'b10:begin
		out1 = 7'b0110000;
		out2 = 7'b0100100;
		out3 = 7'b1111001;
	end
	2'b11:begin
		out1 = 7'b0000110;
		out2 = 7'b0001000;
		out3 = 7'b0001000;
	end
	endcase
end
endmodule