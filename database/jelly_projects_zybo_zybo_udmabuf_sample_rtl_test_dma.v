// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the system on fpga system
//
//  Test DMA
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module test_dma
        #(
            parameter   CORE_ID         = 64'h0000,
            
            parameter   WB_ADR_WIDTH    = 6,
            parameter   WB_DAT_SIZE     = 3,
            parameter   WB_DAT_WIDTH    = (8 << WB_DAT_SIZE),
            parameter   WB_SEL_WIDTH    = (1 << WB_DAT_SIZE),
            
            parameter   AXI4_ID_WIDTH   = 6,
            parameter   AXI4_ADDR_WIDTH = 64,
            parameter   AXI4_DATA_SIZE  = 2,   // 0:8bit, 1:16bit, 2:32bit ...
            parameter   AXI4_DATA_WIDTH = (8 << AXI4_DATA_SIZE),
            parameter   AXI4_STRB_WIDTH = (1 << AXI4_DATA_SIZE),
            parameter   AXI4_LEN_WIDTH  = 8,
            parameter   AXI4_QOS_WIDTH  = 4,
            parameter   AXI4_AWID       = {AXI4_ID_WIDTH{1'b0}},
            parameter   AXI4_AWSIZE     = AXI4_DATA_SIZE,
            parameter   AXI4_AWBURST    = 2'b01,
            parameter   AXI4_AWLOCK     = 1'b0,
            parameter   AXI4_AWCACHE    = 4'b0001,
            parameter   AXI4_AWPROT     = 3'b000,
            parameter   AXI4_AWQOS      = 0,
            parameter   AXI4_AWREGION   = 4'b0000,
            parameter   AXI4_ARID       = {AXI4_ID_WIDTH{1'b0}},
            parameter   AXI4_ARSIZE     = AXI4_DATA_SIZE,
            parameter   AXI4_ARBURST    = 2'b01,
            parameter   AXI4_ARLOCK     = 1'b0,
            parameter   AXI4_ARCACHE    = 4'b0001,
            parameter   AXI4_ARPROT     = 3'b000,
            parameter   AXI4_ARQOS      = 0,
            parameter   AXI4_ARREGION   = 4'b0000
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            
            input   wire    [WB_ADR_WIDTH-1:0]          s_wb_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]          s_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]          s_wb_dat_o,
            input   wire                                s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]          s_wb_sel_i,
            input   wire                                s_wb_stb_i,
            output  wire                                s_wb_ack_o,
            
            output  wire    [AXI4_ID_WIDTH-1:0]         m_axi4_awid,
            output  wire    [AXI4_ADDR_WIDTH-1:0]       m_axi4_awaddr,
            output  wire    [AXI4_LEN_WIDTH-1:0]        m_axi4_awlen,
            output  wire    [2:0]                       m_axi4_awsize,
            output  wire    [1:0]                       m_axi4_awburst,
            output  wire    [0:0]                       m_axi4_awlock,
            output  wire    [3:0]                       m_axi4_awcache,
            output  wire    [2:0]                       m_axi4_awprot,
            output  wire    [AXI4_QOS_WIDTH-1:0]        m_axi4_awqos,
            output  wire    [3:0]                       m_axi4_awregion,
            output  wire                                m_axi4_awvalid,
            input   wire                                m_axi4_awready,
            output  wire    [AXI4_DATA_WIDTH-1:0]       m_axi4_wdata,
            output  wire    [AXI4_STRB_WIDTH-1:0]       m_axi4_wstrb,
            output  wire                                m_axi4_wlast,
            output  wire                                m_axi4_wvalid,
            input   wire                                m_axi4_wready,
            input   wire    [AXI4_ID_WIDTH-1:0]         m_axi4_bid,
            input   wire    [1:0]                       m_axi4_bresp,
            input   wire                                m_axi4_bvalid,
            output  wire                                m_axi4_bready,
            output  wire    [AXI4_ID_WIDTH-1:0]         m_axi4_arid,
            output  wire    [AXI4_ADDR_WIDTH-1:0]       m_axi4_araddr,
            output  wire    [AXI4_LEN_WIDTH-1:0]        m_axi4_arlen,
            output  wire    [2:0]                       m_axi4_arsize,
            output  wire    [1:0]                       m_axi4_arburst,
            output  wire    [0:0]                       m_axi4_arlock,
            output  wire    [3:0]                       m_axi4_arcache,
            output  wire    [2:0]                       m_axi4_arprot,
            output  wire    [AXI4_QOS_WIDTH-1:0]        m_axi4_arqos,
            output  wire    [3:0]                       m_axi4_arregion,
            output  wire                                m_axi4_arvalid,
            input   wire                                m_axi4_arready,
            input   wire    [AXI4_ID_WIDTH-1:0]         m_axi4_rid,
            input   wire    [AXI4_DATA_WIDTH-1:0]       m_axi4_rdata,
            input   wire    [1:0]                       m_axi4_rresp,
            input   wire                                m_axi4_rlast,
            input   wire                                m_axi4_rvalid,
            output  wire                                m_axi4_rready
        );
    
    function [WB_DAT_WIDTH-1:0] reg_mask(
                                        input [WB_DAT_WIDTH-1:0] org,
                                        input [WB_DAT_WIDTH-1:0] wdat,
                                        input [WB_SEL_WIDTH-1:0] msk
                                    );
    integer i;
    begin
        for ( i = 0; i < WB_DAT_WIDTH; i = i+1 ) begin
            reg_mask[i] = msk[i/8] ? wdat[i] : org[i];
        end
    end
    endfunction
    
    localparam  ADR_STATUS  = 0;
    localparam  ADR_WSTART  = 1;
    localparam  ADR_RSTART  = 2;
    localparam  ADR_ADDR    = 3;
    localparam  ADR_WDATA0  = 4;
    localparam  ADR_WDATA1  = 5;
    localparam  ADR_RDATA0  = 6;
    localparam  ADR_RDATA1  = 7;
    localparam  ADR_ID      = 8;
    
    wire                            busy;
    wire    [WB_DAT_WIDTH-1:0]      rdata0;
    wire    [WB_DAT_WIDTH-1:0]      rdata1;
    
    reg                             reg_wstart;
    reg                             reg_rstart;
    reg     [AXI4_ADDR_WIDTH-1:0]   reg_addr;
    reg     [WB_DAT_WIDTH-1:0]      reg_wdata0;
    reg     [WB_DAT_WIDTH-1:0]      reg_wdata1;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_wstart <= 1'b0;
            reg_rstart <= 1'b0;
            reg_addr   <= {AXI4_ADDR_WIDTH{1'b0}};
            reg_wdata0 <= {WB_DAT_WIDTH{1'b0}};
            reg_wdata1 <= {WB_DAT_WIDTH{1'b0}};
        end
        else begin
            reg_wstart <= 1'b0;
            reg_rstart <= 1'b0;
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                ADR_WSTART: reg_wstart <= reg_mask(reg_wstart, s_wb_dat_i, s_wb_sel_i);
                ADR_RSTART: reg_rstart <= reg_mask(reg_rstart, s_wb_dat_i, s_wb_sel_i);
                ADR_ADDR:   reg_addr   <= reg_mask(reg_addr  , s_wb_dat_i, s_wb_sel_i);
                ADR_WDATA0: reg_wdata0 <= reg_mask(reg_wdata0, s_wb_dat_i, s_wb_sel_i);
                ADR_WDATA1: reg_wdata1 <= reg_mask(reg_wdata1, s_wb_dat_i, s_wb_sel_i);
                endcase
            end
        end
    end
    
    assign s_wb_dat_o = (s_wb_adr_i == ADR_STATUS) ? busy       :
                        (s_wb_adr_i == ADR_WSTART) ? reg_wstart :
                        (s_wb_adr_i == ADR_RSTART) ? reg_rstart :
                        (s_wb_adr_i == ADR_ADDR  ) ? reg_addr   :
                        (s_wb_adr_i == ADR_WDATA0) ? reg_wdata0 :
                        (s_wb_adr_i == ADR_WDATA1) ? reg_wdata1 :
                        (s_wb_adr_i == ADR_RDATA0) ? rdata0     :
                        (s_wb_adr_i == ADR_RDATA1) ? rdata1     :
                        (s_wb_adr_i == ADR_ID    ) ? CORE_ID    :
                        0;
    assign s_wb_ack_o = s_wb_stb_i;
    
    
    
    test_dma_core
            #(
                .AXI4_ID_WIDTH      (AXI4_ID_WIDTH  ),
                .AXI4_ADDR_WIDTH    (AXI4_ADDR_WIDTH),
                .AXI4_DATA_SIZE     (AXI4_DATA_SIZE ),
                .AXI4_DATA_WIDTH    (AXI4_DATA_WIDTH),
                .AXI4_LEN_WIDTH     (AXI4_LEN_WIDTH ),
                .AXI4_QOS_WIDTH     (AXI4_QOS_WIDTH ),
                .AXI4_AWID          (AXI4_AWID      ),
                .AXI4_AWSIZE        (AXI4_AWSIZE    ),
                .AXI4_AWBURST       (AXI4_AWBURST   ),
                .AXI4_AWLOCK        (AXI4_AWLOCK    ),
                .AXI4_AWCACHE       (AXI4_AWCACHE   ),
                .AXI4_AWPROT        (AXI4_AWPROT    ),
                .AXI4_AWQOS         (AXI4_AWQOS     ),
                .AXI4_AWREGION      (AXI4_AWREGION  ),
                .AXI4_ARID          (AXI4_ARID      ),
                .AXI4_ARSIZE        (AXI4_ARSIZE    ),
                .AXI4_ARBURST       (AXI4_ARBURST   ),
                .AXI4_ARLOCK        (AXI4_ARLOCK    ),
                .AXI4_ARCACHE       (AXI4_ARCACHE   ),
                .AXI4_ARPROT        (AXI4_ARPROT    ),
                .AXI4_ARQOS         (AXI4_ARQOS     ),
                .AXI4_ARREGION      (AXI4_ARREGION  )
            )
        i_test_dma_core
            (
                .aresetn            (~reset),
                .aclk               (clk),
                
                .wstart             (reg_wstart),
                .rstart             (reg_rstart),
                .busy               (busy),
                .addr               (reg_addr),
                .wdata              ({reg_wdata1, reg_wdata0}),
                .rdata              ({rdata1, rdata0}),
                
                .m_axi4_awid        (m_axi4_awid     ),
                .m_axi4_awaddr      (m_axi4_awaddr   ),
                .m_axi4_awlen       (m_axi4_awlen    ),
                .m_axi4_awsize      (m_axi4_awsize   ),
                .m_axi4_awburst     (m_axi4_awburst  ),
                .m_axi4_awlock      (m_axi4_awlock   ),
                .m_axi4_awcache     (m_axi4_awcache  ),
                .m_axi4_awprot      (m_axi4_awprot   ),
                .m_axi4_awqos       (m_axi4_awqos    ),
                .m_axi4_awregion    (m_axi4_awregion ),
                .m_axi4_awvalid     (m_axi4_awvalid  ),
                .m_axi4_awready     (m_axi4_awready  ),
                .m_axi4_wdata       (m_axi4_wdata    ),
                .m_axi4_wstrb       (m_axi4_wstrb    ),
                .m_axi4_wlast       (m_axi4_wlast    ),
                .m_axi4_wvalid      (m_axi4_wvalid   ),
                .m_axi4_wready      (m_axi4_wready   ),
                .m_axi4_bid         (m_axi4_bid      ),
                .m_axi4_bresp       (m_axi4_bresp    ),
                .m_axi4_bvalid      (m_axi4_bvalid   ),
                .m_axi4_bready      (m_axi4_bready   ),
                .m_axi4_arid        (m_axi4_arid     ),
                .m_axi4_araddr      (m_axi4_araddr   ),
                .m_axi4_arlen       (m_axi4_arlen    ),
                .m_axi4_arsize      (m_axi4_arsize   ),
                .m_axi4_arburst     (m_axi4_arburst  ),
                .m_axi4_arlock      (m_axi4_arlock   ),
                .m_axi4_arcache     (m_axi4_arcache  ),
                .m_axi4_arprot      (m_axi4_arprot   ),
                .m_axi4_arqos       (m_axi4_arqos    ),
                .m_axi4_arregion    (m_axi4_arregion ),
                .m_axi4_arvalid     (m_axi4_arvalid  ),
                .m_axi4_arready     (m_axi4_arready  ),
                .m_axi4_rid         (m_axi4_rid      ),
                .m_axi4_rdata       (m_axi4_rdata    ),
                .m_axi4_rresp       (m_axi4_rresp    ),
                .m_axi4_rlast       (m_axi4_rlast    ),
                .m_axi4_rvalid      (m_axi4_rvalid   ),
                .m_axi4_rready      (m_axi4_rready   )
            );
    
    
endmodule


`default_nettype wire


// end of file
