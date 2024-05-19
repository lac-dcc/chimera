// This program was cloned from: https://github.com/Cosmos-OpenSSD/Cosmos-OpenSSD
// License: GNU General Public License v3.0

//////////////////////////////////////////////////////////////////////////////////
// sync_setting.v for Cosmos OpenSSD
// Copyright (c) 2014 Hanyang University ENC Lab.
// Contributed by Taeyeong Huh <tyhuh@enc.hanyang.ac.kr>
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
// Module Name: sync_setting
// File Name: sync_setting.v
//
// Version: v3.0.0
//
// Description:
//   - generate mode change control signal (interface, cell type, and io drive strength)
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v3.0.0
//   - add io drive strength change mode
//
// * v2.0.0
//   - add cell type change mode
//
// * v1.0.0
//   - first draft
//////////////////////////////////////////////////////////////////////////////////
`include "parameter.vh"

module sync_setting(
    //system
    input  wire                 i_nc_clk        ,
    input  wire                 i_nc_rstn       ,
    
    //flag
    input  wire                 i_mode_ch_en_n  ,
    output reg                  o_mode_ch_ready ,  //Ready(1)/Busy(0)
    output reg                  o_mode_ch_begin ,
    
    input  wire                 i_ch_gnt        ,
    output reg                  o_ch_req        ,
    output reg                  o_m_ch_cmplt    ,
               
    //out PIN
    input  wire                 i_set_rb_n      ,
    output wire [`CIO_WD-1:0]   o_set_dq        ,
    output reg                  o_set_ce_n      ,
    output reg                  o_set_cle       ,
    output reg                  o_set_ale       ,
    output reg                  o_set_wr_n      ,
    output reg                  o_set_clk       ,
    output reg                  o_set_dq_t      
    );
    //setting
    reg       [3:0]             r_current_st_state;
    reg       [3:0]             r_next_st_state   ;
    
    //cnt                                            
    reg       [3:0]             cnt_mode_cmd         ;
    reg       [3:0]             cnt_mode_addr        ;
    reg       [4:0]             cnt_mode_wait        ;
    reg       [2:0]             cnt_mode_datain1     ;
    reg       [1:0]             cnt_mode_datain2     ;
    reg       [3:0]             cnt_mode_data        ;
                                                     
    reg       [3:0]             i_cnt_mode_cmd       ;
    reg       [3:0]             i_cnt_mode_addr      ;
    reg       [4:0]             i_cnt_mode_wait      ;
    reg       [2:0]             i_cnt_mode_datain1   ;
    reg       [1:0]             i_cnt_mode_datain2   ;
    reg       [3:0]             i_cnt_mode_data      ;
    
    reg       [`IO_WD-1 :0]     r_set_dq             ;
    
    reg                         r_set_drive_done     ;
    wire                        w_set_slc_mode_begin ;
    reg                         r_set_slc_mode_done  ;
    
    
    genvar i ;
    generate
      for (i=0 ; i<`CLST ; i=i+1) 
      begin : nand_io
            assign o_set_dq[(`IO_WD*(i+1))-1 : `IO_WD*i] = r_set_dq ;
      end
    endgenerate
    
    parameter ST_setting_idle           =  4'b0000;
    parameter ST_mode_select_wait_grt   =  4'b0001;
    parameter ST_mode_select_cmd1       =  4'b0011;
    parameter ST_mode_select_cmd2       =  4'b0010;
    parameter ST_mode_select_addr1      =  4'b0110;
    parameter ST_mode_select_addr2      =  4'b0111;
    parameter ST_mode_select_wait       =  4'b0101;
    parameter ST_mode_select_datain1    =  4'b0100;
    parameter ST_mode_select_datain2    =  4'b1100;
    parameter ST_mode_ch_wait           =  4'b1000;
    parameter ST_mode_ch_wait_n         =  4'b1010;
    parameter ST_mode_ch_end            =  4'b1011;
    parameter ST_mode_ch_cmpt           =  4'b1001;
    
    parameter hi = 1'b1 ;
    parameter lo = 1'b0 ;
    
    //cmd
    parameter set_features     = 8'hef; 
    parameter ch_slc_mode      = 8'hbe; // slc mode: 8'hbf, mlc mode: 8'hbe
    //addr
    parameter timing_mode_addr = 8'h01;
    parameter io_drive_addr    = 8'h10;
    //value
    parameter timing_mode      = 8'h12;
    parameter io_drive         = 8'h00; //00h overdrive2, 01h overdirve1, 02h nominal, 03h underdrive
    
    //state machine setting
    always @ (posedge i_nc_clk or negedge i_nc_rstn)
    begin
         if(!i_nc_rstn)
         begin
              r_current_st_state <= ST_setting_idle ;
         end
         
         else
         begin
              r_current_st_state <= r_next_st_state ;
         end
    
    end
    
    //mode select state machine
    always @ (*)
    begin
         case(r_current_st_state) 
         
             ST_setting_idle :
             begin
                  r_next_st_state <= (!i_mode_ch_en_n) ? ST_mode_select_wait_grt : ST_setting_idle ;
                  o_ch_req        <= 'b0;
             end 
             
             ST_mode_select_wait_grt:
             begin
                  r_next_st_state <= (i_ch_gnt) ? ST_mode_select_cmd1 : ST_mode_select_wait_grt ;  
                  o_ch_req        <= 'b1 ;
             end
         
             ST_mode_select_cmd1 :
             begin
                  r_next_st_state <= (i_cnt_mode_cmd == 8) ? ST_mode_select_cmd2 : ST_mode_select_cmd1 ;  //8cycles
                  o_ch_req        <= 'b1 ;
             end
             
             ST_mode_select_cmd2 :
             begin
                  r_next_st_state <= (i_cnt_mode_cmd == 12) ? (w_set_slc_mode_begin & (!r_set_slc_mode_done)) ? ST_mode_ch_wait_n : ST_mode_select_addr1 : ST_mode_select_cmd2;
                  o_ch_req        <= 'b1 ;
             end
             
             ST_mode_select_addr1 :                                  //02
             begin
                  r_next_st_state <= (i_cnt_mode_addr == 7) ? ST_mode_select_addr2 : ST_mode_select_addr1 ;  //8cycles
                  o_ch_req        <= 'b1 ;
             end
             
             ST_mode_select_addr2 :                                 //03
             begin
                  r_next_st_state <= (i_cnt_mode_addr == 11) ? ST_mode_select_wait : ST_mode_select_addr2 ; //4cycles
                  o_ch_req        <= 'b1 ;
             end
             
             ST_mode_select_wait :                                 //04
             begin
                  r_next_st_state <= (i_cnt_mode_wait == 19) ? ST_mode_select_datain1 : ST_mode_select_wait ; //20cycles
                  o_ch_req        <= 'b1 ;
             end
             
             ST_mode_select_datain1 :                                 //05
             begin
                  r_next_st_state <= (i_cnt_mode_datain1 == 5) ? ST_mode_select_datain2 : ST_mode_select_datain1 ; //6cycles
                  o_ch_req        <= 'b1 ;
             end
             
             ST_mode_select_datain2 :                                 //06
             begin
                  if(i_cnt_mode_data == 15)
                  begin
                       r_next_st_state <= ST_mode_ch_wait ;
                  end
                  
                  else
                  begin
                       r_next_st_state <= (i_cnt_mode_datain2 == 3) ? ST_mode_select_datain1 : ST_mode_select_datain2 ; //4cycles
                  end
                  
                  o_ch_req        <= 'b1 ;
             end
             
             ST_mode_ch_wait   :
             begin
                  r_next_st_state <= (i_set_rb_n) ? ST_mode_ch_wait : ST_mode_ch_wait_n ;
                  o_ch_req        <= 'b1 ;
             end
             
             ST_mode_ch_wait_n :
             begin
                  r_next_st_state <= (!i_set_rb_n) ? ST_mode_ch_wait_n : ST_mode_ch_end ;
                  o_ch_req        <= 'b1 ;
             end
             
             ST_mode_ch_end :
             begin
                  r_next_st_state <= (r_set_drive_done & r_set_slc_mode_done) ? ST_mode_ch_cmpt : ST_mode_select_cmd1;
                  o_ch_req        <= 'b1;
             end 
             
             ST_mode_ch_cmpt :
             begin
                  r_next_st_state <= ST_mode_ch_cmpt;
                  o_ch_req        <= 'b0;
             end 
             
             default :
             begin
                  r_next_st_state <= ST_setting_idle ; 
                  o_ch_req        <= 'b0 ;
             end
         endcase
    end
    
    always @ (posedge i_nc_clk)
    begin
         case(r_current_st_state)
             ST_mode_ch_cmpt: o_m_ch_cmplt <= 'b1;
             default :        o_m_ch_cmplt <= 'b0;
         endcase
    end
    
    //setting cnt
    always @ (posedge i_nc_clk or negedge i_nc_rstn)
    begin
         if(!i_nc_rstn)
         begin
              i_cnt_mode_cmd    <= 0 ;
              i_cnt_mode_addr   <= 0 ;
              i_cnt_mode_wait   <= 0 ;
              i_cnt_mode_datain1<= 0 ;
              i_cnt_mode_datain2<= 0 ;
              i_cnt_mode_data   <= 0 ;
         end
         
         else
         begin
              i_cnt_mode_cmd    <= cnt_mode_cmd     ;
              i_cnt_mode_addr   <= cnt_mode_addr    ;
              i_cnt_mode_wait   <= cnt_mode_wait    ;
              i_cnt_mode_datain1<= cnt_mode_datain1 ;
              i_cnt_mode_datain2<= cnt_mode_datain2 ;
              i_cnt_mode_data   <= cnt_mode_data    ;
         end
    end
    
    always @ (*)
    begin
         case(r_current_st_state)
         
             ST_mode_select_cmd1, ST_mode_select_cmd2 :
             begin
                  cnt_mode_cmd      <= i_cnt_mode_cmd + 1 ;
                  cnt_mode_addr     <= 0                  ;
                  cnt_mode_wait     <= 0                  ;
                  cnt_mode_datain1  <= 0                  ;
                  cnt_mode_datain2  <= 0                  ;
                  cnt_mode_data     <= 0                  ;
             end
             
             ST_mode_select_addr1 :
             begin
                  cnt_mode_cmd     <= 0                   ;
                  cnt_mode_addr    <= i_cnt_mode_addr + 1 ;
                  cnt_mode_wait    <= 0                   ;
                  cnt_mode_datain1 <= 0                   ;
                  cnt_mode_datain2 <= 0                   ;
                  cnt_mode_data    <= 0                   ;
             end
             
             ST_mode_select_addr2 :
             begin
                  cnt_mode_cmd     <= 0                   ;
                  cnt_mode_addr    <= i_cnt_mode_addr + 1 ;
                  cnt_mode_wait    <= 0                   ;
                  cnt_mode_datain1 <= 0                   ;
                  cnt_mode_datain2 <= 0                   ;
                  cnt_mode_data    <= 0                   ;
             end
             
             ST_mode_select_wait :
             begin
                  cnt_mode_cmd     <= 0                   ;
                  cnt_mode_addr    <= 0                   ;
                  cnt_mode_wait    <= i_cnt_mode_wait + 1 ;
                  cnt_mode_datain1 <= 0                   ;
                  cnt_mode_datain2 <= 0                   ;
                  cnt_mode_data    <= 0                   ;
             end
             
             ST_mode_select_datain1 :
             begin
                  cnt_mode_cmd     <= 0                                                      ;
                  cnt_mode_addr    <= 0                                                      ;
                  cnt_mode_wait    <= 0                                                      ;
                  cnt_mode_datain1 <= (i_cnt_mode_datain1 == 5) ? 0 : i_cnt_mode_datain1 + 1 ;
                  cnt_mode_datain2 <= 0                                                      ;
                  cnt_mode_data    <= i_cnt_mode_data                                        ;
             end
             
             ST_mode_select_datain2 :
             begin
             
                  cnt_mode_cmd     <= 0                                                      ;
                  cnt_mode_addr    <= 0                                                      ;
                  cnt_mode_wait    <= 0                                                      ;
                  cnt_mode_datain1 <= 0                                                      ;
                  cnt_mode_datain2 <= (i_cnt_mode_datain2 == 3) ? 0 : i_cnt_mode_datain2 + 1 ;
                  cnt_mode_data    <= i_cnt_mode_data + 1                                    ;
             end
         
             default : 
             begin
                  cnt_mode_cmd     <= 0 ;
                  cnt_mode_addr    <= 0 ;
                  cnt_mode_wait    <= 0 ;
                  cnt_mode_datain1 <= 0 ;
                  cnt_mode_datain2 <= 0 ;
                  cnt_mode_data    <= 0 ;
             end
         endcase
    end
    
    always @ (posedge i_nc_clk)
    begin
         case(r_current_st_state) 
             
             ST_setting_idle, ST_mode_ch_cmpt :
             begin
                  o_set_ce_n     <= hi         ;  
                  o_set_cle      <= lo         ;
                  o_set_ale      <= lo         ;
                  o_set_wr_n     <= hi         ;
                  o_set_clk      <= hi         ;
                  r_set_dq       <= 8'h0       ;
                  o_set_dq_t     <= hi         ;
             end
         
             ST_mode_select_cmd1 :
             begin
                  o_set_ce_n     <= lo           ;
                  o_set_cle      <= hi           ;
                  o_set_ale      <= lo           ;
                  o_set_wr_n     <= hi           ;
                  o_set_clk      <= lo           ;
                  r_set_dq       <= (w_set_slc_mode_begin & (!r_set_slc_mode_done)) ? ch_slc_mode : set_features;
                  o_set_dq_t     <= lo           ;
             end
             
             ST_mode_select_cmd2 :
             begin
                  o_set_ce_n     <= lo           ;
                  o_set_cle      <= hi           ;
                  o_set_ale      <= lo           ;
                  o_set_wr_n     <= hi           ;
                  o_set_clk      <= hi           ;
                  r_set_dq       <= (w_set_slc_mode_begin & (!r_set_slc_mode_done)) ? ch_slc_mode : set_features;
                  o_set_dq_t     <= lo           ;
             end
         
             ST_mode_select_addr1 :
             begin
                  o_set_ce_n     <= lo          ;
                  o_set_cle      <= lo          ;
                  o_set_ale      <= hi          ;
                  o_set_wr_n     <= hi          ;
                  o_set_clk      <= lo          ;
                  r_set_dq       <= (r_set_drive_done) ? timing_mode_addr : io_drive_addr;
                  o_set_dq_t     <= lo          ;
             end
             
             ST_mode_select_addr2 :
             begin
                  o_set_ce_n     <= lo          ;
                  o_set_cle      <= lo          ;
                  o_set_ale      <= hi          ;
                  o_set_wr_n     <= hi          ;
                  o_set_clk      <= hi          ;
                  r_set_dq       <= (r_set_drive_done) ? timing_mode_addr : io_drive_addr;
                  o_set_dq_t     <= lo ;
             end   
             
             ST_mode_select_wait :
             begin
                  o_set_ce_n     <= lo          ;
                  o_set_cle      <= lo          ;
                  o_set_ale      <= lo          ;
                  o_set_wr_n     <= hi          ;
                  o_set_clk      <= hi          ;
                  r_set_dq       <= 8'h0        ;
                  o_set_dq_t     <= hi          ;
             end
             
             ST_mode_select_datain1 :
             begin
                  o_set_ce_n     <= lo          ;
                  o_set_cle      <= lo          ;
                  o_set_ale      <= lo          ;
                  o_set_wr_n     <= hi          ;
                  o_set_clk      <= lo          ;
                  r_set_dq       <= (i_cnt_mode_data == 0) ? (r_set_drive_done) ? timing_mode : io_drive : 8'h00 ;
                  o_set_dq_t     <= lo ;
             end
             
             ST_mode_select_datain2 :
             begin
                  o_set_ce_n     <= lo          ;
                  o_set_cle      <= lo          ;
                  o_set_ale      <= lo          ;
                  o_set_wr_n     <= hi          ;
                  o_set_clk      <= hi          ;
                  r_set_dq       <= (i_cnt_mode_data == 0 || i_cnt_mode_data == 1) ? (r_set_drive_done) ? timing_mode : io_drive : 8'h00 ;
                  o_set_dq_t     <= lo ;
             end
           
             ST_mode_ch_end :
             begin
                  o_set_ce_n     <= lo          ;
                  o_set_cle      <= lo          ;
                  o_set_ale      <= lo          ;
                  o_set_wr_n     <= hi          ;
                  o_set_clk      <= hi          ;
                  r_set_dq       <= 8'h0        ;
                  o_set_dq_t     <= hi          ;
             end
             default :
             begin
                  o_set_ce_n     <= lo          ;
                  o_set_cle      <= lo          ;
                  o_set_ale      <= lo          ;
                  o_set_wr_n     <= hi          ;
                  o_set_clk      <= hi          ;
                  r_set_dq       <= 8'h0        ;
                  o_set_dq_t     <= hi          ;
             end
         endcase
    end
    
    always @ (posedge i_nc_clk or negedge i_nc_rstn)
    begin
         if(!i_nc_rstn) r_set_drive_done <= 'b0;
         else
         begin
              case(r_current_st_state)
                   ST_mode_ch_end  : r_set_drive_done <= 'b1;
                   default         : r_set_drive_done <= r_set_drive_done;
              endcase
         end
    end
    
    always @ (posedge i_nc_clk or negedge i_nc_rstn)
    begin
         if(!i_nc_rstn) r_set_slc_mode_done <= 'b0;
         else
         begin
              case(r_current_st_state)
                   ST_mode_ch_end  : r_set_slc_mode_done <= (!r_set_drive_done) ? 'b0 : 'b1;
                   default         : r_set_slc_mode_done <= r_set_slc_mode_done;
              endcase
         end
    end
    
    assign w_set_slc_mode_begin = r_set_drive_done;
    
    always @ (*)
    begin
         case(r_current_st_state)
             ST_setting_idle, ST_mode_select_wait_grt, ST_mode_ch_end, ST_mode_ch_cmpt : o_mode_ch_begin <= 'b0 ;
             default : o_mode_ch_begin <= 'b1 ;
         endcase
    end
    
    always @ (posedge i_nc_clk)
    begin
         case(r_current_st_state)
             ST_setting_idle, ST_mode_ch_cmpt: o_mode_ch_ready <= 'b1 ;
             default: o_mode_ch_ready <= 'b0 ;
         endcase
    end

endmodule
