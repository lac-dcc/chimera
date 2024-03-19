module sigmoid_tb(
);

	reg clk;
	reg [31:0] in;
	wire [31:0] out;

	sigmoid //#(
		//.dataLen(32);
	//)
	sig (
		.in (in),
	  	.out (out)
	);

	initial
	begin
		$dumpfile("./bin/sigmoid.vcd");
		$dumpvars(0, sigmoid_tb);
		$monitor("in,out,clk");
	end

	initial
	begin
		clk = 0;
		in = -1;
	#10
		in = 0;
	#10
		in = 1 << 15;
	#10
		in = 3 << 14;
	#10
		in = 1.9;
	#100
		$finish;
	end

	always
	begin
		#5 clk = !clk;
	end
endmodule
