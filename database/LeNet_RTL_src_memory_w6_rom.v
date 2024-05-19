// This program was cloned from: https://github.com/yztong/LeNet_RTL
// License: MIT License

//==================================================================================================
//  Filename      : w6_rom.v
//  Created On    : 2018-01-08 12:12:47
//  Last Modified : 2018-03-21 17:09:05
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : 
//
//
//==================================================================================================
module w6_rom(/*autoport*/
//output
      w6_rdata,
//input
      clk,
      w6_raddr);

	  input		 clk;
	  input  [6:0] w6_raddr;
    output [671:0] w6_rdata;
   
  blk_mem_gen_w6_rom w6_rom (
    .clka(clk),    // input clka
    .addra(w6_raddr),  // input [6 : 0] addra
    .douta(w6_rdata)  // output [671 : 0] douta
  );

endmodule