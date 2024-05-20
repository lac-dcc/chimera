// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
//                                                                              //
//  Author: meisq                                                               //
//          msq@qq.com                                                          //
//          ALINX(shanghai) Technology Co.,Ltd                                  //
//          heijin                                                              //
//     WEB: http://www.alinx.cn/                                                //
//     BBS: http://www.heijin.org/                                              //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
// Copyright (c) 2017,ALINX(shanghai) Technology Co.,Ltd                        //
//                    All rights reserved                                       //
//                                                                              //
// This source file may be used and distributed without restriction provided    //
// that this copyright statement is not removed from the file and that any      //
// derivative work contains the original copyright notice and the associated    //
// disclaimer.                                                                  //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

//================================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//--------------------------------------------------------------------------------
//  2017/7/19     meisq          1.0         Original
//*******************************************************************************/

`timescale 1ns / 1ps

module pll_test
(
	input   clk,
	input   rst_n,
	output  clkout1,        //pll clock output
	output  clkout2,        //pll clock output
	output  clkout3,        //pll clock output
	output  clkout4         //pll clock output
);

wire locked;

IBUFG IBUFG_INST
(
      .O(clk_bufg),
		.I(clk)
);

pll pll_inst
(
	// Clock in ports
	.clk_in(clk_bufg),           // IN 50Mhz
	// Clock out ports
	.clk_out1(clkout1),           // OUT 25Mhz
	.clk_out2(clkout2),           // OUT 50Mhz
	.clk_out3(clkout3),           // OUT 75Mhz
	.clk_out4(clkout4),           // OUT 100Mhz
	// Status and control signals
	.reset(~rst_n),        // IN
	.locked(locked)         //The signal of PLL normal operation
	);                      // OUT

endmodule
