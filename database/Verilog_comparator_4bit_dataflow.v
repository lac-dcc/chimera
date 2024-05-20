// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
P1.1 4-bit COMPARATOR DATAFLOW1
************************************************/

module comparator_df1(Eq,Gt,Sm,A,B);

	input [3:0]A,B;
	output Eq,Gt,Sm;

assign Eq= &(A ~^ B);	//A==B
assign Gt= (A[3]& ~B[3]) | ((A[3]~^B[3]) & (A[2]& ~B[2])) | ((A[3]~^B[3]) & (A[2]~^B[2]) & (A[1]& ~B[1])) | ((A[3]~^B[3]) & (A[2]~^B[2]) & (A[1]~^B[1]) & (A[0]& ~B[0]));	//A>B
assign Sm= ~(Gt|Eq);

endmodule