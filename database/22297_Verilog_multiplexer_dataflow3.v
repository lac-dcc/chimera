// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
 P1.1 4:1 MULTIPLEXER DATAFLOW3
 ************************************************/

 module mux_4_1_df(Y,I,S);
 	input [3:0]I;
 	input [1:0]S;
 	output Y;

 assign Y= (S==2'd0)?I[0]:((S==2'd1):I[1]:((S==2'd2)?I[2]:I[3]));


 endmodule