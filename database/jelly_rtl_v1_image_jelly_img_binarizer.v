// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_binarizer
        #(
            parameter   CORE_ID          = 32'h527a_2210,
            parameter   CORE_VERSION     = 32'h0001_0000,
            
            parameter   USER_WIDTH       = 0,
            parameter   DATA_WIDTH       = 8,
            parameter   BINARY_WIDTH     = 1,
            parameter   INDEX_WIDTH      = 1,
            
            parameter   WB_ADR_WIDTH     = 8,
            parameter   WB_DAT_WIDTH     = 32,
            parameter   WB_SEL_WIDTH     = (WB_DAT_WIDTH / 8),
            
            parameter   INIT_CTL_CONTROL = 3'b011,
            parameter   INIT_PARAM_TH    = 127,
            parameter   INIT_PARAM_INV   = 0,
            parameter   INIT_PARAM_VAL0  = {BINARY_WIDTH{1'b0}},
            parameter   INIT_PARAM_VAL1  = {BINARY_WIDTH{1'b1}},
            
            parameter   USER_BITS        = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire                            s_img_line_first,
            input   wire                            s_img_line_last,
            input   wire                            s_img_pixel_first,
            input   wire                            s_img_pixel_last,
            input   wire                            s_img_de,
            input   wire    [USER_BITS-1:0]         s_img_user,
            input   wire    [DATA_WIDTH-1:0]        s_img_data,
            input   wire                            s_img_valid,
            
            output  wire                            m_img_line_first,
            output  wire                            m_img_line_last,
            output  wire                            m_img_pixel_first,
            output  wire                            m_img_pixel_last,
            output  wire                            m_img_de,
            output  wire    [USER_BITS-1:0]         m_img_user,
            output  wire    [DATA_WIDTH-1:0]        m_img_data,
            output  wire    [BINARY_WIDTH-1:0]      m_img_binary,
            output  wire                            m_img_valid,
            
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
    
    
    // ---------------------------------
    //  Register
    // ---------------------------------
    
    // register address offset
    localparam  ADR_CORE_ID      = 8'h00;
    localparam  ADR_CORE_VERSION = 8'h01;
    localparam  ADR_CTL_CONTROL  = 8'h04;
    localparam  ADR_CTL_STATUS   = 8'h05;
    localparam  ADR_CTL_INDEX    = 8'h07;
    localparam  ADR_PARAM_TH     = 8'h08;
    localparam  ADR_PARAM_INV    = 8'h09;
    localparam  ADR_PARAM_VAL0   = 8'h0a;
    localparam  ADR_PARAM_VAL1   = 8'h0b;
    localparam  ADR_CURRENT_TH   = 8'h18;
    localparam  ADR_CURRENT_INV  = 8'h19;
    localparam  ADR_CURRENT_VAL0 = 8'h1a;
    localparam  ADR_CURRENT_VAL1 = 8'h1b;
    
    // handshake
    wire    [INDEX_WIDTH-1:0]   update_index;
    wire                        update_ack;
    wire    [INDEX_WIDTH-1:0]   ctl_index;
    
    jelly_param_update_master
            #(
                .INDEX_WIDTH    (INDEX_WIDTH)
            )
        i_param_update_master
            (
                .reset          (s_wb_rst_i),
                .clk            (s_wb_clk_i),
                .cke            (1'b1),
                .in_index       (update_index),
                .out_ack        (update_ack),
                .out_index      (ctl_index)
            );
    
    // registers
    reg     [2:0]                   reg_ctl_control;
    reg     [DATA_WIDTH-1:0]        reg_param_th;
    reg     [0:0]                   reg_param_inv;
    reg     [BINARY_WIDTH-1:0]      reg_param_val0;
    reg     [BINARY_WIDTH-1:0]      reg_param_val1;
    
    // core status
    wire    [0:0]                   core_ctl_status;
    wire    [DATA_WIDTH-1:0]        core_current_th;
    wire    [0:0]                   core_current_inv;
    wire    [BINARY_WIDTH-1:0]      core_current_val0;
    wire    [BINARY_WIDTH-1:0]      core_current_val1;
    
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
            reg_ctl_control  <= INIT_CTL_CONTROL;
            reg_param_th     <= INIT_PARAM_TH;
            reg_param_inv    <= INIT_PARAM_INV;
            reg_param_val0   <= INIT_PARAM_VAL0;
            reg_param_val1   <= INIT_PARAM_VAL1;
        end
        else begin
            if ( update_ack && !reg_ctl_control[2] ) begin
                reg_ctl_control[1] <= 1'b0;     // auto clear
            end
            
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                ADR_CTL_CONTROL: reg_ctl_control <= reg_mask(reg_ctl_control, s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_TH:    reg_param_th    <= reg_mask(reg_param_th,    s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_INV:   reg_param_inv   <= reg_mask(reg_param_inv,   s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_VAL0:  reg_param_val0  <= reg_mask(reg_param_val0,  s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_VAL1:  reg_param_val1  <= reg_mask(reg_param_val1,  s_wb_dat_i, s_wb_sel_i);
                endcase
            end
        end
    end
    
    assign s_wb_dat_o = (s_wb_adr_i == ADR_CORE_ID)      ? CORE_ID           :
                        (s_wb_adr_i == ADR_CORE_VERSION) ? CORE_VERSION      :
                        (s_wb_adr_i == ADR_CTL_CONTROL)  ? reg_ctl_control   :
                        (s_wb_adr_i == ADR_CTL_STATUS)   ? core_ctl_status   :
                        (s_wb_adr_i == ADR_CTL_INDEX)    ? ctl_index         :
                        (s_wb_adr_i == ADR_PARAM_TH)     ? reg_param_th      :
                        (s_wb_adr_i == ADR_PARAM_INV)    ? reg_param_inv     :
                        (s_wb_adr_i == ADR_PARAM_VAL0)   ? reg_param_val0    :
                        (s_wb_adr_i == ADR_PARAM_VAL1)   ? reg_param_val1    :
                        (s_wb_adr_i == ADR_CURRENT_TH)   ? core_current_th   :
                        (s_wb_adr_i == ADR_CURRENT_INV)  ? core_current_inv  :
                        (s_wb_adr_i == ADR_CURRENT_VAL0) ? core_current_val0 :
                        (s_wb_adr_i == ADR_CURRENT_VAL1) ? core_current_val1 :
                        0;
    assign s_wb_ack_o = s_wb_stb_i;
    
    
    
    // ---------------------------------
    //  Core
    // ---------------------------------
    
    jelly_img_binarizer_core
            #(
                .USER_WIDTH         (USER_WIDTH),
                .DATA_WIDTH         (DATA_WIDTH),
                .BINARY_WIDTH       (BINARY_WIDTH)
            )
        i_img_binarizer_core
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .ctl_update         (reg_ctl_control[1]),
                .ctl_index          (update_index),
                
                .param_enable       (reg_ctl_control[0]),
                .param_th           (reg_param_th),
                .param_inv          (reg_param_inv),
                .param_val0         (reg_param_val0),
                .param_val1         (reg_param_val1),
                
                .current_enable     (core_ctl_status),
                .current_th         (core_current_th),
                .current_val0       (core_current_val0),
                .current_val1       (core_current_val1),
                .current_inv        (core_current_inv),
                
                
                .s_img_line_first   (s_img_line_first),
                .s_img_line_last    (s_img_line_last),
                .s_img_pixel_first  (s_img_pixel_first),
                .s_img_pixel_last   (s_img_pixel_last),
                .s_img_de           (s_img_de),
                .s_img_user         (s_img_user),
                .s_img_data         (s_img_data),
                .s_img_valid        (s_img_valid),
                
                .m_img_line_first   (m_img_line_first),
                .m_img_line_last    (m_img_line_last),
                .m_img_pixel_first  (m_img_pixel_first),
                .m_img_pixel_last   (m_img_pixel_last),
                .m_img_de           (m_img_de),
                .m_img_user         (m_img_user),
                .m_img_data         (m_img_data),
                .m_img_binary       (m_img_binary),
                .m_img_valid        (m_img_valid)
            );
    
    
endmodule


`default_nettype wire


// end of file
