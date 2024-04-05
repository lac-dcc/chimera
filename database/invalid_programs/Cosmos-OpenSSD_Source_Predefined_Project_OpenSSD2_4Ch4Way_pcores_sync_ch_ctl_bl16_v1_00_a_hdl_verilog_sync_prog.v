//////////////////////////////////////////////////////////////////////////////////
// sync_prog.v for Cosmos OpenSSD
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
// Module Name: sync_prog
// File Name: sync_prog.v
//
// Version: v2.1.0
//
// Description:
//   - generate page program control signal in synchronous mode
//   - program spare data(40B) and user data(8KB)
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v2.1.0
//   - add spare data program(40B)
//
// * v2.0.0
//   - modify program chunk size(2KB)
//
// * v1.0.0
//   - first draft
//////////////////////////////////////////////////////////////////////////////////
`include "parameter.vh"

module sync_prog(

    //system
    input  wire                        i_nc_clk     ,
    input  wire                        i_clk_o      ,
    input  wire                        i_nc_rstn    ,

    //flag
    input  wire                        i_prog_begin ,
    output reg                         o_prog_end   ,
    output reg                         o_m2b_req    ,
    input  wire                        i_m2b_cmplt  ,
    output wire                        o_sp_en      ,
    output reg                         o_dqs_ce     ,

    //out PIN
    output reg [`CIO_WD-1:0]           o_prog_dq    ,
    output reg                         o_prog_ce_n  ,
    output reg                         o_prog_cle   ,
    output reg                         o_prog_ale   , 
    output reg                         o_prog_wr_n  ,
    output reg                         o_prog_dqs_t ,
    output reg                         o_prog_dq_t  ,
    
    //pbuf ctl
    input  wire [`CIO_WD-1:0]          i_b2n_data   ,  //to nand
    output reg  [`NAND_PBAWIDTH-1:0]   o_b2n_addr   ,
    output reg                         o_b2n_en     ,
    output reg                         o_b2n_we
    );
    
    //DATAin part
    reg [3:0] current_datain_state ;
    reg [3:0] next_datain_state    ;
    
    //counter
    reg [`NAND_PBAWIDTH-1:0]     count_datain_i ;
    reg [`NAND_PBAWIDTH-1:0]     count_datain   ;
    reg [2:0]                    r_begin_cnt    ;
    reg [1:0]                    r_datain_ready_cnt;
    reg                          r_datain_end_cnt;

    reg [`CIO_WD-1:0]            r_prog_dq   ;
    reg [1 : 0]                  r_trf_cnt   ;
    reg                          r_spare_done;
    reg [`NAND_PBAWIDTH-1:0]     r_cnt_para  ;
    
    parameter ST_datain_idle      = 4'b0000;
    parameter ST_datain_m2b       = 4'b0001;
    parameter ST_clk_syn          = 4'b0011;
    parameter ST_datain_begin     = 4'b0010;
    parameter ST_datain_ready_1   = 4'b0110;
    parameter ST_datain_ready_2   = 4'b0111;
    parameter ST_datain1          = 4'b0101;
    parameter ST_datain2          = 4'b0100;
    parameter ST_datain3          = 4'b1100;
    parameter ST_datain_end_1     = 4'b1101;
    parameter ST_datain_end_2     = 4'b1111;
    parameter ST_datain_end_3     = 4'b1110;
    parameter ST_datain_end_4     = 4'b1010;
    parameter ST_sddatain_end     = 4'b1011;
    
    parameter hi = 1'b1 ;
    parameter lo = 1'b0 ;
    
    parameter DATA_COUNT =  (`PBDEPTH)/2-1;//511
    parameter SDATA_COUNT = (`SBDEPTH)/2-1;//19
    
    assign o_sp_en = !r_spare_done;
    
    always @ (*)
    begin
         case(r_spare_done)
             1'b0    : r_cnt_para <= SDATA_COUNT;
             default : r_cnt_para <= DATA_COUNT;
         endcase
    end
    
    always @ (posedge i_nc_clk or negedge i_nc_rstn)
    begin
         if(!i_nc_rstn)
         begin
              current_datain_state <= ST_datain_idle ;
         end
         
         else
         begin
              current_datain_state <= next_datain_state ;
         end
    end
    
    always @ (*)
    begin
         case(current_datain_state)
             
             ST_datain_idle :
             begin
                  next_datain_state <= (i_prog_begin) ? (r_spare_done) ? ST_datain_m2b : ST_clk_syn : ST_datain_idle ;
             end 
             
             ST_datain_m2b :
             begin
                  
                  if(i_m2b_cmplt)
                  begin
                       next_datain_state <= ST_clk_syn ;
                  end
                  
                  else
                  begin
                       next_datain_state <= ST_datain_m2b ;
                  end
             end
             
             ST_clk_syn :
             begin
                  next_datain_state <= (i_clk_o) ? ST_clk_syn : ST_datain_begin ;
             end
             
             ST_datain_begin :
             begin
                  next_datain_state <= (r_begin_cnt) ? ST_datain_begin : ST_datain_ready_1 ;
             end
             
             ST_datain_ready_1 :
             begin
                  next_datain_state <= ST_datain_ready_2 ;
             end
             
             ST_datain_ready_2 :
             begin
                  next_datain_state <= (r_datain_ready_cnt) ? ST_datain_ready_2 : ST_datain1 ;
             end

             ST_datain1 :
             begin
                  next_datain_state <= ST_datain2 ;
             end
             
             ST_datain2 :
             begin
                  next_datain_state <= (count_datain_i == r_cnt_para-'h1) ? ST_datain3 : ST_datain1 ;
             end

             ST_datain3 :
             begin
                  next_datain_state <= (r_datain_end_cnt) ? ST_datain3 : ST_datain_end_1 ;
             end
             
             ST_datain_end_1 :
             begin
                  next_datain_state <= ST_datain_end_2 ;
             end
              
             ST_datain_end_2 :
             begin
                  next_datain_state <= (r_spare_done) ? ST_datain_end_3 : ST_sddatain_end ;
             end
             
             ST_datain_end_3 :
             begin
                  next_datain_state <= ST_datain_end_4 ;
             end
             
             ST_datain_end_4:
             begin
                  next_datain_state <= ST_datain_idle ;
             end
             
             ST_sddatain_end : 
             begin
                  next_datain_state <= ST_datain_idle ;  
             end
             
             default :
             begin
                  next_datain_state <= ST_datain_idle ;
             end
         endcase
    end
    
    //m2b_req
    always @ (*)//(posedge i_nc_clk)
    begin
         case(current_datain_state)
         ST_datain_m2b: o_m2b_req <= (i_m2b_cmplt) ? 'b0 : 'b1;
         default:       o_m2b_req <= 'b0;
         endcase
    end
    
    //prog end ack
    always @ (posedge i_nc_clk)
    begin
         case(current_datain_state)
             ST_datain_end_3: o_prog_end <= (!r_trf_cnt) ? 'b1 : 'b0 ;
             ST_datain_end_4: o_prog_end <= o_prog_end;
             default:         o_prog_end <= 'b0;
         endcase
    end
    
    //datain counter
    always @ (posedge i_nc_clk)
    begin
         case(current_datain_state)
             
             ST_datain_ready_2 : 
             begin
                 r_datain_ready_cnt <= r_datain_ready_cnt-'b1;
                 r_datain_end_cnt   <= 'b1;
             end
             ST_datain3      : 
             begin
                  r_datain_ready_cnt <= 'h2;
                  r_datain_end_cnt   <= r_datain_end_cnt-'b1;
             end 
             default           : 
             begin
                  r_datain_ready_cnt <= 'h2;
                  r_datain_end_cnt   <= 'b1;
             end
         endcase
    end
    
    //datain counter
    always @ (posedge i_nc_clk or negedge i_nc_rstn)
    begin
         if(!i_nc_rstn)
         begin
              count_datain_i <= 0 ; 
         end
         
         else
         begin
               count_datain_i <= count_datain ;
         end
    end
    
    always @ (*)
    begin
         case(current_datain_state)
         
             ST_datain1 :
             begin
                  count_datain <= count_datain_i ; 
             end
         
             ST_datain2 :
             begin
                  count_datain <= count_datain_i + 1 ;
             end
             
             default :
             begin
                  count_datain <= 0 ;
             end
         endcase
    end
    
    always @ (posedge i_nc_clk)
    begin
         case(current_datain_state)
             
             ST_datain_idle, ST_datain_m2b, ST_clk_syn :
             begin
                  o_prog_ce_n   <= lo    ;
                  o_prog_cle    <= lo    ;
                  o_prog_ale    <= lo    ;
                  o_prog_wr_n   <= hi    ;
             end
             
             ST_datain_begin, ST_datain_ready_1 :
             begin
                  o_prog_ce_n   <= lo    ;
                  o_prog_cle    <= lo    ;
                  o_prog_ale    <= lo    ;
                  o_prog_wr_n   <= hi    ;
             end
             
             ST_datain_ready_2, ST_datain1 :
             begin
                  o_prog_ce_n   <= lo    ;
                  o_prog_cle    <= hi    ;
                  o_prog_ale    <= hi    ;
                  o_prog_wr_n   <= hi    ;
             end
             
             ST_datain2 :
             begin
                  o_prog_ce_n   <= lo    ;
                  o_prog_cle    <= (count_datain_i == r_cnt_para-'h1) ? lo : hi ;
                  o_prog_ale    <= (count_datain_i == r_cnt_para-'h1) ? lo : hi ;
                  o_prog_wr_n   <= hi    ;
             end
             
             default :
             begin
                  o_prog_ce_n   <= lo    ;
                  o_prog_cle    <= lo    ;
                  o_prog_ale    <= lo    ;
                  o_prog_wr_n   <= hi    ;
             end
         endcase
    end
    
    always @ (*)
    begin
         case(current_datain_state)
         
             ST_datain_ready_1, ST_datain_ready_2, ST_datain_end_1, ST_datain_end_2, ST_datain_end_3, ST_datain_end_4, ST_sddatain_end: 
             begin
                  o_prog_dqs_t <= lo;
                  o_dqs_ce     <= 'b1;
             end
             ST_datain1, ST_datain2, ST_datain3 : 
             begin
                  o_prog_dqs_t <= lo;
                  o_dqs_ce     <= 'b0;
             end
         
             default : 
             begin
                  o_prog_dqs_t <= hi;
                  o_dqs_ce     <= 'b1;
             end
         endcase
    end
    
    always @ (posedge i_nc_clk)
    begin 
         o_prog_dq <= r_prog_dq ;
    end
    always @ (*)
    begin
         case(current_datain_state)
             
             ST_datain_begin :
             begin
                  r_prog_dq     <= `CIO_WD'h0 ;
                  o_prog_dq_t   <= hi   ;//lo ;
             end
             
             ST_datain_ready_2, ST_datain1, ST_datain2, ST_datain3 :              //count가 3에서 buffer에서 i_data_32바꿔줘야 한다.
             begin
                  r_prog_dq     <= i_b2n_data ;
                  o_prog_dq_t   <= lo   ;
             end
             
             ST_datain_end_1 :
             begin
                  r_prog_dq     <= `CIO_WD'h0 ;
                  o_prog_dq_t   <= lo   ;
             end

             default :
             begin
                  r_prog_dq     <= `CIO_WD'h0 ;
                  o_prog_dq_t   <= hi   ;
             end
         endcase
    end
    
    //BRAM ctl signal
    always @ (posedge i_nc_clk)
    begin
         case(current_datain_state)
             
             ST_datain_begin :
             begin
                  o_b2n_addr <= (r_begin_cnt) ? `INIT_PBDEPTH - 'b1 : o_b2n_addr - 'b1;
                  o_b2n_en   <= hi ;
                  o_b2n_we   <= lo ;
             end
             
             ST_datain_ready_1 :
             begin
                  o_b2n_addr <= o_b2n_addr - 'b1;
                  o_b2n_en   <= hi ;
                  o_b2n_we   <= lo ;
             end
             
             ST_datain_ready_2 :
             begin
                  o_b2n_addr <= o_b2n_addr - 'b1;
                  o_b2n_en   <= hi ;
                  o_b2n_we   <= lo ;
             end

             ST_datain1, ST_datain2 :
             begin
                  o_b2n_addr <= o_b2n_addr - 'b1;
                  o_b2n_en   <= hi ;
                  o_b2n_we   <= lo ;
             end
             
             default :
             begin
                  o_b2n_addr <= `INIT_PBDEPTH - 'b1 ;
                  o_b2n_en   <= lo ;
                  o_b2n_we   <= lo ;
             end
         endcase
    end

    //cnt trf
    always @ (posedge i_nc_clk or negedge i_nc_rstn)
    begin
         if(!i_nc_rstn)
         begin
              r_trf_cnt <= 'b0 ;
         end
         
         else
         begin
              case(current_datain_state)
                  ST_datain_end_1 : r_trf_cnt <= (r_spare_done) ? r_trf_cnt + 'b1 : r_trf_cnt ;
                  default         : r_trf_cnt <= r_trf_cnt ;
              endcase
         end
    end
    
    always @ (posedge i_nc_clk or negedge i_nc_rstn)
    begin
         if(!i_nc_rstn) r_spare_done <= 'b0 ;
         else 
         begin
              case(current_datain_state)
                  ST_datain_end_2: r_spare_done <= (r_trf_cnt) ? 'b1 : 'b0;
                  ST_sddatain_end: r_spare_done <= 'b1;
                  default:         r_spare_done <= r_spare_done;
              endcase
         end
    end
    
    //begin cnt
    always @ (posedge i_nc_clk or negedge i_nc_rstn)
    begin
         if(!i_nc_rstn) r_begin_cnt <= 3'b101;
         else
         begin
              case(current_datain_state)
                  ST_datain_begin : r_begin_cnt <= r_begin_cnt - 'b1 ;
                  default         : r_begin_cnt <= 3'b101;
              endcase
         end
    end
    
endmodule
