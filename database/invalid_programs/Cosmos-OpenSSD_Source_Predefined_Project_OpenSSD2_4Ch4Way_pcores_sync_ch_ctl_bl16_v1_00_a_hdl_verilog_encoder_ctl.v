//////////////////////////////////////////////////////////////////////////////////
// encoder_ctl.v for Cosmos OpenSSD
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
// Module Name: encoder_ctl
// File Name: encoder_ctl.v
//
// Version: v1.0.1
//
// Description: 
//   - control 2KB/32-bit BCH encoder module
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

module encoder_ctl
(
  input   wire                                    i_nc_clk,
  input   wire                                    i_nc_rstn,
  
  //enc_ctl interface
  input  wire                                     i_ecc_gen_start,
  output reg                                      o_ecc_gen_cmplt,
  output reg                                      o_enc_en,
  output reg                                      o_enc_we,
  output reg  [`NAND_PBAWIDTH-1:0]                o_enc_addr,
  input  wire [7:0]                               i_enc_data,
  output reg  [7:0]                               o_enc_data
  );
  
  reg  [2:0]                   r_cur_state;
  reg  [2:0]                   r_next_state;
  wire                         w_encoding_complete;
  reg                          r_encoding_complete;
  wire                         w_encoding_complete_1;
  wire                         w_parity_trans_cmplt;
  reg                          r_parity_trans_cmplt;
  wire                         w_parity_trans_cmplt_1;
  reg                          r_execute_encoding;
  reg                          r_message_BUS_valid;
  wire [7:0]                   w_enc_data;
  reg  [11:0]                  r_gen_data_cnt;
  reg  [1:0]                   r_ecc_end_cnt;
  
  parameter ENC_IDLE  = 3'b000;
  parameter ENC_INIT  = 3'b001;
  parameter ENC_GEN   = 3'b011;
  parameter ENC_TRANS = 3'b010;
  parameter ENC_END   = 3'b110;
  
  always @ (posedge i_nc_clk or negedge i_nc_rstn)
  begin
       if(!i_nc_rstn) r_cur_state <= ENC_IDLE;
       else           r_cur_state <= r_next_state;
  end
  
  always @ (*)
  begin
       case(r_cur_state)
           
           ENC_IDLE:
           begin
                r_next_state <= (i_ecc_gen_start) ? ENC_INIT : ENC_IDLE;
           end
           
           ENC_INIT:
           begin
                r_next_state <= ENC_GEN;
           end
           
           ENC_GEN:
           begin
                r_next_state <= (!w_encoding_complete_1) ? ENC_GEN : ENC_TRANS;
           end
           
           ENC_TRANS:
           begin
                r_next_state <= (!w_parity_trans_cmplt_1) ? ENC_TRANS : ENC_END;
           end
           
           ENC_END:
           begin
                r_next_state <= (r_ecc_end_cnt) ? ENC_END : ENC_IDLE;
           end
           
           default:
           begin
                r_next_state <= ENC_IDLE;
           end
       endcase
  end
  
  //cnt
  always @ (posedge i_nc_clk)
  begin
       case(r_cur_state)
           
           ENC_GEN: 
           begin
                r_gen_data_cnt <= (r_gen_data_cnt[11]=='b1) ? r_gen_data_cnt : r_gen_data_cnt+'b1;
                r_ecc_end_cnt  <= 'h3;
           end
           
           ENC_END:
           begin
                r_gen_data_cnt <= 'b0;
                r_ecc_end_cnt  <= (r_ecc_end_cnt) ? r_ecc_end_cnt - 'b1 : r_ecc_end_cnt;
           end
           
           default: 
           begin
                r_gen_data_cnt <= 'b0;
                r_ecc_end_cnt  <= 'h3;
           end
       endcase
  end
  
  //bram ctl
  always @ (*)
  begin
       case(r_cur_state)
           
           ENC_INIT:
           begin
                o_enc_en <= 'b1;
                o_enc_we <= 'b0;
           end
           
           ENC_GEN:
           begin
                o_enc_en <= 'b1;
                o_enc_we <= 'b0;
           end
           
           ENC_TRANS:
           begin
                o_enc_en <= 'b1;
                o_enc_we <= 'b1;
           end
           
           default:
           begin
                o_enc_en <= 'b0;
                o_enc_we <= 'b0;
           end
       endcase
  end
  
  always @ (posedge i_nc_clk)
  begin
       case(r_cur_state)
           ENC_INIT:  o_enc_addr <= o_enc_addr + 'b1;
           ENC_GEN:   o_enc_addr <= (o_enc_addr[11]) ? o_enc_addr : o_enc_addr + 'b1;
           ENC_TRANS: o_enc_addr <= o_enc_addr + 'b1;
           default:   o_enc_addr <= 'b0;
       endcase
  end
  
  always @ (posedge i_nc_clk)
  begin
       case(r_cur_state)
           ENC_GEN:
           begin
                r_execute_encoding  <= (r_gen_data_cnt==0) ? 'b1 : 'b0;
                r_message_BUS_valid <= (r_gen_data_cnt==0 || r_gen_data_cnt[10:0])? 'b1 : 'b0;
           end
           
           default:
           begin
                r_execute_encoding  <= 'b0;
                r_message_BUS_valid <= 'b0;
           end
       endcase
       
  end
  
  reg  r_execute_encoding_1;
  wire r_execute_encoding_2;
  
  always @ (posedge i_nc_clk)
  begin
       r_execute_encoding_1 <= r_execute_encoding;
  end
  
  assign r_execute_encoding_2 = |{r_execute_encoding, r_execute_encoding_1};
  
  
  always @ (*)
  begin
       case(r_cur_state)
           ENC_TRANS: o_enc_data <= w_enc_data;
           default:   o_enc_data <= 'b0;
       endcase
  end
  
  //cmplt
  always @ (posedge i_nc_clk)
  begin
       case(r_cur_state)
           ENC_END: o_ecc_gen_cmplt <= 'b1;
           default: o_ecc_gen_cmplt <= 'b0;
       endcase
  end
  
  //enc_cmplt
  always @ (posedge i_nc_clk)
  begin
       r_encoding_complete <= w_encoding_complete;
  end
  assign w_encoding_complete_1 = |{w_encoding_complete, r_encoding_complete};
  
  //parity_trans_cmplt
  always @ (posedge i_nc_clk)
  begin
       r_parity_trans_cmplt <= w_parity_trans_cmplt;
  end
  assign w_parity_trans_cmplt_1 = |{w_parity_trans_cmplt, r_parity_trans_cmplt};
  
  encoder encoder0(
  .clk                         (i_nc_clk),
  .nRESET                      (i_nc_rstn),
  .execute_encoding            (r_execute_encoding_2),
  .message_BUS_valid           (r_message_BUS_valid),
  .message                     (i_enc_data),
  .encoding_start              (),
  .last_message_block_received (),
  .encoding_complete           (w_encoding_complete),
  .parity_strobe               (),
  .parity_out_start            (),
  .parity_out_complete         (w_parity_trans_cmplt),
  .parity_out                  (w_enc_data)
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
