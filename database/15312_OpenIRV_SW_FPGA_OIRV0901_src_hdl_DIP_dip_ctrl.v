// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: dip_ctrl.v
 *  Purpose:  DIP (Digital Image Processing) module.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020-2021, Vaagn Oganesyan <ovgn@protonmail.com>
 *  
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  
 *      http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 * ----------------------------------------------------------------------------
 */


`default_nettype none
`timescale 1ps / 1ps


module dip_ctrl #
(
    parameter   integer C_S_AXI_ADDR_WIDTH = 8
)
(
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *)
    input   wire            axi_aresetn,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLKIF, ASSOCIATED_BUSIF S_AXI_LITE:S_AXIS_RAW:S_AXIS_EQUAL:S_AXIS_EQUAL_X2:M_AXIS_GAIN:M_AXIS_OFST:M_AXIS_AVGI:S_AXIS_AVGO:S_AXIS_MM2S:M_AXIS_S2MM:M_AXIS_MM2S_CMD:S_AXIS_MM2S_STS:M_AXIS_S2MM_CMD:S_AXIS_S2MM_STS, ASSOCIATED_RESET axi_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLKIF CLK" *)
    input   wire            axi_aclk,
    
    input   wire            sof_strb,
    input   wire            eol_strb,
    
    output  wire    [2:0]   avg_level,
    output  wire            nuc_bypass,
    output  wire            bpr_bypass,
    
    input   wire            fifo_raw_prog_empty,
    input   wire            fifo_avgo_prog_empty,
    input   wire            fifo_equal_prog_empty,
    input   wire            fifo_equal_x2_prog_empty,
    
    input   wire            fifo_avgi_prog_full,
    input   wire            fifo_gain_prog_full,
    input   wire            fifo_ofst_prog_full,
    
    (* X_INTERFACE_PARAMETER = "MAX_BURST_LENGTH 1, SUPPORTS_NARROW_BURST 0, READ_WRITE_MODE READ_WRITE, BUSER_WIDTH 0, RUSER_WIDTH 0, WUSER_WIDTH 0, ARUSER_WIDTH 0, AWUSER_WIDTH 0, ADDR_WIDTH 8, ID_WIDTH 0, PROTOCOL AXI4LITE, DATA_WIDTH 32, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWADDR"  *)    input   wire    [C_S_AXI_ADDR_WIDTH - 1:0]  s_axi_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWVALID" *)    input   wire                                s_axi_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWREADY" *)    output  reg                                 s_axi_awready   = 1'b0,
    
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WDATA"   *)    input   wire    [31:0]                      s_axi_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WSTRB"   *)    input   wire    [3:0]                       s_axi_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WVALID"  *)    input   wire                                s_axi_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WREADY"  *)    output  reg                                 s_axi_wready    = 1'b0,
    
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE BRESP"   *)    output  reg     [1:0]                       s_axi_bresp     = 2'b00,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE BVALID"  *)    output  reg                                 s_axi_bvalid    = 1'b0,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE BREADY"  *)    input   wire                                s_axi_bready,
    
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARADDR"  *)    input   wire    [C_S_AXI_ADDR_WIDTH - 1:0]  s_axi_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARVALID" *)    input   wire                                s_axi_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARREADY" *)    output  reg                                 s_axi_arready   = 1'b0,
    
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RDATA"   *)    output  reg     [31:0]                      s_axi_rdata = {32{1'b0}},
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RRESP"   *)    output  reg     [1:0]                       s_axi_rresp     = 2'b00,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RVALID"  *)    output  reg                                 s_axi_rvalid    = 1'b0,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RREADY"  *)    input   wire                                s_axi_rready,
    
    /* Slave AXIS sensor raw image row */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_RAW, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RAW TDATA"  *)          input   wire    [31:0]  s_axis_raw_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RAW TVALID" *)          input   wire            s_axis_raw_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RAW TREADY" *)          output  wire            s_axis_raw_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RAW TLAST"  *)          input   wire            s_axis_raw_tlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RAW TUSER"  *)          input   wire            s_axis_raw_tuser,

    /* Slave AXIS equalized image row */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_EQUAL, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_EQUAL TDATA"  *)        input   wire    [31:0]  s_axis_equal_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_EQUAL TVALID" *)        input   wire            s_axis_equal_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_EQUAL TREADY" *)        output  wire            s_axis_equal_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_EQUAL TLAST"  *)        input   wire            s_axis_equal_tlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_EQUAL TUSER"  *)        input   wire            s_axis_equal_tuser,
    
    /* Slave AXIS equalized image row (x2 upscaled) */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_EQUAL_X2, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_EQUAL_X2 TDATA"  *)     input   wire    [31:0]  s_axis_equal_x2_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_EQUAL_X2 TVALID" *)     input   wire            s_axis_equal_x2_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_EQUAL_X2 TREADY" *)     output  wire            s_axis_equal_x2_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_EQUAL_X2 TLAST"  *)     input   wire            s_axis_equal_x2_tlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_EQUAL_X2 TUSER"  *)     input   wire            s_axis_equal_x2_tuser,
    
    /* Master AXIS sensor NUC gain row */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_GAIN, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_GAIN TDATA"  *)         output  wire    [31:0]  m_axis_gain_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_GAIN TVALID" *)         output  wire            m_axis_gain_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_GAIN TREADY" *)         input   wire            m_axis_gain_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_GAIN TLAST"  *)         output  wire            m_axis_gain_tlast,
    
    /* Master AXIS sensor NUC offset row */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_OFST, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_OFST TDATA"  *)         output  wire    [31:0]  m_axis_ofst_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_OFST TVALID" *)         output  wire            m_axis_ofst_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_OFST TREADY" *)         input   wire            m_axis_ofst_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_OFST TLAST"  *)         output  wire            m_axis_ofst_tlast,
    
    /* Master AXIS frame averaging output row */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_AVGI, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_AVGI TDATA"  *)         output  wire    [31:0]  m_axis_avgi_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_AVGI TVALID" *)         output  wire            m_axis_avgi_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_AVGI TREADY" *)         input   wire            m_axis_avgi_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_AVGI TLAST"  *)         output  wire            m_axis_avgi_tlast,
    
    /* Slave AXIS frame averaging input row */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_AVGO, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_AVGO TDATA"  *)         input   wire    [31:0]  s_axis_avgo_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_AVGO TVALID" *)         input   wire            s_axis_avgo_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_AVGO TREADY" *)         output  wire            s_axis_avgo_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_AVGO TLAST"  *)         input   wire            s_axis_avgo_tlast,
    
    /* DataMover MM2S (read from memory) */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_MM2S, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S TDATA"  *)         input   wire    [31:0]  s_axis_mm2s_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S TKEEP"  *)         input   wire    [3:0]   s_axis_mm2s_tkeep,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S TVALID" *)         input   wire            s_axis_mm2s_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S TREADY" *)         output  wire            s_axis_mm2s_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S TLAST"  *)         input   wire            s_axis_mm2s_tlast,
    
    /* DataMover S2MM (write to memory) */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_S2MM, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_S2MM TDATA"  *)         output  reg     [31:0]  m_axis_s2mm_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_S2MM TKEEP"  *)         output  wire    [3:0]   m_axis_s2mm_tkeep,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_S2MM TVALID" *)         output  reg             m_axis_s2mm_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_S2MM TREADY" *)         input   wire            m_axis_s2mm_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_S2MM TLAST"  *)         output  reg             m_axis_s2mm_tlast,
    
    /* DataMover MM2S command interface */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_MM2S_CMD, TDATA_NUM_BYTES 9, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_MM2S_CMD TDATA"  *)     output  reg     [71:0]  m_axis_mm2s_cmd_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_MM2S_CMD TVALID" *)     output  reg             m_axis_mm2s_cmd_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_MM2S_CMD TREADY" *)     input   wire            m_axis_mm2s_cmd_tready,
    
    /* DataMover MM2S status interface */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_MM2S_STS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S_STS TDATA"  *)     input   wire    [7:0]   s_axis_mm2s_sts_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S_STS TKEEP"  *)     input   wire    [0:0]   s_axis_mm2s_sts_tkeep,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S_STS TVALID" *)     input   wire            s_axis_mm2s_sts_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S_STS TREADY" *)     output  reg             s_axis_mm2s_sts_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S_STS TLAST"  *)     input   wire            s_axis_mm2s_sts_tlast,
    
    /* DataMover S2MM command interface */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_S2MM_CMD, TDATA_NUM_BYTES 9, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_S2MM_CMD TDATA"  *)     output  reg     [71:0]  m_axis_s2mm_cmd_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_S2MM_CMD TVALID" *)     output  reg             m_axis_s2mm_cmd_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_S2MM_CMD TREADY" *)     input   wire            m_axis_s2mm_cmd_tready,
    
    /* DataMover S2MM status interface */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_S2MM_STS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_S2MM_STS TDATA"  *)     input   wire    [7:0]   s_axis_s2mm_sts_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_S2MM_STS TKEEP"  *)     input   wire    [0:0]   s_axis_s2mm_sts_tkeep,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_S2MM_STS TVALID" *)     input   wire            s_axis_s2mm_sts_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_S2MM_STS TREADY" *)     output  reg             s_axis_s2mm_sts_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_S2MM_STS TLAST"  *)     input   wire            s_axis_s2mm_sts_tlast
);

