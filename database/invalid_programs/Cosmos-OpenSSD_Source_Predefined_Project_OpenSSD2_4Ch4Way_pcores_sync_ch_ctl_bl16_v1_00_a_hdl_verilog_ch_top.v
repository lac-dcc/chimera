//////////////////////////////////////////////////////////////////////////////////
// ch_top.v for Cosmos OpenSSD
// Copyright (c) 2014 Hanyang University ENC Lab.
// Contributed by Taeyeong Huh <tyhuh@enc.hanyang.ac.kr>
//                Kibin Park <kbpark@enc.hanyang.ac.kr>
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
// Engineer: Taeyeong Huh <tyhuh@enc.hanyang.ac.kr>, Kibin Park <kbpark@enc.hanyang.ac.kr>
// 
// Project Name: Cosmos OpenSSD
// Design Name: channel controller
// Module Name: ch_controller
// File Name: ch_top.v
//
// Version: v2.0.0
//
// Description: 
//   - nand io, page buffer selection module
//   - include page_buffer, ch_arbiter, way_controller
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v2.1.0
//   - 8-way architecture, disabled 4 ways
//
// * v2.0.0
//   - change to 8-way architecture
//
// * v1.0.0
//   - first draft (4-way architecture)
//////////////////////////////////////////////////////////////////////////////////
`include "parameter.vh"

module ch_controller 
#(
  parameter REG_SEL_WD = `NUM_REG - 1
)(
  //system
  input  wire                                     i_bus_clk,
  input  wire                                     i_bus_rst,
  //host interface
  input  wire       [ REG_SEL_WD:0]               i_slv_rd_sel,
  input  wire       [ REG_SEL_WD:0]               i_slv_wr_sel,
  input  wire       [`SLV_DATA_WD-1:0]            i_slv_data,
  output reg        [`SLV_DATA_WD-1:0]            o_slv_data,
  input  wire       [`SLV_ADDR_WD-1:0]            i_slv_addr,
  input  wire                                     i_slv_rnw,
  output wire                                     o_sp_write_ack,
  output wire                                     o_sp_read_ack,
  input  wire                                     i_slv_sp_wr_ack,
  input  wire                                     i_slv_sp_rd_ack,
  
  //dma interface 
  input   wire                                    i_data_clk        ,
  input   wire                                    i_data_rst        ,
  output  wire       [`MST_ADDR_WD-1:0]           o_dma_addr        ,
  input   wire       [`MST_DATA_WD-1:0]           i_dma_data        ,
  output  wire       [`MST_DATA_WD-1:0]           o_dma_data        ,
  output  wire       [`DMA_LEN-1:0]               o_dma_length      ,
  output  wire                                    o_dma_rd_req      ,
  output  wire                                    o_dma_wr_req      ,
  input   wire                                    i_dma_cmd_ack     ,
  input   wire                                    i_dma_cmplt       ,
  input   wire                                    i_dma_rd_sof_n    ,
  input   wire                                    i_dma_rd_eof_n    ,
  input   wire                                    i_dma_rd_src_rdy_n,
  input   wire                                    i_dma_rd_src_dsc_n,
  output  wire                                    o_dma_rd_dst_rdy_n,
  output  wire                                    o_dma_rd_dst_dsc_n,
  output  wire                                    o_dma_wr_sof_n    ,
  output  wire                                    o_dma_wr_eof_n    ,
  output  wire                                    o_dma_wr_src_rdy_n,
  output  wire                                    o_dma_wr_src_dsc_n,
  input   wire                                    i_dma_wr_dst_rdy_n,
  input   wire                                    i_dma_wr_dst_dsc_n,
  //nand controller
  input  wire                                     i_nc_clk      ,
  input  wire                                     i_nc_rstn     ,
  input  wire       [`CIO_WD-1:0]                 i_nand_dq     ,          //data input
  output reg        [`CIO_WD-1:0]                 o_nand_dq     ,          //data output
  output reg                                      o_nand_dq_t   ,        //data direction
  output wire                                     o_nand_cle    ,         //command latch enable
  output wire                                     o_nand_ale    ,         //address latch enable
  output wire       [`WAY-1:0]                    o_nand_ce_n   ,        //chip enable
  output wire                                     o_nand_we_n   ,        //write enable & we
  output wire                                     o_nand_wr_n   ,        //read enable
  output wire                                     o_nand_wp_n   ,        //write protect
  input  wire       [`WAY-1:0]                    i_nand_rb     ,           //ready(1)/busy(0)
  input  wire                                     i_nand_dqs    ,
  output reg                                      o_nand_dqs_t  ,
  input  wire                                     i_clk_o       ,
  output wire                                     o_m_ch_cmplt  ,
  output wire                                     o_dqs_ce      ,
  //performance monitor
  output wire       [`WAY-1:0]                    o_prog_start  ,
  output wire       [`WAY-1:0]                    o_prog_end    ,
  output wire       [`WAY-1:0]                    o_read_start  ,
  output wire       [`WAY-1:0]                    o_read_end    ,
  output wire       [`WAY-1:0]                    o_erase_start ,
  output wire       [`WAY-1:0]                    o_erase_end   ,
  output wire       [`WAY-1:0]                    o_op_fail  
);
  
  //channel arbiter 
  wire              [`WAY-1:0]                    w_ch_req;
  wire              [`WAY-1:0]                    w_ch_grt;
  wire              [`WAY-1:0]                    w_maddr_ack;
  wire              [`SLV_DATA_WD*`WAY-1:0]       w_mem_addr;
  reg               [`SLV_DATA_WD-1:0]            r_mem_addr;
  wire              [`WAY-1:0]                    w_b2m_req;
  wire                                            w_b2m_cmplt;
  wire              [`WAY-1:0]                    w_m2b_req;
  wire                                            w_m2b_cmplt;
  
  //page buffer 
  wire              [`WAY-1:0]                    w_nand_pb_en;
  wire              [`WAY-1:0]                    w_nand_pb_we;
  reg                                             r_nand_pb_en;
  reg                                             r_nand_pb_we;
  wire              [`NAND_PBAWIDTH*`WAY-1:0]     w_nand_pb_addr;
  reg               [`NAND_PBAWIDTH-1:0]          r_nand_pb_addr;
  wire              [`CIO_WD-1:0]                 w_nand_pb_data_o;
  wire              [`CIO_WD*`WAY-1:0]            w_nand_pb_data_i;
  reg               [`CIO_WD-1:0]                 r_nand_pb_data_i;
  wire              [`WAY-1:0]                    w_sp_en;
  reg                                             r_sp_en; 
  wire                                            w_slv_sp_rd_wr_ack;
  
  //nand interface
  wire              [`CIO_WD*`WAY-1 :0]           w_nand_dq_o;
  wire              [`WAY-1:0]                    w_nand_dq_t;
  wire              [`WAY-1:0]                    w_nand_cle;
  wire              [`WAY-1:0]                    w_nand_ale;
  wire              [`WAY-1:0]                    w_nand_we_n;
  wire              [`WAY-1:0]                    w_nand_wr_n;
  wire              [`WAY-1:0]                    w_nand_wp_n;
  wire              [`WAY-1:0]                    w_nand_dqs_t;
  //wire              [`WAY-1:0]                    w_nand_prog_en;
  wire              [`WAY-1:0]                    w_m_ch_cmplt;
  wire              [`WAY-1:0]                    w_dqs_ce;
  
  //register selection
  wire              [`WAY-1:0]                    w_way_sel;
  wire              [`IO_WD*`WAY-1:0]             w_way_status;
  
  //slave data
  reg               [`SLV_DATA_WD-1:0]            r_slv_data;
  wire              [`SLV_DATA_WD-1:0]            w_slv_sp_data;
  wire              [`SLV_DATA_WD*`WAY-1 :0]      w_slv_data;

  //read_write_ack
  assign w_slv_sp_rd_wr_ack = |{i_slv_sp_wr_ack, i_slv_sp_rd_ack};
                             
  //register access  
  genvar i;
  generate 
    for (i=0; i<`WAY; i=i+1) begin : way_selection
      assign w_way_sel[i] = |{i_slv_rd_sel[`WAY_REG*(i+1)-1:`WAY_REG*i],i_slv_wr_sel[`WAY_REG*(i+1)-1:`WAY_REG*i]};
    end
  endgenerate
  //select, slave data output
  always@( * ) begin
    case(w_way_sel)
