//////////////////////////////////////////////////////////////////////////////////
// sync_read_top.v for Cosmos OpenSSD
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
// Module Name: sync_read_top
// File Name: sync_read_top.v
//
// Version: v1.0.0
//
// Description:
//   - control sub read module (spare area, data area)
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v1.0.0
//   - first draft
//////////////////////////////////////////////////////////////////////////////////
`include "parameter.vh"

module sync_read_top(

    //system
    input wire                       i_nc_clk     ,
    input wire                       i_clk_o      ,
    input wire                       i_nc_rstn    ,
    
    //flag
    input  wire                      i_read_begin ,
    output reg                       o_read_end   ,
    
    //out PIN
    output wire                      o_read_ce_n  ,
    output reg                       o_read_cle   ,
    output reg                       o_read_ale   ,
    output reg                       o_read_wr_n  ,
    
    //NAND
    input  wire [`CIO_WD-1:0]        i_read_dq    ,
    input  wire                      i_read_dqs   ,
    output wire [`CIO_WD-1:0]        o_read_dq    ,
    output reg                       o_read_dq_t  ,
    output wire                      o_b2m_req    ,
    input  wire                      i_b2m_cmplt  ,
    output reg                       o_sp_en      ,
    
    output reg  [`CIO_WD-1:0]        o_n2b_data   ,
    output reg  [`NAND_PBAWIDTH-1:0] o_n2b_addr   ,
    output reg                       o_n2b_en     ,
    output reg                       o_n2b_we
    );
    
    reg [2:0] r_current_state;
    reg [2:0] r_next_state;
    
    //cnt register
    reg r_rd_end_cnt;
    
    //flag signal
    wire w_sp_read_end;
    wire w_dt_read_end;
    reg  r_sp_start;
    reg  r_dt_start;

    //sp_nand_interface
    wire w_sp_start;
    wire w_sp_read_cle ;
    wire w_sp_read_ale ;
    wire w_sp_read_wr_n;
    wire w_sp_read_dq_t;

    //dt_nand_interface
    wire w_dt_start;
    wire w_dt_read_cle ;
    wire w_dt_read_ale ;
    wire w_dt_read_wr_n;
    wire w_dt_read_dq_t;
    
    //sp_bram_interface
    wire w_sp_n2b_en;
    wire w_sp_n2b_we;
    wire [`CIO_WD-1:0]        w_n2b_sp_data;
    wire [`NAND_PBAWIDTH-1:0] w_n2b_sp_addr;
    
    //dt_bram_interface
    wire w_dt_n2b_en;
    wire w_dt_n2b_we;
    wire [`CIO_WD-1:0]        w_n2b_dt_data;
    wire [`NAND_PBAWIDTH-1:0] w_n2b_dt_addr;
    
    parameter IDLE             =  3'b000;
    parameter SP_READ_EXECUTE  =  3'b001;
    parameter SP_READ_END      =  3'b011;
    parameter DT_READ_EXECUTE  =  3'b010;
    parameter DT_READ_END      =  3'b110;
    parameter READ_END         =  3'b100;
    
    //state
    always @ (posedge i_nc_clk or negedge i_nc_rstn)
    begin
         if(!i_nc_rstn) r_current_state <= IDLE;
         else           r_current_state <= r_next_state;
    end
    
    always @ (*)
    begin
         case(r_current_state)
             IDLE:            r_next_state <= (i_read_begin) ? SP_READ_EXECUTE : IDLE;
             SP_READ_EXECUTE: r_next_state <= (w_sp_read_end) ? SP_READ_END : SP_READ_EXECUTE;
             SP_READ_END:     r_next_state <= DT_READ_EXECUTE;
             DT_READ_EXECUTE: r_next_state <= (w_dt_read_end) ? DT_READ_END : DT_READ_EXECUTE;
             DT_READ_END:     r_next_state <= READ_END;
             READ_END:        r_next_state <= (r_rd_end_cnt) ? READ_END : IDLE;
             default:         r_next_state <= IDLE;
         endcase
    end
    
    //state cnt
    always @ (posedge i_nc_clk)
    begin
         case(r_current_state)
             READ_END:r_rd_end_cnt <= (r_rd_end_cnt) ? r_rd_end_cnt - 'b1 : r_rd_end_cnt; 
             default: r_rd_end_cnt <= 'b1;
         endcase
    end
    
    //read end
    always @ (posedge i_nc_clk)
    begin
         case(r_current_state)
             READ_END: o_read_end <= 'b1;
             default:  o_read_end <= 'b0;
         endcase
    end
    
    //spare buffer enable
    always @ (posedge i_nc_clk)
    begin
         case(r_current_state)
             IDLE, SP_READ_EXECUTE, SP_READ_END: o_sp_en <= 'b1;
             default:                            o_sp_en <= 'b0;
         endcase
    end
    
    //sub_module_start
    always @ (*)
    begin
         case(r_current_state)
             SP_READ_EXECUTE:
             begin
                  r_sp_start <= 'b1;
                  r_dt_start <= 'b0;
             end
             DT_READ_EXECUTE:
             begin
                  r_sp_start <= 'b0;
                  r_dt_start <= 'b1;
             end
             default:
             begin
                  r_sp_start <= 'b0;
                  r_dt_start <= 'b0;
             end
         endcase
    end
    
    //output nand interface signal
    assign o_read_ce_n = 'b0;
    assign o_read_dq   = 'b0;
    
    always @ (posedge i_nc_clk)
    begin
         case({w_sp_start, w_dt_start})
         2'b10:
         begin
              o_read_cle  <= w_sp_read_cle ;
              o_read_ale  <= w_sp_read_ale ;
              o_read_wr_n <= w_sp_read_wr_n;
              o_read_dq_t <= w_sp_read_dq_t;
         end
         2'b01:
         begin
              o_read_cle  <= w_dt_read_cle ;
              o_read_ale  <= w_dt_read_ale ;
              o_read_wr_n <= w_dt_read_wr_n;
              o_read_dq_t <= w_dt_read_dq_t;
         end
         default:
         begin
              o_read_cle  <= 'b0;
              o_read_ale  <= 'b0;
              o_read_wr_n <= 'b1;
              o_read_dq_t <= 'b1;
         end
         endcase
    end
    
    //bram interface
    always @ (posedge i_nc_clk)
    begin
         o_n2b_en <= |{w_sp_n2b_en, w_dt_n2b_en};
         o_n2b_we <= |{w_sp_n2b_we, w_dt_n2b_we};
    end
    
    always @ (posedge i_nc_clk)
    begin
         case({w_sp_start, w_dt_start})
             2'b10:
             begin
                  o_n2b_data <= w_n2b_sp_data;
                  o_n2b_addr <= w_n2b_sp_addr;
             end
             2'b01:
             begin
                  o_n2b_data <= w_n2b_dt_data;
                  o_n2b_addr <= w_n2b_dt_addr;
             end
             default:
             begin
                  o_n2b_data <= 'b0;
                  o_n2b_addr <= 'b0;
             end
         endcase
    end
    
    sync_read_sp sync_read_sp0(
    .i_nc_clk    (i_nc_clk ),
    .i_clk_o     (i_clk_o  ),
    .i_nc_rstn   (i_nc_rstn),
    .o_read_cle  (w_sp_read_cle ),
    .o_read_ale  (w_sp_read_ale ),
    .o_read_wr_n (w_sp_read_wr_n),
    .o_read_dq_t (w_sp_read_dq_t),
    .i_read_dq   (i_read_dq),
    .i_read_dqs  (i_read_dqs),
    //.o_sp_en     (o_sp_en),
    .o_n2b_data  (w_n2b_sp_data),
    .o_n2b_addr  (w_n2b_sp_addr),
    .o_n2b_en    (w_sp_n2b_en),
    .o_n2b_we    (w_sp_n2b_we),
    .o_sp_start  (w_sp_start),
    .i_sp_start  (r_sp_start),
    .o_sp_read_end (w_sp_read_end)
    );
    
    sync_read_dt  sync_read_dt0(
    .i_nc_clk    (i_nc_clk ),
    .i_clk_o     (i_clk_o  ),
    .i_nc_rstn   (i_nc_rstn),
    .o_read_cle  (w_dt_read_cle ),
    .o_read_ale  (w_dt_read_ale ),
    .o_read_wr_n (w_dt_read_wr_n),
    .o_read_dq_t (w_dt_read_dq_t),
    .i_read_dq   (i_read_dq),
    .i_read_dqs  (i_read_dqs),
    .o_b2m_req   (o_b2m_req  ),
    .i_b2m_cmplt (i_b2m_cmplt),
    .o_n2b_data  (w_n2b_dt_data),
    .o_n2b_addr  (w_n2b_dt_addr),
    .o_n2b_en    (w_dt_n2b_en),
    .o_n2b_we    (w_dt_n2b_we),
    .o_dt_start  (w_dt_start),
    .i_dt_start  (r_dt_start),
    .o_dt_read_end (w_dt_read_end)
    );
    
endmodule
