// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_video_binarizer
        #(
            parameter   TUSER_WIDTH     = 1,
            parameter   TDATA_WIDTH     = 8,
            
            parameter   WB_ADR_WIDTH    = 8,
            parameter   WB_DAT_WIDTH    = 32,
            parameter   WB_SEL_WIDTH    = (WB_DAT_WIDTH / 8),
            
            parameter   CORE_ID         = 32'h527a_ffff,
            parameter   CORE_VERSION    = 32'h0001_0000,
            
            parameter   INIT_PARAM_TH   = 127,
            parameter   INIT_PARAM_INV  = 1'b0
        )
        (
            input   wire                        aresetn,
            input   wire                        aclk,
            
            input   wire                        s_wb_rst_i,
            input   wire                        s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]  s_wb_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_o,
            input   wire                        s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]  s_wb_sel_i,
            input   wire                        s_wb_stb_i,
            output  wire                        s_wb_ack_o,
            
            input   wire    [TUSER_WIDTH-1:0]   s_axi4s_tuser,
            input   wire                        s_axi4s_tlast,
            input   wire    [TDATA_WIDTH-1:0]   s_axi4s_tdata,
            input   wire                        s_axi4s_tvalid,
            output  wire                        s_axi4s_tready,
            
            output  wire    [TUSER_WIDTH-1:0]   m_axi4s_tuser,
            output  wire                        m_axi4s_tlast,
            output  wire    [0:0]               m_axi4s_tbinary,
            output  wire    [TDATA_WIDTH-1:0]   m_axi4s_tdata,
            output  wire                        m_axi4s_tvalid,
            input   wire                        m_axi4s_tready
        );
    
    
    // -------------------------------------
    //  registers
    // -------------------------------------
    
    // register address offset
    localparam  ADR_CORE_ID            = 8'h00;
    localparam  ADR_CORE_VERSION       = 8'h01;
//  localparam  ADR_CTL_CONTROL        = 8'h04;
//  localparam  ADR_CTL_STATUS         = 8'h05;
//  localparam  ADR_CTL_INDEX          = 8'h07;
    localparam  ADR_PARAM_TH           = 8'h10;
    localparam  ADR_PARAM_INV          = 8'h11;
    
    // registers
    reg     [TDATA_WIDTH-1:0]       reg_param_th;
    reg     [0:0]                   reg_param_inv;
    
    
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
    
    always @(posedge s_wb_clk_i) begin
        if ( s_wb_rst_i ) begin
            reg_param_th  <= INIT_PARAM_TH;
            reg_param_inv <= INIT_PARAM_INV;
        end
        else begin
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                ADR_PARAM_TH:   reg_param_th  <= reg_mask(reg_param_th,  s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_INV:  reg_param_inv <= reg_mask(reg_param_inv, s_wb_dat_i, s_wb_sel_i);
                endcase
            end
        end
    end
    
    // read
    assign s_wb_dat_o = (s_wb_adr_i == ADR_CORE_ID)      ? CORE_ID       :
                        (s_wb_adr_i == ADR_CORE_VERSION) ? CORE_VERSION  :
                        (s_wb_adr_i == ADR_PARAM_TH)     ? reg_param_th  :
                        (s_wb_adr_i == ADR_PARAM_INV)    ? reg_param_inv :
                        {WB_DAT_WIDTH{1'b0}};
    
    assign s_wb_ack_o = s_wb_stb_i;
    
    
    // core
    jelly_video_binarizer_core
            #(
                .TUSER_WIDTH        (TUSER_WIDTH),
                .TDATA_WIDTH        (TDATA_WIDTH)
            )
        i_video_binarizer_core
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                
                .param_th           (reg_param_th),
                .param_inv          (reg_param_inv),
                
                .s_axi4s_tuser      (s_axi4s_tuser),
                .s_axi4s_tlast      (s_axi4s_tlast),
                .s_axi4s_tdata      (s_axi4s_tdata),
                .s_axi4s_tvalid     (s_axi4s_tvalid),
                .s_axi4s_tready     (s_axi4s_tready),
                
                .m_axi4s_tuser      (m_axi4s_tuser),
                .m_axi4s_tlast      (m_axi4s_tlast),
                .m_axi4s_tbinary    (m_axi4s_tbinary),
                .m_axi4s_tdata      (m_axi4s_tdata),
                .m_axi4s_tvalid     (m_axi4s_tvalid),
                .m_axi4s_tready     (m_axi4s_tready)
            );
    
    
endmodule


`default_nettype wire


// end of file
