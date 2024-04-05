/*
 * Copyright 2019 International Business Machines
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
`timescale 1ns / 1ps

`include "snap_global_vars.v"

module brdg_response_decode 
                      #(
                        parameter MODE = 1'b1  //0: write; 1: read
                        )
                      ( 
                       input                 clk                       ,
                       input                 rst_n                     ,

                       //---- configuration --------------------------
                       input      [0003:0]   cfg_backoff_timer         ,

                       //---- communication with command decoder -----
                       input                 prt_cmd_valid             ,
                       input                 prt_cmd_last              ,
                       output reg            prt_cmd_enable            ,
                       input                 prt_cmd_start             ,

                       //---- DMA interface --------------------------
                       output reg            dma_resp_valid            ,
                       output reg [1023:0]   dma_resp_data             , 
                       output reg [`TAGW-1:0]dma_resp_tag              , 
                       output reg [0001:0]   dma_resp_pos              , 
                       output reg [0002:0]   dma_resp_code             ,     

                       //---- TLX interface --------------------------
                       input                 tlx_rsp_valid             ,
                       input      [0015:0]   tlx_rsp_afutag            ,
                       input      [0007:0]   tlx_rsp_opcode            ,
                       input      [0003:0]   tlx_rsp_code              ,
                       input      [0001:0]   tlx_rsp_dl                ,
                       input      [0001:0]   tlx_rsp_dp                ,
                       input                 tlx_rdata_o_dv            ,
                       input                 tlx_rdata_e_dv            ,
                       input                 tlx_rdata_o_bdi           ,
                       input                 tlx_rdata_e_bdi           ,
                       input      [0511:0]   tlx_rdata_o               ,
                       input      [0511:0]   tlx_rdata_e               ,

                       //---- control and status ---------------------
                       input                 debug_cnt_clear           ,
                       output reg [0031:0]   debug_tlx_cnt_rsp         ,
                       output reg [0031:0]   debug_tlx_cnt_retry       ,
                       output reg [0031:0]   debug_tlx_cnt_fail        ,
                       output reg [0031:0]   debug_tlx_cnt_xlt_pd      ,
                       output reg [0031:0]   debug_tlx_cnt_xlt_done    ,
                       output reg [0031:0]   debug_tlx_cnt_xlt_retry   ,
                       output reg [0004:0]   fir_fifo_overflow         ,
                       output reg            fir_tlx_response_unsupport
                       );



 reg             rsp_valid;
 reg [0015:00]   rsp_afutag;
 reg [0007:00]   rsp_opcode;
 reg [0004:00]   rsp_code; 
 reg [0001:00]   rsp_dl;   
 reg [0001:00]   rsp_dp;   
 wire[0017:00]   rsp_type;
 wire[0001:00]   rsp_pos;
 wire[`TAGW-1:00]rsp_tag;
 wire            response_wr_done;
 wire            response_wr_failed;
 wire            response_wr_xlate_pending;
 wire            response_wr_xlate_done;
 wire            response_wr_xlate_retry;
 wire            response_wr_retry;
 wire            response_rd_xlate_pending;
 wire            response_rd_done;
 wire            response_rd_failed;
 wire            response_rd_retry;
 wire            response_rd_xlate_done;
 wire            response_rd_xlate_retry;
 wire            response_write;
 wire            response_read;
 wire            response_done;        
 wire            response_failed;       
 wire            response_retry;       
 wire            response_xlate_done;   
 wire            response_xlate_pending;
 wire            response_xlate_retry; 
 wire            response_partial; 
 wire            response_partial_done; 
 wire            response_partial_retry; 
 wire            response_partial_failed; 
 wire            response_partial_xlate_pending; 
 wire            rsp_rd_partial;
 wire            rsp_good_valid;       
 wire            rsp_good_full_valid;        
 wire            rsp_bad_full_valid;        
 wire            fifo_rsp_good_partial_dv;
 wire            fifo_rsp_good_full_dv;
 wire            fifo_rsp_bad_full_dv;
 reg             all_fifos_emptied;
 reg [0511:00]   tmp_partial_rd_data_o;
 reg [0511:00]   tmp_partial_rd_data_e;
 wire[0004:00]   rsp_rty_typ;
 wire            rty_rdy;
 wire            rty_valid;
 wire[0001:00]   rty_pos;
 wire[`TAGW-1:00]rty_tag;
 reg [0004:00]   prt_inflight_cnt;
 reg [0004:00]   prt_data_cnt;
 reg             prt_commands_allout;
 reg             prt_responses_allin;
 wire            prt_rsp_empty_window;
 wire            prt_rsp_available;
 wire            prt_rsp_last;
 wire            prt_rsp_last_no_data;
 wire            prt_rsp_last_all_data;
 wire            prt_rsp_end;
 reg [0007:00]   prt_rsp_end_shift;
 reg             prt_rsp_pending;
 reg             prt_rsp_retry;
 reg             prt_rsp_done;
 reg             prt_rsp_failed;
 reg             rty_in_progress;
 wire            prt_valid;
 wire            end_of_partial_batch;
 wire            rty_busy;
 reg [0003:00]   prt_rsp_code;
 reg [0001:00]   prt_pos;
 reg [0006:00]   prt_tag;
 wire[0009:00]   fifo_rsp_good_din;
 wire            fifo_rsp_good_den;
 wire            fifo_rsp_good_rdrq;
 wire            fifo_rsp_good_dv; 
 wire[0009:00]   fifo_rsp_good_dout;
 wire            fifo_rsp_good_empty; 
 wire            fifo_rsp_good_ovfl; 
 reg [0512:00]   fifo_rspdat_o_din;
 reg             fifo_rspdat_o_den;
 wire            fifo_rspdat_o_rdrq;
 wire[0512:00]   fifo_rspdat_o_dout;
 wire            fifo_rspdat_o_empty;
 reg [0512:00]   fifo_rspdat_e_din;
 reg             fifo_rspdat_e_den;
 wire            fifo_rspdat_e_rdrq;
 wire[0512:00]   fifo_rspdat_e_dout;
 wire            fifo_rspdat_e_empty;
 wire            fifo_rspdat_o_ovfl;
 wire            fifo_rspdat_e_ovfl;
 wire[0008:00]   fifo_rsp_bad_din;
 wire            fifo_rsp_bad_den;
 wire            fifo_rsp_bad_rdrq;
 wire            fifo_rsp_bad_dv; 
 wire            fifo_rsp_bad_empty; 
 wire            fifo_rsp_bad_ovfl; 
 wire[0008:00]   fifo_rsp_bad_dout;


 // TL CAPP response opcode
 localparam [7:0] TLX_AFU_RESP_OPCODE_NOP                = 8'b00000000;  // -- Nop
 localparam [7:0] TLX_AFU_RESP_OPCODE_RETURN_TLX_CREDITS = 8'b00000001;  // -- Return TLX Credits
 localparam [7:0] TLX_AFU_RESP_OPCODE_TOUCH_RESP         = 8'b00000010;  // -- Touch Response
 localparam [7:0] TLX_AFU_RESP_OPCODE_READ_RESPONSE      = 8'b00000100;  // -- Read Response
 localparam [7:0] TLX_AFU_RESP_OPCODE_UPGRADE_RESP       = 8'b00000111;  // -- Upgrade Response
 localparam [7:0] TLX_AFU_RESP_OPCODE_READ_FAILED        = 8'b00000101;  // -- Read Failed
 localparam [7:0] TLX_AFU_RESP_OPCODE_CL_RD_RESP         = 8'b00000110;  // -- Cachable Read Response
 localparam [7:0] TLX_AFU_RESP_OPCODE_WRITE_RESPONSE     = 8'b00001000;  // -- Write Response
 localparam [7:0] TLX_AFU_RESP_OPCODE_WRITE_FAILED       = 8'b00001001;  // -- Write Failed
 localparam [7:0] TLX_AFU_RESP_OPCODE_MEM_FLUSH_DONE     = 8'b00001010;  // -- Memory Flush Done
 localparam [7:0] TLX_AFU_RESP_OPCODE_INTRP_RESP         = 8'b00001100;  // -- Interrupt Response
 localparam [7:0] TLX_AFU_RESP_OPCODE_WAKE_HOST_RESP     = 8'b00010000;  // -- Wake Host Thread Response
 localparam [7:0] TLX_AFU_RESP_OPCODE_XLATE_DONE         = 8'b00011000;  // -- Address Translation Completed (Async Notification)
 localparam [7:0] TLX_AFU_RESP_OPCODE_INTRP_RDY          = 8'b00011010;  // -- Interrupt ready (Async Notification)
 
 // TL CAPP response code
 localparam [3:0] TLX_AFU_RESP_CODE_DONE          = 4'b0000;
 localparam [3:0] TLX_AFU_RESP_CODE_RTY_HWT       = 4'b0001;
 localparam [3:0] TLX_AFU_RESP_CODE_RTY_REQ       = 4'b0010;
 localparam [3:0] TLX_AFU_RESP_CODE_XLATE_PENDING = 4'b0100;
 localparam [3:0] TLX_AFU_RESP_CODE_INTRP_PENDING = 4'b0100;
 localparam [3:0] TLX_AFU_RESP_CODE_DERROR        = 4'b1000;
 localparam [3:0] TLX_AFU_RESP_CODE_BAD_LENGTH    = 4'b1001;
 localparam [3:0] TLX_AFU_RESP_CODE_BAD_ADDR      = 4'b1011;
 localparam [3:0] TLX_AFU_RESP_CODE_FAILED        = 4'b1110;
 localparam [3:0] TLX_AFU_RESP_CODE_ADR_ERROR     = 4'b1111;

 // response code
 parameter RESP_GOOD  = 3'b001,
           RESP_RETRY = 3'b010,
           RESP_BAD   = 3'b100;



//=================================================================================================================
//
//  RESPONSE INFORMATION DECODE 
//
//  * response type : 16 bits 
//         bit16~8: read/write failures
//         bit7:  write retry request
//         bit6:  read retry request
//         bit5:  write xlate pending
//         bit4:  read xlate pending
//         bit3:  xlate and retry backoff request
//         bit2:  xlate and retry immediate request
//         bit1:  write done
//         bit0:  read done
//
//  * response tag : 6 bits
//         slot address
//
//  * response pos : 2 bits
//         bit1: higher 64B in slot
//         bit0: lower 64B in slot
//
//=================================================================================================================


//---- latch signals once ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     rsp_valid  <= 1'd0;
   else
     rsp_valid  <= tlx_rsp_valid;          

 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     begin
       rsp_afutag <= 16'd0;
       rsp_opcode <= 8'd0;
       rsp_code   <= 4'd0;
       rsp_dl     <= 2'd0;
       rsp_dp     <= 2'd0;
     end
   else if(tlx_rsp_valid)
     begin
       rsp_afutag <= tlx_rsp_afutag;
       rsp_opcode <= tlx_rsp_opcode;
       rsp_code   <= tlx_rsp_code;            
       rsp_dl     <= tlx_rsp_dl;              
       rsp_dp     <= tlx_rsp_dp;              
     end

 // response type
 assign rsp_type = {
           /*bit17*/ (rsp_opcode == TLX_AFU_RESP_OPCODE_WRITE_FAILED) && (rsp_code == TLX_AFU_RESP_CODE_BAD_LENGTH),
           /*bit16*/ (rsp_opcode == TLX_AFU_RESP_OPCODE_READ_FAILED)  && (rsp_code == TLX_AFU_RESP_CODE_BAD_LENGTH),
           /*bit15*/ (rsp_opcode == TLX_AFU_RESP_OPCODE_WRITE_FAILED) && (rsp_code == TLX_AFU_RESP_CODE_ADR_ERROR),
           /*bit14*/ (rsp_opcode == TLX_AFU_RESP_OPCODE_READ_FAILED)  && (rsp_code == TLX_AFU_RESP_CODE_ADR_ERROR),
           /*bit13*/ (rsp_opcode == TLX_AFU_RESP_OPCODE_WRITE_FAILED) && (rsp_code == TLX_AFU_RESP_CODE_DERROR),
           /*bit12*/ (rsp_opcode == TLX_AFU_RESP_OPCODE_READ_FAILED)  && (rsp_code == TLX_AFU_RESP_CODE_DERROR),
           /*bit11*/ (rsp_opcode == TLX_AFU_RESP_OPCODE_WRITE_FAILED) && (rsp_code == TLX_AFU_RESP_CODE_BAD_ADDR),
           /*bit10*/ (rsp_opcode == TLX_AFU_RESP_OPCODE_READ_FAILED)  && (rsp_code == TLX_AFU_RESP_CODE_BAD_ADDR),
           /*bit09*/ (rsp_opcode == TLX_AFU_RESP_OPCODE_WRITE_FAILED) && (rsp_code == TLX_AFU_RESP_CODE_FAILED),
           /*bit08*/ (rsp_opcode == TLX_AFU_RESP_OPCODE_READ_FAILED)  && (rsp_code == TLX_AFU_RESP_CODE_FAILED),
           /*bit07*/ (rsp_opcode == TLX_AFU_RESP_OPCODE_WRITE_FAILED) && (rsp_code == TLX_AFU_RESP_CODE_RTY_REQ),
           /*bit06*/ (rsp_opcode == TLX_AFU_RESP_OPCODE_READ_FAILED)  && (rsp_code == TLX_AFU_RESP_CODE_RTY_REQ),
           /*bit05*/ (rsp_opcode == TLX_AFU_RESP_OPCODE_WRITE_FAILED) && (rsp_code == TLX_AFU_RESP_CODE_XLATE_PENDING),
           /*bit04*/ (rsp_opcode == TLX_AFU_RESP_OPCODE_READ_FAILED)  && (rsp_code == TLX_AFU_RESP_CODE_XLATE_PENDING),
           /*bit03*/ (rsp_opcode == TLX_AFU_RESP_OPCODE_XLATE_DONE)   && (rsp_code == TLX_AFU_RESP_CODE_RTY_REQ),
           /*bit02*/ (rsp_opcode == TLX_AFU_RESP_OPCODE_XLATE_DONE)   && (rsp_code == TLX_AFU_RESP_CODE_DONE),
           /*bit01*/ (rsp_opcode == TLX_AFU_RESP_OPCODE_WRITE_RESPONSE),
           /*bit00*/ (rsp_opcode == TLX_AFU_RESP_OPCODE_READ_RESPONSE)
                    };




 // response data length and position:
 //  * full resp for 128B : 2'b11; 
 //  * split resp for 128B: 2'b10 (dp=01) or 2'b01 (dp=00);         
 //  * resp for 64B: afutag[7:6]
 assign rsp_pos = (rsp_dl == 2'd2)? 2'b11 : ((rsp_afutag[8:7] == 2'b11)? ((rsp_dp[0])? 2'b10 : 2'b01) : (rsp_afutag[8:7]));

 // tag
 assign rsp_tag = rsp_afutag[6:0];
 
 // decode responses
 assign response_wr_done                = rsp_type[1];
 assign response_wr_failed              = rsp_type[9] || rsp_type[11] || rsp_type[13] || rsp_type[15] || rsp_type[17];
 assign response_wr_xlate_pending       = rsp_type[5];
 assign response_wr_xlate_done          = rsp_type[2] && response_write;
 assign response_wr_xlate_retry         = rsp_type[3] && response_write;
 assign response_wr_retry               = rsp_type[7];
 assign response_rd_xlate_pending       = rsp_type[4];
 assign response_rd_done                = rsp_type[0];
 assign response_rd_failed              = rsp_type[8] || rsp_type[10] || rsp_type[12] || rsp_type[14] || rsp_type[16];
 assign response_rd_retry               = rsp_type[6];
 assign response_rd_xlate_done          = rsp_type[2] && response_read;
 assign response_rd_xlate_retry         = rsp_type[3] && response_read;
 
 // distinguish read, write and partial write
 assign response_write                  = ~rsp_afutag[15];
 assign response_read                   = rsp_afutag[15];

 // check mode 
 assign response_done                   = (MODE)? response_rd_done          : response_wr_done;
 assign response_failed                 = (MODE)? response_rd_failed        : response_wr_failed;
 assign response_retry                  = (MODE)? response_rd_retry         : response_wr_retry; 
 assign response_xlate_done             = (MODE)? response_rd_xlate_done    : response_wr_xlate_done;
 assign response_xlate_pending          = (MODE)? response_rd_xlate_pending : response_wr_xlate_pending;
 assign response_xlate_retry            = (MODE)? response_rd_xlate_retry   : response_wr_xlate_retry; 

 // partial
 assign response_partial                = rsp_afutag[14];
 assign response_partial_done           = response_partial && response_done;
 assign response_partial_retry          = response_partial && response_retry;
 assign response_partial_xlate_pending  = response_partial && response_xlate_pending;
 assign response_partial_failed         = response_partial && response_failed;
 assign rsp_rd_partial                  = response_read && response_partial;

 // response valid for good and bad responses
 assign rsp_bad_full_valid              = rsp_valid && ~response_partial && response_failed;
 assign rsp_good_full_valid             = rsp_valid && ~response_partial && response_done;
 assign rsp_good_valid                  = rsp_valid && response_done;



//=================================================================================================================
//
// NORMAL RESPONSE FIFO SET (RO)
//
//                             read/write mode------------|                
//                                                        V
//          +--------+       +------------------------+      +--+
//          |        | ====> | FIFO for good rsp (RO) |====> |M |
//          |        |  ||   +------------------------+      |U |     +--+
//          |        |  ||   +------------------------+      |X |===> |M |
//          |        | ====> | FIFO for bad rsp (RO)  |====> |  |     |U | ==> data
//      ==> | decode |  ||   +------------------------+      |  |     |X | ==> tag
//          |        |  ||=================================> |  |     |  | ==> pos
//          |        |       (bypass route, WO)              +--+     |  | ==> code (good/bad/retry)
//          |        |                                                |  |
//          |        |         +-------------------+                  |  |
//          |        | ======> |   retry queue     |================> |  |
//          +--------+         +-------------------+                  +--+
//
//   * designed for alignment of good response and its corresponding read data.
//   * good response FIFO (highest priority, read only, data driven out by valid read data)
//   * bad response FIFO (2nd priority, read only)
//   * retry queue (lowest priority for read)
//
//=================================================================================================================

 generate
   if (MODE) begin : ReadModeOnly

//---- FIFO to buffer information of good response ----
 assign fifo_rsp_good_din = {rsp_rd_partial, rsp_pos, rsp_tag};
 assign fifo_rsp_good_den = rsp_good_valid && (MODE);

 fifo_sync #(
             .DATA_WIDTH (10),
             .ADDR_WIDTH (4),
             .FWFT(0),
             .DISTR(1)
             ) mfifo_rsp_good (
                               .clk     (clk                ),
                               .rst_n   (rst_n              ),
                               .din     (fifo_rsp_good_din  ),
                               .wr_en   (fifo_rsp_good_den  ),
                               .rd_en   (fifo_rsp_good_rdrq ),
                               .valid   (fifo_rsp_good_dv   ),
                               .dout    (fifo_rsp_good_dout ),
                               .overflow(fifo_rsp_good_ovfl ),
                               .empty   (fifo_rsp_good_empty)
                               );

//---- FIFO to buffer data of good response ----
 // ODD data and bdi
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     begin
       fifo_rspdat_o_din <= 1024'd0;
       fifo_rspdat_o_den <= 1'b0;
     end
   else
     begin
       fifo_rspdat_o_din <= {tlx_rdata_o_bdi,tlx_rdata_o};
       fifo_rspdat_o_den <= tlx_rdata_o_dv;
     end

 fifo_sync #(
             .DATA_WIDTH (513),
             .ADDR_WIDTH (4),
             .FWFT(0),
             .DISTR(1)
             ) mfifo_rspdat_o (
                               .clk     (clk                ),
                               .rst_n   (rst_n              ),
                               .din     (fifo_rspdat_o_din  ),
                               .wr_en   (fifo_rspdat_o_den  ),
                               .rd_en   (fifo_rspdat_o_rdrq ),
                               .dout    (fifo_rspdat_o_dout ),
                               .overflow(fifo_rspdat_o_ovfl ),
                               .empty   (fifo_rspdat_o_empty)
                               );

 // EVEN data and bdi
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     begin
       fifo_rspdat_e_din <= 1024'd0;
       fifo_rspdat_e_den <= 1'b0;
     end
   else
     begin
       fifo_rspdat_e_din <= {tlx_rdata_e_bdi,tlx_rdata_e};
       fifo_rspdat_e_den <= tlx_rdata_e_dv;
     end

 fifo_sync #(
             .DATA_WIDTH (513),
             .ADDR_WIDTH (4),
             .FWFT(0),
             .DISTR(1)
             ) mfifo_rspdat_e (
                               .clk     (clk                ),
                               .rst_n   (rst_n              ),
                               .din     (fifo_rspdat_e_din  ),
                               .wr_en   (fifo_rspdat_e_den  ),
                               .rd_en   (fifo_rspdat_e_rdrq ),
                               .dout    (fifo_rspdat_e_dout ),
                               .overflow(fifo_rspdat_e_ovfl ),
                               .empty   (fifo_rspdat_e_empty)
                               );

