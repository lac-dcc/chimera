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

module brdg_interrupt ( 
                       input                 clk              ,
                       input                 rst_n            ,

                       //---- configuration --------------------------------------
                       input      [011:0]    cfg_actag_base   ,
                       input      [019:0]    cfg_pasid_base   ,
                       input      [019:0]    cfg_pasid_mask   ,

                       //---- backoff time countdown time limit ------------------
                       input      [003:0]    backoff_limit    ,

                       //---- enable interrupt when SNAP is idle -----------------
                       input                 interrupt_enable ,

                       //---- AXI interface --------------------------------------
                       output                interrupt_ack    ,
                       input                 interrupt        ,
                       input      [063:0]    interrupt_src    ,
                       input      [008:0]    interrupt_ctx    ,

                       //---- TLX interface --------------------------------------
                       output reg            tlx_cmd_valid    ,
                       output reg [067:0]    tlx_cmd_obj      ,
                       output reg [015:0]    tlx_cmd_afutag   ,     
                       output reg [007:0]    tlx_cmd_opcode   ,
                       output reg [0019:0]   tlx_cmd_pasid    ,
                       output reg [0011:0]   tlx_cmd_actag    ,
                       input                 tlx_rsp_valid    ,
                       input      [015:0]    tlx_rsp_afutag   ,
                       input      [007:0]    tlx_rsp_opcode   ,
                       input      [003:0]    tlx_rsp_code     
                       );


 reg [07:00] cstate, nstate;
 reg [23:00] cfg_short_backoff_timer;
 reg [23:00] backoff_countdown;
 reg [063:0] interrupt_src_sync;
 wire        backoff_timeup;
 wire        int_rsp_done;    
 wire        int_rsp_retry;   
 wire        int_rsp_pending; 
 wire        int_rsp_fail;    
 wire        int_rsp_rdy_done; 
 wire        int_rsp_rdy_retry;



 parameter IDLE         =  8'h01,          
           NEW_INT      =  8'h02,  
           WAIT_FOR_RSP =  8'h04, 
           INT_PENDING  =  8'h08,
           INT_BACKOFF  =  8'h10,
           UNEXP_RESP   =  8'h20,
           ACK_INT      =  8'h40;


 // TLX AP command encodes
 localparam    [7:0] AFU_TLX_CMD_ENCODE_INTRP_REQ             = 8'b01011000;  // -- Interrupt Request
 localparam    [7:0] AFU_TLX_CMD_ENCODE_INTRP_REQ_S           = 8'b01011001;  // -- Interrupt Request
 localparam    [7:0] AFU_TLX_CMD_ENCODE_INTRP_REQ_D           = 8'b01011010;  // -- Interrupt Request
 localparam    [7:0] AFU_TLX_CMD_ENCODE_INTRP_REQ_D_S         = 8'b01011011;  // -- Interrupt Request

 // TL CAPP response encodes
 localparam    [7:0] TLX_AFU_RESP_ENCODE_INTRP_RESP           = 8'b00001100;  // -- Interrupt Response
 localparam    [7:0] TLX_AFU_RESP_ENCODE_INTRP_RDY            = 8'b00011010;  // -- Interrupt ready (Async Notification)

 // TL CAP response code encodes
 localparam    [3:0] TLX_AFU_RESP_CODE_DONE                   = 4'b0000;      // -- Done
 localparam    [3:0] TLX_AFU_RESP_CODE_RTY_REQ                = 4'b0010;      // -- Retry Heavy weight (long backoff timer)                     
 localparam    [3:0] TLX_AFU_RESP_CODE_INTRP_PENDING          = 4'b0100;      // -- Toss, wait for intrp rdy with same AFU tag, convert to Retry
 localparam    [3:0] TLX_AFU_RESP_CODE_DERROR                 = 4'b1000;      // -- Machine Check
 localparam    [3:0] TLX_AFU_RESP_CODE_BAD_LENGTH             = 4'b1001;      // -- Machine Check
 localparam    [3:0] TLX_AFU_RESP_CODE_BAD_HANDLE             = 4'b1011;      // -- Machine Check
 localparam    [3:0] TLX_AFU_RESP_CODE_FAILED                 = 4'b1110;      // -- Machine Check

