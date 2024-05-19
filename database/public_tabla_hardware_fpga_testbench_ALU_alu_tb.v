// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

module alu_tb(
);

	reg clk;
  	reg [15:0] in1;
  	reg [15:0] in2;
	reg [15:0] in3;
	reg [1:0] sel;
  	wire [15:0] out;
  	wire overflow;
	//wire overflowA, overflowS;		

  mac #(
	//input parameters
		.LEN(16),
		.SELECT_LEN(2)
	)
	alu0 (
	//input output ports
		.in1 (in1),
  		.in2 (in2),
		.in3 (in3),
		.select (sel),
  	.out (out)
  );


	initial
	begin
		$dumpfile("./bin/alu.vcd");
		$dumpvars(0,alu_tb);
		$monitor("in1,in2,in3,out,sel,clk");
	end

	initial 
	begin
		clk = 0;
		in1 = 100;
		in2 = 88;
		in3 = 0;
		sel = 0;
		
	#10
		in1 = 32;
		in2 = -32;
		in3 = 10;
		sel = 2;

	#10
		in1 = -21;
		in2 = -121;
		in3 = -11;
		sel = 3;
	

	#10

		in1 = 100;
		in2 = 0;
		sel = 1;
	#100 
		$finish;
	end

	always
	begin
		#10 clk = ~clk;
	end

endmodule
