// This program was cloned from: https://github.com/Cosmos-OpenSSD/Cosmos-OpenSSD
// License: GNU General Public License v3.0

//////////////////////////////////////////////////////////////////////////////////
// nand_status.v for Cosmos OpenSSD
// Copyright (c) 2014 Hanyang University ENC Lab.
// Contributed by Taeyeong Huh <tyhuh@enc.hanyang.ac.kr>
//                Jaehyeong Jeong <jhjeong@enc.hanyang.ac.kr>
//                Yong Ho Song <yhsong@enc.hanyang.ac.kr>
//
// This file is part of Cosmos OpenSSD.
//
// Cosmos OpenSSD is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 3, or (at your option)
// any later version.
//
// Cosmos OpenSSD is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
// See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Cosmos OpenSSD; see the file COPYING.
// If not, see <http://www.gnu.org/licenses/>.
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Company: ENC Lab. <http://enc.hanyang.ac.kr>
// Engineer: Taeyeong Huh <tyhuh@enc.hanyang.ac.kr>
// 
// Project Name: Cosmos OpenSSD
// Design Name: nand controller
// Module Name: status
// File Name: nand_status.v
//
// Version: v1.1.0
//
// Description:
//   - capture nand device status information in asynchronous mode
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v1.1.0
//   - shift read data ack signal
//
// * v1.0.0
//   - first draft
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
`include "parameter.vh"
`include "nand_parameter.vh"

