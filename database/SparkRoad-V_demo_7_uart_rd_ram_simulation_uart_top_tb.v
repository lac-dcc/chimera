// Verilog testbench created by TD v4.6.12906
// 2019-07-24 09:21:08

`timescale 1ns / 1ps

module uart_top_tb();

reg ext_clk_25m;
reg ext_rst_n;
reg uart_rx;
wire uart_tx;

//Clock process
parameter PERIOD = 10;

//glbl Instantiate
glbl glbl();

//Unit Instantiate
uart_top uut(
	.ext_clk_25m(ext_clk_25m),
	.ext_rst_n(ext_rst_n),
	.uart_rx(uart_rx),
	.uart_tx(uart_tx));

//Stimulus process
initial begin
//To be inserted
	ext_clk_25m = 0;
	ext_rst_n = 1;
	
	#500;
	uart_rx = 1;
	#104;
	
	uart_rx = 0;
	#104;
	uart_rx = 0;
	#104;
	uart_rx = 0;
	#104;
	uart_rx = 0;
	#104;
	uart_rx = 0;
	#104;
	uart_rx = 1;
	#104;
	uart_rx = 0;
	#104;
	uart_rx = 1;
	#104;
	
	uart_rx = 0;
	
		
		
	
end

always #20 ext_clk_25m <= ~ext_clk_25m;

endmodule