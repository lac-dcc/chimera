// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

module mac_tb(
);

	reg clk;
  reg [8:0] in1;
  reg [8:0] in2;
	reg [8:0] preResult;
  wire [17:0] out;
  wire overflow;
	//wire overflowA, overflowS;		
	

  mac #(
	//input parameters
		.LEN(9)
	)
	m0 (
	//input output ports
		.in1 (in1),
  	.in2 (in2),
		.preResult (preResult),
  	.out (out),
  	.overflow (overflow)
  );


	initial
	begin
		$dumpfile("./bin/mac.vcd");
		$dumpvars(0,mac_tb);
		$monitor("in1,in2,preResult,out,overflow,clk");
	end

	initial 
	begin
		clk = 0;
		in1 = 100;
		in2 = 88;
		preResult = 0;
		
	#10
		in1 = 32;
		in2 = -32;
		preResult = 10;

	#10
		in1 = -21;
		in2 = -231;
		preResult = -11;
		
	
	#100 
		$finish;
	end

	always
	begin
		#10 clk = ~clk;
	end

endmodule
