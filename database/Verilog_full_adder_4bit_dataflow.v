// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
 P1.1 4-bit FULL ADDER DATAFLOW
 ************************************************/

 module full_adder_4bit_df(s,cout,a,b,cin); 
 	input [3:0]a, b;
 	input cin;
 	output [3:0]s;
 	output cout;

 	assign {cout,s} = a + b + cin;


 endmodule