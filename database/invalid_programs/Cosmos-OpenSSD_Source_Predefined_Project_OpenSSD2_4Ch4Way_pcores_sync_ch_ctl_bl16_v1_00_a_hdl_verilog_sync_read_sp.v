//////////////////////////////////////////////////////////////////////////////////
// sync_read_sp.v for Cosmos OpenSSD
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
// Module Name: sync_read_sp
// File Name: sync_read_sp.v
//
// Version: v1.1.0
//
// Description:
//   - generate spare data read control signal in synchronous mode
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v1.1.0
//   - make dqs signal as differential signal
//
// * v1.0.0
//   - first draft
//////////////////////////////////////////////////////////////////////////////////
`include "parameter.vh"

module sync_read_sp(

    //system
    input wire                       i_nc_clk     ,
    input wire                       i_clk_o      ,
    input wire                       i_nc_rstn    ,
    //nand interface
    output reg                       o_read_cle   ,
    output reg                       o_read_ale   ,
    output reg                       o_read_wr_n  ,
    output reg                       o_read_dq_t  ,
    input  wire [`CIO_WD-1:0]        i_read_dq    ,
    input  wire                      i_read_dqs   ,
    //output wire                      o_sp_en      ,
    //bram interface
    output reg  [`CIO_WD-1:0]        o_n2b_data   ,
    output reg  [`NAND_PBAWIDTH-1:0] o_n2b_addr   ,
    output reg                       o_n2b_en     ,
    output reg                       o_n2b_we     ,
    //module interface
    output reg                       o_sp_start   ,
    input  wire                      i_sp_start   ,
    output reg                       o_sp_read_end
    );
    
    //DATAout part
    reg [3:0]    r_current_read_state ;
    reg [3:0]    r_next_read_state    ;
    
    reg  [`NAND_PBAWIDTH-1:0] r_n2b_addr ;
    reg  [`NAND_PBAWIDTH-1:0] s_n2b_addr_1 ;
    reg  [`NAND_PBAWIDTH-1:0] s_n2b_addr_2 ;
    
    reg s_n2b_en_1;
    reg s_n2b_en_2;
    reg s_n2b_we_1;
    reg s_n2b_we_2;
    
    //count
    reg [`NAND_PBAWIDTH-1:0]     r_clk_cnt      ;
    reg [2:0]                    r_cmd_wait_cnt ;
    reg                          r_cmd_cnt      ;
    reg [1:0]                    r_begin1_cnt   ;
    reg [2:0]                    r_begin2_cnt   ;
    reg [1:0]                    r_ready_cnt    ;
    reg                          r_end_cnt      ;
    reg                          r_end2_cnt     ;
    
    wire                         w_read_dqs_n;
    
    assign w_read_dqs_n = !i_read_dqs;
    
    parameter        ST_dataout_idle        = 4'b0000;
    parameter        ST_clk_syn             = 4'b0001;
    parameter        ST_dataout_CMD_wait    = 4'b0011;
    parameter        ST_dataout_CMD         = 4'b0010;
    parameter        ST_dataout_begin1      = 4'b0110;
    parameter        ST_dataout_begin2      = 4'b0111;
    parameter        ST_dataout_ready       = 4'b0101;
    parameter        ST_dataout             = 4'b0100;
    parameter        ST_dataout_end1        = 4'b1100;
    parameter        ST_dataout_end2        = 4'b1000;
    parameter        ST_sdataout_end        = 4'b1001;
    
    parameter hi = 1'b1 ;
    parameter lo = 1'b0 ;
    
    parameter SDATA_COUNT = (`SBDEPTH)/2-1;

    //data output state machine 
    always @ (posedge i_nc_clk or negedge i_nc_rstn)
    begin
         if(!i_nc_rstn)
         begin
              r_current_read_state <= ST_dataout_idle ;
         end
         
         else
         begin
              r_current_read_state <= r_next_read_state ;
         end
    end
    
    always @ (*)
    begin
         case(r_current_read_state)
             
             ST_dataout_idle :
             begin
                  r_next_read_state <= (i_sp_start) ?  ST_clk_syn : ST_dataout_idle ;
             end
             
             ST_clk_syn :
             begin
                  r_next_read_state <= (i_clk_o) ? ST_clk_syn : ST_dataout_CMD_wait ;
             end
             
             ST_dataout_CMD_wait :
             begin
                  r_next_read_state <= (r_cmd_wait_cnt) ? ST_dataout_CMD_wait : ST_dataout_CMD ;
             end
             
             ST_dataout_CMD      :
             begin
                  r_next_read_state <= (r_cmd_cnt) ? ST_dataout_CMD : ST_dataout_begin1 ;
             end
             
             ST_dataout_begin1 :
             begin
                  r_next_read_state <= (r_begin1_cnt) ? ST_dataout_begin1 : ST_dataout_begin2 ;
             end
             
             ST_dataout_begin2 :
             begin
                  r_next_read_state <= (r_begin2_cnt) ? ST_dataout_begin2 : ST_dataout_ready ;
             end
            
             ST_dataout_ready :
             begin
                  r_next_read_state <= (r_ready_cnt) ? ST_dataout_ready : ST_dataout ;
             end
             
             ST_dataout :
             begin
                  r_next_read_state <= (r_clk_cnt==SDATA_COUNT) ? ST_dataout_end1 : ST_dataout;
             end
             
             ST_dataout_end1 :
             begin
                  r_next_read_state <= (r_end_cnt) ? ST_dataout_end1 : ST_dataout_end2 ;
             end
            
             ST_dataout_end2 :
             begin
                  r_next_read_state <= (r_end2_cnt) ? ST_dataout_end2 : ST_sdataout_end ;
             end

             ST_sdataout_end :
             begin
                  r_next_read_state <= ST_dataout_idle ;
             end
             
             default :
             begin
                  r_next_read_state <= ST_dataout_idle ;
             end
         endcase
    end
    
    always @ (*)
    begin
         case(r_current_read_state)
             ST_dataout_idle: o_sp_start <= 'b0;
             default:         o_sp_start <= 'b1;
         endcase
    end
    
    //sp_end
    always @ (*)
    begin
         case(r_current_read_state)
             ST_dataout_end2, ST_sdataout_end: o_sp_read_end <= 'b1;
             default:                          o_sp_read_end <= 'b0;
         endcase
    end
    
    always @ (posedge i_nc_clk or negedge i_nc_rstn)
    begin
         if(!i_nc_rstn)
         begin
              r_cmd_wait_cnt <= 3'h4;
              r_cmd_cnt      <=  'b1;
              r_begin1_cnt   <= 2'h3;
              r_begin2_cnt   <= 3'h5;
              r_ready_cnt    <= 2'h2;
              r_end_cnt      <=  'h1;
              r_end2_cnt     <=  'h1;
         end
         
         else
         begin
              case(r_current_read_state)
                  
                  ST_dataout_CMD_wait : 
                  begin
                       r_cmd_wait_cnt <= r_cmd_wait_cnt - 'b1 ;
                       r_cmd_cnt      <=  'b1;
                       r_begin1_cnt   <= 2'h3;
                       r_begin2_cnt   <= 3'h5;
                       r_ready_cnt    <= 2'h2;
                       r_end_cnt      <=  'h1;
                       r_end2_cnt     <=  'h1;
                  end
                  
                  ST_dataout_CMD :
                  begin
                       r_cmd_wait_cnt <= 3'h4;
                       r_cmd_cnt      <= r_cmd_cnt - 'b1 ;
                       r_begin1_cnt   <= 2'h3;
                       r_begin2_cnt   <= 3'h5;
                       r_ready_cnt    <= 2'h2;
                       r_end_cnt      <=  'h1;
                       r_end2_cnt     <=  'h1;
                  end
                  
                  ST_dataout_begin1 :
                  begin
                       r_cmd_wait_cnt <= 3'h4;
                       r_cmd_cnt      <=  'b1;
                       r_begin1_cnt   <= r_begin1_cnt - 'b1 ;
                       r_begin2_cnt   <= 3'h5;
                       r_ready_cnt    <= 2'h2;
                       r_end_cnt      <=  'h1;
                       r_end2_cnt     <=  'h1;
                  end
                  
                  ST_dataout_begin2 :
                  begin
                       r_cmd_wait_cnt <= 3'h4;
                       r_cmd_cnt      <=  'b1;
                       r_begin1_cnt   <= 2'h3;
                       r_begin2_cnt   <= r_begin2_cnt - 'b1 ;
                       r_ready_cnt    <= 2'h2;
                       r_end_cnt      <=  'h1;
                       r_end2_cnt     <=  'h1;
                  end
                  
                  ST_dataout_ready :
                  begin
                       r_cmd_wait_cnt <= 3'h4;
                       r_cmd_cnt      <=  'b1;
                       r_begin1_cnt   <= 2'h3;
                       r_begin2_cnt   <= 3'h5;
                       r_ready_cnt    <= r_ready_cnt - 'b1 ;
                       r_end_cnt      <=  'h1;
                       r_end2_cnt     <=  'h1;
                  end
                  
                  ST_dataout_end1 : 
                  begin
                       r_cmd_wait_cnt <= 3'h4;
                       r_cmd_cnt      <=  'b1;
                       r_begin1_cnt   <= 2'h3;
                       r_begin2_cnt   <= 3'h5;
                       r_ready_cnt    <= 2'h2;
                       r_end_cnt      <= r_end_cnt - 'b1 ;
                       r_end2_cnt     <=  'h1;
                  end
                  
                  ST_dataout_end2:
                  begin
                       r_cmd_wait_cnt <= 3'h4;
                       r_cmd_cnt      <=  'b1;
                       r_begin1_cnt   <= 2'h3;
                       r_begin2_cnt   <= 3'h5;
                       r_ready_cnt    <= 2'h2;
                       r_end_cnt      <=  'h1 ;
                       r_end2_cnt     <= r_end2_cnt - 'h1;
                  end
                  
                  default             : 
                  begin
                       r_cmd_wait_cnt <= 3'h4;
                       r_cmd_cnt      <=  'b1;
                       r_begin1_cnt   <= 2'h3;
                       r_begin2_cnt   <= 3'h5;
                       r_ready_cnt    <= 2'h2;
                       r_end_cnt      <=  'h1;
                       r_end2_cnt     <=  'h1;
                  end
              endcase
         end
    end
    
    always @ (*)
    begin
         case(r_current_read_state)
              
             ST_dataout_idle, ST_clk_syn  :
             begin
                  o_read_cle    <= lo ;
                  o_read_ale    <= lo ;
                  o_read_wr_n   <= hi ;
                  o_read_dq_t   <= hi   ;
             end
             
             ST_dataout_CMD_wait :
             begin  
                  o_read_cle    <= lo ;
                  o_read_ale    <= lo ;
                  o_read_wr_n   <= hi ;
                  o_read_dq_t   <= hi   ;
             end
       
             ST_dataout_CMD :
             begin
                  o_read_cle    <= hi ;
                  o_read_ale    <= lo ;
                  o_read_wr_n   <= hi ;
                  o_read_dq_t   <= lo   ;
             end
               
             ST_dataout_begin1 :
             begin
                  o_read_cle    <= lo ;
                  o_read_ale    <= lo ;
                  o_read_wr_n   <= hi ;
                  o_read_dq_t   <= hi   ;
             end
             
             ST_dataout_begin2 :
             begin
                  o_read_cle    <= lo ;
                  o_read_ale    <= lo ;
                  o_read_wr_n   <= lo ;
                  o_read_dq_t   <= hi   ;
             end
             
             ST_dataout_ready :
             begin
                  o_read_cle    <= hi ;
                  o_read_ale    <= hi ;
                  o_read_wr_n   <= lo ;
                  o_read_dq_t   <= hi   ;
             end
             
             ST_dataout :
             begin
                  o_read_cle    <= (r_clk_cnt == SDATA_COUNT) ? lo : hi ;
                  o_read_ale    <= (r_clk_cnt == SDATA_COUNT) ? lo : hi ;
                  o_read_wr_n   <= lo ;
                  o_read_dq_t   <= hi   ;
             end
             
             ST_dataout_end1 :
             begin
                  o_read_cle    <= lo ;
                  o_read_ale    <= lo ;
                  o_read_wr_n   <= lo ;
                  o_read_dq_t   <= hi   ;
             end
             
             ST_dataout_end2 :
             begin
                  o_read_cle    <= lo ;
                  o_read_ale    <= lo ;
                  o_read_wr_n   <= lo ;//hi ;
                  o_read_dq_t   <= hi   ;
             end
             
             default :
             begin
                  o_read_cle    <= lo ;
                  o_read_ale    <= lo ;
                  o_read_wr_n   <= hi ;
                  o_read_dq_t   <= hi   ;
             end
         endcase
    end
    
    always @ (posedge i_nc_clk or negedge i_nc_rstn)
    begin
         if (!i_nc_rstn) r_clk_cnt <= 'b0;
         else 
         begin
              case(r_current_read_state)
                  ST_dataout : 
                  begin
                       if (!i_clk_o) r_clk_cnt <= r_clk_cnt + 'b1;
                       else          r_clk_cnt <= r_clk_cnt;
                  end
                  
                  default    : r_clk_cnt <= 'b0;
              endcase
         end
         
    end
    
    reg [`IO_WD-1 :0] r_p_data;
    reg [`IO_WD-1 :0] r_n_data;
    
    always @ (posedge i_read_dqs)
    begin
         r_p_data <= i_read_dq;
    end
    
    always @ (posedge w_read_dqs_n)
    begin
         r_n_data <= i_read_dq;
    end
    
    always @(posedge i_nc_clk)
    begin
         o_n2b_data <= (i_read_dqs) ? r_p_data : r_n_data;
    end
    
    always @ (posedge i_nc_clk)
    begin
         s_n2b_addr_1 <= r_n2b_addr;
         s_n2b_addr_2 <= s_n2b_addr_1;
         o_n2b_addr   <= s_n2b_addr_2;
    end
    
    always @ (posedge i_nc_clk)
    begin
         case(r_current_read_state)
        
             ST_dataout, ST_dataout_end1 :
             begin
                  r_n2b_addr <= (!r_n2b_addr) ? r_n2b_addr : r_n2b_addr - 'b1;
             end
             
             default :
             begin
                  r_n2b_addr <= `INIT_PBDEPTH - 'b1 ;
             end
         endcase
    end
    
    always @ (posedge i_nc_clk)
    begin
         s_n2b_en_2 <= s_n2b_en_1;
         o_n2b_en   <= s_n2b_en_2;
         s_n2b_we_2 <= s_n2b_we_1;
         o_n2b_we   <= s_n2b_we_2;
    end
    
    
    always @ (posedge i_nc_clk)
    begin
         case(r_current_read_state)
             
             ST_dataout, ST_dataout_end1 :
             begin
                  s_n2b_en_1 <= (r_end_cnt) ? hi : lo;
                  s_n2b_we_1 <= (r_end_cnt) ? hi : lo;
             end
             
             default :
             begin
                  s_n2b_en_1 <= lo ;
                  s_n2b_we_1 <= lo ;
             end
         endcase
    end  
    
endmodule
