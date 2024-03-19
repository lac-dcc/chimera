module MonExp_tb();
	reg clk;
	reg reset;
	
	MonExp monexp0(
		.clk(clk), .reset(reset)
	);
	
	initial begin
		clk = 0;
		reset = 0;
		//#1000000  $stop;
	end
	
	always begin
	   #5 clk = ~clk;
	end
endmodule
