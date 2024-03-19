// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_video_integrator_bram
        #(
            parameter   COMPONENT_NUM    = 3,
            parameter   DATA_WIDTH       = 8,
            parameter   RATE_WIDTH       = 8,
            parameter   WB_ADR_WIDTH     = 8,
            parameter   WB_DAT_WIDTH     = 32,
            parameter   WB_SEL_WIDTH     = (WB_DAT_WIDTH / 8),
            parameter   TUSER_WIDTH      = 1,
            parameter   TDATA_WIDTH      = COMPONENT_NUM * DATA_WIDTH,
            parameter   X_WIDTH          = 9,
            parameter   Y_WIDTH          = 7,
            parameter   MAX_X_NUM        = (1 << X_WIDTH),
            parameter   MAX_Y_NUM        = (1 << Y_WIDTH),
            parameter   RAM_TYPE         = "block",
            parameter   FILLMEM          = 0,
            parameter   FILLMEM_DATA     = 0,
            parameter   ROUNDING         = 1,
            parameter   COMPACT          = 0,
            parameter   M_SLAVE_REGS     = 1,
            parameter   M_MASTER_REGS    = 1,
            
            parameter   INIT_PARAM_RATE  = 0
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
            output  wire                        m_axi4s_tvalid,
            input   wire                        m_axi4s_tready
        );
    
    
    // register
    localparam  REG_ADDR_PARAM_RATE = 32'h00;
    
    (* MARK_DEBUG = "true" *)
    reg     [RATE_WIDTH-1:0]        reg_param_rate;
    
    always @(posedge s_wb_clk_i) begin
        if ( s_wb_rst_i ) begin
            reg_param_rate <= INIT_PARAM_RATE;
        end
        else begin
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                REG_ADDR_PARAM_RATE:    reg_param_rate <= s_wb_dat_i;
                endcase
            end
        end
    end
    
    reg     [WB_DAT_WIDTH-1:0]  wb_dat_o;
    always @* begin
        wb_dat_o = {WB_DAT_WIDTH{1'b0}};
        case ( s_wb_adr_i )
        REG_ADDR_PARAM_RATE:    wb_dat_o = reg_param_rate;
        endcase
    end
    
    assign s_wb_dat_o = wb_dat_o;
    assign s_wb_ack_o = s_wb_stb_i;
    
    jelly_video_integrator_bram_core
            #(
                .COMPONENT_NUM          (COMPONENT_NUM),
                .DATA_WIDTH             (DATA_WIDTH),
                .RATE_WIDTH             (RATE_WIDTH),
                .TUSER_WIDTH            (TUSER_WIDTH),
                .X_WIDTH                (X_WIDTH),
                .Y_WIDTH                (Y_WIDTH),
                .MAX_X_NUM              (MAX_X_NUM),
                .MAX_Y_NUM              (MAX_Y_NUM),
                .RAM_TYPE               (RAM_TYPE),
                .FILLMEM                (FILLMEM),
                .FILLMEM_DATA           (FILLMEM_DATA),
                .ROUNDING               (ROUNDING),
                .COMPACT                (COMPACT)
            )
        i_video_integrator_bram_core
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                .aclken                 (aclken),
                
                .param_rate             (reg_param_rate),
                
                .s_axi4s_tuser          (s_axi4s_tuser),
                .s_axi4s_tlast          (s_axi4s_tlast),
                .s_axi4s_tdata          (s_axi4s_tdata),
                .s_axi4s_tvalid         (s_axi4s_tvalid),
                .s_axi4s_tready         (s_axi4s_tready),
                
                .m_axi4s_tuser          (m_axi4s_tuser),
                .m_axi4s_tlast          (m_axi4s_tlast),
                .m_axi4s_tdata          (m_axi4s_tdata),
                .m_axi4s_tvalid         (m_axi4s_tvalid),
                .m_axi4s_tready         (m_axi4s_tready)
            );
    
    
endmodule



`default_nettype wire



// end of file
