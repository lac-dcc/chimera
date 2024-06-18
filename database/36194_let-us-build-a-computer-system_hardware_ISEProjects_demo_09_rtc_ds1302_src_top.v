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
//  2017/6/19     meisq         1.0         Original
//*******************************************************************************/
module top(
    //sys
    input        clk,   
    input        rst_n,
    output       rtc_sclk,
    output       rtc_ce,
    inout        rtc_data,
    output [5:0] seg_sel,
    output [7:0] seg_data
    );

wire[7:0] read_second;
wire[7:0] read_minute;
wire[7:0] read_hour;
wire[7:0] read_date;
wire[7:0] read_month;
wire[7:0] read_week;
wire[7:0] read_year;
seg_bcd seg_bcd_m0(
    .clk          (clk),
    .rst_n        (rst_n),
    .seg_sel      (seg_sel),
    .seg_data     (seg_data),
    .seg_bcd      ({read_hour,read_minute,read_second})
);
ds1302_test ds1302_test_m0(
    .rst         (~rst_n),
    .clk         (clk),
    .ds1302_ce   (rtc_ce),
    .ds1302_sclk (rtc_sclk),
    .ds1302_io   (rtc_data),
    .read_second (read_second),
    .read_minute (read_minute),
    .read_hour   (read_hour),
    .read_date   (read_date),
    .read_month  (read_month),
    .read_week   (read_week),
    .read_year   (read_year)
);
endmodule 
    
    