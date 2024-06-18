// This program was cloned from: https://github.com/maomran/softmax
// License: Apache License 2.0

`timescale 1ns / 1ps
`define DATALENGTH 32
`define INPUTMAX 5 
`define IDLE 			2'b00
`define INPUTSTREAM 	2'b01
`define OP 				2'b10
`define OUTPUTSTREAM    2'b11
`define NUMBER 3'b101

module softmax_tb(
		);
reg 						Clock;
reg 						Reset;
reg 						Start;
reg [`DATALENGTH-1:0] 	Datain;
reg	[`INPUTMAX-1:0]		N;
wire [`DATALENGTH-1:0] Dataout;



	softmax DUT (Clock, Reset, Start, Datain,N, Dataout);
	
initial begin
	Clock = 1;
	Reset = 1;
	N   = 3;
	#10
	Start = 1;
	Reset = 0;
	Datain = 32'h3f800000;
	#2
	Datain = 32'h3f800000;
    #2
    Datain = 32'h3f800000;            
    #2
    Datain = 32'h3f800000;          
	
	Start = 0;
	#2000 
	$finish;
end

always 
#1 Clock = ~Clock;

endmodule 
