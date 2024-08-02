// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_video_pwm_modulator
        #(
            parameter   WB_ADR_WIDTH       = 8,
            parameter   WB_DAT_WIDTH       = 32,
            parameter   WB_SEL_WIDTH       = (WB_DAT_WIDTH / 8),
            
            parameter   TUSER_WIDTH        = 1,
            parameter   TDATA_WIDTH        = 24,
            
            parameter   INDEX_WIDTH        = 1,
            
            parameter   INIT_CTL_ENABLE    = 0,
            parameter   INIT_PARAM_TH      = 16,
            parameter   INIT_PARAM_INV     = 0,
            parameter   INIT_PARAM_STEP    = 16
        )
        (
            input   wire                        aresetn,
            input   wire                        aclk,
            input   wire                        aclken,
            
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
            output  wire    [TDATA_WIDTH-1:0]   m_axi4s_tdata,
            output  wire    [0:0]               m_axi4s_tbinary,
            output  wire                        m_axi4s_tvalid,
            input   wire                        m_axi4s_tready
        );
    
    
    // register
    localparam  REG_ADDR_CTL_ENABLE = 32'h00;
    localparam  REG_ADDR_PARAM_TH   = 32'h04;
    localparam  REG_ADDR_PARAM_INV  = 32'h05;
    localparam  REG_ADDR_PARAM_STEP = 32'h06;
    
    reg                             reg_ctl_enable;
    reg     [TDATA_WIDTH-1:0]       reg_param_th;
    reg                             reg_param_inv;
    reg     [TDATA_WIDTH-1:0]       reg_param_step;
    
    always @(posedge s_wb_clk_i) begin
        if ( s_wb_rst_i ) begin
            reg_ctl_enable <= INIT_CTL_ENABLE;
            reg_param_th   <= INIT_PARAM_TH;
            reg_param_inv  <= INIT_PARAM_INV;
            reg_param_step <= INIT_PARAM_STEP;
        end
        else begin
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                REG_ADDR_CTL_ENABLE:    reg_ctl_enable <= s_wb_dat_i;
                REG_ADDR_PARAM_TH:      reg_param_th   <= s_wb_dat_i;
                REG_ADDR_PARAM_INV:     reg_param_inv  <= s_wb_dat_i;
                REG_ADDR_PARAM_STEP:    reg_param_step <= s_wb_dat_i;
                endcase
            end
        end
    end
    
    reg     [WB_DAT_WIDTH-1:0]  wb_dat_o;
    always @* begin
        wb_dat_o = {WB_DAT_WIDTH{1'b0}};
        case ( s_wb_adr_i )
        REG_ADDR_CTL_ENABLE:    wb_dat_o = reg_ctl_enable;
        REG_ADDR_PARAM_TH:      wb_dat_o = reg_param_th;
        REG_ADDR_PARAM_INV:     wb_dat_o = reg_param_inv;
        REG_ADDR_PARAM_STEP:    wb_dat_o = reg_param_step;
        endcase
    end
    
    assign s_wb_dat_o = wb_dat_o;
    assign s_wb_ack_o = s_wb_stb_i;
    
    
    
    // core
    (* ASYNC_REG = "true" *)    reg     ff0_ctl_enable, ff1_ctl_enable, ff2_ctl_enable;
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            ff0_ctl_enable  <= 1'b0;
            ff1_ctl_enable  <= 1'b0;
            ff2_ctl_enable  <= 1'b0;
        end
        else begin
            ff0_ctl_enable  <= reg_ctl_enable;
            ff1_ctl_enable  <= ff0_ctl_enable;
            ff2_ctl_enable  <= ff1_ctl_enable;
        end
    end
    
    jelly_video_pwm_modulator_core
            #(
                .TUSER_WIDTH        (TUSER_WIDTH),
                .TDATA_WIDTH        (TDATA_WIDTH)
            )
        i_video_pwm_modulator_core
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                .aclken             (aclken),
                
                .ctl_enable         (ff2_ctl_enable),
                .param_th           (reg_param_th),
                .param_step         (reg_param_step),
                .param_inv          (reg_param_inv),
                
                .s_axi4s_tuser      (s_axi4s_tuser),
                .s_axi4s_tlast      (s_axi4s_tlast),
                .s_axi4s_tdata      (s_axi4s_tdata),
                .s_axi4s_tvalid     (s_axi4s_tvalid),
                .s_axi4s_tready     (s_axi4s_tready),
                
                .m_axi4s_tuser      (m_axi4s_tuser),
                .m_axi4s_tlast      (m_axi4s_tlast),
                .m_axi4s_tdata      (m_axi4s_tdata),
                .m_axi4s_tbinary    (m_axi4s_tbinary),
                .m_axi4s_tvalid     (m_axi4s_tvalid),
                .m_axi4s_tready     (m_axi4s_tready)
            );
    
    
endmodule



`default_nettype wire



// end of file
