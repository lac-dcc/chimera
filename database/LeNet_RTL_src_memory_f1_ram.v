//==================================================================================================
//  Filename      : f1_rom.v
//  Created On    : 2017-12-29 19:14:58
//  Last Modified : 2018-03-21 15:09:42
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : feature rom for conv layer1
//
//
//==================================================================================================

module f1_ram(/*autoport*/
//output
			f1_rdata,
//input
			rclk,
			wclk,
			f1_wr_en,
			f1_waddr,
			f1_wdata,
			ena,
			f1_raddr);
input			rclk;
input			wclk;
input [3:0]    	f1_wr_en;
input [31:0]   	f1_waddr;
input [31:0]   	f1_wdata;
input			ena;
input [9:0]    	f1_raddr;
output[7:0]  	f1_rdata; 



//2 cycles delay
blk_mem_gen_f1_ram f1_ram (
  .clka(wclk),    // input clka
  .ena(ena),  
  .wea(f1_wr_en),      // input [3 : 0] wea
  .addra(f1_waddr),  // input [31 : 0] addra
  .dina(f1_wdata),    // input [31 : 0] dina
  .clkb(rclk),    // input clkb
  .addrb({20'b0,f1_raddr,2'b0}),  // input [31 : 0] addrb
  .doutb(f1_rdata)  // output [31 : 0] doutb
);

endmodule 