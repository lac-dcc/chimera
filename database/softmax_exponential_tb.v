// This program was cloned from: https://github.com/maomran/softmax
// License: Apache License 2.0

`timescale 1ns / 1ps
`define DATALENGTH 32
`define INPUTMAX 5 
`define IDLE 			2'b00
`define INPUTSTREAM 	2'b01
`define OP 				2'b10
module exponential_tb ();

reg 						Clock;
reg 						Reset;
reg 						Str;
reg  [`DATALENGTH-1:0] 	Datain;
wire [`DATALENGTH-1:0]	DataOut;
wire					Ack;


exponential DUT (Clock, Reset,Str, Datain ,Ack, DataOut);
	
initial begin
	Clock = 0;
	Reset = 1;
	Str   = 0;
	#10
	Reset = 0;
	Str	  = 1;
	Datain = 32'h3f800000;
	#50 
	$finish;
end

always 
#1 Clock = ~Clock;

endmodule 