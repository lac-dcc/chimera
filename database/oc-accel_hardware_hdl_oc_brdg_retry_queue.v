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
`timescale 1ns/1ps

`include "snap_global_vars.v"

module brdg_retry_queue 
                        (
                         input                 clk          ,
                         input                 rst_n        ,

                         // backoff time countdown time limit
                         input      [003:0]    backoff_limit,

                         // partial command start indicator
                         input                 prt_cmd_start,

                         // retry busy indicator
                         output                rty_busy     ,

                         // retry request in
                         input                 rsp_den      ,
                         input      [001:0]    rsp_pos      ,
                         input      [`TAGW-1:0]rsp_tag      ,
                         input      [004:0]    rsp_typ      ,

                         // retry request out
                         input                 rty_rdy      ,
                         output                rty_valid    ,
                         output reg [001:0]    rty_pos      ,
                         output reg [`TAGW-1:0]rty_tag      ,

                         // FIFO overflow
                         output                overflow
                         );



 reg             fifo_retry_den;
 reg [11:00]     fifo_retry_din;
 wire            fifo_retry_rdrq;
 wire            fifo_retry_dv;
 wire            fifo_retry_empty;
 reg             rsp_is_retry_backoff;
 reg [23:00]     cfg_short_backoff_timer;
 reg             rsp_is_xlate_pending;
 reg             rsp_is_partial;
 wire[11:00]     fifo_retry_dout;
 reg [23:00]     backoff_countdown;
 reg [04:00]     xlate_pending_cnt;
 wire            retry_check_done;
 reg [04:00]     cstate, nstate;
 reg             ram_xlate_done_wena;
 reg [`TAGW-1:00] ram_xlate_done_addra;
 reg [03:00]     ram_xlate_done_dina;
 reg [02:00]     retry_check_done_slide;
 wire            rsp_is_xlate_done_retry_backoff;
 wire            rsp_is_xlate_done_retry_immediate;
 reg [`TAGW-1:00]ram_xlate_done_addrb;
 wire[03:00]     ram_xlate_done_doutb;
 reg [`TAGW-1:00]last_rty_tag;
 reg [01:00]     last_rty_pos;
 reg             rep_retry_enable;


 parameter IDLE          = 5'b00001,
           RETRY_RELEASE = 5'b00010,    
           RETRY_CHECK   = 5'b00100,    
           RETRY_BACKOFF = 5'b01000,    
           RETRY_NOW     = 5'b10000;    



//-----------------------------------------------------------------------------------------------------------------
//
// Retry responses pushed into retry queue include: xlate_pending and rty_req
//
// Data of the retry queue are read out of the queue only if 
//   1), it's not empty,
//   2), not any retry process is ongoing, 
//   3), the same number of xlate_done as the xlate_pending that have been put in the queue are also received.
// 
// Meanwhile, xlate_done response that follows the xlate_pending is stored in another RAM and read out 
// addressed by the same AFUTAG as the response that's being read out of the retry queue.
// 
// If the response read from the retry queue is rty_req, retry will be carried out after a backoff time.
// But if the response read from the retry queue is xlate_pending, retry will be carried out immediately if the 
// resp_code going with the xlate_done is DONE.
// 
//-----------------------------------------------------------------------------------------------------------------


//---- decode retry related responses ----
 wire rsp_xlate_pending              = rsp_typ[0];
 wire rsp_xlate_done_retry_backoff   = rsp_typ[1];
 wire rsp_xlate_done_retry_immediate = rsp_typ[2];
 wire rsp_retry_backoff              = rsp_typ[3];
 wire rsp_partial                    = rsp_typ[4];

//---- push retry and xlate_pending responses in queue ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     begin
       fifo_retry_den  <= 1'b0;
       fifo_retry_din  <= 12'd0;
     end
   else
     begin
       fifo_retry_den  <= rsp_den && (rsp_xlate_pending || rsp_retry_backoff);
       fifo_retry_din  <= {rsp_partial, rsp_retry_backoff, rsp_xlate_pending, rsp_pos, rsp_tag}; //1+1+1+2+7=12
     end

//---- retry FIFO ----
 fifo_sync #(
             .DATA_WIDTH (12),
             .ADDR_WIDTH (7),
             .FWFT       (0)
             ) mfifo_rty_tag (
                              .clk          (clk             ), // input clk
                              .rst_n        (rst_n           ), // input rst
                              .din          (fifo_retry_din  ), // input [11 : 0] din
                              .wr_en        (fifo_retry_den  ), // input wr_en
                              .rd_en        (fifo_retry_rdrq ), // input rd_en
                              .dout         (fifo_retry_dout ), // output [11 : 0] dout
                              .valid        (fifo_retry_dv   ),
                              .empty        (fifo_retry_empty), // output empty
                              .overflow     (overflow        )
                              );

//---- read FIFO once only when 1) equal number of xlate_pending and xlate_done have received; 2) FIFO is not empty
 assign fifo_retry_rdrq = (cstate == RETRY_RELEASE);

//---- retrieve retry responses ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     {rsp_is_partial, rsp_is_retry_backoff, rsp_is_xlate_pending, rty_pos, rty_tag} <= 12'd0;
   else if(fifo_retry_dv)
     {rsp_is_partial, rsp_is_retry_backoff, rsp_is_xlate_pending, rty_pos, rty_tag} <= fifo_retry_dout;


//---- retry timer mapping, copied from the MCP3 example ----
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
   else if(cstate == RETRY_BACKOFF)
     backoff_countdown <= backoff_countdown - 24'd1;
   else
     backoff_countdown <= cfg_short_backoff_timer;


//---- balance counter for xlate_pending and xlate_done ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     xlate_pending_cnt <= 5'd0;
   else if(rsp_den)
     case(rsp_typ[3:0])
       4'b0001 : xlate_pending_cnt <= xlate_pending_cnt + 5'd1;  // xlate_pending
       4'b0010 : xlate_pending_cnt <= xlate_pending_cnt - 5'd1;  // xlate_done
       4'b0100 : xlate_pending_cnt <= xlate_pending_cnt - 5'd1;  // xlate_done
       default:;
     endcase


//---- statemachine ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     cstate <= IDLE;
   else
     cstate <= nstate;

 always@*
   case(cstate)
     IDLE               :
                          if (~fifo_retry_empty && ~|xlate_pending_cnt)
                            nstate = RETRY_RELEASE;
                          else
                            nstate = IDLE;
     RETRY_RELEASE      :
                            nstate = RETRY_CHECK;
     RETRY_CHECK        :
                          if (retry_check_done)
                            begin
                              if ((rty_tag == last_rty_tag) && (rty_pos == last_rty_pos) && ~rep_retry_enable)  // skip retry output with identical tag
                                nstate = IDLE;
                              else if (rsp_is_retry_backoff)
                                nstate = RETRY_BACKOFF;
                              else if (rsp_is_xlate_pending && rsp_is_xlate_done_retry_immediate)
                                nstate = RETRY_NOW;
                              else if (rsp_is_xlate_pending && rsp_is_xlate_done_retry_backoff)
                                nstate = RETRY_BACKOFF;
                              else
                                nstate = RETRY_CHECK;
                            end
                          else
                            nstate = RETRY_CHECK;
     RETRY_BACKOFF     :
                          if (~|backoff_countdown)
                            nstate = RETRY_NOW;
                          else
                            nstate = RETRY_BACKOFF;
     RETRY_NOW         :
                          if (rty_rdy)
                            nstate = IDLE;
                          else
                            nstate = RETRY_NOW;
     default           :
                            nstate = IDLE;
   endcase



//---- timing adjustment for xlate_pending and xlate_done comparison ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     retry_check_done_slide <= 3'b001;
   else 
     case(cstate)
       RETRY_CHECK : retry_check_done_slide <= retry_check_done_slide << 1;
       default     : retry_check_done_slide <= 3'b001;
     endcase

 assign retry_check_done = retry_check_done_slide[2];

//---- store xlate_done response in RAM, addressed by afutag ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     begin
       ram_xlate_done_wena  <= 1'b0;
       ram_xlate_done_addra <= 6'd0;
       ram_xlate_done_dina  <= 4'd0;
     end
   else 
     begin
       ram_xlate_done_wena  <= rsp_den && (rsp_xlate_done_retry_backoff || rsp_xlate_done_retry_immediate);
       ram_xlate_done_addra <= rsp_tag;
       ram_xlate_done_dina  <= {rsp_xlate_done_retry_backoff, rsp_xlate_done_retry_immediate, rsp_pos};
     end

//---- RAM for xlate_done responses ----
 ram_simple_dual #(4,`TAGW) mram_xlate_done ( 
                                         .clk   (clk                 ), 
                                         .ena   (1'b1                ),
                                         .enb   (1'b1                ),
                                         .wea   (ram_xlate_done_wena ), 
                                         .addra (ram_xlate_done_addra), 
                                         .dia   (ram_xlate_done_dina ), 
                                         .addrb (ram_xlate_done_addrb), 
                                         .dob   (ram_xlate_done_doutb)  
                                         );


//---- get xlate_done response out of RAM, addressed by afutag from retry FIFO ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     ram_xlate_done_addrb <= 6'd0;
   else
     ram_xlate_done_addrb <= fifo_retry_dout[6:0];

 assign rsp_is_xlate_done_retry_backoff   = ram_xlate_done_doutb[3];
 assign rsp_is_xlate_done_retry_immediate = ram_xlate_done_doutb[2];


//---- notify valid retry ----
 assign rty_valid = rty_rdy && (cstate == RETRY_NOW);

//---- store the last retry tag to prevent repetitive retry on the same tag ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     begin
       last_rty_tag <= 7'd0;
       last_rty_pos <= 2'd0;
     end
   else if(rty_valid)
     begin
       last_rty_tag <= rty_tag;  
       last_rty_pos <= rty_pos;
     end

//---- allow repetitive tag retry since retry's response could be another retry ----
// 2 senarios of possible repetitive retry: 
//   1) single tag, full 
//   2) multiple responses with the same tag, partial
// for partial, enable retry when new partial commands start to fire; otherwise when FIFO's empty
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     rep_retry_enable <= 1'b0;
   else if(rty_valid)
     rep_retry_enable <= 1'b0;
   else if(prt_cmd_start || (fifo_retry_empty && ~rsp_is_partial))  
     rep_retry_enable <= 1'b1;


//---- indicate no retry request in queue ----
 assign rty_busy = ~fifo_retry_empty;
        

 wire cstate_h01_h02 = ((cstate == IDLE) && (nstate == RETRY_RELEASE));
 wire cstate_h02_h04 = ((cstate == RETRY_RELEASE) && (nstate == RETRY_CHECK));
 wire cstate_h04_h01 = ((cstate == RETRY_CHECK) && (nstate == IDLE));
 wire cstate_h04_h08 = ((cstate == RETRY_CHECK) && (nstate == RETRY_BACKOFF));
 wire cstate_h04_h10 = ((cstate == RETRY_CHECK) && (nstate == RETRY_NOW));
 wire cstate_h10_h01 = ((cstate == RETRY_NOW) && (nstate == IDLE));



 // psl default clock = (posedge clk);

//==== PSL COVERAGE ==============================================================================
 // psl PRT_CSTATE_H01_H02 : cover {(cstate_h01_h02)};
 // psl PRT_CSTATE_H02_H04 : cover {(cstate_h02_h04)};
 // psl PRT_CSTATE_H04_H01 : cover {(cstate_h04_h01)};
 // psl PRT_CSTATE_H04_H08 : cover {(cstate_h04_h08)};
 // psl PRT_CSTATE_H04_H10 : cover {(cstate_h04_h10)};
 // psl PRT_CSTATE_H10_H01 : cover {(cstate_h10_h01)};
//==== PSL COVERAGE ==============================================================================


endmodule