//---- sync response info and even/odd data ----
 wire fifo_tri_rsp_good_empty = fifo_rsp_good_empty || fifo_rspdat_o_empty || fifo_rspdat_e_empty;
 reg  fifo_rsp_good_rdrq_orig;

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     fifo_rsp_good_rdrq_orig <= 1'b0;
   else 
     fifo_rsp_good_rdrq_orig <= ~fifo_tri_rsp_good_empty;

 assign fifo_rsp_good_rdrq = fifo_rsp_good_rdrq_orig && ~fifo_tri_rsp_good_empty;
 assign fifo_rspdat_o_rdrq = fifo_rsp_good_rdrq_orig && ~fifo_tri_rsp_good_empty;
 assign fifo_rspdat_e_rdrq = fifo_rsp_good_rdrq_orig && ~fifo_tri_rsp_good_empty;

//---- classify data FIFO output based on partial info ----
 assign fifo_rsp_good_full_dv    = (fifo_rsp_good_dv && ~fifo_rsp_good_dout[9]);
 assign fifo_rsp_good_partial_dv = (fifo_rsp_good_dv &&  fifo_rsp_good_dout[9]);

//---- tmporary register for partial read data combination ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     tmp_partial_rd_data_o <= 512'd0;
   else if(prt_rsp_available)
     tmp_partial_rd_data_o <= 512'd0;
   else if(fifo_rsp_good_partial_dv && ~fifo_rsp_good_dout[7])
     tmp_partial_rd_data_o <= (tmp_partial_rd_data_o | fifo_rspdat_o_dout[511:0]);

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     tmp_partial_rd_data_e <= 512'd0;
   else if(prt_rsp_available)
     tmp_partial_rd_data_e <= 512'd0;
   else if(fifo_rsp_good_partial_dv && fifo_rsp_good_dout[7])
     tmp_partial_rd_data_e <= (tmp_partial_rd_data_e | fifo_rspdat_e_dout[511:0]);