module status(
  //system
  input   wire                                    i_nc_clk,
  input   wire                                    i_nc_rstn,
  
  input   wire                                    i_en_n,
  output  reg                                     o_cmplt,
  input   wire                                    i_plane,       //single(0)/multi(1)
  output  reg       [`CIO_WD-'b1:0]               o_status,
  output  wire                                    o_sta_rdy,     //ready(1)/busy(0) for dara register
  output  wire                                    o_sta_dc_rdy,  //ready(1)/busy(0) for data cache
  output  wire                                    o_sta_fail,    //pass(0)/fail(1) for current page
  output  wire                                    o_sta_pp_fail, //pass(0)/fail(1) for previous page
  
  //nand interface
  input   wire      [`CIO_WD-'b1:0]               i_nand_io,   //data input
  output  wire      [`CIO_WD-'b1:0]               o_nand_io,   //data output
  output  reg                                     o_nand_io_t,   //data direction
  output  reg                                     o_nand_cle,    //command latch enable
  output  reg                                     o_nand_ce_n,   //chip enable
  output  reg                                     o_nand_we_n,   //write enable
  output  reg                                     o_nand_re_n    //read enable
  );
  
  //parameter                                                                           
  parameter         IDLE                          = 3'b000;  //0   //8'b0000_0001; //1 
  parameter         SETUP_CE                      = 3'b001;  //1   //8'b0000_0010; //2 
  parameter         CMD_INPUT_WP                  = 3'b011;  //3   //8'b0000_0100; //4 
  parameter         CMD_INPUT_WH                  = 3'b010;  //2   //8'b0000_1000; //8 
  parameter         STATUS_OUTPUT_WHR             = 3'b110;  //6   //8'b0001_0000; //10
  parameter         STATUS_OUTPUT_RP              = 3'b111;  //7   //8'b0010_0000; //20
  parameter         STATUS_OUTPUT_REH             = 3'b101;  //5   //8'b0100_0000; //40
  parameter         CMPLT                         = 3'b100;  //4   //8'b1000_0000; //80
  
  reg               [`IO_WD-'b1:0]                r_nand_io_o;
  //status capture ack
  reg                                             r_status_ack;
  //state
  reg               [2:0]                         r_current_state;
  reg               [2:0]                         r_next_state;
  //counter
  reg               [clogb2(`tCS ):0]             r_tCS_cnt;
  reg               [clogb2(`tREA):0]             r_tREA_cnt;
  reg               [clogb2(`tREH):0]             r_tREH_cnt;
  reg               [clogb2(`tRHZ):0]             r_tRHZ_cnt;
  reg               [clogb2(`tRP ):0]             r_tRP_cnt;
  reg               [clogb2(`tWP ):0]             r_tWH_cnt;
  reg               [clogb2(`tWHR):0]             r_tWHR_cnt;
  reg               [clogb2(`tWP ):0]             r_tWP_cnt;
  
  wire                                            w_read_ack;
  reg                                             r_next_read_ack;
  reg                                             r_next_read_ack_2;
  reg                                             r_next_read_ack_3;
  reg                                             r_next_read_ack_4;
  reg                                             r_next_read_ack_5;
   
  genvar i;
  generate
    for (i=0; i<`CLST; i=i+1) begin : nand_io
      assign o_nand_io[`IO_WD*(i+1)-'b1:`IO_WD*i] = r_nand_io_o;
    end
  endgenerate
  
  //data access ack
  assign w_read_ack = (r_tREA_cnt)? 'b0:'b1;

  //read data ack
  always@(negedge i_nc_clk) begin                     //simulation version
    r_next_read_ack <= w_read_ack;                    //FPGA version 수정 필요
    r_next_read_ack_2 <= r_next_read_ack ;
    r_next_read_ack_3 <= r_next_read_ack_2 ;
    r_next_read_ack_4 <= r_next_read_ack_3 ;
    r_next_read_ack_5 <= r_next_read_ack_4 ;
    //r_status_ack    <= w_read_ack & ~r_next_read_ack;
  end
  
  always @ (negedge i_nc_clk)
  begin
       r_status_ack <= ~r_next_read_ack_4 & r_next_read_ack_5 ;
  end
  
  //status capture
  always@(posedge i_nc_clk) begin
    if     (!i_nc_rstn)     o_status <= 'b0;//{`CIO_WD{1'b1}};
    else if(r_status_ack) o_status <= i_nand_io;
  end
  
  //status signal
  assign o_sta_dc_rdy  = o_status[6];//&{o_status[30],o_status[22],o_status[14],o_status[6]}; //ready(1)/busy(0) for data cache
  assign o_sta_rdy     = o_status[5];//&{o_status[29],o_status[21],o_status[13],o_status[5]}; //ready(1)/busy(0)
  assign o_sta_pp_fail = o_status[1];//|{o_status[25],o_status[17],o_status[9], o_status[1]}; //pass(0)/fail(1) for previous page
  assign o_sta_fail    = o_status[0];//|{o_status[24],o_status[16],o_status[8], o_status[0]}; //pass(0)/fail(1) for current page
  
  //counter for ac timing characteristics
  always@(posedge i_nc_clk) begin
    if(!i_nc_rstn) begin
        r_tCS_cnt  <= `tCS;
        r_tREA_cnt <= `tREA;
        r_tREH_cnt <= `tREH;
        r_tRHZ_cnt <= `tRHZ;
        r_tRP_cnt  <= `tRP;
        r_tWH_cnt  <= `tWP;
        r_tWHR_cnt <= `tWHR;
        r_tWP_cnt  <= `tWP;
    end else begin
      case(r_current_state)
        IDLE: begin
          r_tCS_cnt  <= `tCS;
          r_tREA_cnt <= `tREA;
          r_tREH_cnt <= `tREH;
          r_tRP_cnt  <= `tRP;
          r_tWH_cnt  <= `tWP;
          r_tWHR_cnt <= `tWHR;
          r_tWP_cnt  <= `tWP;
        end
        SETUP_CE: begin
          r_tCS_cnt  <= (r_tCS_cnt !='b0)?r_tCS_cnt-1 :r_tCS_cnt;
          r_tWP_cnt <= `tWP;
          r_tWH_cnt <= `tWH;
        end
        CMD_INPUT_WP: begin
          r_tCS_cnt <= `tCS;
          r_tWP_cnt <= (r_tWP_cnt!='b0)?r_tWP_cnt-'b1:r_tWP_cnt;
          r_tWH_cnt <= `tWH;
        end
        CMD_INPUT_WH: begin
          r_tCS_cnt <= `tCS;
          r_tWP_cnt <= `tWP;
          r_tWH_cnt <= (r_tWH_cnt!='b0)?r_tWH_cnt-'b1:r_tWH_cnt;
          r_tWHR_cnt <= (r_tWHR_cnt!='b0)?r_tWHR_cnt-'b1:r_tWHR_cnt;
        end
        STATUS_OUTPUT_WHR: begin //10
          r_tREA_cnt <= (r_tREA_cnt!='b0)?r_tREA_cnt-'b1:r_tREA_cnt;
          r_tWHR_cnt <= (r_tWHR_cnt!='b0)?r_tWHR_cnt-'b1:r_tWHR_cnt;
        end
        STATUS_OUTPUT_RP:begin   //20
          r_tREA_cnt <= `tREA ;//r_tREA_cnt <= (r_tREA_cnt!='b0)?r_tREA_cnt-'b1:r_tREA_cnt;
          r_tRHZ_cnt <= `tRHZ;
          r_tRP_cnt  <= (r_tRP_cnt!='b0)?r_tRP_cnt-'b1:r_tRP_cnt;
          r_tWHR_cnt <= `tWHR;
        end
        STATUS_OUTPUT_REH:begin //40
          r_tREA_cnt <= `tREA ;//r_tREA_cnt <= (r_tREA_cnt!='b0)?r_tREA_cnt-'b1:r_tREA_cnt;
          r_tREH_cnt <= (r_tREH_cnt!='b0)?r_tREH_cnt-'b1:r_tREH_cnt;
          r_tRHZ_cnt <= (r_tRHZ_cnt!='b0)?r_tRHZ_cnt-'b1:r_tRHZ_cnt;
          r_tRP_cnt  <= `tRP;
          r_tWHR_cnt <= `tWHR;
        end
        CMPLT : begin
          r_tRHZ_cnt <= (r_tRHZ_cnt!='b0)?r_tRHZ_cnt-'b1:r_tRHZ_cnt;
        end
      endcase
    end
  end
  
  //finite state machine
  always@( * ) begin
    case(r_current_state)
      IDLE: begin
        o_nand_cle  <= 'b0;
        o_nand_ce_n <= 'b1;
        o_nand_we_n <= 'b1;
        o_nand_re_n <= 'b1;
        o_nand_io_t <= 'b1;
        r_nand_io_o <= 'b0;
        if(!i_en_n)
          r_next_state <= SETUP_CE;
        else
          r_next_state <= IDLE;
      end
      SETUP_CE: begin
        o_nand_cle  <= 'b1;
        o_nand_ce_n <= 'b0;
        o_nand_we_n <= 'b1;
        o_nand_re_n <= 'b1;
        o_nand_io_t <= 'b1;
        r_nand_io_o <= 'b0;
        if(!r_tCS_cnt)
          r_next_state <= CMD_INPUT_WP;
        else
          r_next_state <= SETUP_CE;
      end
      CMD_INPUT_WP: begin
        o_nand_cle  <= 'b1;
        o_nand_ce_n <= 'b0;
        o_nand_we_n <= 'b0;
        o_nand_re_n <= 'b1;
        o_nand_io_t <= 'b0; //program
        if(!i_plane) //single plane
          r_nand_io_o <= `READ_STATUS_REGISTER;
        else //multi plane
          r_nand_io_o <= `MULTI_PLANE_READ_STATUS_REGISTER;
        if(!r_tWP_cnt)
          r_next_state <= CMD_INPUT_WH;
        else
          r_next_state <= CMD_INPUT_WP;
      end
      CMD_INPUT_WH: begin
        o_nand_cle  <= 'b1;
        o_nand_ce_n <= 'b0;
        o_nand_we_n <= 'b1;
        o_nand_re_n <= 'b1;
        o_nand_io_t <= 'b0; //program
        if(!i_plane) //single plane
          r_nand_io_o <= `READ_STATUS_REGISTER;
        else //multi plane
          r_nand_io_o <= `MULTI_PLANE_READ_STATUS_REGISTER;
        if(!r_tWH_cnt)
          r_next_state <= STATUS_OUTPUT_WHR;
        else
          r_next_state <= CMD_INPUT_WH;
      end
      STATUS_OUTPUT_WHR: begin
        o_nand_cle  <= 'b0;
        o_nand_ce_n <= 'b0;
        o_nand_we_n <= 'b1;
        o_nand_re_n <= 'b1;
        o_nand_io_t <= 'b1; //read
        r_nand_io_o <= 'b0;
        if(!r_tWHR_cnt)
          r_next_state <= STATUS_OUTPUT_RP;
        else
          r_next_state <= STATUS_OUTPUT_WHR;
      end
      STATUS_OUTPUT_RP: begin
        o_nand_cle  <= 'b0;
        o_nand_ce_n <= 'b0;
        o_nand_we_n <= 'b1;
        o_nand_re_n <= 'b0;
        o_nand_io_t <= 'b1;
        r_nand_io_o <= 'b0;
        if(!r_tRP_cnt)
          r_next_state <= STATUS_OUTPUT_REH;
        else
          r_next_state <= STATUS_OUTPUT_RP;
      end
      STATUS_OUTPUT_REH: begin
        o_nand_cle  <= 'b0;
        o_nand_ce_n <= 'b0;
        o_nand_we_n <= 'b1;
        o_nand_re_n <= 'b1;
        o_nand_io_t <= 'b1;
        r_nand_io_o <= 'b0;
        if(!r_tREH_cnt)
          r_next_state <= CMPLT;
        else
          r_next_state <= STATUS_OUTPUT_REH;
      end
      CMPLT: begin
        o_nand_cle  <= 'b0;
        o_nand_ce_n <= 'b1;
        o_nand_we_n <= 'b1;
        o_nand_re_n <= 'b1;
        o_nand_io_t <= 'b1;
        r_nand_io_o <= 'b0;
        if(r_tRHZ_cnt)
          r_next_state <= CMPLT;
        else
          r_next_state <= IDLE;
      end
      default: begin
        o_nand_cle  <= 'b0;
        o_nand_ce_n <= 'b1;
        o_nand_we_n <= 'b1;
        o_nand_re_n <= 'b1;
        o_nand_io_t <= 'b1;
        r_nand_io_o <= 'b0;
        r_next_state <= CMPLT;
      end
    endcase
  end
  
  //done
  always@( * ) begin
    case(r_current_state)
      CMPLT  : //o_cmplt <= 'b1;
          if(r_tRHZ_cnt)  o_cmplt <= 'b0;
          else            o_cmplt <= 'b1;
      default:            o_cmplt <= 'b0;
    endcase
  end
  
  //state update
  always@(posedge i_nc_clk) begin
    if(!i_nc_rstn)
      r_current_state <= IDLE;
    else begin
      if(i_en_n)
        r_current_state <= IDLE;
      else
        r_current_state <= r_next_state;
    end
  end
  
//function - register width
function integer clogb2;
  input [31:0] value;
  integer i;
  begin
    clogb2 = 0;
    for(i = 0; 2**i < value; i = i + 1)
      clogb2 = i + 1;
  end
endfunction
  
endmodule
