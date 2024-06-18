// This program was cloned from: https://github.com/SimNabong/UART-Transmitter-and-Receiver-with-Verilog
// License: MIT License

`timescale 1ns/1ps

module Transmitter_BaudRate_testbench();
	reg clk;
	reg [2:0]BC;
	reg Rxi;
	reg [7:0]UI;
	wire Txo;
	//wire Tx_clk;

	
	Transmitter_BaudRate Transmitter_BaudRateInst(.clk(clk), .BC(BC), .Rxi(Rxi), .UI(UI), .Txo(Txo));
	
	
	initial begin
		clk = 0; //initialized clock to 0 
		forever #1 clk = ~clk; //clock toggling forever
	end
	
	//assign Max_Cntr =(~BC[2]&~BC[1]&BC[0])?9'd217:(~BC[2]&BC[1]&~BC[0])?9'd109:(~BC[2]&BC[1]&BC[0])?9'd72:(BC[2]&~BC[1]&~BC[0])?9'd36:9'd434;
	
	initial begin
		BC=3'd0; //434
		Rxi = 0; 
		UI=8'd0;
		
		#40000 UI=8'b00001011; //odd parity bit
		#40000 BC=3'b011; //72
		#40000 BC=3'b001;UI=8'b00001111; //even parity bit 217
		#40000 UI=8'b11101000; //even pbit 73
		#40000 UI=8'd0;//
		#40000 BC=3'b011;UI=8'b01101111; //even pbit 72
		#40000 BC=3'b001;UI=8'b00001001; //even parity bit 36
		#40000 BC=3'd0;
		
		#0 $finish;
		
	end
	
	initial begin
		$monitor("simtime=%g, clk=%b, Rxi=%b, BC=%b, UI=%b, Txo=%b", $time, clk, Rxi,BC,UI,Txo);
	end 
	

endmodule