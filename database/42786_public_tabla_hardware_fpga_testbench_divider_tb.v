// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

module divider_tb(
);

	reg clk;
	reg [31:0] in1;
	reg [31:0] in2;
	wire [31:0] out;
	wire done;

	divider //#(
		//.dataLen(32)
	//)
	div (
		.in1 (in1),
	  	.in2 (in2),
	  	.out (out),
	  	.done (done)
	);

	initial
	begin
		$dumpfile("./bin/divider.vcd");
		$dumpvars(0, divider_tb);
		$monitor("in1,in2,out,done,clk");
	end

	initial
	begin
		clk = 0;
		in1 = 2;
		in2 = 2;
	#10
		in1 = 10;
		in2 = 4;
	#10
		in1 = 10;
		in2 = 3;
	#100
		$finish;
	end

	always
	begin
		#5 clk = !clk;
	end
endmodule
