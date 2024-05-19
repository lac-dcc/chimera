// This program was cloned from: https://github.com/sxtyzhangzk/mips-cpu
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/22 21:36:19
// Design Name: 
// Module Name: sim_cpu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sim_cpu();
	reg CLK;
	reg RST;
	wire Rx, Tx;
	
	cpu CPU(CLK, RST, Tx, Rx);
	sim_memory sm(CLK, RST, Rx, Tx);
	
	initial begin
		CLK = 0;
		RST = 0;
		RST = #1 1;
		repeat(1000) #1 CLK = !CLK;
		RST = 0;
		forever #1 CLK = !CLK;
	end
endmodule
