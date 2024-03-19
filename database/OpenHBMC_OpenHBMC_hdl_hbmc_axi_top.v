/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenHBMC
 *  Filename: hbmc_axi_top.v
 *  Purpose:  HyperBus memory controller AXI4 wrapper top module.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020-2022, Vaagn Oganesyan <ovgn@protonmail.com>
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
 *  limitations under the License.
 * ----------------------------------------------------------------------------
 */


`default_nettype none
`timescale 1ps / 1ps


module hbmc_axi_top #
(
    parameter integer C_S_AXI_ID_WIDTH     = 1,
    parameter integer C_S_AXI_DATA_WIDTH   = 32,
    parameter integer C_S_AXI_ADDR_WIDTH   = 32,
    parameter integer C_S_AXI_AWUSER_WIDTH = 0,
    parameter integer C_S_AXI_ARUSER_WIDTH = 0,
    parameter integer C_S_AXI_WUSER_WIDTH  = 0,
    parameter integer C_S_AXI_RUSER_WIDTH  = 0,
    parameter integer C_S_AXI_BUSER_WIDTH  = 0,
    
    parameter integer C_HBMC_CLOCK_HZ            = 166000000,
    parameter integer C_HBMC_FPGA_DRIVE_STRENGTH = 8,
    parameter         C_HBMC_FPGA_SLEW_RATE      = "SLOW",
    parameter integer C_HBMC_MEM_DRIVE_STRENGTH  = 46,
    parameter integer C_HBMC_CS_MAX_LOW_TIME_US  = 4,
    parameter         C_HBMC_FIXED_LATENCY       = 0,
    parameter integer C_ISERDES_CLOCKING_MODE    = 0,
    
    parameter         C_IDELAYCTRL_INTEGRATED    = 0,
    parameter         C_IODELAY_GROUP_ID         = "HBMC",
    parameter real    C_IODELAY_REFCLK_MHZ       = 200.0,
    
    parameter         C_RWDS_USE_IDELAY = 0,
    parameter         C_DQ7_USE_IDELAY  = 0,
    parameter         C_DQ6_USE_IDELAY  = 0,
    parameter         C_DQ5_USE_IDELAY  = 0,
    parameter         C_DQ4_USE_IDELAY  = 0,
    parameter         C_DQ3_USE_IDELAY  = 0,
    parameter         C_DQ2_USE_IDELAY  = 0,
    parameter         C_DQ1_USE_IDELAY  = 0,
    parameter         C_DQ0_USE_IDELAY  = 0,
    
    parameter [4:0]   C_RWDS_IDELAY_TAPS_VALUE = 0,
    parameter [4:0]   C_DQ7_IDELAY_TAPS_VALUE  = 0,
    parameter [4:0]   C_DQ6_IDELAY_TAPS_VALUE  = 0,
    parameter [4:0]   C_DQ5_IDELAY_TAPS_VALUE  = 0,
    parameter [4:0]   C_DQ4_IDELAY_TAPS_VALUE  = 0,
    parameter [4:0]   C_DQ3_IDELAY_TAPS_VALUE  = 0,
    parameter [4:0]   C_DQ2_IDELAY_TAPS_VALUE  = 0,
    parameter [4:0]   C_DQ1_IDELAY_TAPS_VALUE  = 0,
    parameter [4:0]   C_DQ0_IDELAY_TAPS_VALUE  = 0
)
(
    input   wire                                clk_hbmc_0,
    input   wire                                clk_hbmc_90,
    input   wire                                clk_iserdes,
    input   wire                                clk_idelay_ref,

    input   wire                                s_axi_aclk,
    input   wire                                s_axi_aresetn,

    /* AXI4 Slave Interface Write Address Ports */
    input   wire    [C_S_AXI_ID_WIDTH-1:0]      s_axi_awid,
    input   wire    [C_S_AXI_ADDR_WIDTH-1:0]    s_axi_awaddr,
    input   wire    [7:0]                       s_axi_awlen,
    input   wire    [2:0]                       s_axi_awsize,
    input   wire    [1:0]                       s_axi_awburst,
    input   wire    [C_S_AXI_AWUSER_WIDTH-1:0]  s_axi_awuser,   // unused
    input   wire                                s_axi_awlock,   // unused
    input   wire    [3:0]                       s_axi_awregion, // unused
    input   wire    [3:0]                       s_axi_awcache,  // unused
    input   wire    [3:0]                       s_axi_awqos,    // unused
    input   wire    [2:0]                       s_axi_awprot,   // unused
    input   wire                                s_axi_awvalid,
    output  reg                                 s_axi_awready,

    /* AXI4 Slave Interface Write Data Ports */
    input   wire    [C_S_AXI_DATA_WIDTH-1:0]    s_axi_wdata,
    input   wire    [C_S_AXI_DATA_WIDTH/8-1:0]  s_axi_wstrb,
    input   wire    [C_S_AXI_WUSER_WIDTH-1:0]   s_axi_wuser,    // unused
    input   wire                                s_axi_wlast,
    input   wire                                s_axi_wvalid,
    output  wire                                s_axi_wready,

    /* AXI4 Slave Interface Write Response Ports */
    output  reg     [C_S_AXI_ID_WIDTH-1:0]      s_axi_bid,
    output  wire    [C_S_AXI_BUSER_WIDTH-1:0]   s_axi_buser,    // unused
    output  wire    [1:0]                       s_axi_bresp,
    output  reg                                 s_axi_bvalid,
    input   wire                                s_axi_bready,

    /* AXI4 Interface Read Address Ports */
    input   wire    [C_S_AXI_ID_WIDTH-1:0]      s_axi_arid,
    input   wire    [C_S_AXI_ADDR_WIDTH-1:0]    s_axi_araddr,
    input   wire    [7:0]                       s_axi_arlen,
    input   wire    [2:0]                       s_axi_arsize,
    input   wire    [1:0]                       s_axi_arburst,
    input   wire    [C_S_AXI_ARUSER_WIDTH-1:0]  s_axi_aruser,   // unused
    input   wire                                s_axi_arlock,   // unused
    input   wire    [3:0]                       s_axi_arregion, // unused
    input   wire    [3:0]                       s_axi_arcache,  // unused
    input   wire    [3:0]                       s_axi_arqos,    // unused
    input   wire    [2:0]                       s_axi_arprot,   // unused
    input   wire                                s_axi_arvalid,
    output  reg                                 s_axi_arready,

    /* AXI4 Slave Interface Read Data Ports */
    output  reg     [C_S_AXI_ID_WIDTH-1:0]      s_axi_rid,
    output  wire    [C_S_AXI_DATA_WIDTH-1:0]    s_axi_rdata,
    output  wire    [C_S_AXI_RUSER_WIDTH-1:0]   s_axi_ruser,    // unused
    output  wire    [1:0]                       s_axi_rresp,
    output  wire                                s_axi_rlast,
    output  wire                                s_axi_rvalid,
    input   wire                                s_axi_rready,

    /* HyperBus Interface Port */
    output  wire                                hb_ck_p,
    output  wire                                hb_ck_n,
    output  wire                                hb_reset_n,
    output  wire                                hb_cs_n,
    inout   wire                                hb_rwds,
    inout   wire    [7:0]                       hb_dq
);
    
