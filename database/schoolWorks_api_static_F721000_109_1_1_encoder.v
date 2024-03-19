module encoder (in,out,valid);
input [7:0]in;
output valid;
output [2:0]out;
reg [2:0]out;
reg valid;
always @ (in)
begin 
	case (in)
		8'b00000001: begin
			out = 3'b000;
			valid = 1;
		end
		8'b00000010: begin
			out = 3'b001;
			valid = 1;
		end
		8'b00000100: begin
			out = 3'b010;
			valid = 1;
		end
		8'b00001000: begin
			out = 3'b011;
			valid = 1;
		end
		8'b00010000: begin
			out = 3'b100;
			valid = 1;
		end
		8'b00100000: begin
			out = 3'b101;
			valid = 1;
		end
		8'b01000000: begin
			out = 3'b110;
			valid = 1;
		end
		8'b10000000: begin
			out = 3'b111;
			valid = 1;
		end
		default: begin 
			out = 3'b000;
			valid = 0;
		end
	endcase
end
endmodule