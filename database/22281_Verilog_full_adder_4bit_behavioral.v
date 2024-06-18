// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
 P1.1 4-bit FULL ADDER BEHAVIORAL
 ************************************************/

 module full_adder_4bit_bh(s,cout,a,b,cin); 
 	input [3:0]a, b;
 	input cin;
 	output reg [3:0]s;
 	output reg cout;

 	always@(a,b,cin)

 	{cout,s} = a + b + cin;


 endmodule