module sqrt_tb(
);

	reg clk;
	reg [31:0] in;
	wire [15:0] out;
	wire [16:0] rout;
	wire done;

	sqrt //#(
		//.dataLen(32);
	//)
	sqrt0 (
		.in (in),
	  	.out (out),
	  	.rout (rout),
	  	.done (done)
	);

	initial
	begin
		$dumpfile("./bin/sqrt_tb.vcd");
		$dumpvars(0, sqrt_tb);
		$monitor("in,out,rout,done,clk");
	end

	initial
	begin
		clk = 0;
		in = 140;
	#50
		in = 2 << 10;	// 5 bits fraction
	#50
		in = 9 << 10;	// 5 bits fraction
	#200
		$finish;
	end

	always
	begin
		#1 clk = !clk;
	end
endmodule
