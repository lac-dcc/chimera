`timescale 1ns/1ps

module system_tb;
	reg rst = 0;
	reg clk = 0;
	initial begin
		$dumpfile("kamikaze.vcd");
		$dumpvars(0, system_tb);
		#15 rst = 1;
		#1000 $finish;

	end
	always begin 
		#5 clk = !clk; 
	end
	
	top dut(.clk_i(clk), .rst_i(rst));
	
endmodule
