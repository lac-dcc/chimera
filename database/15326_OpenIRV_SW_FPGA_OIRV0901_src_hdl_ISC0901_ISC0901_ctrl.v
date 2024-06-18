// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: ISC0901_ctrl.v
 *  Purpose:  ISC0901 control and data management module.
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


module ISC0901_ctrl #
(
    parameter   integer C_S_AXI_ADDR_WIDTH = 8
)
(
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *)
    input   wire            axi_aresetn,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLKIF, ASSOCIATED_BUSIF S_AXI_LITE:S_AXIS_RTEMP:M_AXIS_BIAS:M_AXIS_SENSOR_CMD:S_AXIS_MM2S:M_AXIS_S2MM:M_AXIS_MM2S_CMD:S_AXIS_MM2S_STS:M_AXIS_S2MM_CMD:S_AXIS_S2MM_STS, ASSOCIATED_RESET axi_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLKIF CLK" *)
    input   wire            axi_aclk,
    
    input   wire            sof_strb,
    input   wire            eol_strb,
    
    input   wire            fifo_bias_prog_full,
    
    output  wire            sensor_rstn,
    output  wire            sensor_bias_volt_sel,
    output  wire            sensor_bias_boost_pwr_ena,
    output  wire            sensor_bias_pwr_ena,
    output  wire            sensor_core_pwr_ena,
    output  wire            sensor_io_pwr_ena_n,
    
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
    
    /* Slave AXIS sensor row temperature/feedback ??? */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_RTEMP, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RTEMP TDATA"  *)        input   wire    [31:0]  s_axis_rtemp_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RTEMP TVALID" *)        input   wire            s_axis_rtemp_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RTEMP TREADY" *)        output  wire            s_axis_rtemp_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RTEMP TLAST"  *)        input   wire            s_axis_rtemp_tlast,

    /* Master AXIS sensor bias row */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_BIAS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_BIAS TDATA"  *)         output  wire    [31:0]  m_axis_bias_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_BIAS TVALID" *)         output  wire            m_axis_bias_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_BIAS TREADY" *)         input   wire            m_axis_bias_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_BIAS TLAST"  *)         output  wire            m_axis_bias_tlast,
    
    /* Master AXIS sensor command */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_SENSOR_CMD, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_SENSOR_CMD TDATA"  *)   output  wire    [31:0]  m_axis_sensor_cmd_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_SENSOR_CMD TVALID" *)   output  wire            m_axis_sensor_cmd_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_SENSOR_CMD TREADY" *)   input   wire            m_axis_sensor_cmd_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_SENSOR_CMD TLAST"  *)   output  wire            m_axis_sensor_cmd_tlast,
    
    /* DataMover MM2S (read from memory) */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_MM2S, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S TDATA"  *)         input   wire    [31:0]  s_axis_mm2s_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S TKEEP"  *)         input   wire    [3:0]   s_axis_mm2s_tkeep,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S TVALID" *)         input   wire            s_axis_mm2s_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S TREADY" *)         output  wire            s_axis_mm2s_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_MM2S TLAST"  *)         input   wire            s_axis_mm2s_tlast,
    
    /* DataMover S2MM (write to memory) */
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_S2MM, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_S2MM TDATA"  *)         output  wire    [31:0]  m_axis_s2mm_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_S2MM TKEEP"  *)         output  wire    [3:0]   m_axis_s2mm_tkeep,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_S2MM TVALID" *)         output  wire            m_axis_s2mm_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_S2MM TREADY" *)         input   wire            m_axis_s2mm_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_S2MM TLAST"  *)         output  wire            m_axis_s2mm_tlast,
    
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
    reg     [31:0]  bias_buf_addr   = {32{1'b0}};
    reg     [31:0]  rtemp_buf_addr  = {32{1'b0}};
    reg     [31:0]  cmd_buf_addr    = {32{1'b0}};
    
    reg     [31:0]  bias_btt  = {32{1'b0}};
    reg     [31:0]  rtemp_btt = {32{1'b0}};
    reg     [31:0]  cmd_btt   = {32{1'b0}};
    
    
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
                    case (axi_awaddr[6:2])
                        
                        5'd0 : ctrl_reg[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ctrl_reg[i*8 +: 8];
                        
                        5'd1 : bias_buf_addr  [i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : bias_buf_addr  [i*8 +: 8];
                        5'd2 : rtemp_buf_addr [i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : rtemp_buf_addr [i*8 +: 8];
                        5'd3 : cmd_buf_addr   [i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : cmd_buf_addr   [i*8 +: 8];
                        
                        5'd4 : bias_btt [i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : bias_btt [i*8 +: 8];
                        5'd5 : rtemp_btt[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : rtemp_btt[i*8 +: 8];
                        5'd6 : cmd_btt  [i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : cmd_btt  [i*8 +: 8];
                        
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
                case (axi_araddr[6:2])
                    5'd0 : s_axi_rdata <= ctrl_reg;
                    
                    5'd1 : s_axi_rdata <= bias_buf_addr;
                    5'd2 : s_axi_rdata <= rtemp_buf_addr;
                    5'd3 : s_axi_rdata <= cmd_buf_addr;
                    
                    5'd4 : s_axi_rdata <= bias_btt;
                    5'd5 : s_axi_rdata <= rtemp_btt;
                    5'd6 : s_axi_rdata <= cmd_btt;
                    
                    default: s_axi_rdata <= 32'hABADC0DE;
                endcase
            end
        end
    end
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/

    localparam  [3:0]   DMA_XFER_OKAY       = 4'b1000,
                        DMA_XFER_SLVERR     = 4'b0100,
                        DMA_XFER_DECERR     = 4'b0010,
                        DMA_XFER_INTERR     = 4'b0001;
    
    localparam          BIAS_ROW_FIFO_ID    = 1'b0,
                        SENSOR_CMD_ID       = 1'b1;
    
    // S2MM
    reg             s2mm_xfer_ena = 1'b0;
    
    assign  m_axis_s2mm_tkeep   = {4{1'b1}};
    assign  m_axis_s2mm_tdata   = s_axis_rtemp_tdata;
    assign  m_axis_s2mm_tlast   = s_axis_rtemp_tlast;
    assign  m_axis_s2mm_tvalid  = s_axis_rtemp_tvalid & s2mm_xfer_ena;
    assign  s_axis_rtemp_tready = s2mm_xfer_ena & m_axis_s2mm_tready;
    
    // MM2S
    reg     mm2s_xfer_ena = 1'b0;
    reg     slave_select  = 1'b0;
    
    assign  m_axis_bias_tdata        = s_axis_mm2s_tdata;
    assign  m_axis_bias_tvalid       = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == BIAS_ROW_FIFO_ID);
    assign  m_axis_bias_tlast        = s_axis_mm2s_tlast;
    
    assign  m_axis_sensor_cmd_tdata  = s_axis_mm2s_tdata;
    assign  m_axis_sensor_cmd_tvalid = s_axis_mm2s_tvalid & mm2s_xfer_ena & (slave_select == SENSOR_CMD_ID);
    assign  m_axis_sensor_cmd_tlast  = s_axis_mm2s_tlast;
    
    
    reg slave_axis_tready;
    
    always @(*) begin
        (* parallel_case *)
        case (slave_select)
            BIAS_ROW_FIFO_ID:   slave_axis_tready = m_axis_bias_tready;
            SENSOR_CMD_ID:      slave_axis_tready = m_axis_sensor_cmd_tready;
        endcase
    end
    
    assign  s_axis_mm2s_tready = slave_axis_tready & mm2s_xfer_ena;

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    /* Main data streaming module. Current FSM manages
     * data movement by AXI-DataMover IP-core */
    
    localparam  [3:0]   ST_ERROR              = 4'd0,
                        ST_RESET              = 4'd1,
                        
                        ST_WAIT_EOL           = 4'd2,
                        ST_SEND_BIAS_ROW      = 4'd3,
                        ST_GET_ROW_TEMP       = 4'd4,
                        ST_SEND_SENSOR_CMD    = 4'd5,
                        
                        ST_DATMOV_S2MM_CMD_0  = 4'd6,
                        ST_DATMOV_S2MM_CMD_1  = 4'd7,
                        ST_DATMOV_S2MM_XFER   = 4'd8,
                        ST_GET_S2MM_XFER_STAT = 4'd9,
                        
                        ST_DATMOV_MM2S_CMD_0  = 4'd10,
                        ST_DATMOV_MM2S_CMD_1  = 4'd11,
                        ST_DATMOV_MM2S_XFER   = 4'd12,
                        ST_GET_MM2S_XFER_STAT = 4'd13;
    
    reg         [3:0]   state       = ST_RESET;
    reg         [3:0]   state_next  = ST_RESET;
    
    reg                 eol_flag = 1'b0;
    
    reg         [31:0]  rtemp_frame_ptr = {32{1'b0}};
    reg         [31:0]  bias_frame_ptr  = {32{1'b0}};
    
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
                bias_frame_ptr  <= bias_buf_addr;
                rtemp_frame_ptr <= rtemp_buf_addr;
                
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
                        state <= ST_WAIT_EOL;
                    end
                end
                
                
                ST_WAIT_EOL: begin
                    if (eol_flag) begin
                        eol_flag <= 1'b0;
                        state <= ST_SEND_BIAS_ROW;
                    end
                end
                
                
                ST_SEND_BIAS_ROW: begin
                    if (~fifo_bias_prog_full) begin
                        slave_select <= BIAS_ROW_FIFO_ID;     
                        byte_offset <= bias_frame_ptr;       
                        bias_frame_ptr <= bias_frame_ptr + bias_btt;
                        btt_cnt <= bias_btt[22:0];
                        state <= ST_DATMOV_MM2S_CMD_0;
                        state_next <= ST_GET_ROW_TEMP;
                    end else begin
                        state <= ST_GET_ROW_TEMP;
                    end
                end
                
                
                ST_GET_ROW_TEMP: begin
                    if (s_axis_rtemp_tvalid) begin
                        byte_offset <= rtemp_frame_ptr;
                        rtemp_frame_ptr <= rtemp_frame_ptr + rtemp_btt;
                        btt_cnt <= rtemp_btt[22:0];
                        state <= ST_DATMOV_S2MM_CMD_0;
                        state_next <= ST_SEND_SENSOR_CMD;
                    end else begin
                        state <= ST_SEND_SENSOR_CMD;
                    end
                end
                
                
                ST_SEND_SENSOR_CMD: begin
                    slave_select <= SENSOR_CMD_ID;
                    byte_offset <= cmd_buf_addr;
                    btt_cnt <= cmd_btt[22:0];
                    state <= ST_DATMOV_MM2S_CMD_0;
                    state_next <= ST_WAIT_EOL;                    
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
    
    assign sensor_bias_volt_sel      =  ctrl_reg[1];
    assign sensor_bias_boost_pwr_ena =  ctrl_reg[2];
    assign sensor_bias_pwr_ena       =  ctrl_reg[3];
    assign sensor_core_pwr_ena       =  ctrl_reg[4];
    assign sensor_io_pwr_ena_n       = ~ctrl_reg[5];
    assign sensor_rstn               =  ctrl_reg[6];
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
