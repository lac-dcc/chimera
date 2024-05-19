// This program was cloned from: https://github.com/OpenCAPI/oc-accel
// License: Apache License 2.0

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

module brdg_command_encode 
                          #(
                            parameter MODE = 1'b0  //0: write; 1: read
                            )
                          ( 
                           input                      clk              ,
                           input                      rst_n            ,
                             
                           //---- configuration --------------------------
                           input      [011:0]         cfg_actag_base   ,
                           input      [019:0]         cfg_pasid_base   ,
                           input      [019:0]         cfg_pasid_mask   ,

                           //---- communication with command decoder -----
                           output                     prt_cmd_start    ,
                           output                     prt_cmd_valid    ,
                           output                     prt_cmd_last     ,
                           input                      prt_cmd_enable   ,

                           //---- DMA interface ---------------------------
                           output                     dma_cmd_ready    ,
                           input                      dma_cmd_valid    ,
                           input      [1023:0]        dma_cmd_data     ,
                           input      [0127:0]        dma_cmd_be       ,
                           input      [0063:0]        dma_cmd_ea       ,
                           input      [`TAGW-1:0]     dma_cmd_tag      ,
                           input      [`CTXW-1:0]     dma_cmd_ctx      ,

                           //---- TLX interface ---------------------------
                             // command
                           output reg                 tlx_cmd_valid    ,    
                           output reg [0007:0]        tlx_cmd_opcode   ,     
                           output reg [0067:0]        tlx_cmd_ea_or_obj,        
                           output reg [0015:0]        tlx_cmd_afutag   ,     
                           output reg [0001:0]        tlx_cmd_dl       , 
                           output reg [0002:0]        tlx_cmd_pl       , 
                           output     [0063:0]        tlx_cmd_be       , 
                           output reg [0019:0]        tlx_cmd_pasid    ,
                           output reg [0011:0]        tlx_cmd_actag    ,
                           output reg [1023:0]        tlx_cdata_bus    ,    

                             // credit availability
                           input                      tlx_cmd_rdy      ,

                           //---- control and status ---------------------
                           input                      debug_cnt_clear  ,
                           output reg [0031:0]        debug_tlx_cnt_cmd,
                           output reg [0001:0]        fir_fifo_overflow
                           );


 // TLX AP command opcode
 localparam [7:0] AFU_TLX_CMD_OPCODE_ASSIGN_ACTAG  = 8'b0101_0000;  // Assign acTag
 localparam [7:0] AFU_TLX_CMD_OPCODE_RD_WNITC      = 8'b0001_0000;  // Read with no intent to cache
 localparam [7:0] AFU_TLX_CMD_OPCODE_RD_WNITC_N    = 8'b0001_0100;  // Read with no intent to cache
 localparam [7:0] AFU_TLX_CMD_OPCODE_PR_RD_WNITC   = 8'b0001_0010;  // Partial read with no intent to cache
 localparam [7:0] AFU_TLX_CMD_OPCODE_PR_RD_WNITC_N = 8'b0001_0110;  // Partial read with no intent to cache
 localparam [7:0] AFU_TLX_CMD_OPCODE_DMA_W         = 8'b0010_0000;  // DMA Write
 localparam [7:0] AFU_TLX_CMD_OPCODE_DMA_W_N       = 8'b0010_0100;  // DMA Write
 localparam [7:0] AFU_TLX_CMD_OPCODE_DMA_PR_W      = 8'b0011_0000;  // DMA Partial Write
 localparam [7:0] AFU_TLX_CMD_OPCODE_DMA_PR_W_N    = 8'b0011_0100;  // DMA Partial Write
 localparam [7:0] AFU_TLX_CMD_OPCODE_DMA_W_BE      = 8'b0010_1000;  // Byte Enable DMA Write
 localparam [7:0] AFU_TLX_CMD_OPCODE_DMA_W_BE_N    = 8'b0010_1100;  // Byte Enable DMA Write
 localparam [7:0] AFU_TLX_CMD_OPCODE_INTRP_REQ     = 8'b0101_1000;  // Interrupt Request
 localparam [7:0] AFU_TLX_CMD_OPCODE_INTRP_REQ_D   = 8'b0101_1010;  // Interrupt Request
 localparam [7:0] AFU_TLX_CMD_OPCODE_XLATE_TOUCH   = 8'b0111_1000;  // Address translation prefetch
 localparam [7:0] AFU_TLX_CMD_OPCODE_XLATE_TOUCH_N = 8'b0111_1001;  // Address translation prefetch

 reg             fifo_prt_info_wr_en;
 reg             fifo_prt_data_wr_en;
 reg [0202:00]   fifo_prt_info_din;
 reg [1023:00]   fifo_prt_data_din;
 wire            fifo_prt_info_rd_en;
 wire            fifo_prt_data_rd_en;
 wire [0202:00]  fifo_prt_info_dout;
 wire [1023:00]  fifo_prt_data_dout;
 wire [0004:00]  fifo_prt_info_count;
 reg [0202:00]   fifo_prt_info_dout_sync;
 reg [0511:00]   fifo_prt_data_dout_h_sync;
 wire            fifo_prt_info_empty;
 wire            fifo_prt_info_dv;
 reg [0063:00]   strobe;
 reg             strobe_valid;
 wire            partial_l;
 wire            partial_h;
 reg [`TAGW-1:00] partial_tag;
 reg [`CTXW-1:00] partial_ctx;
 wire[0004:00]   partial_cnt;
 reg [0056:00]   partial_ea_128B;
 reg             partial_2nd;
 reg [0511:00]   partial_data;
 wire            partial_enable;
 reg             partial_next_pending;
 wire [0002:00]  partial_len;
 wire            partial_valid;
 wire            partial_done;
 reg [0002:00]   partial_status;
 wire [0005:00]  partial_ea_32B;
 reg [0004:00]   prt_cstate, prt_nstate;
 wire            prt_h, prt_l;
 wire            fifo_prt_data_ovfl;
 wire            fifo_prt_info_ovfl;

 parameter IDLE          = 5'h01, 
           RD_PRT_FIFO   = 5'h02,
           CHECK_PARTIAL = 5'h04,
           PARTIAL_L64B  = 5'h08,
           PARTIAL_H64B  = 5'h10;


