// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps
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

//===============================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//-------------------------------------------------------------------------------
//  2017/6/19     meisq         1.0         Original
//*******************************************************************************/
module seg_test(
                input      clk,
                input      rst_n,
                output[5:0]seg_sel,
                output[7:0]seg_data
                );
					 
reg[31:0] timer_cnt;
reg en_1hz;                          //1 second , 1 counter enable
always@(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
    begin
        en_1hz <= 1'b0;
        timer_cnt <= 32'd0;
    end
    else if(timer_cnt >= 32'd49_999_999)
    begin
        en_1hz <= 1'b1;
        timer_cnt <= 32'd0;
    end
    else
    begin
        en_1hz <= 1'b0;
        timer_cnt <= timer_cnt + 32'd1; 
    end
end
wire[3:0] count0;
wire t0;
count_m10 count10_m0(
    .clk    (clk),
    .rst_n  (rst_n),
    .en     (en_1hz),
    .clr    (1'b0),
    .data   (count0),
    .t      (t0)
 );
wire[3:0] count1;
wire t1;
count_m10 count10_m1(
     .clk    (clk),
     .rst_n  (rst_n),
     .en     (t0),
     .clr    (1'b0),
     .data   (count1),
     .t      (t1)
 );

wire[3:0] count2;
wire t2;
count_m10 count10_m2(
    .clk   (clk),
    .rst_n (rst_n),
    .en    (t1),
    .clr   (1'b0),
    .data  (count2),
    .t     (t2)
);

wire[3:0] count3;
wire t3;
count_m10 count10_m3(
    .clk   (clk),
    .rst_n (rst_n),
    .en    (t2),
    .clr   (1'b0),
    .data  (count3),
    .t     (t3)
);

wire[3:0] count4;
wire t4;
count_m10 count10_m4(
    .clk   (clk),
    .rst_n (rst_n),
    .en    (t3),
    .clr   (1'b0),
    .data  (count4),
    .t     (t4)
);

wire[3:0] count5;
wire t5;
count_m10 count10_m5(
    .clk   (clk),
    .rst_n (rst_n),
    .en    (t4),
    .clr   (1'b0),
    .data  (count5),
    .t     (t5)
);

wire[6:0] seg_data_0;
seg_decoder seg_decoder_m0(
    .bin_data  (count5),
    .seg_data  (seg_data_0)
);
wire[6:0] seg_data_1;
seg_decoder seg_decoder_m1(
    .bin_data  (count4),
    .seg_data  (seg_data_1)
);
wire[6:0] seg_data_2;
seg_decoder seg_decoder_m2(
    .bin_data  (count3),
    .seg_data  (seg_data_2)
);
wire[6:0] seg_data_3;
seg_decoder seg_decoder_m3(
    .bin_data  (count2),
    .seg_data  (seg_data_3)
);
wire[6:0] seg_data_4;
seg_decoder seg_decoder_m4(
    .bin_data  (count1),
    .seg_data  (seg_data_4)
);

wire[6:0] seg_data_5;
seg_decoder seg_decoder_m5(
    .bin_data  (count0),
    .seg_data  (seg_data_5)
);

seg_scan seg_scan_m0(
    .clk        (clk),
    .rst_n      (rst_n),
    .seg_sel    (seg_sel),
    .seg_data   (seg_data),
    .seg_data_0 ({1'b1,seg_data_0}),      //The  decimal point at the highest bit,and low level effecitve
    .seg_data_1 ({1'b1,seg_data_1}), 
    .seg_data_2 ({1'b1,seg_data_2}),
    .seg_data_3 ({1'b1,seg_data_3}),
    .seg_data_4 ({1'b1,seg_data_4}),
    .seg_data_5 ({1'b1,seg_data_5})
);
endmodule 