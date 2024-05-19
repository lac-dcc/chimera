// This program was cloned from: https://github.com/Cosmos-OpenSSD/Cosmos-OpenSSD
// License: GNU General Public License v3.0

//////////////////////////////////////////////////////////////////////////////////
// sync_top.v for Cosmos OpenSSD
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
// Module Name: sync_top
// File Name: sync_top.v
//
// Version: v1.1.0
//
// Description:
//   - control sub module to deal with ftl request
//   - transfer nand device control signals
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v1.1.0
//   - insert sub module trigger logic
//
// * v1.0.0
//   - first draft
//////////////////////////////////////////////////////////////////////////////////
`include "parameter.vh"

module sync_top(
     //system
     input      wire                                i_nc_clk , //100MHz
     input      wire                                i_nc_rstn,
          
     input      wire      [`CMD_WD-1:0]             i_command,
     input      wire                                i_cmd_ack, //command trigger
     output     wire                                o_maddr_ack,
     output     wire                                o_b2m_req,
     input      wire                                i_b2m_cmplt,
     output     wire                                o_m2b_req,
     input      wire                                i_m2b_cmplt,
     output     wire                                o_ready,
     output     reg       [`CIO_WD-1:0]             o_status,
     
     //channel arbiter
     output     wire                                o_ch_req,
     input      wire                                i_ch_gnt,
     
     //page buffer
     output     reg       [`NAND_PBAWIDTH-1:0]      o_pb_addr,
     input      wire      [`CIO_WD-1:0]             i_pb_data,         //data read from buffer 
     output     wire      [`CIO_WD-1:0]             o_pb_data,         //data write to buffer
     output     wire                                o_pb_en,
     output     wire                                o_pb_we,

     //sync NAND
     input      wire                                i_clk_o     ,//50MHz
     input      wire      [`NADDR_WD-1:0]           i_nand_addr ,
     input      wire      [`CIO_WD-1:0]             i_nand_dq   ,
     output     reg       [`CIO_WD-1:0]             o_nand_dq   ,
     output     wire                                o_nand_dq_t ,
     output     wire                                o_nand_cle  ,
     output     wire                                o_nand_ale  ,
     output     reg                                 o_nand_ce_n , 
     output     wire                                o_nand_we_n , //we_n
     output     wire                                o_nand_wr_n , //re_n
     output     wire                                o_nand_wp_n ,
     input      wire                                i_nand_rb   ,
     input      wire                                i_nand_dqs  ,
     output     wire                                o_nand_dqs_t,
     
     //output     wire                                o_nand_prog_en,
     output     wire                                o_m_ch_cmplt  ,
     output     wire                                o_dqs_ce      ,
     //output     wire        [7:0]                   debug_0       ,
     output     wire                                o_sp_en       ,
     output     wire                                o_prog_start  ,
     output     wire                                o_prog_end    ,
     output     wire                                o_read_start  ,
     output     wire                                o_read_end    ,
     output     wire                                o_erase_start ,
     output     wire                                o_erase_end
    );
                     
    //sync_setting 
    wire [`CIO_WD-1:0] w_set_dq_o ;
    wire               w_set_ce_n ;
    wire               s_CLE ;
    wire               s_ALE ;
    wire               s_W_R_n ;
    wire               s_CLK_out ;   
    wire               w_mode_ch_ready ;
    wire               w_mode_ch_req ;
    reg                r_mode_ch_en_n ;
    
    //sync_op
    wire flag_dataout_end ;
    wire flag_datain_end ;
    wire w_status_read_end ;
    
    wire w_read_begin ;
    wire w_prog_begin ;
    wire flag_status_begin ;
    wire w_op_ready ;
    
    //reset
    reg                 r_reset_en_n  ;
    reg                 r_op_en_n     ;
    wire                w_rst_ready   ;
    wire                w_rst_ch_req  ;
    wire                w_op_ch_req   ;
    wire [`CIO_WD-1:0]  w_rst_status  ;
    
    wire [`CIO_WD-1:0]  w_rst_io_o ;
    wire                w_rst_io_t ;
    wire                w_rst_cle  ;
    wire                w_rst_ce_n ;
    wire                w_rst_we_n ;
    wire                w_rst_re_n ;
    wire                w_rst_begin;
    wire                w_asyn_st_cp;
    
    //operation
    wire [`CIO_WD-1:0] w_op_dq_o ;
    wire w_op_ce_n ;
    wire op_CLE ;
    wire op_ALE ;
    wire op_W_R_n ;
    
    //sync_dataout
    wire                w_read_ce_n     ;
    wire                do_CLE      ;
    wire                do_ALE      ;
    wire                do_W_R_n    ;
    wire [`CIO_WD-1:0]  w_read_dq_o ;
    wire                w_read_dq_t ;
    wire                w_r_sp_en   ;
    
    //sync_datain
    wire [`CIO_WD-1:0] w_prog_dq_o  ;
    wire               w_prog_ce_n   ;
    wire               di_CLE    ;
    wire               di_ALE    ;
    wire               di_W_R_n  ;
    wire               w_p_sp_en ;
    
    //sync_status
    wire                   w_st_ce_n     ;
    wire                   st_CLE      ;
    wire                   st_ALE      ;
    wire                   st_W_R_n    ;
    wire   [`CIO_WD-1:0]   w_st_dq_o   ;
    wire                   w_st_dq_t   ;
    wire                   w_st_begin  ;
    wire   [`CIO_WD-1:0]   w_st_data   ;
    wire                   w_sync_st_cp;
    
    wire w_op_dq_t ;
    wire w_op_dqs_t ; 
    
    wire w_prog_dqs_t ;
    wire w_prog_dq_t ;
    
    wire w_set_dq_t ;
    
    wire w_sta_rdy ;
    
    wire w_mode_ch_begin ;
    
    //pbuf interface
    wire [`NAND_PBAWIDTH-1:0]  w_n2b_addr ;
    wire                       w_n2b_en   ;
    wire                       w_n2b_we   ;
    
    wire [`NAND_PBAWIDTH-1:0]  w_b2n_addr ;
    wire                       w_b2n_en   ;
    wire                       w_b2n_we   ;
    
    parameter hi = 1'b1 ;
    parameter lo = 1'b0 ;
    
    assign o_nand_dq_t  = &{w_op_dq_t, w_set_dq_t, w_read_dq_t, w_prog_dq_t, w_st_dq_t, w_rst_io_t} ;     //1:  hi-z, 0: output
    assign o_nand_dqs_t = &{w_op_dqs_t, w_prog_dqs_t} ;
    
    assign o_pb_en = |{w_n2b_en, w_b2n_en} ;
    assign o_pb_we = |{w_n2b_we, w_b2n_we} ;
    
    assign o_ch_req =|{w_rst_ch_req, w_mode_ch_req, w_op_ch_req}; 
    assign o_ready = &{w_rst_ready, w_mode_ch_ready, w_op_ready};
    
    assign o_sp_en = &{w_r_sp_en, w_p_sp_en};
    
    //nand interface
    assign o_nand_wp_n = 'b1;
    assign o_nand_cle  = |{w_rst_cle, s_CLE, do_CLE, di_CLE, st_CLE, op_CLE};
    assign o_nand_ale  = |{s_ALE, do_ALE, di_ALE, st_ALE, op_ALE};
    assign o_nand_wr_n = &{w_rst_re_n, s_W_R_n, do_W_R_n, di_W_R_n, st_W_R_n, op_W_R_n};
    assign o_nand_we_n = &{w_rst_we_n, s_CLK_out};
    
    //status
    always @ (posedge i_nc_clk)
    begin
         case({w_asyn_st_cp, w_sync_st_cp})
             2'b10   : o_status <= w_rst_status;
             2'b01   : o_status <= w_st_data   ;
             default : o_status <= o_status    ;
         endcase
    end
    
    always @ (*)
    begin
         case({w_read_begin, w_prog_begin})
             
             2'b10   : o_pb_addr <= w_n2b_addr ;
             2'b01   : o_pb_addr <= w_b2n_addr ;
             default : o_pb_addr <= 'hfff ;
         endcase
    end
    
    always @ (*)
    begin
         if (i_cmd_ack)
         begin
              case (i_command)
                   
                   `CMD_RESET :
                   begin
                        r_reset_en_n <= 'b0;
                        r_op_en_n <= 'b1;
                        r_mode_ch_en_n <= 'b1 ;
                   end 
                   
                   `CMD_MODE_CHANGE :
                   begin
                        r_reset_en_n <= 'b1;
                        r_op_en_n <= 'b1;
                        r_mode_ch_en_n <= 'b0 ;
                   end
                   
                   default :
                   begin
                        r_reset_en_n <= 'b1;
                        r_op_en_n <= 'b0;
                        r_mode_ch_en_n <= 'b1 ;
                   end
              endcase
         end
         
         else
         begin
              r_reset_en_n <= 'b1;
              r_op_en_n <= 'b1;
              r_mode_ch_en_n <= 'b1 ;
         end
    end
    
    //async reset
    reset reset0(
    .i_nc_clk      (i_nc_clk),
    .i_nc_rstn     (i_nc_rstn),
    .i_en_n        (r_reset_en_n),
    .o_ready       (w_rst_ready),
    .o_rst_begin   (w_rst_begin),
    .o_status      (w_rst_status),
    .o_st_data_cp  (w_asyn_st_cp),
    .o_ch_req      (w_rst_ch_req), 
    .i_ch_gnt      (i_ch_gnt), 
    .i_nand_io     (i_nand_dq ), 
    .o_nand_io     (w_rst_io_o), 
    .o_nand_io_t   (w_rst_io_t),
    .o_nand_cle    (w_rst_cle ), 
    .o_nand_ce_n   (w_rst_ce_n), 
    .o_nand_we_n   (w_rst_we_n),
    .o_nand_re_n   (w_rst_re_n), 
    .i_nand_rb     (i_nand_rb )
    );
    
    sync_setting sync_setting0(
    //NFC       TOP
    .i_nc_clk          (i_nc_clk),
    .i_nc_rstn         (i_nc_rstn),
    .i_mode_ch_en_n    (r_mode_ch_en_n),
    .o_mode_ch_ready   (w_mode_ch_ready),
    .o_mode_ch_begin   (w_mode_ch_begin),
    .i_ch_gnt          (i_ch_gnt),
    .o_ch_req          (w_mode_ch_req),
    .o_m_ch_cmplt      (o_m_ch_cmplt),
    .i_set_rb_n        (i_nand_rb),
    .o_set_dq          (w_set_dq_o), 
    .o_set_ce_n        (w_set_ce_n), 
    .o_set_cle         (s_CLE), 
    .o_set_ale         (s_ALE),
    .o_set_wr_n        (s_W_R_n),
    .o_set_clk         (s_CLK_out),
    .o_set_dq_t        (w_set_dq_t)
    );
    
    sync_op sync_op0(
    //NFC     TOP
    .i_nc_clk            (i_nc_clk),
    .i_clk_o             (i_clk_o),
    .i_nc_rstn           (i_nc_rstn),
    .i_enable            (!r_op_en_n),
    .i_command           (i_command),
    .i_nand_addr         (i_nand_addr),
    .i_read_end          (flag_dataout_end),
    .i_prog_end          (flag_datain_end),
    .i_status_read_end   (w_status_read_end),
    .o_read_begin        (w_read_begin),
    .o_prog_begin        (w_prog_begin),
    .o_status_read_begin (flag_status_begin),
    .o_prog_start        (o_prog_start ),
    .o_prog_end          (o_prog_end   ),
    .o_read_start        (o_read_start ),
    .o_read_end          (o_read_end   ),
    .o_erase_start       (o_erase_start),
    .o_erase_end         (o_erase_end  ),
    .o_op_dq_t           (w_op_dq_t),
    .o_op_dqs_t          (w_op_dqs_t),
    .o_op_dq             (w_op_dq_o),
    .o_op_ce_n           (w_op_ce_n),
    .o_op_cle            (op_CLE),
    .o_op_ale            (op_ALE),
    .o_op_wr_n           (op_W_R_n),
    .i_sta_rdy           (w_sta_rdy),
    .i_ch_gnt            (i_ch_gnt),
    .o_ch_req            (w_op_ch_req),
    .o_maddr_ack         (o_maddr_ack),
    .o_ready             (w_op_ready)
    );
    
    sync_read_top sync_read_top0(
    //NFC     TOP
    .i_nc_clk      (i_nc_clk),
    .i_clk_o       (i_clk_o),
    .i_nc_rstn     (i_nc_rstn)  ,
    .i_read_begin  (w_read_begin),
    .o_read_end    (flag_dataout_end),
    .o_read_ce_n   (w_read_ce_n), 
    .o_read_cle    (do_CLE),
    .o_read_ale    (do_ALE), 
    .o_read_wr_n   (do_W_R_n), 
    .i_read_dq     (i_nand_dq),
    .i_read_dqs    (i_nand_dqs),
    .o_read_dq     (w_read_dq_o),
    .o_read_dq_t   (w_read_dq_t),
    .o_b2m_req     (o_b2m_req),
    .i_b2m_cmplt   (i_b2m_cmplt),
    .o_sp_en       (w_r_sp_en),
    .o_n2b_data    (o_pb_data),
    .o_n2b_addr    (w_n2b_addr),
    .o_n2b_en      (w_n2b_en  ),
    .o_n2b_we      (w_n2b_we  )
    );
    
    sync_prog sync_prog0(
    //NFC     TOP
    .i_nc_clk        (i_nc_clk),
    .i_clk_o         (i_clk_o),
    .i_nc_rstn       (i_nc_rstn)  ,
    .i_prog_begin    (w_prog_begin),
    .o_prog_end      (flag_datain_end),
    .o_m2b_req       (o_m2b_req  ),
    .i_m2b_cmplt     (i_m2b_cmplt),
    .o_sp_en         (w_p_sp_en),
    .o_dqs_ce        (o_dqs_ce),
    .o_prog_dq       (w_prog_dq_o),
    .o_prog_ce_n     (w_prog_ce_n), 
    .o_prog_cle      (di_CLE),  
    .o_prog_ale      (di_ALE),
    .o_prog_wr_n     (di_W_R_n),
    .o_prog_dqs_t    (w_prog_dqs_t),
    .o_prog_dq_t     (w_prog_dq_t),
    .i_b2n_data      (i_pb_data),
    .o_b2n_addr      (w_b2n_addr),
    .o_b2n_en        (w_b2n_en  ),
    .o_b2n_we        (w_b2n_we  )
    );
    
    sync_status sync_status0(
    //NFC     TOP
    .i_nc_clk             (i_nc_clk),
    .i_clk_o              (i_clk_o),
    .i_nc_rstn            (i_nc_rstn)  ,
    .i_status_read_begin  (flag_status_begin),
    .o_status_read_end    (w_status_read_end),
    .o_st_begin           (w_st_begin),
    .o_st_data_cp         (w_sync_st_cp),
    .o_st_data            (w_st_data),
    .o_st_ce_n            (w_st_ce_n), 
    .o_st_cle             (st_CLE),
    .o_st_ale             (st_ALE), 
    .o_st_wr_n            (st_W_R_n), 
    .i_st_dq              (i_nand_dq),
    .i_st_dqs             (i_nand_dqs),
    .o_sta_rdy            (w_sta_rdy),
    .o_st_dq              (w_st_dq_o),
    .o_st_dq_t            (w_st_dq_t)
    );
    
    always @ (*)
    begin
         case ({w_rst_begin, w_mode_ch_begin, w_read_begin, w_prog_begin, w_st_begin})

         5'b1_0000 :
         begin
              o_nand_dq       <=  w_rst_io_o;
              o_nand_ce_n     <=  w_rst_ce_n;
         end
         
         5'b0_1000 :  //setting
         begin
              o_nand_dq       <= w_set_dq_o;
              o_nand_ce_n     <= w_set_ce_n;
         end
         
         5'b0_0100 :   //read
         begin
              o_nand_dq      <= w_read_dq_o;
              o_nand_ce_n    <= w_read_ce_n;
         end
         
         5'b0_0010 :   //prog
         begin
              o_nand_dq       <= w_prog_dq_o;
              o_nand_ce_n     <= w_prog_ce_n;
         end
         
         5'b0_0001 :   //status
         begin
              o_nand_dq       <= w_st_dq_o;
              o_nand_ce_n     <= w_st_ce_n;
         end
 
         default :  //operation
         begin
              o_nand_dq       <= w_op_dq_o;
              o_nand_ce_n     <= w_op_ce_n;
         end
       endcase
    end
endmodule
