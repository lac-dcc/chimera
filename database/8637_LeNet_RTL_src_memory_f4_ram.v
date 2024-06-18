// This program was cloned from: https://github.com/yztong/LeNet_RTL
// License: MIT License

//==================================================================================================
//  Filename      : f4_ram.v
//  Created On    : 2018-01-01 15:35:30
//  Last Modified : 2018-03-21 21:47:03
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : 
//
//
//================================================================================================
module f4_ram(/*autoport*/
//output
			f4_rdata,
//input
			clk,
			f4_wdata,
			f4_wr_en,
			f4_waddr,
			f4_raddr);
	input clk;
//write side
	input [255:0] f4_wdata;


	input 		  f4_wr_en;
	input [6:0]   f4_waddr;
//read side
	input [6:0]   f4_raddr;
	output[255:0] f4_rdata;


	blk_mem_gen_f4_ram f4_ram (
	  .clka(clk),    // input clka
	  .wea(f4_wr_en),      // input [0 : 0] wea
	  .addra(f4_waddr),  // input [6 : 0] addra
	  .dina(f4_wdata),    // input [255 : 0] dina
	  .clkb(clk),    // input clkb
	  .addrb(f4_raddr),  // input [6 : 0] addrb
	  .doutb(f4_rdata)  // output [255 : 0] doutb
	);

endmodule 