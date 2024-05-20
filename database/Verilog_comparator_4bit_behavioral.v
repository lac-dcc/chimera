// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
P1.1 4-bit COMPARATOR BEHAVIORAL
************************************************/

module comparator_bh(Eq,Gt,Sm,A,B);

	input [3:0]A,B;
	output reg Eq,Gt,Sm;

	always@(*) begin
		Eq= (A==B);	//A==B
		Gt= (A>B);	//A>B
		Sm= (A<B);	//A<B
	end // always@(*)

endmodule