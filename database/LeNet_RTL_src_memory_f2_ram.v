//==================================================================================================
//  Filename      : conv1_pulling1_ram.v
//  Created On    : 2017-12-28 14:56:33
//  Last Modified : 2018-03-21 21:46:47
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : 
//
//
//==================================================================================================
module f2_ram(/*autoport*/
//output
			f2_rdata,
//input
			clk,
			f2_wdata,
			f2_wr_en,
			f2_waddr,
			f2_raddr);
	input clk;
//write side
	input [95:0]	f2_wdata;
	input 		  	f2_wr_en;
	input [9:0]  	f2_waddr;
//read side
	input [9:0]  	f2_raddr;
	output [95:0]	f2_rdata;

	blk_mem_gen_f2_ram f2_ram (
	  .clka(clk),    // input clka
	  .wea(f2_wr_en),      // input [0 : 0] wea
	  .addra(f2_waddr),  // input [9 : 0] addra
	  .dina(f2_wdata),    // input [95 : 0] dina
	  .clkb(clk),    // input clkb
	  .addrb(f2_raddr),  // input [9 : 0] addrb
	  .doutb(f2_rdata)  // output [95 : 0] doutb
	);
	
endmodule 