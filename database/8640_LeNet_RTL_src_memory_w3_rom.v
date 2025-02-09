// This program was cloned from: https://github.com/yztong/LeNet_RTL
// License: MIT License

//==================================================================================================
//  Filename      : w3_rom.v
//  Created On    : 2018-01-02 13:14:12
//  Last Modified : 2018-03-21 17:07:39
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : Generated by Perl
//
//
//==================================================================================================
module w3_rom(/*autoport*/
//output
			w3_rdata,
//input
			clk,
			w3_raddr);
	input clk;
	input [4:0] 	w3_raddr;
	output[767:0] 	w3_rdata;
							
	dist_mem_gen_w3_rom w3_rom (
	  .a(w3_raddr),        // input [4 : 0] a
	  .clk(clk),    // input clk
	  .qspo(w3_rdata)  // output [767 : 0] qspo
	);

endmodule