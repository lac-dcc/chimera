/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: fx2lp_master.v
 *  Purpose:  USB UVC top module.
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


module fx2lp_master #
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
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)  output  reg             s_axis_tready = 1'b0,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TUSER"  *)  input   wire            s_axis_tuser,
    
    (* X_INTERFACE_INFO = "Cypress:user:SFIFO:1.0 SFIFO sfifo_arst_n"   *)  input   wire            sfifo_arst_n,
    (* X_INTERFACE_INFO = "Cypress:user:SFIFO:1.0 SFIFO sfifo_ifclk"    *)  output  wire            sfifo_ifclk,
    (* X_INTERFACE_INFO = "Cypress:user:SFIFO:1.0 SFIFO sfifo_dq"       *)  output  wire    [7:0]   sfifo_dq,
    (* X_INTERFACE_INFO = "Cypress:user:SFIFO:1.0 SFIFO sfifo_addr"     *)  output  wire    [1:0]   sfifo_addr,
    (* X_INTERFACE_INFO = "Cypress:user:SFIFO:1.0 SFIFO sfifo_slrd_n"   *)  output  wire            sfifo_slrd_n,
    (* X_INTERFACE_INFO = "Cypress:user:SFIFO:1.0 SFIFO sfifo_slwr_n"   *)  output  wire            sfifo_slwr_n,
    (* X_INTERFACE_INFO = "Cypress:user:SFIFO:1.0 SFIFO sfifo_sloe_n"   *)  output  wire            sfifo_sloe_n,
    (* X_INTERFACE_INFO = "Cypress:user:SFIFO:1.0 SFIFO sfifo_pktend_n" *)  output  wire            sfifo_pktend_n,
    (* X_INTERFACE_INFO = "Cypress:user:SFIFO:1.0 SFIFO sfifo_flag_a"   *)  input   wire            sfifo_flag_a,
    (* X_INTERFACE_INFO = "Cypress:user:SFIFO:1.0 SFIFO sfifo_flag_b"   *)  input   wire            sfifo_flag_b,
    (* X_INTERFACE_INFO = "Cypress:user:SFIFO:1.0 SFIFO sfifo_flag_c"   *)  input   wire            sfifo_flag_c,
    (* X_INTERFACE_INFO = "Cypress:user:SFIFO:1.0 SFIFO sfifo_flag_d"   *)  input   wire            sfifo_flag_d,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *)
    output  wire    master_arst_n
);

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  UVC_HEADER_SIZE = 2;
    
    localparam  [1:0]   EP2_FIFO_ADDR = 2'b00,
                        EP4_FIFO_ADDR = 2'b01,
                        EP6_FIFO_ADDR = 2'b10,
                        EP8_FIFO_ADDR = 2'b11;
    
    localparam  [7:0]   HDR_FID_BIT = 8'h01,    // Frame identifier (toggles each frame start boundary)
                        HDR_EOF_BIT = 8'h02,    // End of frame (should be set for the last frame packet header)
                        HDR_PTS_BIT = 8'h04,    // PTS (Presentation Time Stamp) is present
                        HDR_SCR_BIT = 8'h08,    // SCR (Source Clock Reference) is present
                        HDR_RES_BIT = 8'h10,    // Reserved (should be zero)
                        HDR_STI_BIT = 8'h20,    // Still image
                        HDR_ERR_BIT = 8'h40,    // Error bit
                        HDR_EOH_BIT = 8'h80;    // End of header

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
    
    reg     [31:0]  ch_config = {32{1'b0}};
    
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
                        6'd2 : ch_config[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch_config[i*8 +: 8];
                        
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
                    6'd2 : s_axi_rdata <= ch_config;
                    
                    default: s_axi_rdata <= 32'hABADC0DE;
                endcase
            end
        end
    end
    
    
    assign          master_arst_n = ctrl_reg[31];
    wire    [15:0]  img_res_x     = ch_config[15:0];
    wire    [15:0]  img_res_y     = ch_config[31:16];
    assign          stat_reg      = 32'hDEADFACE;
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire    sfifo_rst_n;
    
    sync_cdc_bit #
    (
        .C_SYNC_STAGES (3)
    )
    sync_cdc_bit_inst
    (
        .clk ( s_axis_aclk  ),
        .d   ( sfifo_arst_n ),
        .q   ( sfifo_rst_n  )
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  [2:0]   ST_RST          = 3'd0,
                        ST_WAIT_EOF     = 3'd1,
                        ST_IDLE         = 3'd2,
                        ST_UVC_HEADER   = 3'd3,
                        ST_DATA         = 3'd4,
                        ST_STOP         = 3'd5,
                        ST_DELAY        = 3'd6;
    
    reg     [2:0]   state = ST_RST;
    reg     [7:0]   hdr_cnt   = 8'd0;
    reg     [15:0]  burst_cnt = 16'd0;
    reg     [15:0]  line_cnt  = 16'd0;
    
    reg             hdr_fid  = 1'b0;
    reg             hdr_eof  = 1'b0;
    reg     [3:0]   hdb_byte = 4'h0;
    
    reg             slwr_n = 1'b1;
    reg             pktend_n = 1'b1;
    reg     [7:0]   dq = 8'h00;
    
    wire    fx2_fifo_empty = ~sfifo_flag_a;
    wire    fx2_fifo_full  = ~sfifo_flag_b;
    
    
    always @(posedge s_axis_aclk) begin
        if (~s_axis_aresetn | ~sfifo_rst_n) begin
            slwr_n        <= 1'b1;
            pktend_n      <= 1'b1;
            s_axis_tready <= 1'b0;
            state <= ST_RST;
        end else begin
            case (state)
            
                ST_RST: begin
                    hdr_fid       <= 1'b0;
                    hdr_eof       <= 1'b0;
                    slwr_n        <= 1'b1;
                    s_axis_tready <= 1'b0;
                    line_cnt      <= img_res_y;
                    
                    if (fx2_fifo_empty) begin
                        pktend_n <= 1'b1;
                        state <= ST_WAIT_EOF;
                    end else begin
                        pktend_n <= 1'b0;
                    end
                end
                
                ST_WAIT_EOF: begin
                    if (s_axis_tvalid & s_axis_tready & s_axis_tuser) begin
                        s_axis_tready <= 1'b0;
                        state <= ST_IDLE;
                    end else begin
                        s_axis_tready <= 1'b1;
                    end
                end
                
                ST_IDLE: begin
                    slwr_n   <= 1'b1;
                    pktend_n <= 1'b1;
                    
                    if (fx2_fifo_empty) begin
                        hdr_cnt <= 8'd0;
                        state <= ST_UVC_HEADER;
                    end
                end
                
                ST_UVC_HEADER: begin
                    case (hdr_cnt)
                        8'd0: dq <= UVC_HEADER_SIZE;
                    
                        8'd1: begin
                            dq <= HDR_EOH_BIT | (hdr_eof? HDR_EOF_BIT : 1'b0) | (hdr_fid? HDR_FID_BIT : 1'b0);
                            hdr_eof <= 1'b0;
                        end
                        
                        default: dq <= 8'h00;
                    endcase
                    
                    if (hdr_cnt == UVC_HEADER_SIZE) begin
                        slwr_n <= 1'b1;
                        s_axis_tready <= 1'b1;
                        burst_cnt <= img_res_x << 1;    // YUYV 4:2:2 mode, i.e. two bytes per pixel
                        state     <= ST_DATA;
                    end else begin
                        slwr_n <= 1'b0;
                        hdr_cnt <= hdr_cnt + 1'b1;
                    end
                end
                
                ST_DATA: begin
                    dq     <= s_axis_tdata;
                    slwr_n <= ~(s_axis_tvalid & s_axis_tready);
                    
                    if (s_axis_tvalid & s_axis_tready) begin
                        if (burst_cnt > 16'd1) begin
                            burst_cnt <= burst_cnt - 1'b1;
                        end else begin
                            line_cnt <= line_cnt - 1'b1;
                            pktend_n <= 1'b0;
                            s_axis_tready <= 1'b0;
                            state <= ST_STOP;
                        end
                    end
                end
                
                ST_STOP: begin
                    slwr_n   <= 1'b1;
                    pktend_n <= 1'b1;
                    s_axis_tready <= 1'b0;
                    
                    if (line_cnt == 16'd1) begin
                        hdr_eof <= 1'b1;
                    end else begin
                        if (line_cnt == 16'd0) begin
                            hdr_fid <= ~hdr_fid;
                            line_cnt <= img_res_y;
                        end
                    end
                    
                    state <= ST_IDLE;
                end
                
                default: begin
                    state <= ST_RST;
                end
                
            endcase
        end
    end
    
    
    assign sfifo_dq       = dq;
    assign sfifo_addr     = EP2_FIFO_ADDR;
    assign sfifo_slrd_n   = 1'b1;
    assign sfifo_slwr_n   = slwr_n;
    assign sfifo_sloe_n   = 1'b1;
    assign sfifo_pktend_n = pktend_n;
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    ODDR #
    (
        .DDR_CLK_EDGE   ( "OPPOSITE_EDGE" ),    // "OPPOSITE_EDGE" or "SAME_EDGE"
        .INIT           ( 1'b0            ),    // Initial value of Q: 1'b0 or 1'b1
        .SRTYPE         ( "ASYNC"         )     // Set/Reset type: "SYNC" or "ASYNC"
    )
    ODDR_ifclk
    (
        .Q  ( sfifo_ifclk    ),     // 1-bit DDR output
        .C  ( s_axis_aclk    ),     // 1-bit clock input
        .CE ( s_axis_aresetn ),     // 1-bit clock enable input
        .D1 ( 1'b0           ),     // 1-bit data input (positive edge)
        .D2 ( 1'b1           ),     // 1-bit data input (negative edge)
        .R  ( 1'b0           ),     // 1-bit reset
        .S  ( 1'b0           )      // 1-bit set
    );
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