//---- FIFO to buffer information of bad response ----
 assign fifo_rsp_bad_din = {rsp_pos, rsp_tag};
 assign fifo_rsp_bad_den = rsp_bad_full_valid && (MODE);

 fifo_sync #(
             .DATA_WIDTH (9),
             .ADDR_WIDTH (4),
             .DISTR(1)
             ) mfifo_rsp_bad (
                              .clk     (clk               ),
                              .rst_n   (rst_n             ),
                              .din     (fifo_rsp_bad_din  ),
                              .wr_en   (fifo_rsp_bad_den  ),
                              .rd_en   (fifo_rsp_bad_rdrq ),
                              .valid   (fifo_rsp_bad_dv   ),
                              .dout    (fifo_rsp_bad_dout ),
                              .overflow(fifo_rsp_bad_ovfl ),
                              .empty   (fifo_rsp_bad_empty)
                              );

 assign fifo_rsp_bad_rdrq = ~fifo_rsp_bad_empty && ~fifo_rsp_good_rdrq;                                 
 assign fifo_rsp_bad_full_dv = fifo_rsp_bad_dv;

 reg fifo_rsp_good_den_sync;
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     fifo_rsp_good_den_sync <= 1'b0;
   else
     fifo_rsp_good_den_sync <= fifo_rsp_good_den;

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     all_fifos_emptied <= 1'b1;
   else if(fifo_rsp_good_den_sync)
     all_fifos_emptied <= 1'b0;
   else if(fifo_rsp_good_empty)
     all_fifos_emptied <= 1'b1;

   end
 endgenerate

