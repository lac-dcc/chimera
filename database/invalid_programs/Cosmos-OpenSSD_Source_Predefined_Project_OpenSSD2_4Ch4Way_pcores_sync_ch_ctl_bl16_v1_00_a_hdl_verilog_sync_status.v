//////////////////////////////////////////////////////////////////////////////////
// sync_status.v for Cosmos OpenSSD
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
// Module Name: sync_status
// File Name: sync_status.v
//
// Version: v1.1.0
//
// Description:
//   - capture nand device status information in synchronous mode
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v1.1.0
//   - change status data capture timing
//
// * v1.0.0
//   - first draft
//////////////////////////////////////////////////////////////////////////////////
`include "parameter.vh"

module sync_status(
    //system
    input   wire                 i_nc_clk            ,
    input   wire                 i_clk_o             ,
    input   wire                 i_nc_rstn           ,
    
    //flag
    input   wire                 i_status_read_begin ,
    output  reg                  o_status_read_end   ,
    output  reg                  o_st_begin          ,
    output  reg                  o_st_data_cp        ,
    
    //status data
    output  reg  [`CIO_WD-1:0]   o_st_data  ,
    
    //out PIN
    output  reg                  o_st_ce_n  ,
    output  reg                  o_st_cle   ,
    output  reg                  o_st_ale   ,
    output  reg                  o_st_wr_n  ,
    
    //NAND
    input   wire [`CIO_WD-1:0]   i_st_dq         ,
    input   wire                 i_st_dqs        ,
    output  wire                 o_sta_rdy       ,
    output  wire [`CIO_WD-1:0]   o_st_dq         ,
    output  reg                  o_st_dq_t
    );
    
    //read status
    reg [3:0] current_status_state ;
    reg [3:0] next_status_state    ;
    
    //cnt
    reg       [1:0]           r_ready_cnt ;
    reg       [2:0]           r_cnt_setup_ce  ;
    reg                       r_cnt_cmd_input ;
    reg                       r_begin_cnt;
    reg                       r_st_begin_cnt;
    reg       [1:0]           r_st_data_ready_cnt;
    reg       [1:0]           r_st_data_cp_cnt;
    
    reg       [`IO_WD-1 :0]   r_status_dq ;
    
    genvar i ;
    generate
      for (i=0 ; i<`CLST ; i=i+1) 
      begin : nand_io
            assign o_st_dq[(`IO_WD*(i+1))-1 : `IO_WD*i] = r_status_dq ;
      end
    endgenerate
    
    parameter        ST_status_idle       =  4'b0000;
    parameter        ST_status_setup_ce   =  4'b0001;
    parameter        ST_status_cmd_input  =  4'b0011;
    parameter        ST_status_begin      =  4'b0010;
    parameter        ST_status_ready      =  4'b0110;
    parameter        ST_status            =  4'b0111;
    parameter        ST_status_out        =  4'b0101;
    parameter        ST_status_cp         =  4'b0100;
    parameter        ST_status_cp_end     =  4'b1100;
    parameter        ST_status_end        =  4'b1000;

    parameter hi = 1'b1 ;
    parameter lo = 1'b0 ;
    
    assign o_sta_rdy = o_st_data[5];
    
    always @ (posedge i_nc_clk or negedge i_nc_rstn)
    begin
         if(!i_nc_rstn)
         begin
              current_status_state <= ST_status_idle ;
         end
         
         else
         begin
              current_status_state <= next_status_state ;
         end
    end
    
    
    always @ (posedge i_nc_clk)
    begin
         case(current_status_state)
             
             ST_status_setup_ce :
             begin
                  r_cnt_setup_ce  <= r_cnt_setup_ce-'b1 ;
                  r_cnt_cmd_input <= 'b1;
                  r_begin_cnt     <= 'b1;
                  r_ready_cnt     <= 'h3;
                  r_st_begin_cnt  <= 'b1;
                  r_st_data_ready_cnt <='h2;
                  r_st_data_cp_cnt <= 'h3;
             end
             
             ST_status_cmd_input :
             begin
                  r_cnt_setup_ce  <= 'h4;
                  r_cnt_cmd_input <= r_cnt_cmd_input-'b1 ;
                  r_begin_cnt     <= 'b1;
                  r_ready_cnt     <= 'h3;
                  r_st_begin_cnt  <= 'b1;
                  r_st_data_ready_cnt <='h2;
                  r_st_data_cp_cnt <= 'h3;
             end
             
             ST_status_begin :
             begin
                  r_cnt_setup_ce  <= 'h4;
                  r_cnt_cmd_input <= 'b1;
                  r_begin_cnt     <= r_begin_cnt-'b1;
                  r_ready_cnt     <= 'h3;
                  r_st_begin_cnt  <= 'b1;
                  r_st_data_ready_cnt <='h2;
                  r_st_data_cp_cnt <= 'h3;
             end
             
             ST_status_ready:
             begin
                  r_cnt_setup_ce  <= 'h4;
                  r_cnt_cmd_input <= 'b1;
                  r_begin_cnt     <= 'b1;
                  r_ready_cnt     <= r_ready_cnt-'b1;
                  r_st_begin_cnt  <= 'b1;
                  r_st_data_ready_cnt <='h2;
                  r_st_data_cp_cnt <= 'h3;
             end
             
             ST_status:
             begin
                  r_cnt_setup_ce  <= 'h4;
                  r_cnt_cmd_input <= 'b1;
                  r_begin_cnt     <= 'b1;
                  r_ready_cnt     <= 'h3;
                  r_st_begin_cnt  <= r_st_begin_cnt-'b1;
                  r_st_data_ready_cnt <='h2;
                  r_st_data_cp_cnt <= 'h3;
             end
             
             ST_status_out:
             begin
                  r_cnt_setup_ce  <= 'h4;
                  r_cnt_cmd_input <= 'b1;
                  r_begin_cnt     <= 'b1;
                  r_ready_cnt     <= 'h3;
                  r_st_begin_cnt  <= 'b1;
                  r_st_data_ready_cnt <= r_st_data_ready_cnt-'b1;
                  r_st_data_cp_cnt <= 'h3;
             end
             
             ST_status_cp_end:
             begin
                  r_cnt_setup_ce  <= 'h4;
                  r_cnt_cmd_input <= 'b1;
                  r_begin_cnt     <= 'b1;
                  r_ready_cnt     <= 'h3;
                  r_st_begin_cnt  <= 'b1;
                  r_st_data_ready_cnt <= 'h2;
                  r_st_data_cp_cnt <= r_st_data_cp_cnt-'b1;
             end
             
             default :
             begin
                  r_cnt_setup_ce  <= 'h4;
                  r_cnt_cmd_input <= 'b1;
                  r_begin_cnt     <= 'b1;
                  r_ready_cnt     <= 'h3;
                  r_st_begin_cnt  <= 'b1;
                  r_st_data_ready_cnt <='h2;
                  r_st_data_cp_cnt <= 'h3;
             end
         endcase
    end
    
    always @ (*)
    begin
         case(current_status_state)
             
             ST_status_idle :
             begin
                  next_status_state   <= (i_status_read_begin&&(!i_clk_o)) ? ST_status_setup_ce : ST_status_idle ;
                  o_st_begin          <= 'b0;
             end
             
             ST_status_setup_ce :
             begin
                  next_status_state   <= (r_cnt_setup_ce) ? ST_status_setup_ce : ST_status_cmd_input ;
                  o_st_begin          <= 'b1;
             end
             
             ST_status_cmd_input :
             begin
                  next_status_state   <= (r_cnt_cmd_input) ? ST_status_cmd_input : ST_status_begin ;
                  o_st_begin          <= 'b1;
             end
             
             ST_status_begin :
             begin
                  next_status_state   <= (r_begin_cnt) ? ST_status_begin : ST_status_ready ;
                  o_st_begin          <= 'b1;
             end

             ST_status_ready :
             begin
                  next_status_state   <= (r_ready_cnt) ? ST_status_ready : ST_status;
                  o_st_begin          <= 'b1;
             end
             
             ST_status :
             begin
                  next_status_state   <= (r_st_begin_cnt) ? ST_status : ST_status_out ;
                  o_st_begin          <= 'b1;
             end
             
             ST_status_out :
             begin
                  next_status_state   <= (r_st_data_ready_cnt) ? ST_status_out : ST_status_cp ;
                  o_st_begin          <= 'b1;
             end
             
             ST_status_cp :
             begin
                  next_status_state   <= ST_status_cp_end ;
                  o_st_begin          <= 'b1;
             end
             
             ST_status_cp_end :
             begin
                  next_status_state   <= (r_st_data_cp_cnt) ? ST_status_cp_end : ST_status_end ;
                  o_st_begin          <= 'b1;
             end
             
             ST_status_end :
             begin
                  next_status_state   <= ST_status_idle  ;
                  o_st_begin          <= 'b1;
             end
             
             default :                              
             begin
                  next_status_state   <= ST_status_idle ;
                  o_st_begin          <= 'b0;
             end
         endcase
    end
    
    always @ (posedge i_nc_clk)
    begin
         case(current_status_state)
              
             ST_status_idle :
             begin
                  o_st_ce_n   <= hi ;
                  o_st_cle    <= lo ;
                  o_st_ale    <= lo ;
                  o_st_wr_n   <= hi ;
                  r_status_dq <= 0  ;
                  o_st_dq_t   <= hi ;
             end
             ST_status_setup_ce :
             begin
                  o_st_ce_n   <= lo ;
                  o_st_cle    <= lo ;
                  o_st_ale    <= lo ;
                  o_st_wr_n   <= hi ;
                  r_status_dq <= 0  ;
                  o_st_dq_t   <= hi ;
             end
             ST_status_cmd_input :
             begin
                  o_st_ce_n   <= lo ;
                  o_st_cle    <= hi ;
                  o_st_ale    <= lo ;
                  o_st_wr_n   <= hi ;
                  r_status_dq <= 8'h70 ;
                  o_st_dq_t   <= lo ;
             end
             
             ST_status_begin :
             begin
                  o_st_ce_n   <= lo ;
                  o_st_cle    <= lo ;
                  o_st_ale    <= lo ;
                  o_st_wr_n   <= hi ;
                  r_status_dq <= 0  ;
                  o_st_dq_t   <= hi ;
             end
             
             ST_status_ready :
             begin
                  o_st_ce_n   <= lo ;
                  o_st_cle    <= lo ;
                  o_st_ale    <= lo ;
                  o_st_wr_n   <= lo ;
                  r_status_dq <= 0  ;
                  o_st_dq_t   <= hi ;
             end
             
             ST_status :
             begin
                  o_st_ce_n   <= lo ;
                  o_st_cle    <= hi ;
                  o_st_ale    <= hi ;
                  o_st_wr_n   <= lo ;
                  r_status_dq <= 0  ;
                  o_st_dq_t   <= hi ;
             end
             
             ST_status_out, ST_status_cp  :
             begin
                  o_st_ce_n   <= lo ;
                  o_st_cle    <= lo ;
                  o_st_ale    <= lo ;
                  o_st_wr_n   <= lo ;
                  r_status_dq <= 0  ;
                  o_st_dq_t   <= hi ;
             end
             
             ST_status_cp_end :
             begin
                  o_st_ce_n   <= lo ;
                  o_st_cle    <= lo ;
                  o_st_ale    <= lo ;
                  o_st_wr_n   <= hi ;
                  r_status_dq <= 0  ;
                  o_st_dq_t   <= hi ;
             end
             
             default :
             begin
                  o_st_ce_n   <= lo ;
                  o_st_cle    <= lo ;
                  o_st_ale    <= lo ;
                  o_st_wr_n   <= hi ;
                  r_status_dq <= 0  ;
                  o_st_dq_t   <= hi ;
             end
         endcase
    end

    always @ (posedge i_nc_clk)
    begin
         case(current_status_state)
         
             ST_status_idle:
             begin
                  o_st_data <= `CIO_WD'b0 ;
                  o_st_data_cp <= 'b0     ;
             end
             
             ST_status_cp, ST_status_cp_end:
             begin
                  o_st_data    <= (i_st_dqs) ? i_st_dq : o_st_data;
                  o_st_data_cp <= 'b1     ;
             end
             
             ST_status_end:
             begin
                  o_st_data <= o_st_data ;
                  o_st_data_cp <= 'b1    ;
             end
             
             default:
             begin
                  o_st_data <= o_st_data ;
                  o_st_data_cp <= 'b1    ;
             end
         endcase
    end
    
    //cmplt
    always @ (posedge i_nc_clk)
    begin
         case(current_status_state)
             ST_status_cp_end, ST_status_end: o_status_read_end <= 'b1;
             default:                         o_status_read_end <= 'b0;
         endcase
    end
    
endmodule