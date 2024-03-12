`timescale 1ns/1ps 
module grom_computer_tb();
	reg clk = 0;
	reg reset;
	wire [7:0] display_out;
	wire hlt;

	grom_computer computer(.clk(clk),.reset(reset),.hlt(hlt),.display_out(display_out));

	always
		#(5) clk <= !clk;

	initial
	begin
		$dumpfile("grom_computer_tb.vcd");
		$dumpvars(0,grom_computer_tb);
		reset = 1;
		#20
		reset = 0;
		#900
		$finish;
	end
endmodule