//=================================================================================================================
//
// RETRY QUEUE
//
//   * manages responses of rty_req, xlate_pending and xlate_done, send out retry request in apt time
//   * read out available retry data only when no other responses are in process.
//
//=================================================================================================================

//---- push xlate_pending, xlate_done and retry response into retry queue -----
 assign rsp_rty_typ = {response_partial, response_retry, response_xlate_done, response_xlate_retry, response_xlate_pending};
 wire rsp_valid_rty = rsp_valid;
 wire fifo_retry_ovfl;

//---- retry queue that handles backoff countdown and xlate_pending/xlate_done matching ----
 brdg_retry_queue  mretry_queue (
                           .clk          (clk              ),
                           .rst_n        (rst_n            ),
                           .backoff_limit(cfg_backoff_timer),
                           .prt_cmd_start(prt_cmd_start    ),
                           .rty_busy     (rty_busy         ),
                           .rsp_den      (rsp_valid_rty    ),
                           .rsp_pos      (rsp_pos          ),
                           .rsp_tag      (rsp_tag          ),
                           .rsp_typ      (rsp_rty_typ      ),
                           .rty_rdy      (rty_rdy          ),
                           .rty_valid    (rty_valid        ),
                           .rty_pos      (rty_pos          ),
                           .rty_tag      (rty_tag          ),
                           .overflow     (fifo_retry_ovfl  )
                           );

