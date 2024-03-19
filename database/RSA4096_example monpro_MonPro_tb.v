module MonPro_tb();
	reg clk;
	reg reset;
	
	monpro monpro0(
		.clk(clk), .reset(reset)
	);
	
	initial begin
		clk = 0;
		reset = 0;
		#1000000  $stop;
	end
	
	always begin
	   #50 clk = ~clk;
	end
endmodule
