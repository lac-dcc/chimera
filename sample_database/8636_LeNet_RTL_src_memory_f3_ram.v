// This program was cloned from: https://github.com/yztong/LeNet_RTL
// License: MIT License

//==================================================================================================
//  Filename      : f3_ram.v
//  Created On    : 2018-01-01 15:35:30
//  Last Modified : 2018-03-21 21:46:55
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : 
//
//
//================================================================================================
module f3_ram(/*autoport*/
//output
			f3_rdata,
//input
			clk,
			f3_wdata,
			f3_wr_en,
			f3_waddr,
			f3_raddr);
	input clk;
//write side
	input [95:0] f3_wdata;

	input 		 f3_wr_en;
	input [7:0]  f3_waddr;
//read side
	input [7:0]  f3_raddr;
	output[95:0] f3_rdata;

	blk_mem_gen_f3_ram f3_ram (
	  .clka(clk),    // input clka
	  .wea(f3_wr_en),      // input [0 : 0] wea
	  .addra(f3_waddr),  // input [7 : 0] addra
	  .dina(f3_wdata),    // input [95 : 0] dina
	  .clkb(clk),    // input clkb
	  .addrb(f3_raddr),  // input [7 : 0] addrb
	  .doutb(f3_rdata)  // output [95 : 0] doutb
	);

endmodule 