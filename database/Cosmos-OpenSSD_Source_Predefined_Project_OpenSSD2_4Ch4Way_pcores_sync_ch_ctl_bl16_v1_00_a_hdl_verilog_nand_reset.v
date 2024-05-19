// This program was cloned from: https://github.com/Cosmos-OpenSSD/Cosmos-OpenSSD
// License: GNU General Public License v3.0

//////////////////////////////////////////////////////////////////////////////////
// nand_reset.v for Cosmos OpenSSD
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
// Module Name: reset
// File Name: nand_reset.v
//
// Version: v1.0.0
//
// Description:
//   - generate reset control signal of asynchronous nand device
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v1.0.0
//   - first draft
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
`include "parameter.vh"
`include "nand_parameter.vh"

module reset #(
  parameter         STA_REG_RI                    = `STA_REG_RI-1
)(
  //system
  input   wire                                    i_nc_clk,
  input   wire                                    i_nc_rstn,
  //host interface                                
  input   wire                                    i_en_n,
  output  reg                                     o_ready,       //busy(0)/ready(1)
  output  reg                                     o_rst_begin,
  output  wire      [`CIO_WD-1:0]                 o_status,
  output  reg                                     o_st_data_cp,
  //channel arbitration
  output  reg                                     o_ch_req,      //request channel authority
  input   wire                                    i_ch_gnt,      //grant channel authority

  //nand interface
  input   wire      [`CIO_WD-1:0]                 i_nand_io,     //data input
  output  wire      [`CIO_WD-1:0]                 o_nand_io,     //data output
  output  reg                                     o_nand_io_t,   //data direction
  output  reg                                     o_nand_cle,    //command latch enable
  output  reg                                     o_nand_ce_n,   //chip enable
  output  reg                                     o_nand_we_n,   //write enable
  output  reg                                     o_nand_re_n,   //read enable
  input   wire                                    i_nand_rb      //ready(1)/busy(0)
  );
  
  //parameter                                                     
  parameter         IDLE            = 4'b0000;  //0  //4'b0001;  //1    //9'h0_0_1;
  parameter         WAIT_GRT        = 4'b0001;  //1  //4'b0011;  //3    //9'h0_0_2;
  parameter         SETUP_CE        = 4'b0011;  //3  //4'b0010;  //2    //9'h0_0_4;
  parameter         CMD_INPUT_WP    = 4'b0010;  //2  //4'b0110;  //6    //9'h0_0_8;
  parameter         CMD_INPUT_WH    = 4'b0110;  //6  //4'b0111;  //7    //9'h0_1_0;
  parameter         RESET_WB        = 4'b0111;  //7  //4'b0101;  //5    //9'h0_2_0;
  parameter         CHK_STA         = 4'b0101;  //5  //4'b0100;  //4    //9'h0_4_0;
  parameter         WAIT_SRRI       = 4'b0100;  //4  //4'b1100;  //c    //9'h0_8_0;
  parameter         CMPLT           = 4'b1100;  //c  //4'b1101;  //d    //9'h1_0_0;
  
  //state
  reg               [3:0]                         r_current_state;
  reg               [3:0]                         r_next_state;
  reg               [`IO_WD-1:0]                  r_nand_io_o;
  
  //counter
  reg               [clogb2(`tCS):0]              r_tCS_cnt;
  reg               [clogb2(`tWP):0]              r_tWP_cnt;
  reg               [clogb2(`tWH):0]              r_tWH_cnt;
  reg               [clogb2(`tWB):0]              r_tWB_cnt;
  reg               [clogb2(STA_REG_RI):0]        r_SRRI_cnt;
  
  //sub module reg/wire
  reg                                             r_rsr_en_n;
  wire                                            w_rsr_cmplt;
  wire                                            w_rsr_plane;
  wire              [`CIO_WD-1:0]                 w_rsr_status;
  wire                                            w_nand_rdy;
  wire              [`CIO_WD-1:0]                 w_rsr_io_o;
  wire                                            w_rsr_io_t;
  wire                                            w_rsr_cle ;
  wire                                            w_rsr_ce_n;
  wire                                            w_rsr_we_n;
  wire                                            w_rsr_re_n;
  wire              [`CIO_WD-1:0]                 w_nand_io_o;
  
  assign o_status = w_rsr_status;
  
  assign o_nand_io = (r_rsr_en_n) ? w_nand_io_o : w_rsr_io_o;
  
  genvar i;
  generate
    for (i=0; i<`CLST; i=i+1) begin: nand_io
      assign w_nand_io_o[`IO_WD*(i+1)-1:`IO_WD*i] = r_nand_io_o;
    end
  endgenerate
  
  //counter for ac timing characteristics
  always@(posedge i_nc_clk) begin
    case(r_current_state)
      IDLE: begin
        r_tCS_cnt <= `tCS;
        r_tWP_cnt <= `tWP;
        r_tWH_cnt <= `tWH;
        r_SRRI_cnt <= STA_REG_RI;
        r_tWB_cnt <= `tWB;
      end
      SETUP_CE: begin
        r_tCS_cnt <= (r_tCS_cnt!= 0) ? r_tCS_cnt-1:r_tCS_cnt;
        r_tWP_cnt <= `tWP;
        r_tWH_cnt <= `tWH;
      end
      CMD_INPUT_WP: begin
        r_tCS_cnt <= `tCS;
        r_tWP_cnt <= (r_tWP_cnt!=0) ? r_tWP_cnt-1:r_tWP_cnt;
        r_tWH_cnt <= `tWH;
      end
      CMD_INPUT_WH: begin
        r_tCS_cnt <= `tCS;
        r_tWP_cnt <= `tWP;
        r_tWH_cnt <= (r_tWH_cnt!=0) ? r_tWH_cnt-1:r_tWH_cnt;
        r_tWB_cnt <= (r_tWB_cnt!=0) ? r_tWB_cnt-1:r_tWB_cnt;
      end
      CHK_STA: begin
        r_SRRI_cnt <= STA_REG_RI;
      end
      RESET_WB: begin
        r_tCS_cnt <= `tCS;
        r_tWB_cnt <= (r_tWB_cnt!=0) ? r_tWB_cnt-1:r_tWB_cnt;
        r_tWP_cnt <= `tWP;
        r_tWH_cnt <= `tWH;
      end
      WAIT_SRRI: begin
        r_SRRI_cnt <= (r_SRRI_cnt!=0) ? r_SRRI_cnt-1:r_SRRI_cnt;
      end
    endcase
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
        if(!i_en_n) begin
          o_ch_req <= 'b1;
          r_next_state <= WAIT_GRT;
        end else begin
          o_ch_req <= 'b0;
          r_next_state <= IDLE;
        end
      end
      WAIT_GRT: begin
        o_ch_req <= 'b1;
        o_nand_cle  <= 'b0;
        o_nand_ce_n <= 'b1;
        o_nand_we_n <= 'b1;
        o_nand_re_n <= 'b1;
        o_nand_io_t <= 'b1;
        r_nand_io_o <= 'b0;
        if(i_ch_gnt) begin
          r_next_state <= SETUP_CE;
        end else begin
          r_next_state <= WAIT_GRT;
        end
      end
      SETUP_CE: begin
        o_ch_req <= 'b1;
        o_nand_cle  <= 'b1;
        o_nand_ce_n <= 'b0;
        o_nand_we_n <= 'b0;
        o_nand_re_n <= 'b1;
        o_nand_io_t <= 'b0; //program
        r_nand_io_o <= `RESET;
        if(!r_tCS_cnt)
          r_next_state <= CMD_INPUT_WP;
        else
          r_next_state <= SETUP_CE;
      end
      CMD_INPUT_WP: begin
        o_ch_req <= 'b1;
        o_nand_cle  <= 'b1;
        o_nand_ce_n <= 'b0;
        o_nand_we_n <= 'b0;
        o_nand_re_n <= 'b1;
        o_nand_io_t <= 'b0; //program
        r_nand_io_o <= `RESET;
        if(!r_tWP_cnt)
          r_next_state <= CMD_INPUT_WH;
        else
          r_next_state <= CMD_INPUT_WP;
      end
      CMD_INPUT_WH: begin
        o_ch_req <= 'b1;
        o_nand_cle  <= 'b1;
        o_nand_ce_n <= 'b0;
        o_nand_we_n <= 'b1;
        o_nand_re_n <= 'b1;
        o_nand_io_t <= 'b0; //program
        r_nand_io_o <= `RESET;
        if(!r_tWH_cnt)
          r_next_state <= RESET_WB;
        else
          r_next_state <= CMD_INPUT_WH;
      end
      RESET_WB: begin
        o_nand_cle  <= 'b0;
        o_nand_ce_n <= 'b1;
        o_nand_we_n <= 'b1;
        o_nand_re_n <= 'b1;
        o_nand_io_t <= 'b1;
        r_nand_io_o <= 'b0;
        if(!r_tWB_cnt) begin
          o_ch_req <= 'b1;
          r_next_state <= CHK_STA;
        end else begin
          o_ch_req <= 'b0;
          r_next_state <= RESET_WB;
        end
      end
      CHK_STA: begin
        o_ch_req <= 'b1;
        o_nand_cle  <= w_rsr_cle;
        o_nand_ce_n <= w_rsr_ce_n;
        o_nand_we_n <= w_rsr_we_n;
        o_nand_re_n <= w_rsr_re_n;
        o_nand_io_t <= w_rsr_io_t;
        r_nand_io_o <= 'b0;
        if(w_rsr_cmplt) begin
          o_ch_req <= 'b0;
          if(w_nand_rdy) //ready
            r_next_state <= CMPLT;
          else //busy
            r_next_state <= WAIT_SRRI;
        end else
          r_next_state <= CHK_STA;
      end
      WAIT_SRRI: begin
        o_ch_req  <= 'b0;
        o_nand_cle  <= 'b0;
        o_nand_ce_n <= 'b1;
        o_nand_we_n <= 'b1;
        o_nand_re_n <= 'b1;
        o_nand_io_t <= 'b1;
        r_nand_io_o <= 'b0;
        if(r_SRRI_cnt) 
          r_next_state <= WAIT_SRRI;
        else
          r_next_state <= CHK_STA;
      end
      CMPLT: begin
        o_ch_req <= 'b0;
        o_nand_cle  <= 'b0;
        o_nand_ce_n <= 'b1;
        o_nand_we_n <= 'b1;
        o_nand_re_n <= 'b1;
        o_nand_io_t <= 'b1;
        r_nand_io_o <= 'b0;
        r_next_state <= IDLE;
      end
      default: begin
        o_ch_req <= 'b0;
        o_nand_cle  <= 'b0;
        o_nand_ce_n <= 'b1;
        o_nand_we_n <= 'b1;
        o_nand_re_n <= 'b1;
        o_nand_io_t <= 'b1;
        r_nand_io_o <= 'b0;
        r_next_state <= IDLE;
      end
    endcase
  end
  
  //ready/busy
  always@( posedge i_nc_clk ) begin
    case(r_current_state)
      IDLE, CMPLT  : o_ready <= 'b1;
      default: o_ready <= 'b0;
    endcase
  end
  
  //state update
  always@(posedge i_nc_clk) begin
    if(!i_nc_rstn)
      r_current_state <= IDLE;
    else begin    
    r_current_state <= r_next_state;
  end end
  
  always@( * ) begin
    case(r_current_state)
      CHK_STA: if(i_ch_gnt) r_rsr_en_n <= 'b0;
               else         r_rsr_en_n <= 'b1;
      default:              r_rsr_en_n <= 'b1;
    endcase
  end
  
  always @ (posedge i_nc_clk)
  begin
       case(r_current_state)
           IDLE, CMPLT, WAIT_GRT : o_rst_begin <= 'b0 ;
           default : o_rst_begin <= 'b1 ;
       endcase
  end
  
  //data capture
  always @ (*)
  begin
       case(r_current_state)
           CMPLT   : o_st_data_cp <= 'b1 ;
           default : o_st_data_cp <= 'b0 ;
       endcase
  end
  
  assign w_rsr_plane = 'b0; //single plane
  
  //module instance
  status rst_rsr0(
  .i_nc_clk(i_nc_clk), .i_nc_rstn(i_nc_rstn),
  .i_en_n(r_rsr_en_n), .o_cmplt(w_rsr_cmplt),
  .i_plane(w_rsr_plane), .o_status(w_rsr_status),
  .o_sta_rdy(w_nand_rdy),
  .i_nand_io(i_nand_io), .o_nand_io(w_rsr_io_o), .o_nand_io_t(w_rsr_io_t),
  .o_nand_cle(w_rsr_cle), .o_nand_ce_n(w_rsr_ce_n),
  .o_nand_we_n(w_rsr_we_n), .o_nand_re_n(w_rsr_re_n)
  );

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
