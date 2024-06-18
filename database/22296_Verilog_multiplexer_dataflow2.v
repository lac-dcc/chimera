// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
 P1.1 4:1 MULTIPLEXER DATAFLOW2
 ************************************************/

 module mux_4_1_df(Y,I,S);
 	input [3:0]I;
 	input [1:0]S;
 	output Y;

 assign Y= ~|S?I[0]:(&S?I[3]:(S[0]?I[1]:I[2]));


 endmodule