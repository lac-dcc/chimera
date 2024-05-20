// This program was cloned from: https://github.com/PaperL/FPGA-Sketch
// License: Apache License 2.0

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

module nf_endianess_manager
#(
        parameter       C_S_AXIS_TDATA_WIDTH = 512,
        parameter       C_M_AXIS_TDATA_WIDTH = 512,
        parameter       C_M_AXIS_TUSER_WIDTH = 128,
        parameter       C_S_AXIS_TUSER_WIDTH = 128
)
(
	input                                         ACLK,
	input                                         ARESETN,

	output     [(C_M_AXIS_TDATA_WIDTH/8)-1:0]     M_AXIS_TKEEP,
	output     [C_M_AXIS_TUSER_WIDTH-1:0]         M_AXIS_TUSER,
	input      [(C_S_AXIS_TDATA_WIDTH/8)-1:0]     S_AXIS_TKEEP,
	input      [C_S_AXIS_TUSER_WIDTH-1:0]         S_AXIS_TUSER,
	
        output                                        S_AXIS_TREADY,
	input      [C_S_AXIS_TDATA_WIDTH-1:0]         S_AXIS_TDATA,
	input                                         S_AXIS_TLAST,
	input                                         S_AXIS_TVALID,

	output                                        M_AXIS_TVALID,
	output     [C_M_AXIS_TDATA_WIDTH-1:0]         M_AXIS_TDATA,
	output                                        M_AXIS_TLAST,
	input                                         M_AXIS_TREADY,

	output     [(C_M_AXIS_TDATA_WIDTH/8)-1:0]     M_AXIS_INT_TKEEP,
	output     [C_M_AXIS_TUSER_WIDTH-1:0]         M_AXIS_INT_TUSER,
	input      [(C_S_AXIS_TDATA_WIDTH/8)-1:0]     S_AXIS_INT_TKEEP,
	input      [C_S_AXIS_TUSER_WIDTH-1:0]         S_AXIS_INT_TUSER,

	output                                        S_AXIS_INT_TREADY,
	input      [C_S_AXIS_TDATA_WIDTH-1:0]         S_AXIS_INT_TDATA,
	input                                         S_AXIS_INT_TLAST,
	input                                         S_AXIS_INT_TVALID,

	output                                        M_AXIS_INT_TVALID,
	output     [C_M_AXIS_TDATA_WIDTH-1:0]         M_AXIS_INT_TDATA,
	output                                        M_AXIS_INT_TLAST,
	input                                         M_AXIS_INT_TREADY
);

  /* ------------------------------------------
   *  little endian ---> big endian 
   *  ----------------------------------------- */

  bridge
  #(
     .C_AXIS_DATA_WIDTH (C_M_AXIS_TDATA_WIDTH),
     .C_AXIS_TUSER_WIDTH (C_M_AXIS_TUSER_WIDTH)
   ) le_be_bridge
   (
   // Global Ports
        .clk(ACLK),
        .reset(~ARESETN),
   // little endian signals
        .s_axis_tready(S_AXIS_TREADY),
        .s_axis_tdata(S_AXIS_TDATA),
        .s_axis_tlast(S_AXIS_TLAST),
        .s_axis_tvalid(S_AXIS_TVALID),
        .s_axis_tuser(S_AXIS_TUSER),
        .s_axis_tkeep(S_AXIS_TKEEP),
   // big endian signals
        .m_axis_tready(M_AXIS_INT_TREADY),
        .m_axis_tdata(M_AXIS_INT_TDATA),
        .m_axis_tlast(M_AXIS_INT_TLAST),
        .m_axis_tvalid(M_AXIS_INT_TVALID),
        .m_axis_tuser(M_AXIS_INT_TUSER),
        .m_axis_tkeep(M_AXIS_INT_TKEEP)
   );


  /* ------------------------------------------
   *  big endian ---> little endian 
   *  ----------------------------------------- */

  bridge
  #(
    .C_AXIS_DATA_WIDTH (C_S_AXIS_TDATA_WIDTH),
    .C_AXIS_TUSER_WIDTH (C_S_AXIS_TUSER_WIDTH)
  ) be_le_bridge
   (
     // Global Ports
        .clk(ACLK),
        .reset(~ARESETN),
     // big endian signals
        .s_axis_tready(S_AXIS_INT_TREADY),
        .s_axis_tdata(S_AXIS_INT_TDATA),
        .s_axis_tlast(S_AXIS_INT_TLAST),
        .s_axis_tvalid(S_AXIS_INT_TVALID),
        .s_axis_tuser(S_AXIS_INT_TUSER),
        .s_axis_tkeep(S_AXIS_INT_TKEEP),
     // little endian signals
        .m_axis_tready(M_AXIS_TREADY),
        .m_axis_tdata(M_AXIS_TDATA),
        .m_axis_tlast(M_AXIS_TLAST),
        .m_axis_tvalid(M_AXIS_TVALID),
        .m_axis_tuser(M_AXIS_TUSER),
        .m_axis_tkeep(M_AXIS_TKEEP)
    );

endmodule
