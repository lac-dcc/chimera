//==================================================================================================
//  Filename      : w5_rom.v
//  Created On    : 2018-01-07 22:27:49
//  Last Modified : 2018-03-21 17:08:17
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : 
//
//
//==================================================================================================
module w5_rom(/*autoport*/
//output
      w5_rdata,
//input
      clk,
      w5_raddr);
	
	input clk;
	input [8:0] w5_raddr;
  output[959:0] w5_rdata;

  blk_mem_gen_w5_rom w5_rom (
    .clka(clk),    // input clka
    .addra(w5_raddr),  // input [8 : 0] addra
    .douta(w5_rdata)  // output [959 : 0] douta
  );


endmodule