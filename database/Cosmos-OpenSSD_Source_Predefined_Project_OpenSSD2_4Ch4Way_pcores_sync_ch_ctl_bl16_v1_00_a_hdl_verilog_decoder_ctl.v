// This program was cloned from: https://github.com/Cosmos-OpenSSD/Cosmos-OpenSSD
// License: GNU General Public License v3.0

//////////////////////////////////////////////////////////////////////////////////
// decoder_ctl.v for Cosmos OpenSSD
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
// Design Name: dma controller
// Module Name: decoder_ctl
// File Name: decoder_ctl.v
//
// Version: v1.0.1
//
// Description: 
//   - control 2KB/32-bit BCH decoder module
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v1.0.1
//   - extend all ack signals
//
// * v1.0.0
//   - first draft 
//////////////////////////////////////////////////////////////////////////////////
`include "parameter.vh"

module decoder_ctl
(
  input   wire                                    i_nc_clk,
  input   wire                                    i_nc_rstn,
  
  //enc_ctl interface
  input  wire                                     i_dec_gen_start,
  output reg                                      o_dec_gen_cmplt,
  output reg                                      o_dec_en,
  output reg                                      o_dec_we,
  output reg  [`NAND_PBAWIDTH-1:0]                o_dec_addr,
  input  wire [7:0]                               i_dec_data,
  output reg  [7:0]                               o_dec_data,
  output reg                                      o_dec_fail
  );
  
  reg  [2:0]                   r_cur_state;
  reg  [2:0]                   r_next_state;
  wire                         w_dec_available;
  wire                         w_err_detection_end;
  reg                          r_err_detection_end;
  wire                         w_err_detection_end_1;
  wire                         w_err_detected;
  reg                          r_err_detected;
  wire                         w_err_detected_1;
  wire                         w_kes_end;
  reg                          r_kes_end;
  wire                         w_kes_end_1;
  wire                         w_kes_fail;
  wire                         w_dec_data_strobe;
  wire                         w_cor_data_end;
  reg                          r_cor_data_end;
  wire                         w_cor_data_end_1;
  wire [7:0]                   w_dec_data_o;
  //cnt
  reg  [1:0]                   r_dec_end_cnt;
  reg  [11:0]                  r_det_data_cnt; //detection data counter
  
  reg                          r_execute_decoding;
  reg                          r_code_BUS_valid  ;
  
  parameter DEC_IDLE         = 3'b000;
  parameter DEC_INIT         = 3'b001;
  parameter ERR_DETECTION    = 3'b011;
  parameter ERR_CORRECTION   = 3'b010;
  parameter DEC_DATA_TRANS   = 3'b110;
  parameter DEC_END          = 3'b100;
  
  always @ (posedge i_nc_clk or negedge i_nc_rstn)
  begin
       if(!i_nc_rstn) r_cur_state <= DEC_IDLE;
       else           r_cur_state <= r_next_state;
  end
  
  always @ (*)
  begin
       case(r_cur_state)
           
           DEC_IDLE:
           begin
                r_next_state <= (i_dec_gen_start && w_dec_available) ? DEC_INIT : DEC_IDLE;
           end
           
           DEC_INIT:
           begin
                r_next_state <= ERR_DETECTION;
           end
           
           ERR_DETECTION:
           begin
                r_next_state <= (w_err_detection_end_1) ? (w_err_detected_1) ? ERR_CORRECTION : DEC_END : ERR_DETECTION;
           end
           
           ERR_CORRECTION:
           begin
                r_next_state <= (!w_kes_fail) ? (w_kes_end_1) ? DEC_DATA_TRANS : ERR_CORRECTION : DEC_END;
           end
           
           DEC_DATA_TRANS:
           begin
                r_next_state <= (!w_cor_data_end_1) ? DEC_DATA_TRANS : DEC_END;
           end
           
           DEC_END:
           begin
                r_next_state <= (r_dec_end_cnt) ? DEC_END : DEC_IDLE;
           end
           
           default:
           begin
                r_next_state <= DEC_IDLE;
           end
       endcase
  end
  
  //dec start
  always @ (posedge i_nc_clk)
  begin
       case(r_cur_state)
           ERR_DETECTION:
           begin
                r_execute_decoding <= (r_det_data_cnt==0) ? 'b1 : 'b0;
                r_code_BUS_valid   <= (r_det_data_cnt!=2198)? 'b1 : 'b0; 
           end
           default:
           begin
                r_execute_decoding <= 'b0;
                r_code_BUS_valid   <= 'b0;
           end
       endcase
  end
  
  reg  r_execute_decoding_1;
  wire r_execute_decoding_2;
  
  always @ (posedge i_nc_clk)
  begin
       r_execute_decoding_1 <= r_execute_decoding;
  end
  
  assign r_execute_decoding_2 = |{r_execute_decoding, r_execute_decoding_1};
  
  //bram ctl
  always @ (*)
  begin
       case(r_cur_state)
           
           DEC_INIT:
           begin
                o_dec_en   <= 'b1;
                o_dec_we   <= 'b0;
           end
           
           ERR_DETECTION:
           begin
                o_dec_en   <= 'b1;
                o_dec_we   <= 'b0;
           end
           
           DEC_DATA_TRANS:
           begin
                o_dec_en   <= (w_dec_data_strobe)? 'b1 : 'b0;
                o_dec_we   <= (w_dec_data_strobe)? 'b1 : 'b0;
           end
           
           default:
           begin
                o_dec_en   <= 'b0;
                o_dec_we   <= 'b0;
           end
       endcase
  end
  
  //bram addr
  always @ (posedge i_nc_clk)
  begin
       case(r_cur_state)
           
           DEC_INIT:
           begin
                o_dec_addr <= o_dec_addr + 'b1;
           end
           
           ERR_DETECTION:
           begin
                o_dec_addr <= (&{o_dec_addr[11], o_dec_addr[7],o_dec_addr[4],o_dec_addr[2],o_dec_addr[0]}) ? o_dec_addr : o_dec_addr + 'b1;  //2197
           end
           
           DEC_DATA_TRANS:
           begin
                o_dec_addr <= (w_dec_data_strobe) ? o_dec_addr + 'b1 : o_dec_addr;
           end
           
           default:
           begin
                o_dec_addr <= 'b0;
           end
       endcase
  end
  
  //dataout to bram
  always @ (*)
  begin
       case(r_cur_state)
           
           DEC_DATA_TRANS: o_dec_data <= w_dec_data_o;
           default:        o_dec_data <= 'b0;
       endcase
  end
  
  //cnt
  always @ (posedge i_nc_clk)
  begin
       case(r_cur_state)
           ERR_DETECTION:
           begin
                r_det_data_cnt <= (&{r_det_data_cnt[11], r_det_data_cnt[7],r_det_data_cnt[4],r_det_data_cnt[2],r_det_data_cnt[1]}) ? r_det_data_cnt : r_det_data_cnt + 'b1; //2198
                r_dec_end_cnt  <= 'h3;
           end
           
           DEC_END: 
           begin
                r_det_data_cnt <= 'b0;
                r_dec_end_cnt  <= (r_dec_end_cnt) ? r_dec_end_cnt - 'b1 : r_dec_end_cnt;
           end
           default:
           begin
                r_det_data_cnt <= 'b0;
                r_dec_end_cnt  <= 'h3;
           end
       endcase
  end
  
  //cmplt
  always @ (posedge i_nc_clk)
  begin
       case(r_cur_state)
           
           DEC_END: o_dec_gen_cmplt <= 'b1;
           default: o_dec_gen_cmplt <= 'b0;
       endcase
  end
  
  //fail
  always @ (posedge i_nc_clk or negedge i_nc_rstn)
  begin
       if(!i_nc_rstn) o_dec_fail <= 'b0;
       else
       begin
            case(r_cur_state)
                ERR_CORRECTION: o_dec_fail <= w_kes_fail;
                default :       o_dec_fail <= o_dec_fail;
            endcase
       end
  end
  
  //detection cmplt
  always @ (posedge i_nc_clk)
  begin
       r_err_detection_end <= w_err_detection_end;
  end
  assign w_err_detection_end_1 = |{w_err_detection_end, r_err_detection_end};
  
  //detected cmplt
  always @ (posedge i_nc_clk)
  begin
       r_err_detected <= w_err_detected;
  end
  assign w_err_detected_1 = |{w_err_detected, r_err_detected};
  
  //kes cmplt
  always @ (posedge i_nc_clk)
  begin
       r_kes_end <= w_kes_end;
  end
  assign w_kes_end_1 = |{w_kes_end, r_kes_end};
  
  //data trans cmplt
  always @ (posedge i_nc_clk)
  begin
       r_cor_data_end <= w_cor_data_end;
  end
  assign w_cor_data_end_1 = |{w_cor_data_end, r_cor_data_end};
  
  decoder decoder0(
  .clk_100                       (i_nc_clk),
  .nRESET                        (i_nc_rstn),
  .decoder_state                 (),
  .decoder_available             (w_dec_available),
  .execute_decoding              (r_execute_decoding_2),
  .code_BUS_valid                (r_code_BUS_valid),
  .code                          (i_dec_data),
  .decoding_start                (),
  .last_code_block_received      (),
  .decoding_end                  (),
  .error_detection_stage_end     (w_err_detection_end),
  .error_detected                (w_err_detected),
  .ELP_search_stage_end          (w_kes_end),
  .correction_fail               (w_kes_fail),
  .corrected_message_strobe      (w_dec_data_strobe),
  .corrected_message_output_start(),
  .corrected_message_output_end  (w_cor_data_end),
  .corrected_message_out         (w_dec_data_o) 
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