//---- let good or bad responsed processed first ----
 assign rty_rdy = (MODE)? (~fifo_rsp_good_full_dv && ~fifo_rsp_bad_full_dv) : (~rsp_good_full_valid && ~rsp_bad_full_valid);



//=================================================================================================================
//
// Partial bookkeeper
//
//   * increment counter when one partial command is sent.
//   * decrement counter when one partial command is received.
//   * partial commands pertinent to the same 64B are processed individually
//   * acknowledge when all partial commands pertinent to the same 64B are responded.
//                     __
//   prt_cmd_start  __/  |_________________________________________________________________
//                  _____                                                       ___________           
//   prt_cmd_enable      |_____________________________________________________/        
//                         __         __         __     __      __                   
//   prt_cmd_valid  ______/  |_______/  |_______/  |___/  |____/  |________________________
//                                                              __
//   prt_cmd_last   ___________________________________________/  |________________________
//                                __         __         __           __      __   
//   rsp_valid      _____________/  |_______/  |_______/  |_________/  |____/  |___________
//                                                                           __   
//   rsp_last       ________________________________________________________/  |___________
//                                                                              ________
//   prt_rsp_pending __________________________________________________________/        |__       
//                                                                                    __
//   prt_rsp_available  _____________________________________________________________/  |__      
//
//=================================================================================================================

//---- inflight partial command counter ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     prt_inflight_cnt <= 5'd0;
   else 
     case({prt_cmd_valid, (response_partial && ~response_xlate_pending && rsp_valid)})
       2'b10 : prt_inflight_cnt <= prt_inflight_cnt + 5'd1;
       2'b01 : prt_inflight_cnt <= prt_inflight_cnt - 5'd1;
       default:;
     endcase

//---- valid partial response data counter, incrementing when valid response of partial is received, decrementing when valid data is popped ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     prt_data_cnt <= 5'd0;
   else if(MODE)
     case({(response_partial_done && rsp_valid), fifo_rsp_good_partial_dv})
       2'b10 : prt_data_cnt <= prt_data_cnt + 5'd1;
       2'b01 : prt_data_cnt <= prt_data_cnt - 5'd1;
       default:;
     endcase

//---- indicate partial commands have all been sent ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     prt_commands_allout <= 1'b0;
   else if(prt_cmd_enable)
     prt_commands_allout <= 1'b0;
   else if(prt_cmd_last)
     prt_commands_allout <= 1'b1;

//---- indicate all partial responses but not all data have all been received, for read mode only ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     prt_responses_allin <= 1'b0;
   else if(prt_rsp_end)
     prt_responses_allin <= 1'b0;
   else if(prt_rsp_last)
     prt_responses_allin <= 1'b1;

//---- when no other non-partial responses or retry responses are committed to upstream interface ----
 assign prt_rsp_empty_window = rty_rdy && ~rty_valid;

//---- all responses for partial commands have been back ----
 assign prt_rsp_available = prt_rsp_pending && prt_rsp_empty_window;