//---- command type decoding ----
 wire cpl_o = &dma_cmd_be[127:64];  // complete valid 64B , odd half (higher half) 
 wire cpl_e = &dma_cmd_be[063:00];  // complete valid 64B , even half (lower half)
 wire nul_o = ~|dma_cmd_be[127:64]; // odd half all zero
 wire nul_e = ~|dma_cmd_be[063:00]; // even half all zero
 wire prt_o = ~cpl_o && ~nul_o;     // partial valid 64B, odd half
 wire prt_e = ~cpl_e && ~nul_e;     // partial valid 64B, even half

//---- enable bypass mode whenever a complete 64B is available ----
 wire bypass_mode = dma_cmd_valid && (cpl_o || cpl_e);

//---- partial mode is activated whenever a partial 64B is detected ----
 wire partial_mode = dma_cmd_valid && (prt_o || prt_e);

//---- toggle down ready when credit is deficient or partial command transmission is taking place or partial FIFO is half full ----
 assign dma_cmd_ready = tlx_cmd_rdy && (prt_cstate == IDLE) && ~fifo_prt_info_count[4];

//---- output command when 1) bypass mode for 128B/64B: immediate; 2) partial mode: until partial sequencing's ready ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     tlx_cmd_valid <= 1'b0;
   else 
     tlx_cmd_valid <= bypass_mode || partial_valid;

