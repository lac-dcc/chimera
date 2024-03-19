// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_video_resize_half_wb
        #(
            parameter   COMPONENT_NUM       = 3,
            parameter   DATA_WIDTH          = 8,
            parameter   AXI4S_TUSER_WIDTH   = 1,
            parameter   AXI4S_TDATA_WIDTH   = COMPONENT_NUM*DATA_WIDTH,
            
            parameter   WB_ADR_WIDTH        = 8,
            parameter   WB_DAT_SIZE         = 2,    // 0:8bit, 1:16bit, 2:32bit, ...
            parameter   WB_DAT_WIDTH        = (8 << WB_DAT_SIZE),
            parameter   WB_SEL_WIDTH        = (WB_DAT_WIDTH / 8),
            parameter   REG_ADDR_STEP       = WB_DAT_SIZE,
            parameter   INDEX_WIDTH         = 1,
            
            parameter   MAX_X_NUM           = 4096,
            parameter   RAM_TYPE            = MAX_X_NUM > 128 ? "block" : "distributed",
            parameter   M_SLAVE_REGS        = 1,
            parameter   M_MASTER_REGS       = 1,
            
            parameter   INIT_PARAM_V_ENABLE = 1,
            parameter   INIT_PARAM_H_ENABLE = 1
        )
        (
            input   wire                            aresetn,
            input   wire                            aclk,
            input   wire                            aclken,
            
            input   wire    [AXI4S_TUSER_WIDTH-1:0] s_axi4s_tuser,
            input   wire                            s_axi4s_tlast,
            input   wire    [AXI4S_TDATA_WIDTH-1:0] s_axi4s_tdata,
            input   wire                            s_axi4s_tvalid,
            output  wire                            s_axi4s_tready,
            
            output  wire    [AXI4S_TUSER_WIDTH-1:0] m_axi4s_tuser,
            output  wire                            m_axi4s_tlast,
            output  wire    [AXI4S_TDATA_WIDTH-1:0] m_axi4s_tdata,
            output  wire                            m_axi4s_tvalid,
            input   wire                            m_axi4s_tready,
            
            
            input   wire                            s_wb_rst_i,
            input   wire                            s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]      s_wb_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]      s_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]      s_wb_dat_o,
            input   wire                            s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]      s_wb_sel_i,
            input   wire                            s_wb_stb_i,
            output  wire                            s_wb_ack_o
        );
    
    
    
    jelly_video_resize_half
            #(
                .COMPONENT_NUM          (COMPONENT_NUM),
                .DATA_WIDTH             (DATA_WIDTH),
                .AXI4S_TUSER_WIDTH      (AXI4S_TUSER_WIDTH),
                .AXI4S_TDATA_WIDTH      (AXI4S_TDATA_WIDTH),
                
                .AXI4L_ADDR_WIDTH       (WB_ADR_WIDTH + WB_DAT_SIZE),
                .AXI4L_DATA_SIZE        (WB_DAT_SIZE),
                .AXI4L_DATA_WIDTH       (WB_DAT_WIDTH),
                .AXI4L_STRB_WIDTH       (WB_SEL_WIDTH),
                .REG_ADDR_STEP          (REG_ADDR_STEP),
                .INDEX_WIDTH            (INDEX_WIDTH),
                
                .MAX_X_NUM              (MAX_X_NUM),
                .RAM_TYPE               (RAM_TYPE),
                .M_SLAVE_REGS           (M_SLAVE_REGS),
                .M_MASTER_REGS          (M_MASTER_REGS),
                
                .INIT_PARAM_V_ENABLE    (INIT_PARAM_V_ENABLE),
                .INIT_PARAM_H_ENABLE    (INIT_PARAM_H_ENABLE)
            )
        i_video_resize_half
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                .aclken                 (aclken),
                
                .s_axi4s_tuser          (s_axi4s_tuser),
                .s_axi4s_tlast          (s_axi4s_tlast),
                .s_axi4s_tdata          (s_axi4s_tdata),
                .s_axi4s_tvalid         (s_axi4s_tvalid),
                .s_axi4s_tready         (s_axi4s_tready),
                
                .m_axi4s_tuser          (m_axi4s_tuser),
                .m_axi4s_tlast          (m_axi4s_tlast),
                .m_axi4s_tdata          (m_axi4s_tdata),
                .m_axi4s_tvalid         (m_axi4s_tvalid),
                .m_axi4s_tready         (m_axi4s_tready),
                
                .s_axi4l_aresetn        (~s_wb_rst_i),
                .s_axi4l_aclk           (s_wb_clk_i),
                .s_axi4l_awaddr         ({s_wb_adr_i, {WB_DAT_SIZE{1'b0}}}),
                .s_axi4l_awprot         (2'b00),
                .s_axi4l_awvalid        (s_wb_stb_i && s_wb_we_i),
                .s_axi4l_awready        (),
                .s_axi4l_wstrb          (s_wb_sel_i),
                .s_axi4l_wdata          (s_wb_dat_i),
                .s_axi4l_wvalid         (s_wb_stb_i && s_wb_we_i),
                .s_axi4l_wready         (),
                .s_axi4l_bresp          (),
                .s_axi4l_bvalid         (),
                .s_axi4l_bready         (1'b1),
                .s_axi4l_araddr         ({s_wb_adr_i, {WB_DAT_SIZE{1'b0}}}),
                .s_axi4l_arprot         (2'b00),
                .s_axi4l_arvalid        (s_wb_stb_i && !s_wb_we_i),
                .s_axi4l_arready        (),
                .s_axi4l_rdata          (s_wb_dat_o),
                .s_axi4l_rresp          (),
                .s_axi4l_rvalid         (),
                .s_axi4l_rready         (1'b1)
            );
    
    assign s_wb_ack_o = s_wb_stb_i;
    
    
endmodule



`default_nettype wire



// end of file