`ifdef WAY8
      8'b1000_0000: o_slv_data <= w_slv_data[`SLV_DATA_WD*8-1:`SLV_DATA_WD*7];
      8'b0100_0000: o_slv_data <= w_slv_data[`SLV_DATA_WD*7-1:`SLV_DATA_WD*6];
      8'b0010_0000: o_slv_data <= w_slv_data[`SLV_DATA_WD*6-1:`SLV_DATA_WD*5];
      8'b0001_0000: o_slv_data <= w_slv_data[`SLV_DATA_WD*5-1:`SLV_DATA_WD*4];
      8'b0000_1000: o_slv_data <= w_slv_data[`SLV_DATA_WD*4-1:`SLV_DATA_WD*3];
      8'b0000_0100: o_slv_data <= w_slv_data[`SLV_DATA_WD*3-1:`SLV_DATA_WD*2];
      8'b0000_0010: o_slv_data <= w_slv_data[`SLV_DATA_WD*2-1:`SLV_DATA_WD*1];
      8'b0000_0001: o_slv_data <= w_slv_data[`SLV_DATA_WD*1-1:`SLV_DATA_WD*0];
      default: o_slv_data <= w_slv_sp_data;
    
`else `ifdef WAY4
      4'b1000: o_slv_data <= w_slv_data[`SLV_DATA_WD*4-1:`SLV_DATA_WD*3];
      4'b0100: o_slv_data <= w_slv_data[`SLV_DATA_WD*3-1:`SLV_DATA_WD*2];
      4'b0010: o_slv_data <= w_slv_data[`SLV_DATA_WD*2-1:`SLV_DATA_WD*1];
      4'b0001: o_slv_data <= w_slv_data[`SLV_DATA_WD*1-1:`SLV_DATA_WD*0];
      default: o_slv_data <= r_slv_data;
`else `ifdef WAY2
        2'b10: o_slv_data <= w_slv_data[`SLV_DATA_WD*2-1:`SLV_DATA_WD*1];
        2'b01: o_slv_data <= w_slv_data[`SLV_DATA_WD*1-1:`SLV_DATA_WD*0];
      default: o_slv_data <= r_slv_data;
`else `ifdef WAY1
        1'b1:  o_slv_data <= w_slv_data;
     default:  o_slv_data <= r_slv_data;
`endif `endif `endif `endif
    endcase
  end
  
  always@( posedge i_data_clk ) begin //*
  `ifdef WAY8
     case(w_ch_grt)
      8'b1000_0000: r_mem_addr <= w_mem_addr[`SLV_DATA_WD*8-1:`SLV_DATA_WD*7];
      8'b0100_0000: r_mem_addr <= w_mem_addr[`SLV_DATA_WD*7-1:`SLV_DATA_WD*6];
      8'b0010_0000: r_mem_addr <= w_mem_addr[`SLV_DATA_WD*6-1:`SLV_DATA_WD*5];
      8'b0001_0000: r_mem_addr <= w_mem_addr[`SLV_DATA_WD*5-1:`SLV_DATA_WD*4];
      8'b0000_1000: r_mem_addr <= w_mem_addr[`SLV_DATA_WD*4-1:`SLV_DATA_WD*3];
      8'b0000_0100: r_mem_addr <= w_mem_addr[`SLV_DATA_WD*3-1:`SLV_DATA_WD*2];
      8'b0000_0010: r_mem_addr <= w_mem_addr[`SLV_DATA_WD*2-1:`SLV_DATA_WD*1];
      default     : r_mem_addr <= w_mem_addr[`SLV_DATA_WD*1-1:`SLV_DATA_WD*0];
    endcase
  `else `ifdef WAY4
    case(w_ch_grt)
      4'b1000: r_mem_addr <= w_mem_addr[`SLV_DATA_WD*4-1:`SLV_DATA_WD*3];
      4'b0100: r_mem_addr <= w_mem_addr[`SLV_DATA_WD*3-1:`SLV_DATA_WD*2];
      4'b0010: r_mem_addr <= w_mem_addr[`SLV_DATA_WD*2-1:`SLV_DATA_WD*1];
      default: r_mem_addr <= w_mem_addr[`SLV_DATA_WD*1-1:`SLV_DATA_WD*0];
    endcase
  `else `ifdef WAY2
    case(w_ch_grt)
        2'b10: r_mem_addr <= w_mem_addr[`SLV_DATA_WD*2-1:`SLV_DATA_WD*1];
      default: r_mem_addr <= w_mem_addr[`SLV_DATA_WD*1-1:`SLV_DATA_WD*0];
    endcase
  `else `ifdef WAY1
    r_mem_addr <= w_mem_addr;
  `endif `endif `endif `endif
  end
  
  //page buffer
  always@(posedge i_nc_clk) begin  //*
  `ifdef WAY8
    case(w_ch_grt)
      8'b1000_0000: r_nand_pb_addr <= ~(w_nand_pb_addr[`NAND_PBAWIDTH*8-1:`NAND_PBAWIDTH*7]);
      8'b0100_0000: r_nand_pb_addr <= ~(w_nand_pb_addr[`NAND_PBAWIDTH*7-1:`NAND_PBAWIDTH*6]);
      8'b0010_0000: r_nand_pb_addr <= ~(w_nand_pb_addr[`NAND_PBAWIDTH*6-1:`NAND_PBAWIDTH*5]);
      8'b0001_0000: r_nand_pb_addr <= ~(w_nand_pb_addr[`NAND_PBAWIDTH*5-1:`NAND_PBAWIDTH*4]);
      8'b0000_1000: r_nand_pb_addr <= ~(w_nand_pb_addr[`NAND_PBAWIDTH*4-1:`NAND_PBAWIDTH*3]);
      8'b0000_0100: r_nand_pb_addr <= ~(w_nand_pb_addr[`NAND_PBAWIDTH*3-1:`NAND_PBAWIDTH*2]);
      8'b0000_0010: r_nand_pb_addr <= ~(w_nand_pb_addr[`NAND_PBAWIDTH*2-1:`NAND_PBAWIDTH*1]);
      default     : r_nand_pb_addr <= ~(w_nand_pb_addr[`NAND_PBAWIDTH*1-1:`NAND_PBAWIDTH*0]);
    endcase
  `else `ifdef WAY4
    case(w_ch_grt)
      4'b1000: r_nand_pb_addr <= ~(w_nand_pb_addr[`NAND_PBAWIDTH*4-1:`NAND_PBAWIDTH*3]);
      4'b0100: r_nand_pb_addr <= ~(w_nand_pb_addr[`NAND_PBAWIDTH*3-1:`NAND_PBAWIDTH*2]);
      4'b0010: r_nand_pb_addr <= ~(w_nand_pb_addr[`NAND_PBAWIDTH*2-1:`NAND_PBAWIDTH*1]);
      default: r_nand_pb_addr <= ~(w_nand_pb_addr[`NAND_PBAWIDTH*1-1:`NAND_PBAWIDTH*0]);
    endcase
  `else `ifdef WAY2
      case(w_ch_grt)
        2'b10: r_nand_pb_addr <= ~(w_nand_pb_addr[`NAND_PBAWIDTH*2-1:`NAND_PBAWIDTH*1]);
      default: r_nand_pb_addr <= ~(w_nand_pb_addr[`NAND_PBAWIDTH*1-1:`NAND_PBAWIDTH*0]);
    endcase
  `else `ifdef WAY1
    r_nand_pb_addr <= ~(w_nand_pb_addr);
  `endif `endif `endif `endif
  end
  
  always@(posedge i_nc_clk) begin //*
  `ifdef WAY8
    case(w_ch_grt)
      8'b1000_0000: r_nand_pb_data_i <= w_nand_pb_data_i[`CIO_WD*8-1:`CIO_WD*7];
      8'b0100_0000: r_nand_pb_data_i <= w_nand_pb_data_i[`CIO_WD*7-1:`CIO_WD*6];
      8'b0010_0000: r_nand_pb_data_i <= w_nand_pb_data_i[`CIO_WD*6-1:`CIO_WD*5];
      8'b0001_0000: r_nand_pb_data_i <= w_nand_pb_data_i[`CIO_WD*5-1:`CIO_WD*4];
      8'b0000_1000: r_nand_pb_data_i <= w_nand_pb_data_i[`CIO_WD*4-1:`CIO_WD*3];
      8'b0000_0100: r_nand_pb_data_i <= w_nand_pb_data_i[`CIO_WD*3-1:`CIO_WD*2];
      8'b0000_0010: r_nand_pb_data_i <= w_nand_pb_data_i[`CIO_WD*2-1:`CIO_WD*1];
      default     : r_nand_pb_data_i <= w_nand_pb_data_i[`CIO_WD*1-1:`CIO_WD*0];
    endcase
  `else `ifdef WAY4
    case(w_ch_grt)
      4'b1000: r_nand_pb_data_i <= w_nand_pb_data_i[`CIO_WD*4-1:`CIO_WD*3];
      4'b0100: r_nand_pb_data_i <= w_nand_pb_data_i[`CIO_WD*3-1:`CIO_WD*2];
      4'b0010: r_nand_pb_data_i <= w_nand_pb_data_i[`CIO_WD*2-1:`CIO_WD*1];
      default: r_nand_pb_data_i <= w_nand_pb_data_i[`CIO_WD*1-1:`CIO_WD*0];
    endcase
  `else `ifdef WAY2
    case(w_ch_grt)
        2'b10: r_nand_pb_data_i <= w_nand_pb_data_i[`CIO_WD*2-1:`CIO_WD*1];
      default: r_nand_pb_data_i <= w_nand_pb_data_i[`CIO_WD*1-1:`CIO_WD*0];
    endcase
  `else `ifdef WAY1
    r_nand_pb_data_i <= w_nand_pb_data_i;
  `endif `endif `endif `endif
  end
  //en
  always@(posedge i_nc_clk) begin //*
    case(w_ch_grt)
      8'b1000_0000: r_nand_pb_en <= w_nand_pb_en[7];
      8'b0100_0000: r_nand_pb_en <= w_nand_pb_en[6];
      8'b0010_0000: r_nand_pb_en <= w_nand_pb_en[5];
      8'b0001_0000: r_nand_pb_en <= w_nand_pb_en[4];
      8'b0000_1000: r_nand_pb_en <= w_nand_pb_en[3];
      8'b0000_0100: r_nand_pb_en <= w_nand_pb_en[2];
      8'b0000_0010: r_nand_pb_en <= w_nand_pb_en[1];
      default     : r_nand_pb_en <= w_nand_pb_en[0];
    endcase
  end
  //we
  always@(posedge i_nc_clk) begin //*
    case(w_ch_grt)
      8'b1000_0000: r_nand_pb_we <= w_nand_pb_we[7];
      8'b0100_0000: r_nand_pb_we <= w_nand_pb_we[6];
      8'b0010_0000: r_nand_pb_we <= w_nand_pb_we[5];
      8'b0001_0000: r_nand_pb_we <= w_nand_pb_we[4];
      8'b0000_1000: r_nand_pb_we <= w_nand_pb_we[3];
      8'b0000_0100: r_nand_pb_we <= w_nand_pb_we[2];
      8'b0000_0010: r_nand_pb_we <= w_nand_pb_we[1];
      default     : r_nand_pb_we <= w_nand_pb_we[0];
    endcase
  end
  //sp_en
  always @ (posedge i_nc_clk)
  begin
       case(w_ch_grt)
           8'b1000_0000: r_sp_en <= w_sp_en[7];
           8'b0100_0000: r_sp_en <= w_sp_en[6];
           8'b0010_0000: r_sp_en <= w_sp_en[5];
           8'b0001_0000: r_sp_en <= w_sp_en[4];
           8'b0000_1000: r_sp_en <= w_sp_en[3];
           8'b0000_0100: r_sp_en <= w_sp_en[2];
           8'b0000_0010: r_sp_en <= w_sp_en[1];
           default     : r_sp_en <= w_sp_en[0];
       endcase
  end
  
  //signal assign - nand interface
  assign o_nand_cle  = |{w_nand_cle };
  assign o_nand_ale  = |{w_nand_ale };
  assign o_nand_wr_n = &{w_nand_wr_n};
  assign o_nand_wp_n = &{w_nand_wp_n};
  assign o_nand_we_n = &{w_nand_we_n};
  
  assign o_m_ch_cmplt   = &{w_m_ch_cmplt[0],w_m_ch_cmplt[1],w_m_ch_cmplt[2],w_m_ch_cmplt[3]};
  assign o_dqs_ce       = &{w_dqs_ce};
  
  always@( * ) begin
  `ifdef WAY8
    case(w_ch_grt)
      8'b1000_0000: begin
        o_nand_dq    <= w_nand_dq_o[`CIO_WD*8-1:`CIO_WD*7];
        o_nand_dq_t  <= w_nand_dq_t[7];
        o_nand_dqs_t <= w_nand_dqs_t[7];
      end
      8'b0100_0000: begin
        o_nand_dq    <= w_nand_dq_o[`CIO_WD*7-1:`CIO_WD*6];
        o_nand_dq_t  <= w_nand_dq_t[6];
        o_nand_dqs_t <= w_nand_dqs_t[6];  
      end
      8'b0010_0000: begin
        o_nand_dq    <= w_nand_dq_o[`CIO_WD*6-1:`CIO_WD*5];
        o_nand_dq_t  <= w_nand_dq_t[5];
        o_nand_dqs_t <= w_nand_dqs_t[5];
      end
      8'b0001_0000: begin
        o_nand_dq    <= w_nand_dq_o[`CIO_WD*5-1:`CIO_WD*4];
        o_nand_dq_t  <= w_nand_dq_t[4];
        o_nand_dqs_t <= w_nand_dqs_t[4];
      end
      8'b0000_1000: begin
        o_nand_dq    <= w_nand_dq_o[`CIO_WD*4-1:`CIO_WD*3];
        o_nand_dq_t  <= w_nand_dq_t[3];
        o_nand_dqs_t <= w_nand_dqs_t[3];
      end
      8'b0000_0100: begin
        o_nand_dq    <= w_nand_dq_o[`CIO_WD*3-1:`CIO_WD*2];
        o_nand_dq_t  <= w_nand_dq_t[2];
        o_nand_dqs_t <= w_nand_dqs_t[2];  
      end
      8'b0000_0010: begin
        o_nand_dq    <= w_nand_dq_o[`CIO_WD*2-1:`CIO_WD*1];
        o_nand_dq_t  <= w_nand_dq_t[1];
        o_nand_dqs_t <= w_nand_dqs_t[1];
      end
      default: begin
        o_nand_dq    <= w_nand_dq_o[`CIO_WD*1-1:`CIO_WD*0];
        o_nand_dq_t  <= w_nand_dq_t[0];
        o_nand_dqs_t <= w_nand_dqs_t[0];
      end
    endcase
  `else `ifdef WAY4
    case(w_ch_grt)
      4'b1000: begin
        o_nand_dq    <= w_nand_dq_o[`CIO_WD*4-1:`CIO_WD*3];
        o_nand_dq_t  <= w_nand_dq_t[3];
        o_nand_dqs_t <= w_nand_dqs_t[3]; 
      end
      4'b0100: begin
        o_nand_dq    <= w_nand_dq_o[`CIO_WD*3-1:`CIO_WD*2];
        o_nand_dq_t  <= w_nand_dq_t[2];
        o_nand_dqs_t <= w_nand_dqs_t[2];  
      end
      4'b0010: begin
        o_nand_dq    <= w_nand_dq_o[`CIO_WD*2-1:`CIO_WD*1];
        o_nand_dq_t  <= w_nand_dq_t[1];
        o_nand_dqs_t <= w_nand_dqs_t[1];
      end
      default: begin
        o_nand_dq    <= w_nand_dq_o[`CIO_WD*1-1:`CIO_WD*0];
        o_nand_dq_t  <= w_nand_dq_t[0];
        o_nand_dqs_t <= w_nand_dqs_t[0]; 
      end
    endcase
  `else `ifdef WAY2
    case(w_ch_grt)
      2'b10: begin
        o_nand_dq    <= w_nand_dq_o[`CIO_WD*2-1:`CIO_WD*1];
        o_nand_dq_t  <= w_nand_dq_t[1];
        o_nand_dqs_t <= w_nand_dqs_t[1];
      end
      default: begin
        o_nand_dq    <= w_nand_dq_o[`CIO_WD*1-1:`CIO_WD*0];
        o_nand_dq_t  <= w_nand_dq_t[0];
        o_nand_dqs_t <= w_nand_dqs_t[0];
      end
    endcase
  `else `ifdef WAY1
    o_nand_dq    <= w_nand_dq_o;
    o_nand_dq_t  <= w_nand_dq_t;
    o_nand_dqs_t <= w_nand_dqs_t;
  `endif `endif `endif `endif
  end

  //channel arbiter
  ch_arbiter ch_abt0 (
    .i_nc_clk(i_nc_clk),
    .i_nc_rstn(i_nc_rstn),
    .i_ch_req(w_ch_req),
    .o_ch_grt(w_ch_grt));
  
  //page buffer
  page_buffer pbuf0 (
    .i_nc_clk                 (i_nc_clk),
    //.i_clk_50                 (i_clk_50),
    .i_nc_rstn                (i_nc_rstn),
    .i_data_clk               (i_data_clk),
    .i_data_rst               (i_data_rst),
    //nand controller
    .i_mem_addr_ack           (|w_maddr_ack),
    .i_mem_addr               (r_mem_addr),
    .i_b2m_req                (|w_b2m_req),
    .o_b2m_cmplt              (w_b2m_cmplt),
    .i_m2b_req                (|w_m2b_req),
    .o_m2b_cmplt              (w_m2b_cmplt),
    //memory interface for nand
    .i_nand_pb_addr           (r_nand_pb_addr),
    .i_nand_pb_en             (r_nand_pb_en),
    .i_nand_pb_we             (r_nand_pb_we),
    .i_nand_pb_data           (r_nand_pb_data_i),
    .o_nand_pb_data           (w_nand_pb_data_o),
    //axi_burst_data
    .o_dma_addr               (o_dma_addr         ),
    .i_dma_data               (i_dma_data         ),
    .o_dma_data               (o_dma_data         ),
    .o_dma_length             (o_dma_length       ),
    .o_dma_rd_req             (o_dma_rd_req       ),
    .o_dma_wr_req             (o_dma_wr_req       ),
    .i_dma_cmd_ack            (i_dma_cmd_ack      ),
    .i_dma_cmplt              (i_dma_cmplt        ),
    .i_dma_rd_sof_n           (i_dma_rd_sof_n     ),
    .i_dma_rd_eof_n           (i_dma_rd_eof_n     ),
    .i_dma_rd_src_rdy_n       (i_dma_rd_src_rdy_n ),
    .i_dma_rd_src_dsc_n       (i_dma_rd_src_dsc_n ),
    .o_dma_rd_dst_rdy_n       (o_dma_rd_dst_rdy_n ),
    .o_dma_rd_dst_dsc_n       (o_dma_rd_dst_dsc_n ),
    .o_dma_wr_sof_n           (o_dma_wr_sof_n     ),
    .o_dma_wr_eof_n           (o_dma_wr_eof_n     ),
    .o_dma_wr_src_rdy_n       (o_dma_wr_src_rdy_n ),
    .o_dma_wr_src_dsc_n       (o_dma_wr_src_dsc_n ),
    .i_dma_wr_dst_rdy_n       (i_dma_wr_dst_rdy_n ),
    .i_dma_wr_dst_dsc_n       (i_dma_wr_dst_dsc_n ),
    //spare
    .i_sp_en                  (r_sp_en            ),
    .i_slv_addr               (i_slv_addr         ),
    .i_slv_rnw                (i_slv_rnw          ),
    .i_slv_data               (i_slv_data         ),
    .o_slv_data               (w_slv_sp_data      ),
    .o_slv_write_ack          (o_sp_write_ack     ),
    .o_slv_read_ack           (o_sp_read_ack      ), 
    .i_slv_rd_wr_ack          (w_slv_sp_rd_wr_ack )
    );
    
  //way generate
  generate
    for (i=0; i<`WAY; i=i+1) begin : way_controller
      way_controller way (
        //system
        .i_bus_clk            (i_bus_clk),
        .i_bus_rst            (i_bus_rst),
        .i_nc_clk             (i_nc_clk),
        .i_nc_rstn            (i_nc_rstn),
        //control
        .o_maddr_ack          (w_maddr_ack[i]),
        .o_mem_addr           (w_mem_addr[`SLV_DATA_WD*(i+1)-1:`SLV_DATA_WD*i]),
        .o_b2m_req            (w_b2m_req[i]),
        .i_b2m_cmplt          (w_b2m_cmplt),
        .o_m2b_req            (w_m2b_req[i]),
        .i_m2b_cmplt          (w_m2b_cmplt),
        .o_status             (w_way_status[`IO_WD*(i+1)-1:`IO_WD*i]),
        //channel arbitration
        .o_ch_req             (w_ch_req[i]),
        .i_ch_grt             (w_ch_grt[i]),
         //page buffer interface
        .o_pb_en              (w_nand_pb_en[i] ),
        .o_pb_we              (w_nand_pb_we[i] ),
        .o_pb_addr            (w_nand_pb_addr[`NAND_PBAWIDTH*(i+1)-1:`NAND_PBAWIDTH*i]),
        .i_pb_data_o          (w_nand_pb_data_o),
        .o_pb_data_i          (w_nand_pb_data_i[`CIO_WD*(i+1)-1:`CIO_WD*i]),
        //host interface
        .i_slv_rd_sel         (i_slv_rd_sel[`WAY_REG*(i+1)-1:`WAY_REG*i]),
        .i_slv_wr_sel         (i_slv_wr_sel[`WAY_REG*(i+1)-1:`WAY_REG*i]),
        .i_slv_data           (i_slv_data),
        .o_slv_data           (w_slv_data[`SLV_DATA_WD*(i+1)-1:`SLV_DATA_WD*i]),
        //nand interface
        .i_clk_o              (i_clk_o),
        .i_nand_dq            (i_nand_dq), 
        .o_nand_dq            (w_nand_dq_o[`CIO_WD*(i+1)-1:`CIO_WD*i]), 
        .o_nand_dq_t          (w_nand_dq_t[i]),
        .o_nand_cle           (w_nand_cle[i]),
        .o_nand_ale           (w_nand_ale[i]),
        .o_nand_ce_n          (o_nand_ce_n[i]),
        .o_nand_we_n          (w_nand_we_n[i]),
        .o_nand_wr_n          (w_nand_wr_n[i]),
        .o_nand_wp_n          (w_nand_wp_n[i]),
        .i_nand_rb            (i_nand_rb[i]),
        .i_nand_dqs           (i_nand_dqs),
        .o_nand_dqs_t         (w_nand_dqs_t[i]),
        .o_m_ch_cmplt         (w_m_ch_cmplt[i]),
        .o_dqs_ce             (w_dqs_ce[i]),
        .o_sp_en              (w_sp_en[i]),
        .o_prog_start         (o_prog_start [i]),
        .o_prog_end           (o_prog_end   [i]),
        .o_read_start         (o_read_start [i]),
        .o_read_end           (o_read_end   [i]),
        .o_erase_start        (o_erase_start[i]),
        .o_erase_end          (o_erase_end  [i]),
        .o_op_fail            (o_op_fail    [i])
      );
    end
  endgenerate
  
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
