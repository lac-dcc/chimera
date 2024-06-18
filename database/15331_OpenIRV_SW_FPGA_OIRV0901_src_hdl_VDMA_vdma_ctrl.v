// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: vdma_ctrl.v
 *  Purpose:  Video DMA control module. Used to stream video data to different
 *            consumers over AXI4-Stream interface. Supports per channel
 *            configurable burst length, address increment, dual buffering,
 *            interlaced/progressive modes.
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


module vdma_ctrl #
(
    parameter   integer C_S_AXI_ADDR_WIDTH = 8
)
(
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *)
    input   wire            axi_aresetn,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLKIF, ASSOCIATED_BUSIF S_AXI_LITE:M_AXIS_CH0:M_AXIS_CH1:M_AXIS_CH2:M_AXIS_CH3:M_AXIS_CH4:M_AXIS_CH5:S_AXIS_MM2S:M_AXIS_MM2S_CMD:S_AXIS_MM2S_STS, ASSOCIATED_RESET axi_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLKIF CLK" *)
    input   wire            axi_aclk,
    
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
    
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RDATA"   *)    output  reg     [31:0]                      s_axi_rdata     = {32{1'b0}},
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RRESP"   *)    output  reg     [1:0]                       s_axi_rresp     = 2'b00,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RVALID"  *)    output  reg                                 s_axi_rvalid    = 1'b0,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RREADY"  *)    input   wire                                s_axi_rready,
    
    /* Master AXIS OSD (On Screen Display) */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_CH0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 4, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH0 TDATA"  *)      output  wire    [31:0]  m_axis_ch0_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH0 TVALID" *)      output  wire            m_axis_ch0_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH0 TREADY" *)      input   wire            m_axis_ch0_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH0 TUSER"  *)      output  wire    [3:0]   m_axis_ch0_tuser,
    
    /* Master AXIS to consumer 0 */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_CH1, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 4, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH1 TDATA"  *)      output  wire    [31:0]  m_axis_ch1_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH1 TVALID" *)      output  wire            m_axis_ch1_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH1 TREADY" *)      input   wire            m_axis_ch1_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH1 TUSER"  *)      output  wire    [3:0]   m_axis_ch1_tuser,
    
    /* Master AXIS to consumer 1 */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_CH2, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 4, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH2 TDATA"  *)      output  wire    [31:0]  m_axis_ch2_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH2 TVALID" *)      output  wire            m_axis_ch2_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH2 TREADY" *)      input   wire            m_axis_ch2_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH2 TUSER"  *)      output  wire    [3:0]   m_axis_ch2_tuser,
    
    /* Master AXIS to consumer 2 */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_CH3, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 4, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH3 TDATA"  *)      output  wire    [31:0]  m_axis_ch3_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH3 TVALID" *)      output  wire            m_axis_ch3_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH3 TREADY" *)      input   wire            m_axis_ch3_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH3 TUSER"  *)      output  wire    [3:0]   m_axis_ch3_tuser,
    
    /* Master AXIS to consumer 3 */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_CH4, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 4, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH4 TDATA"  *)      output  wire    [31:0]  m_axis_ch4_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH4 TVALID" *)      output  wire            m_axis_ch4_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH4 TREADY" *)      input   wire            m_axis_ch4_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH4 TUSER"  *)      output  wire    [3:0]   m_axis_ch4_tuser,
    
    /* Master AXIS to consumer 4 */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_CH5, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 4, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH5 TDATA"  *)      output  wire    [31:0]  m_axis_ch5_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH5 TVALID" *)      output  wire            m_axis_ch5_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH5 TREADY" *)      input   wire            m_axis_ch5_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_CH5 TUSER"  *)      output  wire    [3:0]   m_axis_ch5_tuser,
    
    /* DataMover MM2S (read from memory) */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_MM2S, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S TDATA"  *)     input   wire    [31:0]  s_axis_mm2s_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S TKEEP"  *)     input   wire    [3:0]   s_axis_mm2s_tkeep,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S TVALID" *)     input   wire            s_axis_mm2s_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S TREADY" *)     output  wire            s_axis_mm2s_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S TLAST"  *)     input   wire            s_axis_mm2s_tlast,
    
    /* DataMover MM2S command interface */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_MM2S_CMD, TDATA_NUM_BYTES 9, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_MM2S_CMD TDATA"  *) output  reg     [71:0]  m_axis_mm2s_cmd_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_MM2S_CMD TVALID" *) output  reg             m_axis_mm2s_cmd_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_MM2S_CMD TREADY" *) input   wire            m_axis_mm2s_cmd_tready,
    
    /* DataMover MM2S status interface */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_MM2S_STS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S_STS TDATA"  *) input   wire    [7:0]   s_axis_mm2s_sts_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S_STS TKEEP"  *) input   wire    [0:0]   s_axis_mm2s_sts_tkeep,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S_STS TVALID" *) input   wire            s_axis_mm2s_sts_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S_STS TREADY" *) output  reg             s_axis_mm2s_sts_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S_STS TLAST"  *) input   wire            s_axis_mm2s_sts_tlast,
    
    input   wire            fifo_ch0_prog_full,
    input   wire            fifo_ch1_prog_full,
    input   wire            fifo_ch2_prog_full,
    input   wire            fifo_ch3_prog_full,
    input   wire            fifo_ch4_prog_full,
    input   wire            fifo_ch5_prog_full
);
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/

    localparam  AXI_RESP_OKAY   = 2'b00,
                AXI_RESP_EXOKAY = 2'b01,
                AXI_RESP_SLVERR = 2'b10,
                AXI_RESP_DECERR = 2'b11;
    
    integer i;
    
    reg     [C_S_AXI_ADDR_WIDTH - 1:0]  axi_awaddr = {C_S_AXI_ADDR_WIDTH{1'b0}};
    reg     [C_S_AXI_ADDR_WIDTH - 1:0]  axi_araddr = {C_S_AXI_ADDR_WIDTH{1'b0}};
    
    reg     [31:0]  ctrl_reg = {32{1'b0}};
    wire    [31:0]  stat_reg;
    
    reg     [31:0]  ch0_config = {32{1'b0}};
    reg     [31:0]  ch1_config = {32{1'b0}};
    reg     [31:0]  ch2_config = {32{1'b0}};
    reg     [31:0]  ch3_config = {32{1'b0}};
    reg     [31:0]  ch4_config = {32{1'b0}};
    reg     [31:0]  ch5_config = {32{1'b0}};
    
    reg     [31:0]  ch0_ping_buf_addr = {32{1'b0}};
    reg     [31:0]  ch1_ping_buf_addr = {32{1'b0}};
    reg     [31:0]  ch2_ping_buf_addr = {32{1'b0}};
    reg     [31:0]  ch3_ping_buf_addr = {32{1'b0}};
    reg     [31:0]  ch4_ping_buf_addr = {32{1'b0}};
    reg     [31:0]  ch5_ping_buf_addr = {32{1'b0}};
    
    reg     [31:0]  ch0_pong_buf_addr = {32{1'b0}};
    reg     [31:0]  ch1_pong_buf_addr = {32{1'b0}};
    reg     [31:0]  ch2_pong_buf_addr = {32{1'b0}};
    reg     [31:0]  ch3_pong_buf_addr = {32{1'b0}};
    reg     [31:0]  ch4_pong_buf_addr = {32{1'b0}};
    reg     [31:0]  ch5_pong_buf_addr = {32{1'b0}};
    
    reg     [31:0]  ch0_buf_size = {32{1'b0}};
    reg     [31:0]  ch1_buf_size = {32{1'b0}};
    reg     [31:0]  ch2_buf_size = {32{1'b0}};
    reg     [31:0]  ch3_buf_size = {32{1'b0}};
    reg     [31:0]  ch4_buf_size = {32{1'b0}};
    reg     [31:0]  ch5_buf_size = {32{1'b0}};
    
    reg     [31:0]  ch0_addr_incr = {32{1'b0}};
    reg     [31:0]  ch1_addr_incr = {32{1'b0}};
    reg     [31:0]  ch2_addr_incr = {32{1'b0}};
    reg     [31:0]  ch3_addr_incr = {32{1'b0}};
    reg     [31:0]  ch4_addr_incr = {32{1'b0}};
    reg     [31:0]  ch5_addr_incr = {32{1'b0}};
    
    reg     [31:0]  ch0_btt = {32{1'b0}};
    reg     [31:0]  ch1_btt = {32{1'b0}};
    reg     [31:0]  ch2_btt = {32{1'b0}};
    reg     [31:0]  ch3_btt = {32{1'b0}};
    reg     [31:0]  ch4_btt = {32{1'b0}};
    reg     [31:0]  ch5_btt = {32{1'b0}};
    
    
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
                        6'd0: ctrl_reg[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ctrl_reg[i*8 +: 8];
                     /* 6'd1: read only register */
                    
                        6'd2 : ch0_config[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch0_config[i*8 +: 8];
                        6'd3 : ch1_config[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch1_config[i*8 +: 8];
                        6'd4 : ch2_config[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch2_config[i*8 +: 8];
                        6'd5 : ch3_config[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch3_config[i*8 +: 8];
                        6'd6 : ch4_config[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch4_config[i*8 +: 8];
                        6'd7 : ch5_config[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch5_config[i*8 +: 8];
                        
                        6'd8 : ch0_ping_buf_addr[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch0_ping_buf_addr[i*8 +: 8];
                        6'd9 : ch1_ping_buf_addr[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch1_ping_buf_addr[i*8 +: 8];
                        6'd10: ch2_ping_buf_addr[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch2_ping_buf_addr[i*8 +: 8];
                        6'd11: ch3_ping_buf_addr[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch3_ping_buf_addr[i*8 +: 8];
                        6'd12: ch4_ping_buf_addr[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch4_ping_buf_addr[i*8 +: 8];
                        6'd13: ch5_ping_buf_addr[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch5_ping_buf_addr[i*8 +: 8];
                        
                        6'd14: ch0_pong_buf_addr[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch0_pong_buf_addr[i*8 +: 8];
                        6'd15: ch1_pong_buf_addr[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch1_pong_buf_addr[i*8 +: 8];
                        6'd16: ch2_pong_buf_addr[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch2_pong_buf_addr[i*8 +: 8];
                        6'd17: ch3_pong_buf_addr[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch3_pong_buf_addr[i*8 +: 8];
                        6'd18: ch4_pong_buf_addr[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch4_pong_buf_addr[i*8 +: 8];
                        6'd19: ch5_pong_buf_addr[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch5_pong_buf_addr[i*8 +: 8];
                        
                        6'd20: ch0_buf_size[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch0_buf_size[i*8 +: 8];
                        6'd21: ch1_buf_size[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch1_buf_size[i*8 +: 8];
                        6'd22: ch2_buf_size[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch2_buf_size[i*8 +: 8];
                        6'd23: ch3_buf_size[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch3_buf_size[i*8 +: 8];
                        6'd24: ch4_buf_size[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch4_buf_size[i*8 +: 8];
                        6'd25: ch5_buf_size[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch5_buf_size[i*8 +: 8];
                        
                        6'd26: ch0_addr_incr[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch0_addr_incr[i*8 +: 8];
                        6'd27: ch1_addr_incr[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch1_addr_incr[i*8 +: 8];
                        6'd28: ch2_addr_incr[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch2_addr_incr[i*8 +: 8];
                        6'd29: ch3_addr_incr[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch3_addr_incr[i*8 +: 8];
                        6'd30: ch4_addr_incr[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch4_addr_incr[i*8 +: 8];
                        6'd31: ch5_addr_incr[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch5_addr_incr[i*8 +: 8];
                        
                        6'd32: ch0_btt[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch0_btt[i*8 +: 8];
                        6'd33: ch1_btt[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch1_btt[i*8 +: 8];
                        6'd34: ch2_btt[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch2_btt[i*8 +: 8];
                        6'd35: ch3_btt[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch3_btt[i*8 +: 8];
                        6'd36: ch4_btt[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch4_btt[i*8 +: 8];
                        6'd37: ch5_btt[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch5_btt[i*8 +: 8];
                        
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
                    6'd0 : s_axi_rdata <= ctrl_reg;
                    6'd1 : s_axi_rdata <= stat_reg;
                    
                    6'd2 : s_axi_rdata <= ch0_config;
                    6'd3 : s_axi_rdata <= ch1_config;
                    6'd4 : s_axi_rdata <= ch2_config;
                    6'd5 : s_axi_rdata <= ch3_config;
                    6'd6 : s_axi_rdata <= ch4_config;
                    6'd7 : s_axi_rdata <= ch5_config;
                    
                    6'd8 : s_axi_rdata <= ch0_ping_buf_addr;
                    6'd9 : s_axi_rdata <= ch1_ping_buf_addr;
                    6'd10: s_axi_rdata <= ch2_ping_buf_addr;
                    6'd11: s_axi_rdata <= ch3_ping_buf_addr;
                    6'd12: s_axi_rdata <= ch4_ping_buf_addr;
                    6'd13: s_axi_rdata <= ch5_ping_buf_addr;
                    
                    6'd14: s_axi_rdata <= ch0_pong_buf_addr;
                    6'd15: s_axi_rdata <= ch1_pong_buf_addr;
                    6'd16: s_axi_rdata <= ch2_pong_buf_addr;
                    6'd17: s_axi_rdata <= ch3_pong_buf_addr;
                    6'd18: s_axi_rdata <= ch4_pong_buf_addr;
                    6'd19: s_axi_rdata <= ch5_pong_buf_addr;
                    
                    6'd20: s_axi_rdata <= ch0_buf_size;
                    6'd21: s_axi_rdata <= ch1_buf_size;
                    6'd22: s_axi_rdata <= ch2_buf_size;
                    6'd23: s_axi_rdata <= ch3_buf_size;
                    6'd24: s_axi_rdata <= ch4_buf_size;
                    6'd25: s_axi_rdata <= ch5_buf_size;
                    
                    6'd26: s_axi_rdata <= ch0_addr_incr;
                    6'd27: s_axi_rdata <= ch1_addr_incr;
                    6'd28: s_axi_rdata <= ch2_addr_incr;
                    6'd29: s_axi_rdata <= ch3_addr_incr;
                    6'd30: s_axi_rdata <= ch4_addr_incr;
                    6'd31: s_axi_rdata <= ch5_addr_incr;
                    
                    6'd32: s_axi_rdata <= ch0_btt;
                    6'd33: s_axi_rdata <= ch1_btt;
                    6'd34: s_axi_rdata <= ch2_btt;
                    6'd35: s_axi_rdata <= ch3_btt;
                    6'd36: s_axi_rdata <= ch4_btt;
                    6'd37: s_axi_rdata <= ch5_btt;
                    
                    default: s_axi_rdata <= 32'hABADC0DE;
                endcase
            end
        end
    end
    
    
    /* Selecting double buffering "ping-pong" buffers */
    wire    ch0_buf_sel = ch0_config[31];
    wire    ch1_buf_sel = ch1_config[31];
    wire    ch2_buf_sel = ch2_config[31];
    wire    ch3_buf_sel = ch3_config[31];
    wire    ch4_buf_sel = ch4_config[31];
    wire    ch5_buf_sel = ch5_config[31];
    
    /* Progressive or interlaced data streaming mode */
     wire    ch0_interlaced = ch0_config[30];
     wire    ch1_interlaced = ch1_config[30];
     wire    ch2_interlaced = ch2_config[30];
     wire    ch3_interlaced = ch3_config[30];
     wire    ch4_interlaced = ch4_config[30];
     wire    ch5_interlaced = ch5_config[30];
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  [3:0]   DMA_XFER_OKAY   = 4'b1000,
                        DMA_XFER_SLVERR = 4'b0100,
                        DMA_XFER_DECERR = 4'b0010,
                        DMA_XFER_INTERR = 4'b0001;
    
    localparam  [2:0]   CH0_FIFO_ID = 3'd0,
                        CH1_FIFO_ID = 3'd1,
                        CH2_FIFO_ID = 3'd2,
                        CH3_FIFO_ID = 3'd3,
                        CH4_FIFO_ID = 3'd4,
                        CH5_FIFO_ID = 3'd5;
    
    
    reg             mm2s_xfer_last = 1'b0;
    reg             mm2s_xfer_ena  = 1'b0;
    reg     [2:0]   slave_select   = 3'b000;
    
    wire            frame_last_pix = mm2s_xfer_last & s_axis_mm2s_tlast;
    
    assign  m_axis_ch0_tdata  = s_axis_mm2s_tdata;
    assign  m_axis_ch0_tvalid = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == CH0_FIFO_ID);
    assign  m_axis_ch0_tuser  = {ch0_config[0]? frame_last_pix : 1'b0,
                                 ch0_config[1]? frame_last_pix : 1'b0,
                                 ch0_config[2]? frame_last_pix : 1'b0,
                                 ch0_config[3]? frame_last_pix : 1'b0};
    
    assign  m_axis_ch1_tdata  = s_axis_mm2s_tdata;
    assign  m_axis_ch1_tvalid = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == CH1_FIFO_ID);
    assign  m_axis_ch1_tuser  = {ch1_config[0]? frame_last_pix : 1'b0,
                                 ch1_config[1]? frame_last_pix : 1'b0,
                                 ch1_config[2]? frame_last_pix : 1'b0,
                                 ch1_config[3]? frame_last_pix : 1'b0};
    
    assign  m_axis_ch2_tdata  = s_axis_mm2s_tdata;
    assign  m_axis_ch2_tvalid = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == CH2_FIFO_ID);
    assign  m_axis_ch2_tuser  = {ch2_config[0]? frame_last_pix : 1'b0,
                                 ch2_config[1]? frame_last_pix : 1'b0,
                                 ch2_config[2]? frame_last_pix : 1'b0,
                                 ch2_config[3]? frame_last_pix : 1'b0};
    
    assign  m_axis_ch3_tdata  = s_axis_mm2s_tdata;
    assign  m_axis_ch3_tvalid = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == CH3_FIFO_ID);
    assign  m_axis_ch3_tuser  = {ch3_config[0]? frame_last_pix : 1'b0,
                                 ch3_config[1]? frame_last_pix : 1'b0,
                                 ch3_config[2]? frame_last_pix : 1'b0,
                                 ch3_config[3]? frame_last_pix : 1'b0};
    
    assign  m_axis_ch4_tdata  = s_axis_mm2s_tdata;
    assign  m_axis_ch4_tvalid = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == CH4_FIFO_ID);
    assign  m_axis_ch4_tuser  = {ch4_config[0]? frame_last_pix : 1'b0,
                                 ch4_config[1]? frame_last_pix : 1'b0,
                                 ch4_config[2]? frame_last_pix : 1'b0,
                                 ch4_config[3]? frame_last_pix : 1'b0};
    
    assign  m_axis_ch5_tdata  = s_axis_mm2s_tdata;
    assign  m_axis_ch5_tvalid = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == CH5_FIFO_ID);
    assign  m_axis_ch5_tuser  = {ch5_config[0]? frame_last_pix : 1'b0,
                                 ch5_config[1]? frame_last_pix : 1'b0,
                                 ch5_config[2]? frame_last_pix : 1'b0,
                                 ch5_config[3]? frame_last_pix : 1'b0};
    
    
    reg     slave_axis_tready = 1'b0;
    
    always @(*) begin
        (* parallel_case *)
        case (slave_select)
            CH0_FIFO_ID: slave_axis_tready = m_axis_ch0_tready;
            CH1_FIFO_ID: slave_axis_tready = m_axis_ch1_tready;
            CH2_FIFO_ID: slave_axis_tready = m_axis_ch2_tready;
            CH3_FIFO_ID: slave_axis_tready = m_axis_ch3_tready;
            CH4_FIFO_ID: slave_axis_tready = m_axis_ch4_tready;
            CH5_FIFO_ID: slave_axis_tready = m_axis_ch5_tready;
            default:     slave_axis_tready = 1'b0;
        endcase
    end
    
    assign  s_axis_mm2s_tready = slave_axis_tready & mm2s_xfer_ena;

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    /* Main data streaming module. Current FSM manages
     * data movement by AXI-DataMover IP-core */
    
    localparam  [3:0]   ST_ERROR                = 4'd0,
                        ST_RESET                = 4'd1,
                        
                        ST_HANDLE_CH0           = 4'd2,
                        ST_HANDLE_CH1           = 4'd3,
                        ST_HANDLE_CH2           = 4'd4,
                        ST_HANDLE_CH3           = 4'd5,
                        ST_HANDLE_CH4           = 4'd6,
                        ST_HANDLE_CH5           = 4'd7,
                        
                        ST_DATMOV_MM2S_CMD_0    = 4'd8,
                        ST_DATMOV_MM2S_CMD_1    = 4'd9,
                        ST_DATMOV_MM2S_XFER     = 4'd10,
                        ST_GET_MM2S_XFER_STAT   = 4'd11;
    
    reg         [3:0]   state       = ST_RESET;
    reg         [3:0]   state_next  = ST_RESET;
    
    reg         [31:0]  ch0_start_ptr = {32{1'b0}};
    reg         [31:0]  ch1_start_ptr = {32{1'b0}};
    reg         [31:0]  ch2_start_ptr = {32{1'b0}};
    reg         [31:0]  ch3_start_ptr = {32{1'b0}};
    reg         [31:0]  ch4_start_ptr = {32{1'b0}};
    reg         [31:0]  ch5_start_ptr = {32{1'b0}};
    
    reg         [31:0]  ch0_frame_ptr = {32{1'b0}};
    reg         [31:0]  ch1_frame_ptr = {32{1'b0}};
    reg         [31:0]  ch2_frame_ptr = {32{1'b0}};
    reg         [31:0]  ch3_frame_ptr = {32{1'b0}};
    reg         [31:0]  ch4_frame_ptr = {32{1'b0}};
    reg         [31:0]  ch5_frame_ptr = {32{1'b0}};
    
    reg         [31:0]  ch0_act = {32{1'b0}};
    reg         [31:0]  ch1_act = {32{1'b0}};
    reg         [31:0]  ch2_act = {32{1'b0}};
    reg         [31:0]  ch3_act = {32{1'b0}};
    reg         [31:0]  ch4_act = {32{1'b0}};
    reg         [31:0]  ch5_act = {32{1'b0}};
    
    reg         [31:0]  ch0_xfer_cnt = {32{1'b0}};
    reg         [31:0]  ch1_xfer_cnt = {32{1'b0}};
    reg         [31:0]  ch2_xfer_cnt = {32{1'b0}};
    reg         [31:0]  ch3_xfer_cnt = {32{1'b0}};
    reg         [31:0]  ch4_xfer_cnt = {32{1'b0}};
    reg         [31:0]  ch5_xfer_cnt = {32{1'b0}};
    
    reg         [31:0]  byte_offset;
    reg         [22:0]  btt_cnt;
    
    reg         [3:0]   dma_xfer_status = 4'h0;
    
    wire                ch0_ena     = ctrl_reg[0];
    wire                ch1_ena     = ctrl_reg[1];
    wire                ch2_ena     = ctrl_reg[2];
    wire                ch3_ena     = ctrl_reg[3];
    wire                ch4_ena     = ctrl_reg[4];
    wire                ch5_ena     = ctrl_reg[5];
    
    wire        [71:0]  datmov_cmd  =   { 
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
        if (~axi_aresetn) begin
            mm2s_xfer_last <= 1'b0;
            mm2s_xfer_ena  <= 1'b0;
            state <= ST_RESET;
        end else begin
            
            if (~ch0_ena) begin
                ch0_xfer_cnt = ch0_btt;
                ch0_start_ptr <= ch0_ping_buf_addr;
                ch0_frame_ptr <= ch0_ping_buf_addr;
            end
            
            if (~ch1_ena) begin
                ch1_xfer_cnt = ch1_btt;
                ch1_start_ptr <= ch1_ping_buf_addr;
                ch1_frame_ptr <= ch1_ping_buf_addr;
            end
            
            if (~ch2_ena) begin
                ch2_xfer_cnt = ch2_btt;
                ch2_start_ptr <= ch2_ping_buf_addr;
                ch2_frame_ptr <= ch2_ping_buf_addr;
            end
            
            if (~ch3_ena) begin
                ch3_xfer_cnt = ch3_btt;
                ch3_start_ptr <= ch3_ping_buf_addr;
                ch3_frame_ptr <= ch3_ping_buf_addr;
            end
            
            if (~ch4_ena) begin
                ch4_xfer_cnt = ch4_btt;
                ch4_start_ptr <= ch4_ping_buf_addr;
                ch4_frame_ptr <= ch4_ping_buf_addr;
            end
            
            if (~ch5_ena) begin
                ch5_xfer_cnt = ch5_btt;
                ch5_start_ptr <= ch5_ping_buf_addr;
                ch5_frame_ptr <= ch5_ping_buf_addr;
            end
            
            case (state)
                
                /* Unrecoverable error */
                ST_ERROR: begin
                    state <= state;
                end
                
                
                ST_RESET: begin
                    mm2s_xfer_last <= 1'b0;
                    mm2s_xfer_ena  <= 1'b0;
                    state <= ST_HANDLE_CH0;
                end
                
                
                ST_HANDLE_CH0: begin
                    if (~fifo_ch0_prog_full & ch0_ena) begin
                        slave_select <= CH0_FIFO_ID;
                        byte_offset <= ch0_frame_ptr;
                        if (ch0_xfer_cnt >= ch0_buf_size) begin
                            mm2s_xfer_last <= 1'b1;
                            ch0_xfer_cnt <= ch0_btt;
                            ch0_start_ptr <= ch0_buf_sel? ch0_pong_buf_addr : ch0_ping_buf_addr;
                            ch0_frame_ptr <= ch0_buf_sel? ch0_pong_buf_addr : ch0_ping_buf_addr;
                        end else begin
                            
                            if (ch0_interlaced && (ch0_xfer_cnt == (ch0_buf_size >> 1))) begin
                                ch0_frame_ptr <= ch0_start_ptr + ch0_btt;
                            end else begin
                                ch0_frame_ptr <= ch0_frame_ptr + ch0_addr_incr;
                            end
                            
                            ch0_xfer_cnt <= ch0_xfer_cnt + ch0_btt;
                        end
                        btt_cnt <= ch0_btt;
                        state <= ST_DATMOV_MM2S_CMD_0;
                        state_next <= ST_HANDLE_CH1;
                    end else begin
                        state <= ST_HANDLE_CH1;
                    end
                end
                
                
                ST_HANDLE_CH1: begin
                    if (~fifo_ch1_prog_full & ch1_ena) begin
                        slave_select <= CH1_FIFO_ID;
                        byte_offset <= ch1_frame_ptr;
                        if (ch1_xfer_cnt >= ch1_buf_size) begin
                            mm2s_xfer_last <= 1'b1;
                            ch1_xfer_cnt <= ch1_btt;
                            ch1_start_ptr <= ch1_buf_sel? ch1_pong_buf_addr : ch1_ping_buf_addr;
                            ch1_frame_ptr <= ch1_buf_sel? ch1_pong_buf_addr : ch1_ping_buf_addr;
                        end else begin
                            
                            if (ch1_interlaced && (ch1_xfer_cnt == (ch1_buf_size >> 1))) begin
                                ch1_frame_ptr <= ch1_start_ptr + ch1_btt;
                            end else begin
                                ch1_frame_ptr <= ch1_frame_ptr + ch1_addr_incr;
                            end
                            
                            ch1_xfer_cnt <= ch1_xfer_cnt + ch1_btt;
                        end
                        btt_cnt <= ch1_btt;
                        state <= ST_DATMOV_MM2S_CMD_0;
                        state_next <= ST_HANDLE_CH2;
                    end else begin
                        state <= ST_HANDLE_CH2;
                    end
                end
                
                
                ST_HANDLE_CH2: begin
                    if (~fifo_ch2_prog_full & ch2_ena) begin
                        slave_select <= CH2_FIFO_ID;
                        byte_offset <= ch2_frame_ptr;
                        if (ch2_xfer_cnt >= ch2_buf_size) begin
                            mm2s_xfer_last <= 1'b1;
                            ch2_xfer_cnt <= ch2_btt;
                            ch2_start_ptr <= ch2_buf_sel? ch2_pong_buf_addr : ch2_ping_buf_addr;
                            ch2_frame_ptr <= ch2_buf_sel? ch2_pong_buf_addr : ch2_ping_buf_addr;
                        end else begin
                            
                            if (ch2_interlaced && (ch2_xfer_cnt == (ch2_buf_size >> 1))) begin
                                ch2_frame_ptr <= ch2_start_ptr + ch2_btt;
                            end else begin
                                ch2_frame_ptr <= ch2_frame_ptr + ch2_addr_incr;
                            end
                            
                            ch2_xfer_cnt <= ch2_xfer_cnt + ch2_btt;
                        end
                        btt_cnt <= ch2_btt;
                        state <= ST_DATMOV_MM2S_CMD_0;
                        state_next <= ST_HANDLE_CH3;
                    end else begin
                        state <= ST_HANDLE_CH3;
                    end
                end
                
                
                ST_HANDLE_CH3: begin
                    if (~fifo_ch3_prog_full & ch3_ena) begin
                        slave_select <= CH3_FIFO_ID;
                        byte_offset <= ch3_frame_ptr;
                        if (ch3_xfer_cnt >= ch3_buf_size) begin
                            mm2s_xfer_last <= 1'b1;
                            ch3_xfer_cnt <= ch3_btt;
                            ch3_start_ptr <= ch3_buf_sel? ch3_pong_buf_addr : ch3_ping_buf_addr;
                            ch3_frame_ptr <= ch3_buf_sel? ch3_pong_buf_addr : ch3_ping_buf_addr;
                        end else begin
                            
                            if (ch3_interlaced && (ch3_xfer_cnt == (ch3_buf_size >> 1))) begin
                                ch3_frame_ptr <= ch3_start_ptr + ch3_btt;
                            end else begin
                                ch3_frame_ptr <= ch3_frame_ptr + ch3_addr_incr;
                            end
                            
                            ch3_xfer_cnt <= ch3_xfer_cnt + ch3_btt;
                        end
                        btt_cnt <= ch3_btt;
                        state <= ST_DATMOV_MM2S_CMD_0;
                        state_next <= ST_HANDLE_CH4;
                    end else begin
                        state <= ST_HANDLE_CH4;
                    end
                end
                
                
                ST_HANDLE_CH4: begin
                    if (~fifo_ch4_prog_full & ch4_ena) begin
                        slave_select <= CH4_FIFO_ID;
                        byte_offset <= ch4_frame_ptr;
                        if (ch4_xfer_cnt >= ch4_buf_size) begin
                            mm2s_xfer_last <= 1'b1;
                            ch4_xfer_cnt <= ch4_btt;
                            ch4_start_ptr <= ch4_buf_sel? ch4_pong_buf_addr : ch4_ping_buf_addr;
                            ch4_frame_ptr <= ch4_buf_sel? ch4_pong_buf_addr : ch4_ping_buf_addr;
                        end else begin
                            
                            if (ch4_interlaced && (ch4_xfer_cnt == (ch4_buf_size >> 1))) begin
                                ch4_frame_ptr <= ch4_start_ptr + ch4_btt;
                            end else begin
                                ch4_frame_ptr <= ch4_frame_ptr + ch4_addr_incr;
                            end
                            
                            ch4_xfer_cnt <= ch4_xfer_cnt + ch4_btt;
                        end
                        btt_cnt <= ch4_btt;
                        state <= ST_DATMOV_MM2S_CMD_0;
                        state_next <= ST_HANDLE_CH5;
                    end else begin
                        state <= ST_HANDLE_CH5;
                    end
                end
                
                
                ST_HANDLE_CH5: begin
                    if (~fifo_ch5_prog_full & ch5_ena) begin
                        slave_select <= CH5_FIFO_ID;
                        byte_offset <= ch5_frame_ptr;
                        if (ch5_xfer_cnt >= ch5_buf_size) begin
                            mm2s_xfer_last <= 1'b1;
                            ch5_xfer_cnt <= ch5_btt;
                            ch5_start_ptr <= ch5_buf_sel? ch5_pong_buf_addr : ch5_ping_buf_addr;
                            ch5_frame_ptr <= ch5_buf_sel? ch5_pong_buf_addr : ch5_ping_buf_addr;
                        end else begin
                            
                            if (ch5_interlaced && (ch5_xfer_cnt == (ch5_buf_size >> 1))) begin
                                ch5_frame_ptr <= ch5_start_ptr + ch5_btt;
                            end else begin
                                ch5_frame_ptr <= ch5_frame_ptr + ch5_addr_incr;
                            end
                            
                            ch5_xfer_cnt <= ch5_xfer_cnt + ch5_btt;
                        end
                        btt_cnt <= ch5_btt;
                        state <= ST_DATMOV_MM2S_CMD_0;
                        state_next <= ST_HANDLE_CH0;
                    end else begin
                        state <= ST_HANDLE_CH0;
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
                        mm2s_xfer_last <= 1'b0;
                        mm2s_xfer_ena <= 1'b0;
                        s_axis_mm2s_sts_tready <= 1'b1;
                        state <= ST_GET_MM2S_XFER_STAT;
                    end
                end
                
                /* Check MM2S transfer status */
                ST_GET_MM2S_XFER_STAT: begin
                    if (s_axis_mm2s_sts_tvalid) begin
                        s_axis_mm2s_sts_tready <= 1'b0;
                        dma_xfer_status <= s_axis_mm2s_sts_tdata[7:4];
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
    
    assign  stat_reg =  {
                            dma_xfer_status, state,
                            {24{1'b0}}
                        };
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
