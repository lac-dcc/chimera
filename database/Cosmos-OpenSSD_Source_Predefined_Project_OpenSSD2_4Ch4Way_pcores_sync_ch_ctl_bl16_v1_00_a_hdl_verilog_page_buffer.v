// This program was cloned from: https://github.com/Cosmos-OpenSSD/Cosmos-OpenSSD
// License: GNU General Public License v3.0

//////////////////////////////////////////////////////////////////////////////////
// page_buffer.v for Cosmos OpenSSD
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
// Design Name: dma controller
// Module Name: page_buffer
// File Name: page_buffer.v
//
// Version: v3.1.0-BL16
//
// Description: 
//   - control the data flow from nand device or DRAM buffer
//   - data width: 64
//   - burst length: 16
//   - include BCH engine to correct error bits
//   - include 40B spare data buffer
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v3.1.0
//   - modify burst length from 256 to 16
//
// * v3.0.0
//   - insert 40B spare data buffer
//
// * v2.0.0
//   - insert BCH engine (error correction capability: 2KB/32-bit)
//
// * v1.0.0
//   - first draft 
//////////////////////////////////////////////////////////////////////////////////
`include "parameter.vh"

module page_buffer#(
 parameter         LAST_SPARE                    = 0)
(
  input   wire                                    i_nc_clk,
  input   wire                                    i_nc_rstn,
  input   wire                                    i_data_clk,
  input   wire                                    i_data_rst,
  //controller
  input   wire                                    i_mem_addr_ack,
  input   wire      [`SLV_DATA_WD-1:0]            i_mem_addr,
  input   wire                                    i_b2m_req,
  output  wire                                    o_b2m_cmplt,
  input   wire                                    i_m2b_req,
  output  wire                                    o_m2b_cmplt,
  //page buffer interface for nand
  input   wire                                    i_nand_pb_en  ,
  input   wire                                    i_nand_pb_we  ,
  input   wire      [`NAND_PBAWIDTH-1:0]          i_nand_pb_addr,
  input   wire      [`CIO_WD-1:0]                 i_nand_pb_data,
  output  reg       [`CIO_WD-1:0]                 o_nand_pb_data,
  //dma interface
  output reg        [`MST_ADDR_WD-1:0]            o_dma_addr        ,
  input  wire       [`MST_DATA_WD-1:0]            i_dma_data        ,
  output wire       [`MST_DATA_WD-1:0]            o_dma_data        ,
  output wire       [`DMA_LEN-1:0]                o_dma_length      ,
  output reg                                      o_dma_rd_req      ,
  output reg                                      o_dma_wr_req      ,
  input  wire                                     i_dma_cmd_ack     ,
  input  wire                                     i_dma_cmplt       ,
  input  wire                                     i_dma_rd_sof_n    ,
  input  wire                                     i_dma_rd_eof_n    ,
  input  wire                                     i_dma_rd_src_rdy_n,
  input  wire                                     i_dma_rd_src_dsc_n,
  output reg                                      o_dma_rd_dst_rdy_n,
  output wire                                     o_dma_rd_dst_dsc_n,
  output wire                                     o_dma_wr_sof_n    ,
  output wire                                     o_dma_wr_eof_n    ,
  output reg                                      o_dma_wr_src_rdy_n,
  output wire                                     o_dma_wr_src_dsc_n,
  input  wire                                     i_dma_wr_dst_rdy_n,
  input  wire                                     i_dma_wr_dst_dsc_n,
  input  wire                                     i_sp_en           ,
  input  wire       [`SLV_ADDR_WD-1:0]            i_slv_addr        ,
  input  wire                                     i_slv_rnw         ,
  input  wire       [`SLV_DATA_WD-1:0]            i_slv_data        ,
  output wire       [`SLV_DATA_WD-1:0]            o_slv_data        ,
  output reg                                      o_slv_write_ack   ,
  output reg                                      o_slv_read_ack    ,
  input  wire                                     i_slv_rd_wr_ack
  );
  
  parameter         IDLE                          = 4'b0000;
  parameter         ERR_CORRECTION                = 4'b0001;
  parameter         BUF2MEM_RDY                   = 4'b0011;
  parameter         BUF2MEM_REQ                   = 4'b0010;
  parameter         BUF2MEM                       = 4'b0110;
  parameter         BUF2MEM_CMPLT                 = 4'b0111;
  parameter         BUF2MEM_WAIT                  = 4'b0101;
  parameter         MEM2BUF_REQ                   = 4'b0100;
  parameter         MEM2BUF                       = 4'b1100;
  parameter         MEM2BUF_WAIT                  = 4'b1101;
  parameter         ECC_GEN                       = 4'b1111;
  parameter         MEM2BUF_CMPLT                 = 4'b1011;
  parameter         MEM_ADDR_ADD                  = 4'b1001;
  parameter         CMPLT_DELAY                   = 4'b1000;
  
  //state
  reg               [3:0]                         r_current_state;
  reg               [3:0]                         r_next_state;
  //counter
  reg               [1:0]                         r_cmplt_delay_cnt;
  reg               [3:0]                         r_m2b_cnt;
  reg               [3:0]                         r_b2m_cnt;
  //command trigger
  wire              [`DMA_LEN-`CLST:0]            w_dma_len;
  //buffer
  reg               [clogb2(`DB_SIZE)-1:0]        r_dbuf_addr;        //data area address
  wire              [clogb2(`DB_SIZE)-1:0]        w_dma_buf_addr;
  wire              [clogb2(`DB_SIZE)-1:0]        w_pre_dbuf_addr;    //for data prepatch
  reg                                             r_dbuf_addr_sel;
  reg                                             r_dma_buf_en;
  reg                                             r_dma_buf_we;
  wire                                            w_wr_sof;
  wire                                            w_wr_eof;
  
  reg               [`NAND_PBAWIDTH-1:0]          r_pbuf_addr;
  reg                                             r_pbuf_en;
  reg                                             r_pbuf_we;
  reg               [`CIO_WD-1:0]                 r_nand_pb_data;
  wire              [`CIO_WD-1:0]                 w_nand_pb_data;
  reg               [`NAND_SBDEPTH-1:0]           r_sbuf_addr;
  reg                                             r_sbuf_en;
  reg                                             r_sbuf_we; 
  reg               [`CIO_WD-1:0]                 r_nand_sb_data;
  wire              [`CIO_WD-1:0]                 w_nand_sb_data;
  reg               [`SLV_DATA_WD-1:0]            r_sp_slv_data;
  reg               [3:0]                         r_sp_addr;
  reg                                             r_sp_en;
  reg                                             r_sp_we;
  reg                                             r_slv_read_ack;
  reg                                             s_slv_read_ack;
  wire              [3:0]                         w_decoded_addr;
  
  reg                       r_sp_start;
  reg                       r_m2b_cmplt;
  reg                       r_m2b_cmplt_1;
  reg                       r_b2m_cmplt;
  reg                       r_b2m_cmplt_1;
  
  //ecc encoder
  reg                       r_ecc_gen_start;
  wire                      w_ecc_gen_cmplt;
  wire                      w_enc_en       ;
  wire                      w_enc_we       ;
  wire [`NAND_PBAWIDTH-1:0] w_enc_addr     ;
  wire [`CIO_WD-1:0]        w_enc_data_o   ;
  
  //ecc decoder
  reg                       r_err_cor_start;
  wire                      w_err_cor_cmplt;
  wire                      w_dec_en       ;
  wire                      w_dec_we       ;
  wire [`NAND_PBAWIDTH-1:0] w_dec_addr     ;
  wire [`CIO_WD-1:0]        w_dec_data_o   ;
  
  ////
  assign w_decoded_addr = (i_slv_addr[5:4]<<2)+(i_slv_addr[3:0]>>2);
  
  //dma interface
  assign w_dma_len = (`DMA_UNIT/`CLST);
  assign o_dma_length = w_dma_len;
  assign o_dma_rd_dst_dsc_n = 1;
  assign o_dma_wr_src_dsc_n = 1;
  assign w_wr_sof = ( &r_dbuf_addr[3:0]) ? 'b1:'b0;  
  assign w_wr_eof = (~|r_dbuf_addr[3:0]) ? 'b1:'b0;
  assign o_dma_wr_sof_n = ((!o_dma_wr_src_rdy_n)&(w_wr_sof)) ? 'b0:'b1;
  assign o_dma_wr_eof_n = ((!o_dma_wr_src_rdy_n)&(w_wr_eof)) ? 'b0:'b1;
  
  //buffer address
  assign w_dma_buf_addr = (r_dbuf_addr_sel) ? (~r_dbuf_addr) : (~w_pre_dbuf_addr);
  
  //memory address
  always@(posedge i_data_clk)
  begin
      if(i_mem_addr_ack) 
      begin
           o_dma_addr <= i_mem_addr;
      end 
      else 
      begin
           case(r_current_state)
               BUF2MEM_WAIT: o_dma_addr <= o_dma_addr + `DMA_UNIT;
               MEM2BUF_WAIT: o_dma_addr <= o_dma_addr + `DMA_UNIT;
               default:      o_dma_addr <= o_dma_addr;
           endcase
      end
  end

  //buffer address
  always@(posedge i_data_clk) begin
    if(i_data_rst) begin
      r_dbuf_addr <= `DB_SIZE-1;
    end else begin
      case(r_current_state)
        IDLE: begin
          r_dbuf_addr <= `DB_SIZE-1;
        end
        BUF2MEM_REQ, BUF2MEM: begin
          if(!i_dma_wr_dst_rdy_n)
            r_dbuf_addr <= (r_dbuf_addr!=0)? r_dbuf_addr-1 : r_dbuf_addr;
        end
        MEM2BUF: begin
          if(!i_dma_rd_src_rdy_n)
            r_dbuf_addr <= (r_dbuf_addr!=0)? r_dbuf_addr-1 : r_dbuf_addr;
        end
      endcase
    end
  end
  
  //prepatch address
  assign w_pre_dbuf_addr = r_dbuf_addr-'b1;
  
  //select buffer address
  always@( * ) begin
    case(r_current_state)
      BUF2MEM_REQ, BUF2MEM: begin
        if(!i_dma_wr_dst_rdy_n) r_dbuf_addr_sel <= 'b0;
        else                    r_dbuf_addr_sel <= 'b1;
      end
      default:                  r_dbuf_addr_sel <= 'b1;
    endcase
  end
  
  //buffer
  always@( * ) begin
    case(r_current_state)
      MEM2BUF: begin
        r_dma_buf_en <= ~i_dma_rd_src_rdy_n;
        r_dma_buf_we <= ~i_dma_rd_src_rdy_n;
      end
      BUF2MEM_RDY, BUF2MEM_REQ , BUF2MEM : begin
        r_dma_buf_en <= 'b1;
        r_dma_buf_we <= 'b0;
      end
      default: begin
        r_dma_buf_en <= 'b0;
        r_dma_buf_we <= 'b0;
      end
    endcase
  end
  
  //state machine
  always@( * ) begin
    case(r_current_state)
      IDLE: begin
        case({i_b2m_req,i_m2b_req})
            2'b10: r_next_state <= ERR_CORRECTION; //read
            2'b01: r_next_state <= MEM2BUF_REQ; //program
          default: r_next_state <= IDLE;
        endcase
      end
      
      ERR_CORRECTION:
      begin
           r_next_state <= (w_err_cor_cmplt) ? BUF2MEM_RDY : ERR_CORRECTION;
      end
      
      // data transfer for read //----------------------------------------------
      BUF2MEM_RDY: begin
        r_next_state <= BUF2MEM_REQ;
      end
      BUF2MEM_REQ: begin
        if(i_dma_cmd_ack)
          r_next_state <= BUF2MEM;
        else
          r_next_state <= BUF2MEM_REQ;
      end
      BUF2MEM: begin
        if(!i_dma_wr_dst_rdy_n) begin
          if(w_wr_eof)
            r_next_state <= BUF2MEM_CMPLT;
          else
            r_next_state <= BUF2MEM;
        end else begin
          r_next_state <= BUF2MEM;
        end
      end
      
      BUF2MEM_CMPLT: begin 
        if(i_dma_cmplt)
          r_next_state <= BUF2MEM_WAIT;
        else
          r_next_state <= BUF2MEM_CMPLT;
      end
      
      BUF2MEM_WAIT:
      begin
           r_next_state <= (r_b2m_cnt) ? BUF2MEM_RDY : MEM_ADDR_ADD;
      end

      // data transfer for program //-------------------------------------------
      MEM2BUF_REQ: begin
        if(i_dma_cmd_ack)
          r_next_state <= MEM2BUF;
        else
          r_next_state <= MEM2BUF_REQ;
      end
      MEM2BUF: begin
        if(i_dma_cmplt)
          r_next_state <= MEM2BUF_WAIT;
        else
          r_next_state <= MEM2BUF;
      end
      
      MEM2BUF_WAIT:
      begin
           r_next_state <= (r_m2b_cnt) ? MEM2BUF_REQ : ECC_GEN;
      end
      
      ECC_GEN:
      begin
        if(w_ecc_gen_cmplt) r_next_state <= MEM2BUF_CMPLT;
        else                r_next_state <= ECC_GEN;
      end
      
      MEM2BUF_CMPLT: begin 
        r_next_state <= MEM_ADDR_ADD;
      end 
      
      MEM_ADDR_ADD: 
      begin
           r_next_state <= CMPLT_DELAY;
      end
      
      CMPLT_DELAY:
      begin
           r_next_state <= (r_cmplt_delay_cnt) ? CMPLT_DELAY : IDLE;
      end
      
      default: begin
        r_next_state <= IDLE;
      end
    endcase
  end
  
  //ctl signal
  always@( * ) begin
    case(r_current_state)
      IDLE: begin
        o_dma_rd_req <= 'b0;
        o_dma_wr_req <= 'b0;
        o_dma_rd_dst_rdy_n <= 'b1;
        o_dma_wr_src_rdy_n <= 'b1;
      end
      
      ERR_CORRECTION:
      begin
           o_dma_rd_req <= 'b0;
           o_dma_wr_req <= 'b0;
           o_dma_rd_dst_rdy_n <= 'b1;
           o_dma_wr_src_rdy_n <= 'b1;
      end
      
      // data transfer for read //----------------------------------------------
      BUF2MEM_RDY: begin
        o_dma_rd_req <= 'b0;
        o_dma_wr_req <= 'b0;
        o_dma_rd_dst_rdy_n <= 'b1;
        o_dma_wr_src_rdy_n <= 'b1;
      end
      BUF2MEM_REQ: begin
        o_dma_rd_req <= 'b0;
        o_dma_wr_req <= 'b1;
        o_dma_rd_dst_rdy_n <= 'b1;
        o_dma_wr_src_rdy_n <= 'b0;
      end
      BUF2MEM: begin
        o_dma_rd_req <= 'b0;
        o_dma_wr_req <= 'b0;
        o_dma_rd_dst_rdy_n <= 'b1;
        o_dma_wr_src_rdy_n <= 'b0;
      end
      BUF2MEM_CMPLT: begin 
        o_dma_rd_req <= 'b0;
        o_dma_wr_req <= 'b0;
        o_dma_rd_dst_rdy_n <= 'b1;
        o_dma_wr_src_rdy_n <= 'b1;
      end
      BUF2MEM_WAIT:
      begin
           o_dma_rd_req <= 'b0;
           o_dma_wr_req <= 'b0;
           o_dma_rd_dst_rdy_n <= 'b1;
           o_dma_wr_src_rdy_n <= 'b1;
      end
      // data transfer for program //-------------------------------------------
      MEM2BUF_REQ: begin
        o_dma_rd_req <= 'b1;
        o_dma_wr_req <= 'b0;
        o_dma_rd_dst_rdy_n <= 'b0;
        o_dma_wr_src_rdy_n <= 'b1;
      end
      MEM2BUF: begin
        o_dma_rd_req <= 'b0;
        o_dma_wr_req <= 'b0;
        o_dma_rd_dst_rdy_n <= 'b0;
        o_dma_wr_src_rdy_n <= 'b1;
      end
      
      MEM2BUF_WAIT:
      begin
           o_dma_rd_req <= 'b0;
           o_dma_wr_req <= 'b0;
           o_dma_rd_dst_rdy_n <= 'b1;
           o_dma_wr_src_rdy_n <= 'b1;
      end
      
      ECC_GEN:
      begin
        o_dma_rd_req <= 'b0;
        o_dma_wr_req <= 'b0;
        o_dma_rd_dst_rdy_n <= 'b1;
        o_dma_wr_src_rdy_n <= 'b1;
      end
      
      MEM2BUF_CMPLT: begin 
        o_dma_rd_req <= 'b0;
        o_dma_wr_req <= 'b0;
        o_dma_rd_dst_rdy_n <= 'b1;
        o_dma_wr_src_rdy_n <= 'b1;
      end 
      
      MEM_ADDR_ADD: 
      begin
           o_dma_rd_req <= 'b0;
           o_dma_wr_req <= 'b0;
           o_dma_rd_dst_rdy_n <= 'b1;
           o_dma_wr_src_rdy_n <= 'b1;
      end
      
      CMPLT_DELAY:
      begin
           o_dma_rd_req <= 'b0;
           o_dma_wr_req <= 'b0;
           o_dma_rd_dst_rdy_n <= 'b1;
           o_dma_wr_src_rdy_n <= 'b1;
      end
     
      default: begin
        o_dma_rd_req <= 'b0;
        o_dma_wr_req <= 'b0;
        o_dma_rd_dst_rdy_n <= 'b1;
        o_dma_wr_src_rdy_n <= 'b1;
      end
    endcase
  end
  
  //m2b counter
  always @ (posedge i_data_clk)
  begin
       case(r_current_state)
           MEM2BUF_REQ:  r_m2b_cnt <= r_m2b_cnt;
           MEM2BUF:      r_m2b_cnt <= r_m2b_cnt;
           MEM2BUF_WAIT: r_m2b_cnt <= r_m2b_cnt - 'b1;
           default:      r_m2b_cnt <= 4'hf;
       endcase
  end
  
  //b2m counter
  always @ (posedge i_data_clk)
  begin
       case(r_current_state)
           BUF2MEM_RDY:   r_b2m_cnt <= r_b2m_cnt;
           BUF2MEM_REQ:   r_b2m_cnt <= r_b2m_cnt;
           BUF2MEM:       r_b2m_cnt <= r_b2m_cnt;
           BUF2MEM_CMPLT: r_b2m_cnt <= r_b2m_cnt;
           BUF2MEM_WAIT:  r_b2m_cnt <= r_b2m_cnt - 'b1;
           default:       r_b2m_cnt <= 4'hf;
       endcase
  end
  
  //pb state counter
  always @ (posedge i_data_clk)
  begin
       case(r_current_state)
           CMPLT_DELAY: r_cmplt_delay_cnt <= r_cmplt_delay_cnt - 'b1;
           default:     r_cmplt_delay_cnt <= 2'h3;
       endcase
  end
  
  //m2b cmplt
  always @ (posedge i_data_clk)
  begin
       case(r_current_state)
           MEM2BUF_CMPLT: r_m2b_cmplt <= 'b1;
           default:       r_m2b_cmplt <= 'b0;
       endcase
  end
  
  always @ (posedge i_data_clk)
  begin
       r_m2b_cmplt_1 <= r_m2b_cmplt;
  end
  
  assign o_m2b_cmplt = |{r_m2b_cmplt, r_m2b_cmplt_1};
  
  //b2m cmplt
  always @ (posedge i_data_clk)
  begin
       case(r_current_state)
            BUF2MEM_CMPLT: r_b2m_cmplt <= (r_b2m_cnt) ? 'b0 : i_dma_cmplt;
            default:       r_b2m_cmplt <= 'b0;
       endcase
  end
  
  always @ (posedge i_data_clk)
  begin
       r_b2m_cmplt_1 <= r_b2m_cmplt;
  end
  
  assign o_b2m_cmplt = |{r_b2m_cmplt, r_b2m_cmplt_1};
  
  //encoder trigger
  always @ ( posedge i_data_clk )
  begin
       case(r_current_state)
           ECC_GEN: r_ecc_gen_start <= 'b1;
           default: r_ecc_gen_start <= 'b0;
       endcase
  end
  //decoder trigger
  always @ (posedge i_data_clk)
  begin
       case(r_current_state)
           ERR_CORRECTION: r_err_cor_start <= 'b1;
           default:        r_err_cor_start <= 'b0;
       endcase
  end
  
  //state update
  always@(posedge i_data_clk) begin
    if(i_data_rst)
      r_current_state <= IDLE;
    else
      r_current_state <= r_next_state;
  end
  
  always @ (*)
  begin
       case({i_sp_en, r_err_cor_start})
           2'b00: r_sp_start <= 'b0;
           2'b01: r_sp_start <= 'b0;
           2'b10: r_sp_start <= 'b1;
           2'b11: r_sp_start <= 'b0;
       endcase
  end
  
  always @ (posedge i_nc_clk)
  begin
       case({r_sp_start, r_ecc_gen_start, r_err_cor_start})
           3'b100 :  //spare
           begin
                r_sbuf_addr    <= i_nand_pb_addr[5:0];
                r_sbuf_en      <= i_nand_pb_en;
                r_sbuf_we      <= i_nand_pb_we;
                r_nand_sb_data <= i_nand_pb_data;
                r_pbuf_addr    <= 'b0;
                r_pbuf_en      <= 'b0;
                r_pbuf_we      <= 'b0;
                r_nand_pb_data <= 'b0;   
                o_nand_pb_data <= w_nand_sb_data;
           end
           
           3'b010 : //encoder
           begin
                r_sbuf_addr    <= 'b0;
                r_sbuf_en      <= 'b0;
                r_sbuf_we      <= 'b0;
                r_nand_sb_data <= 'b0;
                r_pbuf_addr    <= w_enc_addr;
                r_pbuf_en      <= w_enc_en;
                r_pbuf_we      <= w_enc_we;
                r_nand_pb_data <= w_enc_data_o;
                o_nand_pb_data <= 'b0;
           end
           
           3'b001 : //decoder
           begin
                r_sbuf_addr    <= 'b0;
                r_sbuf_en      <= 'b0;
                r_sbuf_we      <= 'b0;
                r_nand_sb_data <= 'b0;
                r_pbuf_addr    <= w_dec_addr;
                r_pbuf_en      <= w_dec_en;
                r_pbuf_we      <= w_dec_we;
                r_nand_pb_data <= w_dec_data_o;
                o_nand_pb_data <= 'b0;
           end
           
           default :  //nand op
           begin
                r_sbuf_addr    <= 'b0;
                r_sbuf_en      <= 'b0;
                r_sbuf_we      <= 'b0;
                r_nand_sb_data <= 'b0;
                r_pbuf_addr    <= i_nand_pb_addr;
                r_pbuf_en      <= i_nand_pb_en;
                r_pbuf_we      <= i_nand_pb_we;
                r_nand_pb_data <= i_nand_pb_data;
                o_nand_pb_data <= w_nand_pb_data;
           end
       endcase
  end
  
  parameter SP_IDLE            = 5'b0_0001;
  parameter SP_RD_EXECUTE      = 5'b0_0010;
  parameter SP_WR_EXECUTE      = 5'b0_0100;
  parameter SP_RD_END          = 5'b0_1000;
  parameter SP_WR_END          = 5'b1_0000;
  
  reg [4:0] r_sp_cur_state;
  reg [4:0] r_sp_next_state;
  
  always @ (posedge i_data_clk or posedge i_data_rst)
  begin
       if(i_data_rst) r_sp_cur_state <= SP_IDLE;
       else           r_sp_cur_state <= r_sp_next_state;
  end
  
  always @ (*)
  begin
       case(r_sp_cur_state)
           
           SP_IDLE:
           begin
                r_sp_next_state <= (i_slv_addr[7]&&i_slv_rd_wr_ack) ? (i_slv_rnw) ? SP_RD_EXECUTE : SP_WR_EXECUTE : SP_IDLE;
           end
           
           SP_RD_EXECUTE:
           begin
                r_sp_next_state <= SP_RD_END;
           end
           
           SP_WR_EXECUTE:
           begin
                r_sp_next_state <= SP_WR_END;
           end
           
           SP_RD_END:
           begin
                r_sp_next_state <= SP_IDLE;
           end
           
           SP_WR_END:
           begin
                r_sp_next_state <= SP_IDLE;
           end
           
           default:
           begin
                r_sp_next_state <= SP_IDLE;
           end
        endcase
  end
  
  //address
  always @ (posedge i_data_clk)
  begin
       case(r_sp_cur_state)
           
           SP_RD_EXECUTE:
           begin
                r_sp_slv_data <= 'b0; 
                r_sp_addr     <= w_decoded_addr;
                r_sp_en       <= 'b1;
                r_sp_we       <= 'b0;
           end
           
           SP_WR_EXECUTE:
           begin
                r_sp_slv_data <= i_slv_data; 
                r_sp_addr     <= w_decoded_addr;
                r_sp_en       <= 'b1;
                r_sp_we       <= 'b1;
           end
           
           SP_RD_END:
           begin
                r_sp_slv_data <= 'b0; 
                r_sp_addr     <= 'b0;
                r_sp_en       <= 'b0;
                r_sp_we       <= 'b0;
           end
           
           SP_WR_END:
           begin
                r_sp_slv_data <= 'b0;
                r_sp_addr     <= 'b0;
                r_sp_en       <= 'b0;
                r_sp_we       <= 'b0;
           end
           
           default:
           begin
                r_sp_slv_data <= 'b0;
                r_sp_addr     <= 'b0;
                r_sp_en       <= 'b0;
                r_sp_we       <= 'b0;
           end
       endcase
  end 
  
  always @ (*) 
  begin
       case(r_sp_cur_state)
           
           SP_RD_END:
           begin
                o_slv_write_ack <= 'b0;
                r_slv_read_ack  <= 'b1;
           end
           
           SP_WR_END:
           begin
                o_slv_write_ack <= 'b1;
                r_slv_read_ack  <= 'b0;
           end
           
           default:
           begin
                o_slv_write_ack <= 'b0;
                r_slv_read_ack  <= 'b0;
           end
       endcase
  end
  
  always @ (posedge i_data_clk)
  begin
       s_slv_read_ack   <= r_slv_read_ack;
       o_slv_read_ack   <= s_slv_read_ack;
  end
  
  //encoder
  encoder_ctl encoder_ctl0(
  
  .i_nc_clk       (i_nc_clk),
  .i_nc_rstn      (i_nc_rstn),
  .i_ecc_gen_start(r_ecc_gen_start),
  .o_ecc_gen_cmplt(w_ecc_gen_cmplt),
  .o_enc_en       (w_enc_en),
  .o_enc_we       (w_enc_we),
  .o_enc_addr     (w_enc_addr),
  .i_enc_data     (w_nand_pb_data),
  .o_enc_data     (w_enc_data_o)
  ); 
  
  //decoder 
  decoder_ctl decoder_ctl0(
  .i_nc_clk       (i_nc_clk),
  //.i_clk_50       (i_clk_50),
  .i_nc_rstn      (i_nc_rstn),
  .i_dec_gen_start(r_err_cor_start),
  .o_dec_gen_cmplt(w_err_cor_cmplt),
  .o_dec_en       (w_dec_en    ),
  .o_dec_we       (w_dec_we    ),
  .o_dec_addr     (w_dec_addr  ),
  .i_dec_data     (w_nand_pb_data),
  .o_dec_data     (w_dec_data_o),
  .o_dec_fail     ()
  );   
  
  //buffer model
  dpram_8x2198_64x256 pbuf0 (
    .clka   (i_nc_clk)       ,
    .ena    (r_pbuf_en )     ,
    .wea    (r_pbuf_we)      ,
    .addra  (r_pbuf_addr)    ,
    .dina   (r_nand_pb_data) ,
    .douta  (w_nand_pb_data) ,
    
    .clkb   (i_data_clk)    ,
    .enb    (r_dma_buf_en)  ,
    .web    (r_dma_buf_we)  ,
    .addrb  ({1'b0,w_dma_buf_addr}),
    .dinb   (i_dma_data)    ,
    .doutb  (o_dma_data));
  
  dpram_8x40_32x10 sbuf0(
    .clka   (i_nc_clk)       ,
    .ena    (r_sbuf_en )     ,
    .wea    (r_sbuf_we)      ,
    .addra  (r_sbuf_addr)    ,
    .dina   (r_nand_sb_data) ,
    .douta  (w_nand_sb_data) ,
    
    .clkb   (i_data_clk),
    .enb    (r_sp_en),
    .web    (r_sp_we),
    .addrb  (r_sp_addr), //[3:0]
    .dinb   (r_sp_slv_data),
    .doutb  (o_slv_data));
  
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
