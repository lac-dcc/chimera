// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

module addSub_tb(
);

	reg clk;
    reg [8:0] in1;
    reg [8:0] in2;
    wire [8:0] outAdd;
    wire [8:0] outSub;
	wire overflowA, overflowS;		
	

  addSub #(
		//input parameters
		.LEN(9)
	)
	as0 (
	//input output ports
        .in1 (in1),
        .in2 (in2),
        .outAdd (outAdd),
        .outSub (outSub),
        .overflowA (overflowA),
        .overflowS (overflowS)
    );


	initial
	begin
		$dumpfile("./bin/addSub.vcd");
		$dumpvars(0,addSub_tb);
		$monitor("in1,in2,outAdd,outSub,overflowA,overflowS,clk");
	end

	initial 
	begin
		clk = 0;
		in1 = 100;
		in2 = 88;
		
	#10
		in1 = 3297;
		in2 = 323;

	#10
		in1 = 2121;
		in2 = -231;
		
	
	#100 
		$finish;
	end

	always
	begin
		#10 clk = ~clk;
	end

endmodule