/*-------------------------------------------------------------------------------------------------------------------------------------*/

    localparam  AXI_RESP_OKAY   = 2'b00,
                AXI_RESP_EXOKAY = 2'b01,
                AXI_RESP_SLVERR = 2'b10,
                AXI_RESP_DECERR = 2'b11;
    
    integer i;
    
    reg     [C_S_AXI_ADDR_WIDTH - 1:0]  axi_awaddr = {C_S_AXI_ADDR_WIDTH{1'b0}};
    reg     [C_S_AXI_ADDR_WIDTH - 1:0]  axi_araddr = {C_S_AXI_ADDR_WIDTH{1'b0}};
    
    reg     [31:0]  ctrl_reg        = {32{1'b0}};
    wire    [31:0]  stat_reg;
    
    reg     [31:0]  raw_buf_addr      = {32{1'b0}};
    reg     [31:0]  avg_buf_addr      = {32{1'b0}};
    reg     [31:0]  gain_buf_addr     = {32{1'b0}};
    reg     [31:0]  ofst_buf_addr     = {32{1'b0}};
    reg     [31:0]  equal_buf_addr    = {32{1'b0}};
    reg     [31:0]  equal_x2_buf_addr = {32{1'b0}};
    
    reg     [31:0]  raw_btt      = {32{1'b0}};
    reg     [31:0]  avg_btt      = {32{1'b0}};
    reg     [31:0]  gain_btt     = {32{1'b0}};
    reg     [31:0]  ofst_btt     = {32{1'b0}};
    reg     [31:0]  equal_btt    = {32{1'b0}};
    reg     [31:0]  equal_x2_btt = {32{1'b0}};
    
    
    always @(posedge axi_aclk) begin
        if (~axi_aresetn) begin
            s_axi_awready <= 1'b0;
            s_axi_wready  <= 1'b0;
            
            s_axi_bvalid  <= 1'b0;
            s_axi_bresp   <= AXI_RESP_OKAY;
            
            s_axi_arready <= 1'b0;
            s_axi_rvalid  <= 1'b0;
            s_axi_rresp   <= AXI_RESP_OKAY;
        end else begin
            /* Write address handshake */
            s_axi_awready <= (~s_axi_awready & s_axi_awvalid & s_axi_wvalid)? 1'b1 : 1'b0;
            
            /* Write address capture */
            axi_awaddr    <= (~s_axi_awready & s_axi_awvalid & s_axi_wvalid)? s_axi_awaddr : axi_awaddr;
            
            /* Write data handshake */
            s_axi_wready  <= (~s_axi_wready & s_axi_wvalid & s_axi_awvalid)? 1'b1 : 1'b0;
            
            /* Write data */
            if (s_axi_wready & s_axi_wvalid & s_axi_awready & s_axi_awvalid) begin
                for (i = 0; i < 4; i = i + 1) begin
                    case (axi_awaddr[7:2])
                        
                        6'd0  : ctrl_reg[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ctrl_reg[i*8 +: 8];
                     /* 6'd1  : read only register */
                        
                        6'd2  : raw_buf_addr      [i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : raw_buf_addr      [i*8 +: 8];
                        6'd3  : avg_buf_addr      [i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : avg_buf_addr      [i*8 +: 8];
                        6'd4  : gain_buf_addr     [i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : gain_buf_addr     [i*8 +: 8];
                        6'd5  : ofst_buf_addr     [i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ofst_buf_addr     [i*8 +: 8];
                        6'd6  : equal_buf_addr    [i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : equal_buf_addr    [i*8 +: 8];
                        6'd7  : equal_x2_buf_addr [i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : equal_x2_buf_addr [i*8 +: 8];
                        
                        6'd8  : raw_btt      [i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : raw_btt      [i*8 +: 8];
                        6'd9  : avg_btt      [i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : avg_btt      [i*8 +: 8];
                        6'd10 : gain_btt     [i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : gain_btt     [i*8 +: 8];
                        6'd11 : ofst_btt     [i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ofst_btt     [i*8 +: 8];
                        6'd12 : equal_btt    [i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : equal_btt    [i*8 +: 8];
                        6'd13 : equal_x2_btt [i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : equal_x2_btt [i*8 +: 8];
                        
                        default: begin
                            /* TODO: do nothing? */
                        end
                    endcase
                end
            end
            
            /* Write response */
            if (~s_axi_bvalid & s_axi_awready & s_axi_awvalid & s_axi_wready & s_axi_wvalid) begin
                s_axi_bvalid <= 1'b1;
                s_axi_bresp  <= AXI_RESP_OKAY;
            end else begin
                if (s_axi_bvalid & s_axi_bready) begin
                    s_axi_bvalid <= 1'b0;
                end
            end
            
            /* Read address handshake */
            s_axi_arready <= (~s_axi_arready & s_axi_arvalid)? 1'b1 : 1'b0;
            
            /* Read address capture */
            axi_araddr    <= (~s_axi_arready & s_axi_arvalid)? s_axi_araddr : axi_araddr;
            
            /* Read data handshake and response */
            if (~s_axi_rvalid & s_axi_arready & s_axi_arvalid) begin
                s_axi_rvalid  <= 1'b1;
                s_axi_rresp   <= AXI_RESP_OKAY;
            end else begin
                if (s_axi_rvalid & s_axi_rready) begin
                    s_axi_rvalid  <= 1'b0;
                end
            end
            
            /* Read data */
            if (~s_axi_rvalid & s_axi_arready & s_axi_arvalid) begin
                case (axi_araddr[7:2])
                    6'd0  : s_axi_rdata <= ctrl_reg;
                    6'd1  : s_axi_rdata <= stat_reg;
                    
                    6'd2  : s_axi_rdata <= raw_buf_addr;
                    6'd3  : s_axi_rdata <= avg_buf_addr;
                    6'd4  : s_axi_rdata <= gain_buf_addr;
                    6'd5  : s_axi_rdata <= ofst_buf_addr;
                    6'd6  : s_axi_rdata <= equal_buf_addr;
                    6'd7  : s_axi_rdata <= equal_x2_buf_addr;
                    
                    6'd8  : s_axi_rdata <= raw_btt;
                    6'd9  : s_axi_rdata <= avg_btt;
                    6'd10 : s_axi_rdata <= gain_btt;
                    6'd11 : s_axi_rdata <= ofst_btt;
                    6'd12 : s_axi_rdata <= equal_btt;
                    6'd13 : s_axi_rdata <= equal_x2_btt;
                    
                    default: s_axi_rdata <= 32'hABADC0DE;
                endcase
            end
        end
    end

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  [3:0]   DMA_XFER_OKAY    = 4'b1000,
                        DMA_XFER_SLVERR  = 4'b0100,
                        DMA_XFER_DECERR  = 4'b0010,
                        DMA_XFER_INTERR  = 4'b0001;
    
    localparam  [1:0]   RAW_FIFO_ID      = 2'd0,
                        AVGO_FIFO_ID     = 2'd1,
                        EQUAL_FIFO_ID    = 2'd2,
                        EQUAL_X2_FIFO_ID = 2'd3;
    
    localparam  [1:0]   GAIN_FIFO_ID     = 2'd0,
                        OFST_FIFO_ID     = 2'd1,
                        AVGI_FIFO_ID     = 2'd2;
    
    
    reg             raw_fifo_load_ena        = 1'b0;
    reg             raw_fifo_load_done       = 1'b1;
    reg             raw_fifo_load_req        = 1'b0;
    reg             equal_fifo_load_ena      = 1'b0;
    reg             equal_x2_fifo_load_ena   = 1'b0;
    
    
    // S2MM
    reg             s2mm_xfer_ena = 1'b0;
    reg     [1:0]   master_select = 2'b00;
    
    assign  m_axis_s2mm_tkeep = {4{1'b1}};
    
    always @(*) begin
        (* parallel_case *)
        case (master_select)
            RAW_FIFO_ID: begin
                m_axis_s2mm_tdata  = s_axis_raw_tdata;
                m_axis_s2mm_tlast  = s_axis_raw_tlast;
                m_axis_s2mm_tvalid = s_axis_raw_tvalid & s2mm_xfer_ena;
            end
            
            AVGO_FIFO_ID: begin
                m_axis_s2mm_tdata  = s_axis_avgo_tdata;
                m_axis_s2mm_tlast  = s_axis_avgo_tlast;
                m_axis_s2mm_tvalid = s_axis_avgo_tvalid & s2mm_xfer_ena;
            end
            
            EQUAL_FIFO_ID: begin
                m_axis_s2mm_tdata  = s_axis_equal_tdata;
                m_axis_s2mm_tlast  = s_axis_equal_tlast;
                m_axis_s2mm_tvalid = s_axis_equal_tvalid & s2mm_xfer_ena;
            end
            
            EQUAL_X2_FIFO_ID: begin
                m_axis_s2mm_tdata  = s_axis_equal_x2_tdata;
                m_axis_s2mm_tlast  = s_axis_equal_x2_tlast;
                m_axis_s2mm_tvalid = s_axis_equal_x2_tvalid & s2mm_xfer_ena;
            end
            
            //default: begin
            //    m_axis_s2mm_tdata  = {32{1'b0}};
            //    m_axis_s2mm_tlast  = 1'b1;
            //    m_axis_s2mm_tvalid = 1'b0;
            //end
        endcase
    end
    
    
    assign  s_axis_raw_tready      = (s2mm_xfer_ena & m_axis_s2mm_tready & (master_select == RAW_FIFO_ID)) | (~raw_fifo_load_ena);
    assign  s_axis_avgo_tready     =  s2mm_xfer_ena & m_axis_s2mm_tready & (master_select == AVGO_FIFO_ID);
    assign  s_axis_equal_tready    = (s2mm_xfer_ena & m_axis_s2mm_tready & (master_select == EQUAL_FIFO_ID))    | (~equal_fifo_load_ena);
    assign  s_axis_equal_x2_tready = (s2mm_xfer_ena & m_axis_s2mm_tready & (master_select == EQUAL_X2_FIFO_ID)) | (~equal_x2_fifo_load_ena);
    
    
    // MM2S
    reg             mm2s_xfer_ena = 1'b0;
    reg     [1:0]   slave_select  = 2'b00;
    
    assign  m_axis_gain_tdata   = s_axis_mm2s_tdata;
    assign  m_axis_gain_tvalid  = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == GAIN_FIFO_ID);
    assign  m_axis_gain_tlast   = s_axis_mm2s_tlast;
    
    assign  m_axis_ofst_tdata   = s_axis_mm2s_tdata;
    assign  m_axis_ofst_tvalid  = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == OFST_FIFO_ID);
    assign  m_axis_ofst_tlast   = s_axis_mm2s_tlast;
    
    assign  m_axis_avgi_tdata   = s_axis_mm2s_tdata;
    assign  m_axis_avgi_tvalid  = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == AVGI_FIFO_ID);
    assign  m_axis_avgi_tlast   = s_axis_mm2s_tlast;
    
    
    reg     slave_axis_tready;
    
    always @(*) begin
        (* parallel_case *)
        case (slave_select)
            GAIN_FIFO_ID: slave_axis_tready = m_axis_gain_tready;
            OFST_FIFO_ID: slave_axis_tready = m_axis_ofst_tready;
            AVGI_FIFO_ID: slave_axis_tready = m_axis_avgi_tready;
            default:      slave_axis_tready = 1'b0;
        endcase
    end
    
    assign  s_axis_mm2s_tready = slave_axis_tready & mm2s_xfer_ena;
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  [1:0]   ST1_RST      = 2'd0,
                        ST1_ILDE     = 2'd1,
                        ST1_WAIT_SOF = 2'd2,
                        ST1_WAIT_EOF = 2'd3;
    
    reg     [1:0]   state1 = ST1_RST;
    
    
    always @(posedge axi_aclk) begin
        if (~axi_aresetn | ~ctrl_reg[31]) begin
            raw_fifo_load_ena  <= 1'b0;
            raw_fifo_load_done <= 1'b1;
            raw_fifo_load_req  <= 1'b0;
            state1 <= ST1_RST;
        end else begin
            raw_fifo_load_req <= ctrl_reg[0];
            
            case (state1)
                ST1_RST: begin
                    raw_fifo_load_ena  <= 1'b0;
                    raw_fifo_load_done <= 1'b1;
                    state1 <= ST1_ILDE;
                end
                
                ST1_ILDE: begin
                    if (raw_fifo_load_req) begin
                        raw_fifo_load_done <= 1'b0;
                        state1 <= (ctrl_reg[0])? state1 : ST1_WAIT_SOF;
                    end
                end
                
                ST1_WAIT_SOF: begin
                    if (s_axis_raw_tvalid & s_axis_raw_tready & s_axis_raw_tuser) begin
                        raw_fifo_load_ena <= 1'b1;
                        state1 <= ST1_WAIT_EOF;
                    end
                end
                
                ST1_WAIT_EOF: begin
                    if (s_axis_raw_tvalid & s_axis_raw_tready & s_axis_raw_tuser) begin     // s_axis_raw_tuser - indicates last pixels of the frame
                        raw_fifo_load_ena  <= 1'b0;
                        raw_fifo_load_done <= 1'b1;
                        state1 <= ST1_ILDE;
                    end
                end
            endcase
        end
    end

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    always @(posedge axi_aclk) begin
        if (~axi_aresetn | ~ctrl_reg[31]) begin
            equal_fifo_load_ena    <= 1'b0;
            equal_x2_fifo_load_ena <= 1'b0;
        end else begin
            /* Equalized buffer refresh flag */
            if (s_axis_equal_tvalid & s_axis_equal_tready & s_axis_equal_tuser) begin               // tuser - indicates last pixels of the frame
                equal_fifo_load_ena <= ctrl_reg[1];
            end
            
            if (s_axis_equal_x2_tvalid & s_axis_equal_x2_tready & s_axis_equal_x2_tuser) begin      // tuser - indicates last pixels of the frame
                equal_x2_fifo_load_ena <= ctrl_reg[1];
            end
        end
    end

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    /* Main data streaming module. Current FSM manages
     * data movement by AXI-DataMover IP-core */
    
    localparam  [4:0]   ST_ERROR                = 5'd0,
                        ST_RESET                = 5'd1,
                        ST_SWITCH_CNSMR         = 5'd2,
                        
                        ST_DATMOV_S2MM_CMD_0    = 5'd3,
                        ST_DATMOV_S2MM_CMD_1    = 5'd4,
                        ST_DATMOV_S2MM_XFER     = 5'd5,
                        ST_GET_S2MM_XFER_STAT   = 5'd6,
    
                        ST_DATMOV_MM2S_CMD_0    = 5'd7,
                        ST_DATMOV_MM2S_CMD_1    = 5'd8,
                        ST_DATMOV_MM2S_XFER     = 5'd9,                        
                        ST_GET_MM2S_XFER_STAT   = 5'd10,                        

                        ST_SEND_AVGI_ROW        = 5'd11,
                        ST_SEND_GAIN_ROW        = 5'd12,
                        ST_SEND_OFST_ROW        = 5'd13,
                        
                        ST_GET_RAW_ROW          = 5'd14,
                        ST_GET_AVGO_ROW         = 5'd15,
                        ST_GET_EQUAL_ROW        = 5'd16,
                        ST_GET_EQUAL_X2_ROW     = 5'd17;
                        
    reg         [4:0]   state       = ST_RESET;
    reg         [4:0]   state_next  = ST_RESET;
    
    reg                 eol_flag = 1'b0;
    
    reg         [31:0]  raw_frame_ptr      = {32{1'b0}};
    reg         [31:0]  avgo_frame_ptr     = {32{1'b0}};
    reg         [31:0]  gain_frame_ptr     = {32{1'b0}};
    reg         [31:0]  ofst_frame_ptr     = {32{1'b0}};
    reg         [31:0]  avgi_frame_ptr     = {32{1'b0}};
    reg         [31:0]  equal_frame_ptr    = {32{1'b0}};
    reg         [31:0]  equal_x2_frame_ptr = {32{1'b0}};
    
    reg         [31:0]  byte_offset;
    reg         [22:0]  btt_cnt;
    
    
    wire        [71:0]  datmov_cmd =    { 
                                            4'b0000,        // RSVD
                                            4'b0000,        // TAG (Command TAG)
                                            byte_offset,    // Memory address byte offset
                                            1'b0,           // DRR (DRE ReAlignment Request)
                                            1'b1,           // EOF (End of Frame)
                                            6'b000000,      // DSA (DRE Stream Alignment)
                                            1'b1,           // Access type (0 - fix, 1 - inc)
                                            btt_cnt         // Bytes to transfer count
                                        };
    
    always @(posedge axi_aclk) begin
        if (~axi_aresetn | ~ctrl_reg[31]) begin
            mm2s_xfer_ena <= 1'b0;
            s2mm_xfer_ena <= 1'b0;
            
            state <= ST_RESET;
        end else begin
            
            /* Reset frame pointers at the SOF */
            if (sof_strb) begin
                raw_frame_ptr      <= raw_buf_addr;
                avgo_frame_ptr     <= avg_buf_addr;
                gain_frame_ptr     <= gain_buf_addr;
                ofst_frame_ptr     <= ofst_buf_addr;
                avgi_frame_ptr     <= avg_buf_addr;
                equal_frame_ptr    <= equal_buf_addr;
                equal_x2_frame_ptr <= equal_x2_buf_addr;
                
                eol_flag <= 1'b1;   // to fill all FIFOs at SOF
            end
            
            /* Registering EOL flag */
            if (eol_strb) begin
                eol_flag <= 1'b1;
            end
            
            /* Data management FSM */
            case (state)
                
                /* Unrecoverable error */
                ST_ERROR: begin
                    state <= state;
                end
                
                ST_RESET: begin
                    mm2s_xfer_ena <= 1'b0;
                    s2mm_xfer_ena <= 1'b0;
                    
                    if (sof_strb) begin
                        state <= ST_SWITCH_CNSMR;
                    end
                end
                
                ST_SWITCH_CNSMR: begin
                    if (eol_flag) begin
                        /* Here we fill FIFOs that must be mandatory filled 
                         * after each EOL request with highest priority */
                        eol_flag <= 1'b0;
                        state <= ST_SEND_AVGI_ROW;
                    end else begin
                        state <= ST_GET_EQUAL_ROW;
                    end
                end
                
                ST_SEND_AVGI_ROW: begin
                    if (~fifo_avgi_prog_full) begin
                        slave_select <= AVGI_FIFO_ID;
                        byte_offset <= avgi_frame_ptr;
                        avgi_frame_ptr <= avgi_frame_ptr + avg_btt;
                        btt_cnt <= avg_btt;
                        state <= ST_DATMOV_MM2S_CMD_0;
                        state_next <= ST_GET_RAW_ROW;
                    end else begin
                        state <= ST_GET_RAW_ROW;
                    end
                end
                
                ST_GET_RAW_ROW: begin
                    if (~fifo_raw_prog_empty & raw_fifo_load_ena) begin
                        master_select <= RAW_FIFO_ID;
                        byte_offset <= raw_frame_ptr;
                        raw_frame_ptr <= raw_frame_ptr + raw_btt;
                        btt_cnt <= raw_btt;
                        state <= ST_DATMOV_S2MM_CMD_0;
                        state_next <= ST_SEND_GAIN_ROW;
                    end else begin      
                        state <= ST_SEND_GAIN_ROW;
                    end     
                end
                
                ST_SEND_GAIN_ROW: begin
                    if (~fifo_gain_prog_full) begin
                        slave_select <= GAIN_FIFO_ID;        
                        byte_offset <= gain_frame_ptr;      
                        gain_frame_ptr <= gain_frame_ptr + gain_btt;
                        btt_cnt <= gain_btt;
                        state <= ST_DATMOV_MM2S_CMD_0;      
                        state_next <= ST_SEND_OFST_ROW;      
                    end else begin      
                        state <= ST_SEND_OFST_ROW;       
                    end  
                end
                
                ST_SEND_OFST_ROW: begin     
                    if (~fifo_ofst_prog_full) begin
                        slave_select <= OFST_FIFO_ID;        
                        byte_offset <= ofst_frame_ptr;      
                        ofst_frame_ptr <= ofst_frame_ptr + ofst_btt;
                        btt_cnt <= ofst_btt;
                        state <= ST_DATMOV_MM2S_CMD_0;      
                        state_next <= ST_GET_AVGO_ROW;      
                    end else begin      
                        state <= ST_GET_AVGO_ROW;       
                    end     
                end
                
                ST_GET_AVGO_ROW: begin
                    if (~fifo_avgo_prog_empty) begin
                        master_select <= AVGO_FIFO_ID;
                        byte_offset <= avgo_frame_ptr;
                        avgo_frame_ptr <= avgo_frame_ptr + avg_btt;
                        btt_cnt <= avg_btt;
                        state <= ST_DATMOV_S2MM_CMD_0;
                        state_next <= ST_SWITCH_CNSMR;
                    end else begin
                        state <= ST_SWITCH_CNSMR;
                    end
                end
                
                ST_GET_EQUAL_ROW: begin
                    if (~fifo_equal_prog_empty & equal_fifo_load_ena) begin
                        master_select <= EQUAL_FIFO_ID;        
                        byte_offset <= equal_frame_ptr;      
                        equal_frame_ptr <= equal_frame_ptr + equal_btt;
                        btt_cnt <= equal_btt;
                        state <= ST_DATMOV_S2MM_CMD_0;
                        state_next <= ST_GET_EQUAL_X2_ROW;      
                    end else begin      
                        state <= ST_GET_EQUAL_X2_ROW;       
                    end
                end
                
                ST_GET_EQUAL_X2_ROW: begin
                    if (~fifo_equal_x2_prog_empty & equal_x2_fifo_load_ena) begin
                        master_select <= EQUAL_X2_FIFO_ID;        
                        byte_offset <= equal_x2_frame_ptr;      
                        equal_x2_frame_ptr <= equal_x2_frame_ptr + equal_x2_btt;
                        btt_cnt <= equal_x2_btt;
                        state <= ST_DATMOV_S2MM_CMD_0;
                        state_next <= ST_SWITCH_CNSMR;      
                    end else begin      
                        state <= ST_SWITCH_CNSMR;       
                    end
                end
                
                /* Generate S2MM command for DataMover */
                ST_DATMOV_S2MM_CMD_0: begin
                    m_axis_s2mm_cmd_tdata <= datmov_cmd;
                    m_axis_s2mm_cmd_tvalid <= 1'b1;
                    state <= ST_DATMOV_S2MM_CMD_1;
                end
                
                /* Wait S2MM command to be accepted */
                ST_DATMOV_S2MM_CMD_1: begin
                    if (m_axis_s2mm_cmd_tready) begin
                        m_axis_s2mm_cmd_tvalid <= 1'b0;
                        s2mm_xfer_ena <= 1'b1;
                        state <= ST_DATMOV_S2MM_XFER;
                    end
                end
                
                /* Wait S2MM transfer to be done */
                ST_DATMOV_S2MM_XFER: begin
                    if (m_axis_s2mm_tvalid & m_axis_s2mm_tready & m_axis_s2mm_tlast) begin
                        s2mm_xfer_ena <= 1'b0;
                        s_axis_s2mm_sts_tready <= 1'b1;
                        state <= ST_GET_S2MM_XFER_STAT;
                    end
                end
                
                /* Check S2MM transfer status */
                ST_GET_S2MM_XFER_STAT: begin
                    if (s_axis_s2mm_sts_tvalid) begin
                        s_axis_s2mm_sts_tready <= 1'b0;
                        if (s_axis_s2mm_sts_tdata[7:4] == DMA_XFER_OKAY) begin
                            state <= state_next;
                        end else begin
                            state <= ST_ERROR;
                        end
                    end
                end              
                
                /* Generate MM2S command for DataMover */
                ST_DATMOV_MM2S_CMD_0: begin
                    m_axis_mm2s_cmd_tdata <= datmov_cmd;
                    m_axis_mm2s_cmd_tvalid <= 1'b1;
                    state <= ST_DATMOV_MM2S_CMD_1;
                end
                
                /* Wait MM2S command to be accepted */
                ST_DATMOV_MM2S_CMD_1: begin
                    if (m_axis_mm2s_cmd_tready) begin
                        m_axis_mm2s_cmd_tvalid <= 1'b0;
                        mm2s_xfer_ena <= 1'b1;
                        state <= ST_DATMOV_MM2S_XFER;
                    end
                end
                
                /* Wait MM2S transfer to be done */
                ST_DATMOV_MM2S_XFER: begin  
                    if (s_axis_mm2s_tvalid & s_axis_mm2s_tready & s_axis_mm2s_tlast) begin
                        mm2s_xfer_ena <= 1'b0;
                        s_axis_mm2s_sts_tready <= 1'b1;
                        state <= ST_GET_MM2S_XFER_STAT;
                    end
                end
                
                /* Check MM2S transfer status */
                ST_GET_MM2S_XFER_STAT: begin
                    if (s_axis_mm2s_sts_tvalid) begin
                        s_axis_mm2s_sts_tready <= 1'b0;
                        if (s_axis_mm2s_sts_tdata[7:4] == DMA_XFER_OKAY) begin
                            state <= state_next;
                        end else begin
                            state <= ST_ERROR;
                        end
                    end
                end
                
                default: begin
                    state <= ST_ERROR;
                end
                
            endcase
        end
    end
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    assign  avg_level  = ctrl_reg[10:8];
    assign  nuc_bypass = ctrl_reg[11];
    assign  bpr_bypass = ctrl_reg[12];
    
    assign  stat_reg =  {
                            3'b000, state,
                            16'h0000,
                            6'b000000,
                            equal_fifo_load_ena & equal_x2_fifo_load_ena,
                            raw_fifo_load_done
                        };
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
