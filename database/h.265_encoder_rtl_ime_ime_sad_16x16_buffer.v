//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2014, VIPcore Group, Fudan University
//
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//
//  VIPcore       : http://soc.fudan.edu.cn/vip
//  IP Owner      : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn
//
//-------------------------------------------------------------------
//
//  Filename      : ime_sad_16x16_buffer.v
//  Author        : Huang Lei Lei
//  Created       : 2014-12-10
//  Description   : buffer 16x16 sad
//
//-------------------------------------------------------------------
//
//  Modified      : 2014-12-21
//  Description   : bug removed (port name and memory datawidth)
//
//-------------------------------------------------------------------

`include "enc_defines.v"

module ime_sad_16x16_buffer (
  // global
  clk               ,
  rstn              ,

  // ctrl_i
  addr_i            ,
  wren_i            ,
  block_i           ,

  // sad_i
  sad_16x16_x0_i     ,
  sad_16x16_x1_i     ,
  sad_16x16_x2_i     ,
  sad_16x16_x3_i     ,

  // sad_o
  sad_16x16_00_o    ,
  sad_16x16_01_o    ,
  sad_16x16_02_o    ,
  sad_16x16_03_o    ,

  sad_16x16_10_o    ,
  sad_16x16_11_o    ,
  sad_16x16_12_o    ,
  sad_16x16_13_o    ,

  sad_16x16_20_o    ,
  sad_16x16_21_o    ,
  sad_16x16_22_o    ,
  sad_16x16_23_o
  );


//*** PARAMETER DECLARATION ****************************************************


//*** INPUT/OUTPUT DECLARATION *************************************************

  // global
  input                          clk               ;
  input                          rstn              ;

  // ctrl_i
  input  [4              : 0]    addr_i            ;
  input                          wren_i            ;
  input  [1              : 0]    block_i           ;

  // sad_i
  input  [`PIXEL_WIDTH+7 : 0]    sad_16x16_x0_i     ;
  input  [`PIXEL_WIDTH+7 : 0]    sad_16x16_x1_i     ;
  input  [`PIXEL_WIDTH+7 : 0]    sad_16x16_x2_i     ;
  input  [`PIXEL_WIDTH+7 : 0]    sad_16x16_x3_i     ;

  // sad_o
  output [`PIXEL_WIDTH+7 : 0]    sad_16x16_00_o    ;
  output [`PIXEL_WIDTH+7 : 0]    sad_16x16_01_o    ;
  output [`PIXEL_WIDTH+7 : 0]    sad_16x16_02_o    ;
  output [`PIXEL_WIDTH+7 : 0]    sad_16x16_03_o    ;

  output [`PIXEL_WIDTH+7 : 0]    sad_16x16_10_o    ;
  output [`PIXEL_WIDTH+7 : 0]    sad_16x16_11_o    ;
  output [`PIXEL_WIDTH+7 : 0]    sad_16x16_12_o    ;
  output [`PIXEL_WIDTH+7 : 0]    sad_16x16_13_o    ;

  output [`PIXEL_WIDTH+7 : 0]    sad_16x16_20_o    ;
  output [`PIXEL_WIDTH+7 : 0]    sad_16x16_21_o    ;
  output [`PIXEL_WIDTH+7 : 0]    sad_16x16_22_o    ;
  output [`PIXEL_WIDTH+7 : 0]    sad_16x16_23_o    ;


//*** WIRE & REG DECLARATION ***************************************************


//*** MAIN BODY ****************************************************************

  rf_1p #(
    .Word_Width ( 16*4                         ),
    .Addr_Width ( 5                            )
  ) buffer0 (
    .clk        ( clk                          ),
    .cen_i      ( 1'b0                         ),
    .wen_i      ( !(wren_i & (block_i==2'b00)) ),
    .addr_i     ( addr_i                       ),
    .data_i     ( { sad_16x16_x0_i ,sad_16x16_x1_i ,sad_16x16_x2_i ,sad_16x16_x3_i } ),
    .data_o     ( { sad_16x16_00_o ,sad_16x16_01_o ,sad_16x16_02_o ,sad_16x16_03_o } )
    );

  rf_1p #(
    .Word_Width ( 16*4                         ),
    .Addr_Width ( 5                            )
  ) buffer1 (
    .clk        ( clk                          ),
    .cen_i      ( 1'b0                         ),
    .wen_i      ( !(wren_i & (block_i==2'b01)) ),
    .addr_i     ( addr_i                       ),
    .data_i     ( { sad_16x16_x0_i ,sad_16x16_x1_i ,sad_16x16_x2_i ,sad_16x16_x3_i } ),
    .data_o     ( { sad_16x16_10_o ,sad_16x16_11_o ,sad_16x16_12_o ,sad_16x16_13_o } )
    );

  rf_1p #(
    .Word_Width ( 16*4                         ),
    .Addr_Width ( 5                            )
  ) buffer2 (
    .clk        ( clk                          ),
    .cen_i      ( 1'b0                         ),
    .wen_i      ( !(wren_i & (block_i==2'b10)) ),
    .addr_i     ( addr_i                       ),
    .data_i     ( { sad_16x16_x0_i ,sad_16x16_x1_i ,sad_16x16_x2_i ,sad_16x16_x3_i } ),
    .data_o     ( { sad_16x16_20_o ,sad_16x16_21_o ,sad_16x16_22_o ,sad_16x16_23_o } )
    );


//*** DEBUG ********************************************************************


endmodule