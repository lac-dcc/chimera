//-
// Copyright (C) 2010, 2011 The Board of Trustees of The Leland Stanford
//                          Junior University
// Copyright (C) 2018 Noa Zilberman
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
/*******************************************************************************
 *
 *  File:
 *        nf_axis_converter.v
 *
 *  Module:
 *        nf_axis_converter
 *
 *  Author:
 *        Stephen Ibanez
 *
 *  Description:
 *        Convert AXI4-Streams to different data width
 *        Add LEN subchannel.
 *        NOTE: This is just a wrapper module to add a pipeline stage after the
 *        main conversion logic to help with timing.
 *
 */

//Need to add support for err bit (1 bit tuser) 
module nf_axis_converter
#(
    // Master AXI Stream Data Width
    parameter C_M_AXIS_DATA_WIDTH=512,
    parameter C_S_AXIS_DATA_WIDTH=512,

    parameter C_M_AXIS_TUSER_WIDTH=128,
    parameter C_S_AXIS_TUSER_WIDTH=128,

    parameter C_LEN_WIDTH=16,
    parameter C_SPT_WIDTH=8,
    parameter C_DPT_WIDTH=8,

    parameter C_DEFAULT_VALUE_ENABLE=0,
    parameter C_DEFAULT_SRC_PORT=0,
    parameter C_DEFAULT_DST_PORT=0
)
(
    // Part 1: System side signals
    // Global Ports
    input axi_aclk,
    input axi_resetn,
    
    input [7:0] interface_number,
	input       interface_number_en,

    // Master Stream Ports
    output [C_M_AXIS_DATA_WIDTH - 1:0] m_axis_tdata,
    output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_tkeep,
    output [C_M_AXIS_TUSER_WIDTH-1:0] m_axis_tuser,
    output m_axis_tvalid,
    input  m_axis_tready,
    output m_axis_tlast,

    // Slave Stream Ports
    input [C_S_AXIS_DATA_WIDTH - 1:0] s_axis_tdata,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0] s_axis_tkeep,
    input [C_S_AXIS_TUSER_WIDTH-1:0] s_axis_tuser,
    input  s_axis_tvalid,
    output s_axis_tready,
    input  s_axis_tlast
);

  wire [C_M_AXIS_DATA_WIDTH-1:0]        m_axis_nfconv_tdata;
  wire [(C_M_AXIS_DATA_WIDTH/8)-1:0]    m_axis_nfconv_tkeep;
  wire [C_M_AXIS_TUSER_WIDTH-1:0]       m_axis_nfconv_tuser;
  wire                                  m_axis_nfconv_tvalid;
  wire                                  m_axis_nfconv_tready;
  wire                                  m_axis_nfconv_tlast;

  nf_axis_converter_main
  #(
   .C_M_AXIS_DATA_WIDTH    (C_M_AXIS_DATA_WIDTH),
   .C_S_AXIS_DATA_WIDTH    (C_S_AXIS_DATA_WIDTH),
   .C_M_AXIS_TUSER_WIDTH   (C_M_AXIS_TUSER_WIDTH),
   .C_S_AXIS_TUSER_WIDTH   (C_S_AXIS_TUSER_WIDTH),
   .C_LEN_WIDTH            (C_LEN_WIDTH),
   .C_SPT_WIDTH            (C_SPT_WIDTH),
   .C_DPT_WIDTH            (C_DPT_WIDTH),
   .C_DEFAULT_VALUE_ENABLE (C_DEFAULT_VALUE_ENABLE),
   .C_DEFAULT_SRC_PORT     (C_DEFAULT_SRC_PORT),
   .C_DEFAULT_DST_PORT     (C_DEFAULT_DST_PORT)
  ) nf_converter (
   .axi_aclk                             (axi_aclk),
   .axi_resetn                           (axi_resetn),
   .interface_number                     (interface_number),
   .interface_number_en                  (interface_number_en),
   // Slave Ports 
   .s_axis_tdata                         (s_axis_tdata),
   .s_axis_tkeep                         (s_axis_tkeep),
   .s_axis_tvalid                        (s_axis_tvalid),
   .s_axis_tready                        (s_axis_tready),
   .s_axis_tlast                         (s_axis_tlast),
   .s_axis_tuser                         (s_axis_tuser),
   // Master Ports
   .m_axis_tdata                         (m_axis_nfconv_tdata),
   .m_axis_tkeep                         (m_axis_nfconv_tkeep),
   .m_axis_tvalid                        (m_axis_nfconv_tvalid),
   .m_axis_tready                        (m_axis_nfconv_tready),
   .m_axis_tlast                         (m_axis_nfconv_tlast),
   .m_axis_tuser                         (m_axis_nfconv_tuser)
  );

  /* Output FIFO for nf_axis_converter to help with timing */
  axis_fifo
  #(
   .C_AXIS_DATA_WIDTH    (C_M_AXIS_DATA_WIDTH),
   .C_AXIS_TUSER_WIDTH   (C_M_AXIS_TUSER_WIDTH)
  )
  axis_fifo_inst
  (
      .axis_aclk     (axi_aclk),
      .axis_resetn   (axi_resetn),
      // master ports
      .m_axis_tdata  (m_axis_tdata),
      .m_axis_tkeep  (m_axis_tkeep),
      .m_axis_tuser  (m_axis_tuser),
      .m_axis_tvalid (m_axis_tvalid),
      .m_axis_tready (m_axis_tready),
      .m_axis_tlast  (m_axis_tlast),
      // slave ports
      .s_axis_tdata  (m_axis_nfconv_tdata),
      .s_axis_tkeep  (m_axis_nfconv_tkeep),
      .s_axis_tuser  (m_axis_nfconv_tuser),
      .s_axis_tvalid (m_axis_nfconv_tvalid),
      .s_axis_tready (m_axis_nfconv_tready),
      .s_axis_tlast  (m_axis_nfconv_tlast)
  );

endmodule