//store interrupt_src to interrupt_src_sync when interrupt is set, this signal is stored for reuse when retry
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     interrupt_src_sync <= 0;
   else if(interrupt)
     interrupt_src_sync <= interrupt_src;

//---- TLX command ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     begin
       tlx_cmd_valid  <= 1'd0;
       tlx_cmd_obj    <= 68'd0;
       tlx_cmd_afutag <= 16'd0;
       tlx_cmd_opcode <= 8'd0;
     end
   else
     begin
       tlx_cmd_valid  <= ((cstate == NEW_INT) && interrupt_enable);
       tlx_cmd_obj    <= {4'd0, interrupt_src_sync};
       tlx_cmd_afutag <= {2'b11, 14'd0};
       tlx_cmd_opcode <= AFU_TLX_CMD_ENCODE_INTRP_REQ;
     end

//---- interrupt pasid and actag ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     begin
       tlx_cmd_pasid <= 20'd0;
       tlx_cmd_actag <= 12'd0; 
     end
   else
     begin
       tlx_cmd_pasid <= ((cfg_pasid_base & cfg_pasid_mask) | ({{(20-`CTXW){1'd0}}, interrupt_ctx} & ~cfg_pasid_mask));
       tlx_cmd_actag <= cfg_actag_base + {{(12-`CTXW){1'd0}}, interrupt_ctx}; 
     end

//---- TLX response ----
 assign int_rsp_done    = tlx_rsp_valid && (tlx_rsp_opcode == TLX_AFU_RESP_ENCODE_INTRP_RESP) && (tlx_rsp_code == TLX_AFU_RESP_CODE_DONE);
 assign int_rsp_retry   = tlx_rsp_valid && (tlx_rsp_opcode == TLX_AFU_RESP_ENCODE_INTRP_RESP) && (tlx_rsp_code == TLX_AFU_RESP_CODE_RTY_REQ);
 assign int_rsp_pending = tlx_rsp_valid && (tlx_rsp_opcode == TLX_AFU_RESP_ENCODE_INTRP_RESP) && (tlx_rsp_code == TLX_AFU_RESP_CODE_INTRP_PENDING);
 assign int_rsp_fail    = tlx_rsp_valid && (tlx_rsp_opcode == TLX_AFU_RESP_ENCODE_INTRP_RESP) && (tlx_rsp_code == TLX_AFU_RESP_CODE_FAILED);

 assign int_rsp_rdy_done   = tlx_rsp_valid && (tlx_rsp_opcode == TLX_AFU_RESP_ENCODE_INTRP_RDY) && (tlx_rsp_code == TLX_AFU_RESP_CODE_DONE);
 assign int_rsp_rdy_retry  = tlx_rsp_valid && (tlx_rsp_opcode == TLX_AFU_RESP_ENCODE_INTRP_RDY) && (tlx_rsp_code == TLX_AFU_RESP_CODE_RTY_REQ);

//---- interrupt acknowledgement ----
 assign interrupt_ack = (cstate == ACK_INT) || (cstate == UNEXP_RESP);


//---- interrupt command sending and response receiving statemachine ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     cstate <= IDLE;
   else
     cstate <= nstate;

 always@*
   case(cstate)
     IDLE        :  
                    if(interrupt)
                      nstate = NEW_INT;
                    else 
                      nstate = IDLE;
     NEW_INT     :  
                    if(interrupt_enable)
                      nstate = WAIT_FOR_RSP;
                    else 
                      nstate = NEW_INT;
     WAIT_FOR_RSP:  
                    if(int_rsp_done)
                      nstate = ACK_INT;
                    else if(int_rsp_retry)
                      nstate = INT_BACKOFF;
                    else if(int_rsp_pending)
                      nstate = INT_PENDING;
                    else if(int_rsp_fail)
                      nstate = UNEXP_RESP;
                    else
                      nstate = WAIT_FOR_RSP;
                      
     INT_PENDING : 
                    if(int_rsp_rdy_done)
                      nstate = NEW_INT;
                    else if(int_rsp_rdy_retry)
                      nstate = INT_BACKOFF;
                    else
                      nstate = INT_PENDING;
     INT_BACKOFF : 
                   if(backoff_timeup)
                     nstate = NEW_INT;
                   else
                     nstate = INT_BACKOFF;
     UNEXP_RESP  : 
                   if(~interrupt)
                     nstate = IDLE;
                   else
                     nstate = UNEXP_RESP;
     ACK_INT     : 
                   if(~interrupt)
                     nstate = IDLE;
                   else
                     nstate = ACK_INT;
     default     :  
                     nstate = IDLE;
   endcase


//---- backoff timer ----
  always @*
    begin
      case (backoff_limit[3:0])                  // -- At 200 MHz, 20 clock cycles (x14) = 100 ns
        4'b0000:  cfg_short_backoff_timer[23:0] =  24'h00_0014;  // --  2^0  =     1 * 100 ns  
        4'b0001:  cfg_short_backoff_timer[23:0] =  24'h00_0028;  // --  2^1  =     2 * 100 ns
        4'b0010:  cfg_short_backoff_timer[23:0] =  24'h00_0050;  // --  2^2  =     4 * 100 ns   
        4'b0011:  cfg_short_backoff_timer[23:0] =  24'h00_00A0;  // --  2^3  =     8 * 100 ns     
        4'b0100:  cfg_short_backoff_timer[23:0] =  24'h00_0140;  // --  2^4  =    16 * 100 ns     
        4'b0101:  cfg_short_backoff_timer[23:0] =  24'h00_0280;  // --  2^5  =    32 * 100 ns     
        4'b0110:  cfg_short_backoff_timer[23:0] =  24'h00_0500;  // --  2^6  =    64 * 100 ns     
        4'b0111:  cfg_short_backoff_timer[23:0] =  24'h00_0A00;  // --  2^7  =   128 * 100 ns     
        4'b1000:  cfg_short_backoff_timer[23:0] =  24'h00_1400;  // --  2^8  =   256 * 100 ns    
        4'b1001:  cfg_short_backoff_timer[23:0] =  24'h00_2800;  // --  2^9  =   512 * 100 ns      
        4'b1010:  cfg_short_backoff_timer[23:0] =  24'h00_5000;  // --  2^10 =  1024 * 100 ns     
        4'b1011:  cfg_short_backoff_timer[23:0] =  24'h00_A000;  // --  2^11 =  2048 * 100 ns    
        4'b1100:  cfg_short_backoff_timer[23:0] =  24'h01_4000;  // --  2^12 =  4096 * 100 ns    
        4'b1101:  cfg_short_backoff_timer[23:0] =  24'h02_8000;  // --  2^13 =  8192 * 100 ns    
        4'b1110:  cfg_short_backoff_timer[23:0] =  24'h05_0000;  // --  2^14 = 16384 * 100 ns    
        4'b1111:  cfg_short_backoff_timer[23:0] =  24'h0A_0000;  // --  2^15 = 32768 * 100 ns    
      endcase
    end // -- always @ *


//---- backoff counter for retry ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     backoff_countdown <= 24'd0;
   else if(cstate == INT_BACKOFF)
     backoff_countdown <= backoff_countdown - 24'd1;
   else
     backoff_countdown <= cfg_short_backoff_timer;

 assign backoff_timeup = (~|backoff_countdown);



endmodule
