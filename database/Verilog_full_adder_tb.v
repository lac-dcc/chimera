// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
 P1.1 FULL ADDER TESTBENCH
 ************************************************/

 module full_adder_bh; 
 	reg a, b, cin;
 	wire s,cout;

 	full_adder_bh fa_dut(s,cout,a,b,cin);

 	initial begin
 		$monitor("time=%d \t a=%b \t b=%b \t cin=%b \t s=%b \t cout=%b",$time,a,b,cin,s,cout);
 		a=0;
 		b=0;
 		cin=0;		//{cin,a,b}=3'b000
 		#10 a=1;	//{cin,a,b}=3'b010
 		#10 b=1;	//{cin,a,b}=3'b011
 		#10 cin=1;	//{cin,a,b}=3'b111
 		#10 $stop;
 	end // initial

 endmodule