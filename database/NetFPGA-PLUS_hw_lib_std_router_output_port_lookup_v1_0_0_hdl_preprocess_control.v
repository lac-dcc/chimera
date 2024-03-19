/*******************************************************************************
*
* Copyright (C) 2010, 2011 The Board of Trustees of The Leland Stanford
*                          Junior University
* Copyright (C) grg, Gianni Antichi
* Copyright (C) 2021 Yuta Tokusashi
* All rights reserved.
*
* This software was developed by
* Stanford University and the University of Cambridge Computer Laboratory
* under National Science Foundation under Grant No. CNS-0855268,
* the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
* by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
* as part of the DARPA MRC research programme,
* and by the University of Cambridge Computer Laboratory under EPSRC EARL Project
* EP/P025374/1 alongside support from Xilinx Inc.
*
* @NETFPGA_LICENSE_HEADER_START@
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*  http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*
* @NETFPGA_LICENSE_HEADER_END@
*
*******************************************************************************/


  module preprocess_control #(
     parameter C_S_AXIS_DATA_WIDTH=256
  ) (// --- Interface to the previous stage

    input [C_S_AXIS_DATA_WIDTH-1:0]    tdata,
    input                              valid,
    input                              tlast,

	output                             ready,

    // --- Interface to other preprocess blocks
    output reg                         word_IP_DST_HI,
    output reg                         word_IP_DST_LO,

    // --- Misc

    input                              reset,
    input                              clk
   );

   function integer log2;
      input integer number;
      begin
         log2=0;
         while(2**log2<number) begin
            log2=log2+1;
         end
      end
   endfunction // log2

   //------------------ Internal Parameter ---------------------------

   localparam WORD_1           = 1;
   localparam WORD_2           = 2;
   localparam STOP_0           = 2;
   localparam STOP_1           = 4;
   localparam WAIT_EOP         = 8;

   //---------------------- Wires/Regs -------------------------------
   reg [3:0]                            state, state_next;

   //------------------------ Logic ----------------------------------
   generate 
      if (C_S_AXIS_DATA_WIDTH == 256) begin
   always @(*) begin
      state_next = state;
      word_IP_DST_HI = 0;
      word_IP_DST_LO = 0;

      case(state)
        WORD_1: begin
           if(valid) begin
              word_IP_DST_HI = 1;
              state_next     = WORD_2;
           end
        end

        WORD_2: begin
           if(valid) begin
              word_IP_DST_LO = 1;
              if(tlast)
                 state_next = WORD_1;
              else
                 state_next = WAIT_EOP;
           end
        end

        WAIT_EOP: begin
           if(valid && tlast) begin
              state_next = WORD_1;
           end
        end
        default: state_next = WORD_1;
      endcase // case(state)
   end // always @ (*)
   end // generate : C_S_AXIS_DATA_WIDTH == 256
       else if (C_S_AXIS_DATA_WIDTH >= 512 ) begin
   always @(*) begin
      state_next = state;
      word_IP_DST_HI = 0;
      word_IP_DST_LO = 0;

      case(state)
        WORD_1: begin
           if(valid) begin
              word_IP_DST_HI = 1;
              word_IP_DST_LO = 1;
              if (tlast)
              state_next = STOP_0;
              else
              state_next = WAIT_EOP;
           end
        end

        STOP_0: begin
           state_next = STOP_1;
        end

        STOP_1: begin
           state_next = WORD_1;
        end

        WAIT_EOP: begin
           if(valid && tlast) begin
              state_next = STOP_0;
           end
        end
        default: state_next = WORD_1;
      endcase // case(state)
   end // always @ (*)
   end
   endgenerate

   assign ready = (state != STOP_0) && (state != STOP_1);

   always@(posedge clk) begin
      if(reset) begin
         state <= WORD_1;
      end
      else begin
         state <= state_next;
      end
   end

endmodule // op_lut_hdr_parser
