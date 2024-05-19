// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

`timescale 1ns / 1ps


module tb_top;
	parameter	SIMULATION = 1'b1;

	parameter	RATE       = 20;
	parameter	UART_RATE  = (1000000000 / 115200);
	
	
	initial begin
		$dumpfile("tb_top.vcd");
		$dumpvars(0, tb_top);
	end
	
	// reset
	reg		reset;
	initial begin
		#0			reset = 1'b1;
		#(RATE*10)	reset = 1'b0;
	end
	
	// clock
	reg		clk;
	initial begin
		clk    = 1'b1;
	end
	always #(RATE/2) begin
		clk = ~clk;
	end
	
	top
			#(
				.SIMULATION			(SIMULATION)
			)
		i_top
			(
				.in_clk				(clk),
				.in_reset_n			(!reset),
				
				.uart0_tx			(),
				.uart0_rx			(1'b1),
				
				.uart1_tx			(),
				.uart1_rx			(1'b1),
				
				.led				()
			);
	
	
	initial begin
				$display("--- START ---");
	#(RATE*100000);
				$finish;
	end	
	
endmodule

