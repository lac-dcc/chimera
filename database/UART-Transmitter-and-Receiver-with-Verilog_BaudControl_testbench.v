// This program was cloned from: https://github.com/SimNabong/UART-Transmitter-and-Receiver-with-Verilog
// License: MIT License

`timescale 1ns/1ps

module BaudControl_testbench();
	reg clk; //50MHz clk
	reg [2:0]BC; //User Input Baud controls
	wire Rx_clk; //Clk with modified BPS

	BaudControl BaudControlInst(.clk(clk), .BC(BC), .Rx_clk(Rx_clk));
	
	
	initial begin
		clk = 0; //initialized clock to 0 
		forever #1 clk = ~clk; //clock toggling forever
	end
	
	//assign Max_Cntr =(~BC1[2]&~BC1[1]&BC1[0])?9'd217:(~BC1[2]&BC1[1]&~BC1[0])?9'd109:(~BC1[2]&BC1[1]&BC1[0])?9'd72:(BC1[2]&~BC1[1]&~BC1[0])?9'd36:9'd434;
	
	initial begin
		BC=3'd0; //434
		
		#10000 BC=3'b011; //72
		#10000 BC=3'b001;//even parity bit 217
		#40000 BC=3'b010;//even pbit 109
		#10000 BC=3'b100;//even parity bit 36
		#40000 BC=3'd0;
		
		#0 $finish;
		
	end
	
	initial begin
		$monitor("simtime=%g, clk=%b, BC=%b, Rx_clk=%b,", $time, clk, BC, Rx_clk);
	end 
	

endmodule