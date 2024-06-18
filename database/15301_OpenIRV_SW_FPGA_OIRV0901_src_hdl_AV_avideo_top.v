// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: avideo_top.v
 *  Purpose:  Analog video top module.
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


module avideo_top #
(
    parameter   integer C_S_AXI_ADDR_WIDTH = 8
)
(
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *)
    input   wire    s_axi_aresetn,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLKIF, ASSOCIATED_BUSIF S_AXI_LITE, ASSOCIATED_RESET s_axi_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLKIF CLK" *)
    input   wire    s_axi_aclk,
    
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
    
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S_RSTIF RST" *)
    input   wire    s_axis_aresetn,

    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_CLKIF, ASSOCIATED_BUSIF S_AXIS, ASSOCIATED_RESET s_axis_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S_CLKIF CLK" *)
    input   wire    s_axis_aclk,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA"  *)  input   wire    [7:0]   s_axis_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *)  input   wire            s_axis_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)  output  wire            s_axis_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TUSER"  *)  input   wire            s_axis_tuser,

    (* X_INTERFACE_INFO = "AnalogDevices:user:AV:1.0 AV av_dq"  *)          output  wire    [7:0]   av_dq,
    (* X_INTERFACE_INFO = "AnalogDevices:user:AV:1.0 AV av_clk" *)          output  wire            av_clk,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *)
    output  wire    master_arst_n
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
    reg     [31:0]  back_gnd_ycbcr = 32'h00001080;  // 16-bit background color YCbCr {16'hxxxx, Y, CbCr}
    
    reg     [31:0]  cnfg_win_sp = {32{1'b1}};       // 16-bit X and Y values for start point coordinates
    reg     [31:0]  cnfg_win_ep = {32{1'b1}};       // 16-bit X and Y values for end point coordinates
    
    
    always @(posedge s_axi_aclk) begin
        if (~s_axi_aresetn) begin
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
                        
                        6'd0 : ctrl_reg[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ctrl_reg[i*8 +: 8];
                     /* 6'd1 : read only register */
                        6'd2 : back_gnd_ycbcr[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : back_gnd_ycbcr[i*8 +: 8];
                        
                        6'd3 : cnfg_win_sp[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : cnfg_win_sp[i*8 +: 8];
                        6'd4 : cnfg_win_ep[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : cnfg_win_ep[i*8 +: 8];
                        
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
                s_axi_rvalid <= 1'b1;
                s_axi_rresp  <= AXI_RESP_OKAY;
            end else begin
                if (s_axi_rvalid & s_axi_rready) begin
                    s_axi_rvalid <= 1'b0;
                end
            end
            
            /* Read data */
            if (~s_axi_rvalid & s_axi_arready & s_axi_arvalid) begin
                case (axi_araddr[7:2])
                    6'd0 : s_axi_rdata <= ctrl_reg;
                    6'd1 : s_axi_rdata <= stat_reg;
                    6'd2 : s_axi_rdata <= back_gnd_ycbcr;
                    
                    6'd3 : s_axi_rdata <= cnfg_win_sp;
                    6'd4 : s_axi_rdata <= cnfg_win_ep;
                    
                    default: s_axi_rdata <= 32'hABADC0DE;
                endcase
            end
        end
    end
    
    
    assign          master_arst_n = ctrl_reg[31];
    wire    [1:0]   av_mode       = ctrl_reg[1:0];
    assign          stat_reg      = 32'hDEADFACE;
    wire    [15:0]  win_sp_x      = cnfg_win_sp[31:16];
    wire    [15:0]  win_sp_y      = cnfg_win_sp[15:0];
    wire    [15:0]  win_ep_x      = cnfg_win_ep[31:16];
    wire    [15:0]  win_ep_y      = cnfg_win_ep[15:0];
    wire    [7:0]   back_gnd_y    = back_gnd_ycbcr[15:8];
    wire    [7:0]   back_gnd_cbcr = back_gnd_ycbcr[7:0];
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire            pix_clk = s_axis_aclk;
    
    wire            din_rdy;
    wire    [10:0]  vcnt;
    wire    [10:0]  hcnt;
    
    
    reg     force_read = 1'b0;
    
    wire    exp_eof = ((hcnt == win_ep_x) && (vcnt == win_ep_y));
    wire    eof  = (s_axis_tvalid & s_axis_tready & s_axis_tuser);
    
    always @(posedge pix_clk) begin
        if (exp_eof & ~eof & ~force_read) begin
            force_read <= 1'b1;
        end else begin
            if (eof) begin
                force_read <= 1'b0;
            end
        end
    end
    
    
    reg     act_win = 1'b0;

    always @(*) begin
        if (din_rdy && (hcnt >= win_sp_x) && (hcnt <= win_ep_x) && (vcnt >= win_sp_y) && (vcnt <= win_ep_y)) begin
            act_win = 1'b1;
        end else begin
            act_win = 1'b0;
        end
    end
    
    
    reg     [7:0]   bg;
    
    always @(posedge pix_clk) begin
        if (din_rdy) begin
            bg <= (bg == back_gnd_ycbcr)? back_gnd_y : back_gnd_ycbcr;
        end else begin
            bg <= back_gnd_ycbcr;
        end
    end
    
    
    av_timing av_timing
    (
        .clk        ( pix_clk                       ), 
        .resetn     ( s_axis_aresetn                ), 
        .mode       ( av_mode                       ), 
        .din_rdy    ( din_rdy                       ), 
        .vcnt       ( vcnt                          ), 
        .hcnt       ( hcnt                          ), 
        .din        ( (act_win)? s_axis_tdata : bg  ), 
        .dout       ( av_dq                         )
    );
    
    assign s_axis_tready = force_read | act_win;

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    ODDR #
    (
        .DDR_CLK_EDGE   ( "OPPOSITE_EDGE" ),    // "OPPOSITE_EDGE" or "SAME_EDGE"
        .INIT           ( 1'b0            ),    // Initial value of Q: 1'b0 or 1'b1
        .SRTYPE         ( "ASYNC"         )     // Set/Reset type: "SYNC" or "ASYNC"
    )
    ODDR_ifclk
    (
        .Q  ( av_clk         ),     // 1-bit DDR output
        .C  ( pix_clk        ),     // 1-bit clock input
        .CE ( s_axis_aresetn ),     // 1-bit clock enable input
        .D1 ( 1'b0           ),     // 1-bit data input (positive edge)
        .D2 ( 1'b1           ),     // 1-bit data input (negative edge)
        .R  ( 1'b0           ),     // 1-bit reset
        .S  ( 1'b0           )      // 1-bit set
    );
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
