// This program was cloned from: https://github.com/scluconn/DA_PUF_Library
// License: MIT License


module xor_vec #(parameter X=2) (x,y);

	input [X-1:0] x;
	output y;
	
	assign y = ^x;
	
endmodule
