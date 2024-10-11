// This program was cloned from: https://github.com/yztong/LeNet_RTL
// License: MIT License

//==================================================================================================
//  Filename      : w7_rom.v
//  Created On    : 2018-01-08 12:17:27
//  Last Modified : 2018-03-21 17:09:38
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : 
//
//
//==================================================================================================
module w7_rom(/*autoport*/
//output
      w7_rdata,
//input
      clk,
      w7_raddr);
	input		 clk;
	input  [6:0] w7_raddr;

  output [79:0] w7_rdata;


  blk_mem_gen_w7_rom w7_rom (
    .clka(clk),    // input clka
    .addra(w7_raddr),  // input [6 : 0] addra
    .douta(w7_rdata)  // output [79 : 0] douta
  );


endmodule