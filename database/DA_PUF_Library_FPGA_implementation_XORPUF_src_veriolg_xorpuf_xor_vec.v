
module xor_vec #(parameter X=2) (x,y);

	input [X-1:0] x;
	output y;
	
	assign y = ^x;
	
endmodule
