// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
P1.1 4-bit COMPARATOR DATAFLOW2
************************************************/

module comparator_df2(Eq,Gt,Sm,A,B);

	input [3:0]A,B;
	output Eq,Gt,Sm;

assign Eq= (A==B);	//A==B
assign Gt= (A>B);	//A>B
assign Sm= (A<B);	//A<B

endmodule