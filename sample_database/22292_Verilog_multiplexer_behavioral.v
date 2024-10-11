// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
 P1.1 2:1 MULTIPLEXER BEHAVIORAL
 ************************************************/

 module mux_2_1_bh(Y,I,S);
 	input [1:0]I;
 	input S;
 	output reg Y;

 	always@(*)
 	if(S)
 		Y=I[1];
 	else
 		Y=I[0];

 endmodule