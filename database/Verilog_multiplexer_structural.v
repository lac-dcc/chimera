// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
 P1.1 4:1 MULTIPLEXER STRUCTURAL
 ************************************************/

 module mux_4_1_st(Y,I,S);
 	input [3:0]I;
 	input [1:0]S;
 	output Y;

 	mux_2_1_df m1(n1,I[3:2],S[1]);
 	mux_2_1_df m2(n2,I[1:0],S[1]);
 	mux_2_1_df m3(Y,{n1,n2},S[0]);


 endmodule