//
// Copyright (C) 2010, 2011 The Board of Trustees of The Leland Stanford
//                          Junior University
// Copyright (C) 2015 Gianni Antichi
// All rights reserved.
//
// This software was developed by
// Stanford University and the University of Cambridge Computer Laboratory
// under National Science Foundation under Grant No. CNS-0855268,
// the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
// by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
// as part of the DARPA MRC research programme.
//
// @NETFPGA_LICENSE_HEADER_START@
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// @NETFPGA_LICENSE_HEADER_END@
//

module bridge
#(
    parameter C_AXIS_DATA_WIDTH = 256,
    parameter C_AXIS_TUSER_WIDTH = 128,
    parameter NUM_QUEUES = 8,
    parameter NUM_QUEUES_WIDTH = log2(NUM_QUEUES)
)
(
    // Global Ports
    input clk,
    input reset,

    // little endian signals
    input [C_AXIS_DATA_WIDTH-1:0] s_axis_tdata,
    input [(C_AXIS_DATA_WIDTH/8)-1:0] s_axis_tkeep,
    input [C_AXIS_TUSER_WIDTH-1:0] s_axis_tuser,
    input  s_axis_tvalid,
    output reg s_axis_tready,
    input  s_axis_tlast,

    // big endian signals
    output reg [C_AXIS_DATA_WIDTH-1:0] m_axis_tdata,
    output reg[(C_AXIS_DATA_WIDTH/8)-1:0] m_axis_tkeep,
    output reg [C_AXIS_TUSER_WIDTH-1:0] m_axis_tuser,
    output reg  m_axis_tvalid,
    input m_axis_tready,
    output reg  m_axis_tlast

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

    genvar i;

  /* Generate control signals */
  
  always @(*) begin
    if (reset) begin
      m_axis_tuser = {C_AXIS_TUSER_WIDTH{1'b0}};
      m_axis_tvalid = 0;
      m_axis_tlast = 0;
      s_axis_tready = 0;
    end
    else begin
      m_axis_tuser = s_axis_tuser;
      m_axis_tvalid = s_axis_tvalid;
      m_axis_tlast = s_axis_tlast;
      s_axis_tready = m_axis_tready;
    end
  end

 generate
  for (i=0; i<(C_AXIS_DATA_WIDTH/8); i=i+1) begin: conversion
    always @(*) begin
     if (reset) begin
        m_axis_tdata[(i+1)*8-1:i*8] = 0;
        m_axis_tkeep[i] = 0;
      end
else begin
m_axis_tdata[(i+1)*8-1:i*8] = s_axis_tdata[((C_AXIS_DATA_WIDTH/8)-i)*8-1:((C_AXIS_DATA_WIDTH/8)-(i+1))*8];
        m_axis_tkeep[i] = s_axis_tkeep[(C_AXIS_DATA_WIDTH/8)-i-1];
end
    end
  end
  endgenerate

endmodule
