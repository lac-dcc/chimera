// This program was cloned from: https://github.com/yztong/LeNet_RTL
// License: MIT License

//==================================================================================================
//  Filename      : weight_rom.v
//  Created On    : 2017-12-29 19:12:21
//  Last Modified : 2018-03-21 17:06:56
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : weights rom for conv layer1
//
//
//==================================================================================================

module w1_rom(/*autoport*/
//output
			w1_rdata,
//input
			clk,
			w1_raddr);
	
	input clk;
	input  [4:0] 	w1_raddr;
	output [47:0]	w1_rdata;

  dist_mem_gen_w1_rom w1_rom (
    .a(w1_raddr),        // input [4 : 0] a
    .clk(clk),    // input clk
    .qspo(w1_rdata)  // output [47 : 0] qspo
  );

endmodule 