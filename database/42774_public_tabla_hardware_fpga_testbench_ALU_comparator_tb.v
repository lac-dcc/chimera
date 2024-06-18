// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

module comp_tb(
);

	reg clk;
    reg [8:0] in1;
    reg [8:0] in2;
	wire out;

  comp #(
	//input parameters
		.LEN(9)
	)
	c0 (
	//input output ports
        .in1 (in1),
        .in2 (in2),
        .out (out)
    );


	initial
	begin
		$dumpfile("./bin/comparator.vcd");
		$dumpvars(0,comp_tb);
		$monitor("in1,in2,outAdd,outSub,overflowA,overflowS,clk");
	end

	initial 
	begin
		clk = 0;
		in1 = -100;
		in2 = 88;
		
	#10
		in1 = 3297;
		in2 = 323;

	#10
		in1 = 121;
		in2 = 231;
		
	
	#100 
		$finish;
	end

	always
	begin
		#10 clk = ~clk;
	end

endmodule