/*----------------------------------------------------------------------------------------------------------------------------*/

    /* Checking input parameters */

    generate
        /* Supported AXI4 data bus width is 16/32/64 bit only. */
        if ((C_S_AXI_DATA_WIDTH != 16) && (C_S_AXI_DATA_WIDTH != 32) && (C_S_AXI_DATA_WIDTH != 64)) begin
            INVALID_PARAMETER invalid_parameter_msg();
        end
    endgenerate

/*----------------------------------------------------------------------------------------------------------------------------*/

    function integer clog2;
        input integer value;
              integer temp;
        begin
            temp = value;
            for (clog2 = 0; temp > 1; clog2 = clog2 + 1) begin
                temp = temp >> 1;
            end
        end
    endfunction

/*----------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  [C_S_AXI_ADDR_WIDTH - 1:0]  AXI_ADDR_ALIGN_MASK = (C_S_AXI_DATA_WIDTH == 16)? {{C_S_AXI_ADDR_WIDTH - 1{1'b1}}, {1{1'b0}}} :
                                                                  (C_S_AXI_DATA_WIDTH == 32)? {{C_S_AXI_ADDR_WIDTH - 2{1'b1}}, {2{1'b0}}} :
                                                                  (C_S_AXI_DATA_WIDTH == 64)? {{C_S_AXI_ADDR_WIDTH - 3{1'b1}}, {3{1'b0}}} : {C_S_AXI_ADDR_WIDTH{1'b1}};
    
    localparam  AXI_FIXD_BURST  = 2'b00,
                AXI_INCR_BURST  = 2'b01,
                AXI_WRAP_BURST  = 2'b10;
    
    localparam  AXI_RESP_OKAY   = 2'b00,
                AXI_RESP_EXOKAY = 2'b01,
                AXI_RESP_SLVERR = 2'b10,
                AXI_RESP_DECERR = 2'b11;
    
    localparam  NO_REQ    = 2'b00,
                WR_REQ    = 2'b01,
                RD_REQ    = 2'b10,
                WR_RD_REQ = 2'b11;
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    reg             s_axi_areset;
    
    wire            idelayctrl_rdy_sync;
    wire            clk_idelay;
    
    
    /* HBMC command interface */
    reg             cmd_req;
    reg     [31:0]  cmd_mem_addr;
    reg     [15:0]  cmd_word_cnt;
    reg             cmd_wr_not_rd;
    reg             cmd_wrap_not_incr;
    wire            cmd_ack;
    
    
    /* Transfer state flags */
    reg             wr_xfer_done;
    reg             rd_xfer_done;
    
    reg     [11:0]  wr_data_pkt_cnt;
    
    wire            rd_addr_done     = s_axi_arvalid & s_axi_arready;
    wire            rd_data_done     = s_axi_rvalid  & s_axi_rready & s_axi_rlast;
    
    wire            wr_addr_done     = s_axi_awvalid & s_axi_awready;
    wire            wr_data_done     = s_axi_wvalid  & s_axi_wready & s_axi_wlast;
    wire            wr_resp_done     = s_axi_bvalid  & s_axi_bready;
    wire            wr_data_pending  = (wr_data_pkt_cnt > {12{1'b0}});
    
    wire            axi_wr_condition = s_axi_awvalid & wr_xfer_done & wr_data_pending;
    wire            axi_rd_condition = s_axi_arvalid & rd_xfer_done;
    
    
    /* Upstream FIFO wires */
    wire    [15:0]                      ufifo_wr_data;
    wire                                ufifo_wr_last;
    wire                                ufifo_wr_ena;
    wire    [C_S_AXI_DATA_WIDTH-1:0]    ufifo_rd_dout;
    wire    [9:0]                       ufifo_rd_free;
    wire                                ufifo_rd_last;
    wire                                ufifo_rd_ena = s_axi_rvalid & s_axi_rready;
    wire                                ufifo_rd_empty;
    
    
    /* Downstream FIFO wires */
    wire    [15:0]                      dfifo_rd_data;
    wire    [1:0]                       dfifo_rd_strb;
    wire                                dfifo_rd_ena;
    wire    [C_S_AXI_DATA_WIDTH-1:0]    dfifo_wr_din  = s_axi_wdata;
    wire    [C_S_AXI_DATA_WIDTH/8-1:0]  dfifo_wr_strb = s_axi_wstrb;
    wire                                dfifo_wr_ena  = s_axi_wvalid & s_axi_wready;
    wire                                dfifo_wr_full;
    
    
    wire    [C_S_AXI_ADDR_WIDTH - 1:0]  axi_awaddr_aligned = s_axi_awaddr & AXI_ADDR_ALIGN_MASK;
    wire    [C_S_AXI_ADDR_WIDTH - 1:0]  axi_araddr_aligned = s_axi_araddr & AXI_ADDR_ALIGN_MASK;
    
    
    assign  s_axi_rresp   = AXI_RESP_OKAY;
    assign  s_axi_rdata   =  ufifo_rd_dout;
    assign  s_axi_rlast   =  ufifo_rd_last;
    assign  s_axi_rvalid  = ~ufifo_rd_empty;
    
    assign  s_axi_wready  = ~dfifo_wr_full;
    assign  s_axi_bresp   = AXI_RESP_OKAY;
    
    generate
        if (C_S_AXI_BUSER_WIDTH > 0) begin
            assign s_axi_buser = {C_S_AXI_BUSER_WIDTH{1'b0}};
            assign s_axi_ruser = {C_S_AXI_RUSER_WIDTH{1'b0}};
        end
    endgenerate
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    /* AXI active low polarity reset inversion.
     * Positive reset polarity removes useless
     * LUT-based reset inverters, as all FPGA's
     * primitives have positive reset polarity.
     * This also improves timings. */
    always @(posedge s_axi_aclk or negedge s_axi_aresetn) begin
        if (~s_axi_aresetn) begin
            s_axi_areset <= 1'b1;
        end else begin
            s_axi_areset <= 1'b0;
        end
    end

/*----------------------------------------------------------------------------------------------------------------------------*/

    generate
        if (C_IDELAYCTRL_INTEGRATED) begin
            
            wire    idelayctrl_rdy;
            wire    idelayctrl_rst;
    
    
            hbmc_arst_sync #
            (
                /* Current module requires min
                 * 60ns of reset pulse width,
                 * 32 stage synchronizer will
                 * be enough for AXI clock
                 * frequencies < 500MHz */
                .C_SYNC_STAGES ( 32 )
            )
            hbmc_arst_sync_idelayctrl
            (
                .clk   ( s_axi_aclk     ),
                .arst  ( s_axi_areset   ),
                .rst   ( idelayctrl_rst )
            );
            
            
            (* IODELAY_GROUP = C_IODELAY_GROUP_ID *)
            IDELAYCTRL
            IDELAYCTRL_inst
            (
                .RST    ( idelayctrl_rst ),
                .REFCLK ( clk_idelay_ref ),
                .RDY    ( idelayctrl_rdy )
            );
            
            
            hbmc_bit_sync #
            (
                .C_SYNC_STAGES  ( 3     ),
                .C_RESET_STATE  ( 1'b0  )
            )
            hbmc_bit_sync_idelayctrl_rdy
            (
                .arst   ( s_axi_areset        ),
                .clk    ( s_axi_aclk          ),
                .d      ( idelayctrl_rdy      ),
                .q      ( idelayctrl_rdy_sync )
            );
            
            assign clk_idelay = clk_idelay_ref;
            
        end else begin
            assign idelayctrl_rdy_sync = 1'b1;
            assign clk_idelay = 1'b0;
        end
    endgenerate

/*----------------------------------------------------------------------------------------------------------------------------*/

    task hbmc_config_wr_cmd;
    begin
        cmd_wr_not_rd     <= 1'b1;
        cmd_mem_addr      <= (C_S_AXI_ADDR_WIDTH <= 32)? {{32 - C_S_AXI_ADDR_WIDTH + 1{1'b0}}, axi_awaddr_aligned[C_S_AXI_ADDR_WIDTH - 1:1]} :
                                                                                               axi_awaddr_aligned[32:1];
        cmd_word_cnt      <= (s_axi_awlen + 1'b1) << (clog2(C_S_AXI_DATA_WIDTH/8) - 1);
        cmd_wrap_not_incr <= (s_axi_awburst == AXI_WRAP_BURST)? 1'b1 : 1'b0;
    end
    endtask
    
    
    task hbmc_config_rd_cmd;
    begin
        cmd_wr_not_rd     <= 1'b0;
        cmd_mem_addr      <= (C_S_AXI_ADDR_WIDTH <= 32)? {{32 - C_S_AXI_ADDR_WIDTH + 1{1'b0}}, axi_araddr_aligned[C_S_AXI_ADDR_WIDTH - 1:1]} :
                                                                                               axi_araddr_aligned[32:1];
        cmd_word_cnt      <= (s_axi_arlen + 1'b1) << (clog2(C_S_AXI_DATA_WIDTH/8) - 1);
        cmd_wrap_not_incr <= (s_axi_arburst == AXI_WRAP_BURST)? 1'b1 : 1'b0;
    end
    endtask

/*----------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  ST_RST       = 2'd0,
                ST_XFER_SEL  = 2'd1,
                ST_XFER_INIT = 2'd2,
                ST_XFER_RUN  = 2'd3;
    
    reg     [1:0]   state;
    
    
    /* Main transaction processing FSM */
    always @(posedge s_axi_aclk or posedge s_axi_areset) begin
        if (s_axi_areset) begin
            cmd_req           <= 1'b0;
            cmd_wr_not_rd     <= 1'b0;
            cmd_mem_addr      <= {32{1'b0}};
            cmd_word_cnt      <= {16{1'b0}};
            cmd_wrap_not_incr <= 1'b0;
            s_axi_awready     <= 1'b0;
            s_axi_arready     <= 1'b0;
            s_axi_rid         <= {C_S_AXI_ID_WIDTH{1'b0}};
            s_axi_bid         <= {C_S_AXI_ID_WIDTH{1'b0}};
            state             <= ST_RST;
        end else begin
            case (state)
                ST_RST: begin
                    cmd_req       <= 1'b0;
                    s_axi_awready <= 1'b0;
                    s_axi_arready <= 1'b0;
                    
                    if (idelayctrl_rdy_sync) begin
                        state <= ST_XFER_SEL;
                    end
                end
                
                ST_XFER_SEL: begin
                    case ({axi_rd_condition, axi_wr_condition})
                        
                        /* Do nothing */
                        NO_REQ: begin
                            state <= state;
                        end
                        
                        /* New AXI write request */
                        WR_REQ: begin
                            s_axi_awready <= 1'b1;
                            s_axi_bid <= s_axi_awid;
                            hbmc_config_wr_cmd();
                            state <= ST_XFER_INIT;
                        end
                        
                        /* New AXI read request */
                        RD_REQ: begin
                            s_axi_arready <= 1'b1;
                            s_axi_rid <= s_axi_arid;
                            hbmc_config_rd_cmd();
                            state <= ST_XFER_INIT;
                        end
                        
                        /* Simultaneous AXI write + read request */
                        WR_RD_REQ: begin
                            /* Simple round-robin, based 
                             * on the previous operation */
                            if (cmd_wr_not_rd) begin
                                s_axi_arready <= 1'b1;
                                s_axi_rid <= s_axi_arid;
                                hbmc_config_rd_cmd();
                            end else begin
                                s_axi_awready <= 1'b1;
                                s_axi_bid <= s_axi_awid;
                                hbmc_config_wr_cmd();
                            end
                            
                            state <= ST_XFER_INIT;
                        end
                    endcase
                end
                
                ST_XFER_INIT: begin
                    s_axi_awready <= 1'b0;
                    s_axi_arready <= 1'b0;
                    if (~cmd_ack) begin
                        cmd_req <= 1'b1;
                        state   <= ST_XFER_RUN;
                    end
                end
                
                ST_XFER_RUN: begin
                    if (cmd_ack) begin
                        cmd_req <= 1'b0;
                        state <= ST_XFER_SEL;
                    end
                end
            endcase
        end
    end
    
/*----------------------------------------------------------------------------------------------------------------------------*/

    /* Checking AXI read transfer state */
    always @(posedge s_axi_aclk or posedge s_axi_areset) begin
        if (s_axi_areset) begin
            rd_xfer_done <= 1'b1;
        end else begin
            if (rd_addr_done) begin
                rd_xfer_done <= 1'b0;
            end else begin
                if (rd_data_done) begin
                    rd_xfer_done <= 1'b1;
                end
            end
        end
    end

/*----------------------------------------------------------------------------------------------------------------------------*/
    
    /* Pending AXI write data packets counter */
    always @(posedge s_axi_aclk or posedge s_axi_areset) begin
        if (s_axi_areset) begin
            wr_data_pkt_cnt <= {12{1'b0}};
        end else begin
            case ({wr_resp_done, wr_data_done})
                2'b00,
                2'b11: wr_data_pkt_cnt <= wr_data_pkt_cnt;
                2'b01: wr_data_pkt_cnt <= wr_data_pkt_cnt + 1'b1;
                2'b10: wr_data_pkt_cnt <= wr_data_pkt_cnt - 1'b1;
            endcase
        end
    end

/*----------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  ST_BRESP_IDLE = 1'b0,
                ST_BRESP_SEND = 1'b1;
    
    reg         state_bresp;
    
    
    /* AXI write responding FSM */
    always @(posedge s_axi_aclk or posedge s_axi_areset) begin
        if (s_axi_areset) begin
            wr_xfer_done <= 1'b1;
            s_axi_bvalid <= 1'b0;
            state_bresp  <= ST_BRESP_IDLE;
        end else begin
            case (state_bresp)
                ST_BRESP_IDLE: begin
                    /* Start responding when AW was accepted and 
                     * there is pending write data packet in dFIFO */
                    if (wr_addr_done & wr_data_pending) begin
                        wr_xfer_done <= 1'b0;
                        s_axi_bvalid <= 1'b1;
                        state_bresp  <= ST_BRESP_SEND;
                    end
                end
                
                ST_BRESP_SEND: begin
                    if (wr_resp_done) begin
                        wr_xfer_done <= 1'b1;
                        s_axi_bvalid <= 1'b0;
                        state_bresp  <= ST_BRESP_IDLE;
                    end
                end
            endcase
        end
    end
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    wire    hbmc_rst_sync;
    
    
    hbmc_arst_sync #
    (
        .C_SYNC_STAGES ( 3 )
    )
    hbmc_arst_sync_inst
    (
        .clk  ( clk_hbmc_0    ),
        .arst ( s_axi_areset  ),
        .rst  ( hbmc_rst_sync )
    );

/*----------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  BUS_SYNC_WIDTH = 32 + 16 + 1 + 1;
    
    wire            cmd_req_dst;
    wire            cmd_ack_dst;
    
    wire    [31:0]  cmd_mem_addr_dst;
    wire    [15:0]  cmd_word_cnt_dst;
    wire            cmd_wr_not_rd_dst;
    wire            cmd_wrap_not_incr_dst;
    
    
    wire    [BUS_SYNC_WIDTH - 1:0]  src_data;
    wire    [BUS_SYNC_WIDTH - 1:0]  dst_data;
    
    
    assign src_data = {cmd_mem_addr, cmd_word_cnt, cmd_wr_not_rd, cmd_wrap_not_incr};
    assign {cmd_mem_addr_dst, cmd_word_cnt_dst, cmd_wr_not_rd_dst, cmd_wrap_not_incr_dst} = dst_data;
    
    
    hbmc_bus_sync #
    (
        .C_SYNC_STAGES ( 3              ),
        .C_DATA_WIDTH  ( BUS_SYNC_WIDTH )
    )
    hbmc_bus_sync_inst
    (
        .src_clk    ( s_axi_aclk    ),
        .src_rst    ( s_axi_areset  ),
        .src_data   ( src_data      ),
        .src_req    ( cmd_req       ),
        .src_ack    ( cmd_ack       ),
        
        .dst_clk    ( clk_hbmc_0    ),
        .dst_rst    ( hbmc_rst_sync ),
        .dst_data   ( dst_data      ),
        .dst_req    ( cmd_req_dst   ),
        .dst_ack    ( cmd_ack_dst   )
    );

/*----------------------------------------------------------------------------------------------------------------------------*/
    
    hbmc_ctrl #
    (
        .C_AXI_DATA_WIDTH           ( C_S_AXI_DATA_WIDTH         ),
        .C_HBMC_CLOCK_HZ            ( C_HBMC_CLOCK_HZ            ),
        .C_HBMC_FPGA_DRIVE_STRENGTH ( C_HBMC_FPGA_DRIVE_STRENGTH ),
        .C_HBMC_FPGA_SLEW_RATE      ( C_HBMC_FPGA_SLEW_RATE      ),
        .C_HBMC_MEM_DRIVE_STRENGTH  ( C_HBMC_MEM_DRIVE_STRENGTH  ),
        .C_HBMC_CS_MAX_LOW_TIME_US  ( C_HBMC_CS_MAX_LOW_TIME_US  ),
        .C_HBMC_FIXED_LATENCY       ( C_HBMC_FIXED_LATENCY       ),
        .C_ISERDES_CLOCKING_MODE    ( C_ISERDES_CLOCKING_MODE    ),
        .C_IODELAY_GROUP_ID         ( C_IODELAY_GROUP_ID         ),
        .C_IODELAY_REFCLK_MHZ       ( C_IODELAY_REFCLK_MHZ       ),
        
        .C_RWDS_USE_IDELAY          ( C_RWDS_USE_IDELAY          ),
        .C_DQ7_USE_IDELAY           ( C_DQ7_USE_IDELAY           ),
        .C_DQ6_USE_IDELAY           ( C_DQ6_USE_IDELAY           ),
        .C_DQ5_USE_IDELAY           ( C_DQ5_USE_IDELAY           ),
        .C_DQ4_USE_IDELAY           ( C_DQ4_USE_IDELAY           ),
        .C_DQ3_USE_IDELAY           ( C_DQ3_USE_IDELAY           ),
        .C_DQ2_USE_IDELAY           ( C_DQ2_USE_IDELAY           ),
        .C_DQ1_USE_IDELAY           ( C_DQ1_USE_IDELAY           ),
        .C_DQ0_USE_IDELAY           ( C_DQ0_USE_IDELAY           ),
        
        .C_RWDS_IDELAY_TAPS_VALUE   ( C_RWDS_IDELAY_TAPS_VALUE   ),
        .C_DQ7_IDELAY_TAPS_VALUE    ( C_DQ7_IDELAY_TAPS_VALUE    ),
        .C_DQ6_IDELAY_TAPS_VALUE    ( C_DQ6_IDELAY_TAPS_VALUE    ),
        .C_DQ5_IDELAY_TAPS_VALUE    ( C_DQ5_IDELAY_TAPS_VALUE    ),
        .C_DQ4_IDELAY_TAPS_VALUE    ( C_DQ4_IDELAY_TAPS_VALUE    ),
        .C_DQ3_IDELAY_TAPS_VALUE    ( C_DQ3_IDELAY_TAPS_VALUE    ),
        .C_DQ2_IDELAY_TAPS_VALUE    ( C_DQ2_IDELAY_TAPS_VALUE    ),
        .C_DQ1_IDELAY_TAPS_VALUE    ( C_DQ1_IDELAY_TAPS_VALUE    ),
        .C_DQ0_IDELAY_TAPS_VALUE    ( C_DQ0_IDELAY_TAPS_VALUE    )
    )
    hbmc_ctrl_inst
    (
        .rst                ( hbmc_rst_sync         ),
        .clk_hbmc_0         ( clk_hbmc_0            ),
        .clk_hbmc_90        ( clk_hbmc_90           ),
        .clk_iserdes        ( clk_iserdes           ),
        .clk_idelay_ref     ( clk_idelay            ),
        
        .cmd_valid          ( cmd_req_dst           ),
        .cmd_ready          ( cmd_ack_dst           ),
        .cmd_mem_addr       ( cmd_mem_addr_dst      ),
        .cmd_word_count     ( cmd_word_cnt_dst      ),
        .cmd_wr_not_rd      ( cmd_wr_not_rd_dst     ),
        .cmd_wrap_not_incr  ( cmd_wrap_not_incr_dst ),
        
        .ufifo_data         ( ufifo_wr_data         ),
        .ufifo_last         ( ufifo_wr_last         ),
        .ufifo_we           ( ufifo_wr_ena          ),
        
        .dfifo_data         ( dfifo_rd_data         ),
        .dfifo_strb         ( dfifo_rd_strb         ),
        .dfifo_re           ( dfifo_rd_ena          ),
        
        .hb_ck_p            ( hb_ck_p               ),
        .hb_ck_n            ( hb_ck_n               ),
        .hb_reset_n         ( hb_reset_n            ),
        .hb_cs_n            ( hb_cs_n               ),
        .hb_rwds            ( hb_rwds               ),
        .hb_dq              ( hb_dq                 )
    );
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    /* Upstream data FIFO */
    hbmc_ufifo #
    (
        .DATA_WIDTH ( C_S_AXI_DATA_WIDTH )
    )
    hbmc_ufifo_inst
    (
        .fifo_arst      ( s_axi_areset   ),
        
        .fifo_wr_clk    ( clk_hbmc_0     ),
        .fifo_wr_din    ( ufifo_wr_data  ),
        .fifo_wr_last   ( ufifo_wr_last  ),
        .fifo_wr_ena    ( ufifo_wr_ena   ),
        .fifo_wr_full   ( /*----NC----*/ ),
        
        .fifo_rd_clk    ( s_axi_aclk     ),
        .fifo_rd_dout   ( ufifo_rd_dout  ),
        .fifo_rd_free   ( /*----NC----*/ ),
        .fifo_rd_last   ( ufifo_rd_last  ),
        .fifo_rd_ena    ( ufifo_rd_ena   ),
        .fifo_rd_empty  ( ufifo_rd_empty )
    );
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    /* Downstream data FIFO */
    hbmc_dfifo #
    (
        .DATA_WIDTH ( C_S_AXI_DATA_WIDTH )
    )
    hbmc_dfifo_inst
    (
        .fifo_arst      ( s_axi_areset   ),
    
        .fifo_wr_clk    ( s_axi_aclk     ),
        .fifo_wr_din    ( dfifo_wr_din   ),
        .fifo_wr_strb   ( dfifo_wr_strb  ),
        .fifo_wr_ena    ( dfifo_wr_ena   ),
        .fifo_wr_full   ( dfifo_wr_full  ),
        
        .fifo_rd_clk    ( clk_hbmc_0     ),
        .fifo_rd_dout   ( dfifo_rd_data  ),
        .fifo_rd_strb   ( dfifo_rd_strb  ),
        .fifo_rd_ena    ( dfifo_rd_ena   ),
        .fifo_rd_empty  ( /*----NC----*/ )
    );
    
    
endmodule

/*----------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
