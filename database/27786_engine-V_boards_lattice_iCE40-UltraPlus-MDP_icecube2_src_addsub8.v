// This program was cloned from: https://github.com/micro-FPGA/engine-V
// License: Apache License 2.0

/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.32
-- Input file was: addsub8.vhd
-- Command line was: C:\SynaptiCAD\bin\win32\vhdl2verilog.exe addsub8.vhd addsub8.v
-- Date Created: Wed Nov 07 20:48:33 2018

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules


module addsub8 (
   a,
   b,
   q,
   sub,
   cin,
   cout);
 

input   [7:0] a; 
input   [7:0] b; 
output   [7:0] q; 
input   sub; 
input   cin; 
output   cout; 

wire    [7:0] q; 
wire    cout; 
wire    [8:0] A_i; 
wire    [8:0] B_i; 
wire    [8:0] Full_Carry; 
wire    [8:0] Res_i; 

assign B_i[8] = 1'b 0; 
assign B_i[7:0] = sub === 1'b 1 ? ~b : 
	b; 
assign A_i[8] = 1'b 0; 
assign A_i[7:0] = a; 
assign Full_Carry[8:1] = 8'b 00000000; 
assign Full_Carry[0] = cin; 
assign Res_i = A_i + B_i + Full_Carry; 
assign cout = Res_i[8]; 
assign q = Res_i[7:0]; 

endmodule // module addsub8