//---- multiplexer for command outputs ----
// AFUTAG constitution
//     __________________________________
//    ||f|e|d|c b a|9|8|7 6|5 4 3 2 1 0||
//    -----------------------------------
//      ^ ^ \___ ___/ ^ \/ |<- tag  ->|
//      | |     V     | |
//      | |     |     | |__ for 128B: 11; for a 64B or partial command, 01: lower 64B, 10: higher 64B
//      | |     |     |____ partial done for a single 64B
//      | |     |__________ counter for partial command associated with a single 64B
//      | |________________ 0: normal command, 1: partial command
//      |__________________ 0: write, 1: read

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     begin
       tlx_cdata_bus     <= 1024'd0;
       tlx_cmd_ea_or_obj <= 68'd0;        
       tlx_cmd_dl        <= 2'b10;
       tlx_cmd_pl        <= 3'b000;
       tlx_cmd_opcode    <= 8'd0;
       tlx_cmd_afutag    <= 16'd0;
     end
   // non-partial command: 128B or 64B
   else if(bypass_mode)
     case({cpl_o,cpl_e})
       2'b11 : // 128B command
              begin
                tlx_cdata_bus     <= dma_cmd_data;
                tlx_cmd_ea_or_obj <= {4'd0, dma_cmd_ea};        
                tlx_cmd_dl        <= 2'b10;
                tlx_cmd_pl        <= 3'b000;
                tlx_cmd_opcode    <= (MODE)? AFU_TLX_CMD_OPCODE_RD_WNITC : AFU_TLX_CMD_OPCODE_DMA_W;
                tlx_cmd_afutag    <= {MODE, 6'b0, {cpl_o,cpl_e}, dma_cmd_tag};
              end
       2'b01 : // low 64B command
              begin
                tlx_cdata_bus     <= dma_cmd_data;
                tlx_cmd_ea_or_obj <= {4'd0, dma_cmd_ea[63:7],1'b0,6'b0};        
                tlx_cmd_dl        <= 2'b01;
                tlx_cmd_pl        <= 3'b000;
                tlx_cmd_opcode    <= (MODE)? AFU_TLX_CMD_OPCODE_RD_WNITC : AFU_TLX_CMD_OPCODE_DMA_W;
                tlx_cmd_afutag    <= {MODE, 6'b0, {cpl_o,cpl_e}, dma_cmd_tag};
              end
       2'b10 : // high 64B command
              begin
                tlx_cdata_bus     <= {dma_cmd_data[511:0], dma_cmd_data[1023:512]};  // move valid data in lower 64B
                tlx_cmd_ea_or_obj <= {4'd0, dma_cmd_ea[63:7],1'b1,6'b0};        
                tlx_cmd_dl        <= 2'b01;
                tlx_cmd_pl        <= 3'b000;
                tlx_cmd_opcode    <= (MODE)? AFU_TLX_CMD_OPCODE_RD_WNITC : AFU_TLX_CMD_OPCODE_DMA_W;
                tlx_cmd_afutag    <= {MODE, 6'b0, {cpl_o,cpl_e}, dma_cmd_tag};
              end
       default:;
     endcase
   // partial command
   else
              begin
                tlx_cdata_bus     <= {512'd0, partial_data};
                tlx_cmd_ea_or_obj <= {4'b0, partial_ea_128B, prt_h, partial_ea_32B};        
                tlx_cmd_dl        <= 2'b01;
                tlx_cmd_pl        <= partial_len;
                tlx_cmd_opcode    <= (MODE)? AFU_TLX_CMD_OPCODE_PR_RD_WNITC : AFU_TLX_CMD_OPCODE_DMA_PR_W;
                tlx_cmd_afutag    <= {MODE, 1'b1, partial_cnt, {prt_h,prt_l}, partial_tag};
              end
     
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     begin
       tlx_cmd_pasid <= 20'd0;
       tlx_cmd_actag <= 12'd0; 
     end
   else if(bypass_mode)
     begin
       tlx_cmd_pasid <= ((cfg_pasid_base & cfg_pasid_mask) | ({{(20-`CTXW){1'd0}}, dma_cmd_ctx} & ~cfg_pasid_mask));
       tlx_cmd_actag <= cfg_actag_base + {{(12-`CTXW){1'd0}},dma_cmd_ctx}; 
     end
   else
     begin
       tlx_cmd_pasid <= ((cfg_pasid_base & cfg_pasid_mask) | ({{(20-`CTXW){1'd0}}, partial_ctx} & ~cfg_pasid_mask));
       tlx_cmd_actag <= cfg_actag_base + {{(12-`CTXW){1'd0}},partial_ctx}; 
     end


//=====================================================================================================================================
//
// Partial command handling 
//   Partial commands attached to a single slot take time. So partial mode information has to be buffered first to cope with the 
//   situation when a bunch of partial command requests flood in within a short period of time. 
//               ____
//  tlx_cmd_* <=| M |<============================================ dma_cmd_*
//              | U |   ___________________    ____________   ||
//              | X |<=| partial_sequencer |<=| fifo_prt_* |<==
//              ----   --------------------    ------------
//
//=====================================================================================================================================

//---- fill in partial information and data in FIFO when non-all-1s be is received ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     begin
       fifo_prt_info_wr_en <= 1'b0;
       fifo_prt_data_wr_en <= 1'b0;
       fifo_prt_info_din   <= 203'd0;
       fifo_prt_data_din   <= 1024'd0;
     end
   else 
     begin
       fifo_prt_info_wr_en <= partial_mode;
       fifo_prt_data_wr_en <= partial_mode;
       fifo_prt_info_din   <= {dma_cmd_ctx, prt_o, prt_e, dma_cmd_tag, dma_cmd_ea[63:7], dma_cmd_be}; //9+1+1+7+57+128=203
       fifo_prt_data_din   <= dma_cmd_data;
     end

//---- FIFO for partial info ----
 fifo_sync #(
             .DATA_WIDTH (203),
             .ADDR_WIDTH (5), 
             .DISTR(1)
             ) mfifo_prt_info (
                               .clk         (clk                ), // input clk
                               .rst_n       (rst_n              ), // input rst
                               .din         (fifo_prt_info_din  ), // input [202 : 0] din
                               .wr_en       (fifo_prt_info_wr_en), // input wr_en
                               .rd_en       (fifo_prt_info_rd_en), // input rd_en
                               .dout        (fifo_prt_info_dout ), // output [202 : 0] dout
                               .empty       (fifo_prt_info_empty), // output empty
                               .count       (fifo_prt_info_count), // output [4 : 0] count
                               .valid       (fifo_prt_info_dv   ), // output           valid
                               .overflow    (fifo_prt_info_ovfl )  // output overflow
                               );

//---- FIFO for partial data ----
 fifo_sync #(
             .DATA_WIDTH (1024),
             .ADDR_WIDTH (5), 
             .DISTR(1)
             ) mfifo_prt_data (
                               .clk         (clk                ), // input clk
                               .rst_n       (rst_n              ), // input rst
                               .din         (fifo_prt_data_din  ), // input [1024 : 0] din
                               .wr_en       (fifo_prt_data_wr_en), // input wr_en
                               .rd_en       (fifo_prt_data_rd_en), // input rd_en
                               .dout        (fifo_prt_data_dout ), // output [1024 : 0] dout
                               .overflow    (fifo_prt_data_ovfl )  // output overflow
                               );

//---- read out infor and data when the last batch of partial commands have all been sent to TLX ----
 assign fifo_prt_info_rd_en = (prt_cstate == RD_PRT_FIFO);
 assign fifo_prt_data_rd_en = (prt_cstate == RD_PRT_FIFO);

//---- infor for partial command on higher or lower 64B ----
 assign partial_l  =  fifo_prt_info_dout[192];
 assign partial_h  =  fifo_prt_info_dout[193];

//---- delay FIFO out data once for the 2nd 64B partial command ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     begin
       fifo_prt_info_dout_sync   <= 203'd0;
       fifo_prt_data_dout_h_sync <= 512'd0;
     end
   else if(fifo_prt_info_dv)
     begin
       fifo_prt_info_dout_sync   <= fifo_prt_info_dout;
       fifo_prt_data_dout_h_sync <= fifo_prt_data_dout[1023:512];
     end

//---- latch information for partial seqencer ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     begin
       partial_tag     <= {`TAGW{1'b1}};
       partial_ea_128B <= 57'd0;
       partial_2nd     <= 1'b0;
       partial_ctx     <= {`CTXW{1'b0}};
     end
   else if(prt_cstate == CHECK_PARTIAL)
     begin
       partial_tag     <= fifo_prt_info_dout[191:185];
       partial_ea_128B <= fifo_prt_info_dout[184:128];
       partial_2nd     <= fifo_prt_info_dout[193];
       partial_ctx     <= fifo_prt_info_dout[202:194];
     end

//---- adjust data position ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     partial_data <= 512'd0;
   else if(prt_cstate == CHECK_PARTIAL)
     casez({partial_h, partial_l})
       2'b?1 : partial_data <= fifo_prt_data_dout[0511:000];
       2'b10 : partial_data <= fifo_prt_data_dout[1023:512];
     endcase
   else if(partial_done)
     partial_data <= fifo_prt_data_dout_h_sync;
       

//---- input strobe to partial sequencer ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     strobe_valid <= 1'b0;
   else
     strobe_valid <= (prt_cstate == CHECK_PARTIAL) || ((prt_cstate == PARTIAL_L64B) && partial_next_pending && prt_cmd_enable);

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     strobe <= 64'd0;
   else if(prt_cstate == CHECK_PARTIAL)
     casez({partial_h, partial_l})
       2'b?1 : strobe <= fifo_prt_info_dout[063:00];
       2'b10 : strobe <= fifo_prt_info_dout[127:64];
     endcase
   else if(partial_done)
     strobe <= fifo_prt_info_dout_sync[127:64];


//---- enable partial sequencer to work when 1) command credit sufficient; 2) not full command transmission is ongoing ----
 assign partial_enable = tlx_cmd_rdy && ~bypass_mode;

//---- next partial 64B pending ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     partial_next_pending <= 1'b0;
   else if((prt_cstate == PARTIAL_L64B) && partial_2nd && partial_done)
     partial_next_pending <= 1'b1;
   else if(prt_cmd_enable)
     partial_next_pending <= 1'b0;

//---- partial command sequencing submodule ----
 brdg_partial_sequencer mpartial_sequencer (
                                       .clk              (clk           ),
                                       .rst_n            (rst_n         ),
                                       .partial_en       (partial_enable),
                                       .strobe           (strobe        ),
                                       .strobe_valid     (strobe_valid  ),
                                       .partial_len      (partial_len   ),
                                       .partial_ea       (partial_ea_32B),
                                       .partial_cnt      (partial_cnt   ),
                                       .partial_valid    (partial_valid ),
                                       .partial_done     (partial_done  )  
                                       );


//---- output to response decoder ----
 assign prt_cmd_valid = partial_valid;
 assign prt_cmd_last  = partial_done;

//---- indicator of strobe signal starting to decompose ----
 assign prt_cmd_start = strobe_valid;

//---- statemachine for partial command handling ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     prt_cstate <= IDLE;
   else
     prt_cstate <= prt_nstate;

 always@*
   case(prt_cstate)
     IDLE               : 
                          if(~fifo_prt_info_empty && prt_cmd_enable)
                            prt_nstate = RD_PRT_FIFO;
                          else
                            prt_nstate = IDLE;
     RD_PRT_FIFO       :
                          prt_nstate = CHECK_PARTIAL;
     CHECK_PARTIAL      : 
                          if(partial_l)
                            prt_nstate = PARTIAL_L64B;
                          else if(partial_h)
                            prt_nstate = PARTIAL_H64B;
                          else
                            prt_nstate = CHECK_PARTIAL;
     PARTIAL_L64B      : 
                          if(partial_done && ~partial_2nd)
                            begin
                              if(~fifo_prt_info_empty && prt_cmd_enable)
                                prt_nstate = RD_PRT_FIFO;
                              else
                                prt_nstate = IDLE;
                            end
                          else if(partial_next_pending && prt_cmd_enable)
                            prt_nstate = PARTIAL_H64B;
                          else
                            prt_nstate = PARTIAL_L64B;
     PARTIAL_H64B      : 
                          if(partial_done)
                            begin
                              if(~fifo_prt_info_empty && prt_cmd_enable)
                                prt_nstate = RD_PRT_FIFO;
                              else
                                prt_nstate = IDLE;
                            end
                          else
                            prt_nstate = PARTIAL_H64B;
     default           :
                            prt_nstate = IDLE;
   endcase

//---- current 64B position for partial command ---- 
 assign prt_h = (prt_cstate==PARTIAL_H64B);
 assign prt_l = (prt_cstate==PARTIAL_L64B);

 wire prt_cstate_h01_h02 = ((prt_cstate == IDLE)          && (prt_nstate == RD_PRT_FIFO));
 wire prt_cstate_h04_h08 = ((prt_cstate == CHECK_PARTIAL) && (prt_nstate == PARTIAL_L64B));
 wire prt_cstate_h04_h10 = ((prt_cstate == CHECK_PARTIAL) && (prt_nstate == PARTIAL_H64B));
 wire prt_cstate_h08_h01 = ((prt_cstate == PARTIAL_L64B)  && (prt_nstate == IDLE));
 wire prt_cstate_h08_h10 = ((prt_cstate == PARTIAL_L64B)  && (prt_nstate == PARTIAL_H64B));
 wire prt_cstate_h08_h02 = ((prt_cstate == PARTIAL_L64B)  && (prt_nstate == RD_PRT_FIFO));
 wire prt_cstate_h10_h01 = ((prt_cstate == PARTIAL_H64B)  && (prt_nstate == IDLE));
 wire prt_cstate_h10_h02 = ((prt_cstate == PARTIAL_H64B)  && (prt_nstate == RD_PRT_FIFO));
 


//=================================================================================================================
// STATUS output for SNAP registers
//=================================================================================================================

//---- DEBUG registers ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     begin
       debug_tlx_cnt_cmd <= 32'd0;
     end
   else if (debug_cnt_clear)
     begin
       debug_tlx_cnt_cmd <= 32'd0;
     end
   else if (tlx_cmd_valid)
     begin
       debug_tlx_cnt_cmd <= debug_tlx_cnt_cmd + 32'd1;
     end

//---- FAULT ISOLATION REGISTER ----
 reg fir_fifo_prt_data_overflow;
 reg fir_fifo_prt_info_overflow;

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     begin
       fir_fifo_prt_data_overflow <= 1'b0; 
       fir_fifo_prt_info_overflow <= 1'b0; 

       fir_fifo_overflow <= 2'b0;
     end
   else
     begin
       if (fifo_prt_data_ovfl) fir_fifo_prt_data_overflow <= 1'b1; 
       if (fifo_prt_info_ovfl) fir_fifo_prt_info_overflow <= 1'b1; 

       fir_fifo_overflow <= {fir_fifo_prt_data_overflow, fir_fifo_prt_info_overflow};
     end


 // psl default clock = (posedge clk);

//==== PSL ASSERTION ==============================================================================
 // psl STROBE_VALID_SINGLE_PULSE : assert always (strobe_valid -> next(~strobe_valid)) report "strobe_valid not a single cycle pulse!";
 
 // psl TLX_COMMAND_PARTIAL_FULL_CONFLICT : assert never (partial_valid && bypass_mode) report "partial and full command conflict! Each time either partial or full command is allowed to send to TLX.";
//==== PSL ASSERTION ==============================================================================

//==== PSL COVERAGE ==============================================================================
 // psl DMA_CMD_HC_LC : cover {(dma_cmd_valid && (cpl_o && cpl_e))};
 // psl DMA_CMD_HC_LP : cover {(dma_cmd_valid && (cpl_o && prt_e))};
 // psl DMA_CMD_HP_LC : cover {(dma_cmd_valid && (prt_o && cpl_e))};
 // psl DMA_CMD_HP_LP : cover {(dma_cmd_valid && (prt_o && prt_e))};
 // psl DMA_CMD_HC_LN : cover {(dma_cmd_valid && (cpl_o && nul_e))};
 // psl DMA_CMD_HN_LC : cover {(dma_cmd_valid && (nul_o && cpl_e))};
 // psl DMA_CMD_HP_LN : cover {(dma_cmd_valid && (prt_o && nul_e))};
 // psl DMA_CMD_HN_LP : cover {(dma_cmd_valid && (nul_o && prt_e))};
 // psl DMA_CMD_HN_LN : cover {(dma_cmd_valid && (nul_o && nul_e))};
 
 // psl PRT_CSTATE_H01_H02 : cover {(prt_cstate_h01_h02)};
 // psl PRT_CSTATE_H04_H08 : cover {(prt_cstate_h04_h08)};
 // psl PRT_CSTATE_H04_H10 : cover {(prt_cstate_h04_h10)};
 // psl PRT_CSTATE_H08_H01 : cover {(prt_cstate_h08_h01)};
 // psl PRT_CSTATE_H08_H10 : cover {(prt_cstate_h08_h10)};
 // psl PRT_CSTATE_H08_H02 : cover {(prt_cstate_h08_h02)};
 // psl PRT_CSTATE_H10_H01 : cover {(prt_cstate_h10_h01)};
 // psl PRT_CSTATE_H10_H02 : cover {(prt_cstate_h10_h02)};

 // psl TLX_CMD_AC : cover {(tlx_cmd_valid && (tlx_cmd_opcode == AFU_TLX_CMD_OPCODE_ASSIGN_ACTAG))};
 // psl TLX_CMD_RD : cover {(tlx_cmd_valid && (tlx_cmd_opcode == AFU_TLX_CMD_OPCODE_RD_WNITC    ))};
 // psl TLX_CMD_RP : cover {(tlx_cmd_valid && (tlx_cmd_opcode == AFU_TLX_CMD_OPCODE_PR_RD_WNITC ))};
 // psl TLX_CMD_WR : cover {(tlx_cmd_valid && (tlx_cmd_opcode == AFU_TLX_CMD_OPCODE_DMA_W       ))};
 // psl TLX_CMD_WP : cover {(tlx_cmd_valid && (tlx_cmd_opcode == AFU_TLX_CMD_OPCODE_DMA_PR_W    ))};
 // psl TLX_CMD_IN : cover {(tlx_cmd_valid && (tlx_cmd_opcode == AFU_TLX_CMD_OPCODE_INTRP_REQ   ))};
 
 // psl PRT_FIFO_ALMOST_FULL : cover {fifo_prt_info_count[4]};
//==== PSL COVERAGE ==============================================================================


endmodule