//---- the last response pertaining to the partial commands batch ----
 assign prt_rsp_last = response_partial && (prt_inflight_cnt == 5'd1) && prt_commands_allout && ~response_xlate_pending && rsp_valid;

//---- there's no valid data returned ----
 assign prt_rsp_last_no_data = prt_rsp_last && ~prt_rsp_done && ~response_partial_done;

//---- the last response data for read mode ----
 assign prt_rsp_last_all_data = (prt_data_cnt == 5'd0) && prt_rsp_done && prt_responses_allin;

//---- indicate the end of all partial responses for an individual batch ----
 assign prt_rsp_end = (MODE)? (prt_rsp_last_no_data || prt_rsp_last_all_data) : prt_rsp_last;

//---- delay partial commands enabling to make safe distance between 2 partial batches ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     prt_rsp_end_shift <= 8'd0;
   else 
     prt_rsp_end_shift <= {prt_rsp_end_shift[6:0], prt_rsp_end};

//---- pending to acknowledge the last batch of partial commands ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     prt_rsp_pending <= 1'b0;
   else if(prt_rsp_end)
     prt_rsp_pending <= 1'b1;
   else if(prt_rsp_empty_window)
     prt_rsp_pending <= 1'b0;

//---- indicate that at least one out of all responses is retry ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     prt_rsp_retry <= 1'b0;
   else if(prt_rsp_available)
     prt_rsp_retry <= 1'b0;
   else if((response_partial_retry || response_partial_xlate_pending) && rsp_valid)
     prt_rsp_retry <= 1'b1;

//---- indicate that at least one out of all responses is done ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     prt_rsp_done <= 1'b0;
   else if(prt_rsp_available)
     prt_rsp_done <= 1'b0;
   else if(response_partial_done && rsp_valid)
     prt_rsp_done <= 1'b1;

//---- indicate that at least one out of all responses is failed ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     prt_rsp_failed <= 1'b0;
   else if(prt_rsp_available)
     prt_rsp_failed <= 1'b0;
   else if(response_partial_failed && rsp_valid)
     prt_rsp_failed <= 1'b1;

//---- partial response valid signal to upstream interface except for retry ----
// for write or read with bad resp, asserts partial valid to demonstrate the end of a partial commands batch, except when there's retry in it;
// for read with all good resp, asserts partial valid when the last response data is read out of FIFO 
 assign prt_valid = prt_rsp_available && ~prt_rsp_retry;

//---- just in case when there's still retry in FIFO which might be re-sent ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     rty_in_progress <= 1'b0;
   else if(prt_rsp_end_shift[7])
     rty_in_progress <= 1'b1;
   else if(~rty_busy)
     rty_in_progress <= 1'b0;

 assign end_of_partial_batch = rty_in_progress && ~rty_busy;

//---- asserts to notify partial sequencer that all responses have been received ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     prt_cmd_enable <= 1'b1;
   else if(prt_cmd_start)
     prt_cmd_enable <= 1'b0;
   else if(end_of_partial_batch)
     prt_cmd_enable <= 1'b1;

//---- overall partial commands response, being good only when all responses are good ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     prt_rsp_code <= RESP_GOOD;
   else if(prt_rsp_available)
     begin
       if(prt_rsp_failed)
         prt_rsp_code <= RESP_BAD;
       else
         prt_rsp_code <= RESP_GOOD;
     end

//---- position and tag information for partial response ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     begin
       prt_pos <= 2'd0;
       prt_tag <= 7'd0;
     end
   else if(rsp_valid && response_partial)
     begin
       prt_pos <= rsp_pos;
       prt_tag <= rsp_tag;
     end


//=================================================================================================================
//
// MULTIPLEXER FOR RESPONSE OUT
//
//   * read mode: good response > bad response > retry. good response is entitled with the highest priority because
//                it's brought out by incoming response data, which is not buffered.
//   * write mode: good/bad response is not buffered, and overrides retry response.
//
//=================================================================================================================

//---- read data, tag and pos ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     begin
       dma_resp_valid <= 1'b0;
       dma_resp_data  <= 1024'd0;
       dma_resp_tag   <= {`TAGW{1'b1}};
       dma_resp_pos   <= 2'd0;
     end
   else if(MODE)
     begin             
       dma_resp_valid <= fifo_rsp_good_full_dv || fifo_rsp_bad_full_dv || rty_valid || prt_valid;
       dma_resp_data  <= (fifo_rsp_good_full_dv)? 
                         {fifo_rspdat_o_dout[511:0], fifo_rspdat_e_dout[511:0]} : 
                         {tmp_partial_rd_data_o, tmp_partial_rd_data_e}; 
       dma_resp_tag   <= (fifo_rsp_good_full_dv)? 
                          fifo_rsp_good_dout[6:0] : 
                         ((fifo_rsp_bad_full_dv)? fifo_rsp_bad_dout[6:0] : (rty_valid? rty_tag : prt_tag));
       dma_resp_pos   <= (fifo_rsp_good_full_dv)? 
                          fifo_rsp_good_dout[8:7] : 
                         ((fifo_rsp_bad_full_dv)? fifo_rsp_bad_dout[8:7] : (rty_valid? rty_pos : prt_pos));
     end
   else
     begin
       dma_resp_valid <= rsp_good_full_valid || rsp_bad_full_valid || rty_valid || prt_valid;
       dma_resp_tag   <= ((rsp_good_full_valid) || (rsp_bad_full_valid))? rsp_tag : (rty_valid? rty_tag : prt_tag);
       dma_resp_pos   <= ((rsp_good_full_valid) || (rsp_bad_full_valid))? rsp_pos : (rty_valid? rty_pos : prt_pos);
     end

//---- reponse type: 3'b001: good; 3'b010: bad; 3'b100: retry ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     dma_resp_code <= 3'd0;
   else if(MODE)
     case({fifo_rsp_good_full_dv,fifo_rsp_bad_full_dv,rty_valid,prt_valid})
       4'b1000 : dma_resp_code <= (fifo_rspdat_o_dout[512] || fifo_rspdat_e_dout[512])? RESP_BAD : RESP_GOOD;
       4'b0100 : dma_resp_code <= RESP_BAD;
       4'b0010 : dma_resp_code <= RESP_RETRY;
       4'b0001 : dma_resp_code <= prt_rsp_code;
       default:;
     endcase
   else
     case({rsp_good_full_valid,rsp_bad_full_valid,rty_valid,prt_valid})
       4'b1000 : dma_resp_code <= RESP_GOOD;
       4'b0100 : dma_resp_code <= RESP_BAD;
       4'b0010 : dma_resp_code <= RESP_RETRY;
       4'b0001 : dma_resp_code <= prt_rsp_code;
       default:;
     endcase



//=================================================================================================================
// STATUS output for SNAP registers
//=================================================================================================================

//---- DEBUG registers ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     begin
       debug_tlx_cnt_rsp       <= 32'b0;
       debug_tlx_cnt_retry     <= 32'b0;
       debug_tlx_cnt_fail      <= 32'b0;
       debug_tlx_cnt_xlt_pd    <= 32'b0;
       debug_tlx_cnt_xlt_done  <= 32'b0;
       debug_tlx_cnt_xlt_retry <= 32'b0;
     end
   else if(debug_cnt_clear)
     begin
       debug_tlx_cnt_rsp       <= 32'b0;
       debug_tlx_cnt_retry     <= 32'b0;
       debug_tlx_cnt_fail      <= 32'b0;
       debug_tlx_cnt_xlt_pd    <= 32'b0;
       debug_tlx_cnt_xlt_done  <= 32'b0;
       debug_tlx_cnt_xlt_retry <= 32'b0;
     end
   else if(rsp_valid)
     begin
       if(~response_xlate_pending)
         debug_tlx_cnt_rsp         <= debug_tlx_cnt_rsp + 32'b1;  // xlate pending doesn't count
       if(response_retry)
         debug_tlx_cnt_retry       <= debug_tlx_cnt_retry + 32'b1;
       if(response_failed)
         debug_tlx_cnt_fail        <= debug_tlx_cnt_fail + 32'b1;
       if(response_xlate_pending)
         debug_tlx_cnt_xlt_pd    <= debug_tlx_cnt_xlt_pd + 32'b1;
       if(response_xlate_done)
         debug_tlx_cnt_xlt_done  <= debug_tlx_cnt_xlt_done + 32'b1;
       if(response_xlate_retry)
         debug_tlx_cnt_xlt_retry <= debug_tlx_cnt_xlt_retry + 32'b1;
     end


//---- FAULT ISOLATION REGISTER ----
 reg [0003:0]   fir_fifo_rsp_good_overflow;
 reg            fir_fifo_rsp_bad_overflow ;
 reg            fir_fifo_rspdat_o_overflow;
 reg            fir_fifo_rspdat_e_overflow;
 reg            fir_fifo_retry_overflow;

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     begin
       fir_fifo_rsp_good_overflow <= 1'b0; 
       fir_fifo_rsp_bad_overflow  <= 1'b0; 
       fir_fifo_rspdat_o_overflow <= 1'b0;
       fir_fifo_rspdat_e_overflow <= 1'b0;
       fir_fifo_retry_overflow    <= 1'b0;
       fir_tlx_response_unsupport <= 1'b0;

       fir_fifo_overflow <= 5'd0;
     end
   else
     begin
       if (fifo_rsp_good_ovfl) fir_fifo_rsp_good_overflow <= 1'b1; 
       if (fifo_rsp_bad_ovfl)  fir_fifo_rsp_bad_overflow  <= 1'b1; 
       if (fifo_rspdat_o_ovfl) fir_fifo_rspdat_o_overflow <= 1'b1;
       if (fifo_rspdat_e_ovfl) fir_fifo_rspdat_e_overflow <= 1'b1;
       if (fifo_retry_ovfl)    fir_fifo_retry_overflow    <= 1'b1;
       if (rsp_valid && (rsp_type == 16'd0)) fir_tlx_response_unsupport <= 1'b1;

       fir_fifo_overflow <= { fir_fifo_rsp_good_overflow, fir_fifo_rsp_bad_overflow, fir_fifo_rspdat_o_overflow, fir_fifo_rspdat_e_overflow, fir_fifo_retry_overflow };
     end



 // psl default clock = (posedge clk);

//==== PSL ASSERTION ==============================================================================
 //// psl TLX_RESPONSE_DATA_SYNC : assert always ((MODE)? (all_fifos_emptied ? (fifo_rsp_good_empty && fifo_rspdat_o_empty && fifo_rspdat_e_empty) : 1'b1) : 1'b1) report "TLX response and data not synced! Response info and data FIFO should always be in the same status because good TLX response info and response data are expected to come in pairs.";
 
 // psl DATA_BRIDGE_RESPONSE_CONFLICT : assert always ((MODE)? onehot0({fifo_rsp_good_full_dv, fifo_rsp_bad_full_dv, rty_valid, prt_valid}) : onehot0({rsp_good_full_valid, rsp_bad_full_valid, rty_valid, prt_valid})) report "there should be only one response among good, bad, retry and partial responses committed to data bridge each time!";
//==== PSL ASSERTION ==============================================================================


//==== PSL COVERAGE ==============================================================================
 // psl TLX_RSP_17_DL1_DP0 : cover {(rsp_valid && (rsp_type[17]) && (rsp_dl==2'd1) && (rsp_dp==2'd0))};
 // psl TLX_RSP_16_DL1_DP0 : cover {(rsp_valid && (rsp_type[16]) && (rsp_dl==2'd1) && (rsp_dp==2'd0))};
 // psl TLX_RSP_15_DL1_DP0 : cover {(rsp_valid && (rsp_type[15]) && (rsp_dl==2'd1) && (rsp_dp==2'd0))};
 // psl TLX_RSP_14_DL1_DP0 : cover {(rsp_valid && (rsp_type[14]) && (rsp_dl==2'd1) && (rsp_dp==2'd0))};
 // psl TLX_RSP_13_DL1_DP0 : cover {(rsp_valid && (rsp_type[13]) && (rsp_dl==2'd1) && (rsp_dp==2'd0))};
 // psl TLX_RSP_12_DL1_DP0 : cover {(rsp_valid && (rsp_type[12]) && (rsp_dl==2'd1) && (rsp_dp==2'd0))};
 // psl TLX_RSP_11_DL1_DP0 : cover {(rsp_valid && (rsp_type[11]) && (rsp_dl==2'd1) && (rsp_dp==2'd0))};
 // psl TLX_RSP_10_DL1_DP0 : cover {(rsp_valid && (rsp_type[10]) && (rsp_dl==2'd1) && (rsp_dp==2'd0))};
 // psl TLX_RSP_09_DL1_DP0 : cover {(rsp_valid && (rsp_type[09]) && (rsp_dl==2'd1) && (rsp_dp==2'd0))};
 // psl TLX_RSP_08_DL1_DP0 : cover {(rsp_valid && (rsp_type[08]) && (rsp_dl==2'd1) && (rsp_dp==2'd0))};
 // psl TLX_RSP_07_DL1_DP0 : cover {(rsp_valid && (rsp_type[07]) && (rsp_dl==2'd1) && (rsp_dp==2'd0))};
 // psl TLX_RSP_06_DL1_DP0 : cover {(rsp_valid && (rsp_type[06]) && (rsp_dl==2'd1) && (rsp_dp==2'd0))};
 // psl TLX_RSP_05_DL1_DP0 : cover {(rsp_valid && (rsp_type[05]) && (rsp_dl==2'd1) && (rsp_dp==2'd0))};
 // psl TLX_RSP_04_DL1_DP0 : cover {(rsp_valid && (rsp_type[04]) && (rsp_dl==2'd1) && (rsp_dp==2'd0))};
 // psl TLX_RSP_03_DL1_DP0 : cover {(rsp_valid && (rsp_type[03]) && (rsp_dl==2'd1) && (rsp_dp==2'd0))};
 // psl TLX_RSP_02_DL1_DP0 : cover {(rsp_valid && (rsp_type[02]) && (rsp_dl==2'd1) && (rsp_dp==2'd0))};
 // psl TLX_RSP_01_DL1_DP0 : cover {(rsp_valid && (rsp_type[01]) && (rsp_dl==2'd1) && (rsp_dp==2'd0))};
 // psl TLX_RSP_00_DL1_DP0 : cover {(rsp_valid && (rsp_type[00]) && (rsp_dl==2'd1) && (rsp_dp==2'd0))};

 // psl TLX_RSP_17_DL1_DP1 : cover {(rsp_valid && (rsp_type[17]) && (rsp_dl==2'd1) && (rsp_dp==2'd1))};
 // psl TLX_RSP_16_DL1_DP1 : cover {(rsp_valid && (rsp_type[16]) && (rsp_dl==2'd1) && (rsp_dp==2'd1))};
 // psl TLX_RSP_15_DL1_DP1 : cover {(rsp_valid && (rsp_type[15]) && (rsp_dl==2'd1) && (rsp_dp==2'd1))};
 // psl TLX_RSP_14_DL1_DP1 : cover {(rsp_valid && (rsp_type[14]) && (rsp_dl==2'd1) && (rsp_dp==2'd1))};
 // psl TLX_RSP_13_DL1_DP1 : cover {(rsp_valid && (rsp_type[13]) && (rsp_dl==2'd1) && (rsp_dp==2'd1))};
 // psl TLX_RSP_12_DL1_DP1 : cover {(rsp_valid && (rsp_type[12]) && (rsp_dl==2'd1) && (rsp_dp==2'd1))};
 // psl TLX_RSP_11_DL1_DP1 : cover {(rsp_valid && (rsp_type[11]) && (rsp_dl==2'd1) && (rsp_dp==2'd1))};
 // psl TLX_RSP_10_DL1_DP1 : cover {(rsp_valid && (rsp_type[10]) && (rsp_dl==2'd1) && (rsp_dp==2'd1))};
 // psl TLX_RSP_09_DL1_DP1 : cover {(rsp_valid && (rsp_type[09]) && (rsp_dl==2'd1) && (rsp_dp==2'd1))};
 // psl TLX_RSP_08_DL1_DP1 : cover {(rsp_valid && (rsp_type[08]) && (rsp_dl==2'd1) && (rsp_dp==2'd1))};
 // psl TLX_RSP_07_DL1_DP1 : cover {(rsp_valid && (rsp_type[07]) && (rsp_dl==2'd1) && (rsp_dp==2'd1))};
 // psl TLX_RSP_06_DL1_DP1 : cover {(rsp_valid && (rsp_type[06]) && (rsp_dl==2'd1) && (rsp_dp==2'd1))};
 // psl TLX_RSP_05_DL1_DP1 : cover {(rsp_valid && (rsp_type[05]) && (rsp_dl==2'd1) && (rsp_dp==2'd1))};
 // psl TLX_RSP_04_DL1_DP1 : cover {(rsp_valid && (rsp_type[04]) && (rsp_dl==2'd1) && (rsp_dp==2'd1))};
 // psl TLX_RSP_03_DL1_DP1 : cover {(rsp_valid && (rsp_type[03]) && (rsp_dl==2'd1) && (rsp_dp==2'd1))};
 // psl TLX_RSP_02_DL1_DP1 : cover {(rsp_valid && (rsp_type[02]) && (rsp_dl==2'd1) && (rsp_dp==2'd1))};
 // psl TLX_RSP_01_DL1_DP1 : cover {(rsp_valid && (rsp_type[01]) && (rsp_dl==2'd1) && (rsp_dp==2'd1))};
 // psl TLX_RSP_00_DL1_DP1 : cover {(rsp_valid && (rsp_type[00]) && (rsp_dl==2'd1) && (rsp_dp==2'd1))};

 // psl TLX_RSP_17_DL2 : cover {(rsp_valid && (rsp_type[17]) && (rsp_dl==2'd2))};
 // psl TLX_RSP_16_DL2 : cover {(rsp_valid && (rsp_type[16]) && (rsp_dl==2'd2))};
 // psl TLX_RSP_15_DL2 : cover {(rsp_valid && (rsp_type[15]) && (rsp_dl==2'd2))};
 // psl TLX_RSP_14_DL2 : cover {(rsp_valid && (rsp_type[14]) && (rsp_dl==2'd2))};
 // psl TLX_RSP_13_DL2 : cover {(rsp_valid && (rsp_type[13]) && (rsp_dl==2'd2))};
 // psl TLX_RSP_12_DL2 : cover {(rsp_valid && (rsp_type[12]) && (rsp_dl==2'd2))};
 // psl TLX_RSP_11_DL2 : cover {(rsp_valid && (rsp_type[11]) && (rsp_dl==2'd2))};
 // psl TLX_RSP_10_DL2 : cover {(rsp_valid && (rsp_type[10]) && (rsp_dl==2'd2))};
 // psl TLX_RSP_09_DL2 : cover {(rsp_valid && (rsp_type[09]) && (rsp_dl==2'd2))};
 // psl TLX_RSP_08_DL2 : cover {(rsp_valid && (rsp_type[08]) && (rsp_dl==2'd2))};
 // psl TLX_RSP_07_DL2 : cover {(rsp_valid && (rsp_type[07]) && (rsp_dl==2'd2))};
 // psl TLX_RSP_06_DL2 : cover {(rsp_valid && (rsp_type[06]) && (rsp_dl==2'd2))};
 // psl TLX_RSP_05_DL2 : cover {(rsp_valid && (rsp_type[05]) && (rsp_dl==2'd2))};
 // psl TLX_RSP_04_DL2 : cover {(rsp_valid && (rsp_type[04]) && (rsp_dl==2'd2))};
 // psl TLX_RSP_03_DL2 : cover {(rsp_valid && (rsp_type[03]) && (rsp_dl==2'd2))};
 // psl TLX_RSP_02_DL2 : cover {(rsp_valid && (rsp_type[02]) && (rsp_dl==2'd2))};
 // psl TLX_RSP_01_DL2 : cover {(rsp_valid && (rsp_type[01]) && (rsp_dl==2'd2))};
 // psl TLX_RSP_00_DL2 : cover {(rsp_valid && (rsp_type[00]) && (rsp_dl==2'd2))};
 
 // psl TLX_RSP_PRT_NO_DATA  : cover {prt_rsp_last_no_data};
 // psl TLX_RSP_PRT_ALL_DATA : cover {prt_rsp_last_all_data};
 // psl TLX_RSP_PRT_ANY_RTY  : cover {prt_rsp_retry};
 // psl TLX_RSP_PRT_ANY_DONE : cover {prt_rsp_done};
 // psl TLX_RSP_PRT_ANY_FAIL : cover {prt_rsp_failed};
//==== PSL CONVERAGE ==============================================================================
             

endmodule

