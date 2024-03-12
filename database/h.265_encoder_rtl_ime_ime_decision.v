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
//  Filename      : example.v
//  Author        : Huang Lei Lei
//  Created       : 2014-12-08
//  Description   : example for rtl
//
//-------------------------------------------------------------------

`define COST_WIDTH (`PIXEL_WIDTH+12)

`include "enc_defines.v"

module ime_decision (
  // cost_i
  cost_NxN_00_i ,
  cost_NxN_01_i ,
  cost_NxN_02_i ,
  cost_NxN_03_i ,
  cost_2NxN_0_i ,
  cost_2NxN_1_i ,
  cost_Nx2N_0_i ,
  cost_Nx2N_1_i ,
  cost_2Nx2N_i  ,
  // deci_o
  partition_o   ,
  cost_best_o
  );


//*** PARAMETER DECLARATION ****************************************************


//*** INPUT/OUTPUT DECLARATION *************************************************

  // cost_i
  input      [`COST_WIDTH-1    : 0]    cost_NxN_00_i    ;
  input      [`COST_WIDTH-1    : 0]    cost_NxN_01_i    ;
  input      [`COST_WIDTH-1    : 0]    cost_NxN_02_i    ;
  input      [`COST_WIDTH-1    : 0]    cost_NxN_03_i    ;
  input      [`COST_WIDTH-1    : 0]    cost_2NxN_0_i    ;
  input      [`COST_WIDTH-1    : 0]    cost_2NxN_1_i    ;
  input      [`COST_WIDTH-1    : 0]    cost_Nx2N_0_i    ;
  input      [`COST_WIDTH-1    : 0]    cost_Nx2N_1_i    ;
  input      [`COST_WIDTH-1    : 0]    cost_2Nx2N_i     ;
  // deci_o
  output reg [1                : 0]    partition_o      ;    // it's wire
  output reg [`COST_WIDTH-1    : 0]    cost_best_o      ;    // it's wire


//*** WIRE & REG DECLARATION ***************************************************

  wire   [`COST_WIDTH-1    : 0]    cost_NxN_w       ;
  wire   [`COST_WIDTH-1    : 0]    cost_2NxN_w      ;
  wire   [`COST_WIDTH-1    : 0]    cost_Nx2N_w      ;
  wire   [`COST_WIDTH-1    : 0]    cost_2Nx2N_w     ;

  wire                             is_NxN_bt_Nx2N   ;
  wire                             is_2NxN_bt_2Nx2N ;

  wire                             is_former_bt     ;

//*** MAIN BODY ****************************************************************

  assign cost_NxN_w   = cost_NxN_00_i + cost_NxN_01_i + cost_NxN_02_i + cost_NxN_03_i ;
  assign cost_Nx2N_w  = cost_Nx2N_0_i + cost_Nx2N_1_i ;
  assign cost_2NxN_w  = cost_2NxN_0_i + cost_2NxN_1_i ;
  assign cost_2Nx2N_w = cost_2Nx2N_i ;

  assign is_NxN_bt_Nx2N   = cost_NxN_w  < cost_Nx2N_w  ;
  assign is_2NxN_bt_2Nx2N = cost_2NxN_w < cost_2Nx2N_w ;

  assign is_former_bt = ( is_NxN_bt_Nx2N   ? cost_NxN_w  : cost_Nx2N_w  )
                      < ( is_2NxN_bt_2Nx2N ? cost_2NxN_w : cost_2Nx2N_w );

  always @(*) begin
    casex( {is_former_bt, is_NxN_bt_Nx2N ,is_2NxN_bt_2Nx2N} )
      3'b0x0  : begin partition_o = 2'b00 ; cost_best_o = cost_2Nx2N_w ; end
      3'b0x1  : begin partition_o = 2'b01 ; cost_best_o = cost_2NxN_w  ; end
      3'b10x  : begin partition_o = 2'b10 ; cost_best_o = cost_Nx2N_w  ; end
      3'b11x  : begin partition_o = 2'b11 ; cost_best_o = cost_NxN_w   ; end
      default : begin partition_o = 2'b00 ; cost_best_o = cost_2Nx2N_w ; end
    endcase
  end


//*** DEBUG ********************************************************************


endmodule