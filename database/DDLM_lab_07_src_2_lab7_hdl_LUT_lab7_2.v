module lab7_2
(
	input [3:0] x,
	output reg y
);

	always @* 
	begin
		case(x)
			 'b0000: y<= 0;
			 'b0001: y<= 0;
			 'b0010: y<= 0;
			 'b0011: y<= 0;
 			 'b0100: y<= 0;
			 'b0101: y<= 0;
			 'b0110: y<= 0;
			 'b0111: y<= 0;
			 'b1000: y<= 0;
			 'b1001: y<= 0;
			 'b1010: y<= 0;
			 'b1011: y<= 0;
 			 'b1100: y<= 0;
			 'b1101: y<= 0;
			 'b1110: y<= 0;
			 'b1111: y<= 1;
		endcase
	end

endmodule
