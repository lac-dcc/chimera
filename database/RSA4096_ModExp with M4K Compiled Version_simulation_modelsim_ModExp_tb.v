module ModExp_tb();
	reg clk;
	reg reset;
	
	ModExp modexp0(
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
	
// 	always begin
//		#7000000 reset = ~reset;
		//#100000 reset = ~reset;
//	end 
endmodule
