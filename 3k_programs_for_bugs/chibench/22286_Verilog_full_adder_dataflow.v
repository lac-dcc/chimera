// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
 P1.1 FULL ADDER DATAFLOW
 ************************************************/

 module full_adder_df(s, cout, a, b, cin); 
 	input a, b, cin;
 	output s, cout;

 	assign s=a^b^cin;
 	assign cout=(a&b)|(a&cin)|(b&cin);

 endmodule