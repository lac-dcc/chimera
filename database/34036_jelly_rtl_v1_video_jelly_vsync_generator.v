// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The FPGA processing system
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



//  video sync generator
module jelly_vsync_generator
        #(
            parameter   CORE_ID          = 32'h527a_1150,
            parameter   CORE_VERSION     = 32'h0000_0000,
            
            parameter   V_COUNTER_WIDTH  = 12,
            parameter   H_COUNTER_WIDTH  = 12,
            
            parameter   WB_ADR_WIDTH     = 8,
            parameter   WB_DAT_WIDTH     = 32,
            parameter   WB_SEL_WIDTH     = (WB_DAT_WIDTH / 8),
            
            parameter   INIT_CTL_CONTROL = 1'b0,
            parameter   INIT_HTOTAL      = 96 + 16 + 640 + 48,
            parameter   INIT_HDISP_START = 96 + 16,
            parameter   INIT_HDISP_END   = 96 + 16 + 640,
            parameter   INIT_HSYNC_START = 0,
            parameter   INIT_HSYNC_END   = 96,
            parameter   INIT_HSYNC_POL   = 0,                   // 0:N 1:P
            parameter   INIT_VTOTAL      = 2 + 10 + 480 + 33,
            parameter   INIT_VDISP_START = 2 + 10,
            parameter   INIT_VDISP_END   = 2 + 10 + 480,
            parameter   INIT_VSYNC_START = 0,
            parameter   INIT_VSYNC_END   = 2,
            parameter   INIT_VSYNC_POL   = 0                    // 0:N 1:P
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            
            // output
            output  wire                            out_vsync,
            output  wire                            out_hsync,
            output  wire                            out_de,
            
            // WISHBONE (register access)
            input   wire                            s_wb_rst_i,
            input   wire                            s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]      s_wb_adr_i,
            output  wire    [WB_DAT_WIDTH-1:0]      s_wb_dat_o,
            input   wire    [WB_DAT_WIDTH-1:0]      s_wb_dat_i,
            input   wire                            s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]      s_wb_sel_i,
            input   wire                            s_wb_stb_i,
            output  wire                            s_wb_ack_o
        );
    
    // ---------------------------------
    //  Register
    // ---------------------------------
    
    // register address offset
    localparam  ADR_CORE_ID           = 8'h00;
    localparam  ADR_CORE_VERSION      = 8'h01;
    localparam  ADR_CTL_CONTROL       = 8'h04;
    localparam  ADR_CTL_STATUS        = 8'h05;
    localparam  ADR_PARAM_HTOTAL      = 8'h08;
    localparam  ADR_PARAM_HSYNC_POL   = 8'h0B;
    localparam  ADR_PARAM_HDISP_START = 8'h0C;
    localparam  ADR_PARAM_HDISP_END   = 8'h0D;
    localparam  ADR_PARAM_HSYNC_START = 8'h0E;
    localparam  ADR_PARAM_HSYNC_END   = 8'h0F;
    localparam  ADR_PARAM_VTOTAL      = 8'h10;
    localparam  ADR_PARAM_VSYNC_POL   = 8'h13;
    localparam  ADR_PARAM_VDISP_START = 8'h14;
    localparam  ADR_PARAM_VDISP_END   = 8'h15;
    localparam  ADR_PARAM_VSYNC_START = 8'h16;
    localparam  ADR_PARAM_VSYNC_END   = 8'h17;
    
    
    // registers
    reg     [0:0]                   reg_ctl_control;
    wire    [0:0]                   sig_ctl_status;
    
    reg     [H_COUNTER_WIDTH-1:0]   reg_param_htotal;
    reg     [H_COUNTER_WIDTH-1:0]   reg_param_hdisp_start;
    reg     [H_COUNTER_WIDTH-1:0]   reg_param_hdisp_end;
    reg     [H_COUNTER_WIDTH-1:0]   reg_param_hsync_start;
    reg     [H_COUNTER_WIDTH-1:0]   reg_param_hsync_end;
    reg                             reg_param_hsync_pol;        // 0:n 1:p
    reg     [V_COUNTER_WIDTH-1:0]   reg_param_vtotal;
    reg     [V_COUNTER_WIDTH-1:0]   reg_param_vdisp_start;
    reg     [V_COUNTER_WIDTH-1:0]   reg_param_vdisp_end;
    reg     [V_COUNTER_WIDTH-1:0]   reg_param_vsync_start;
    reg     [V_COUNTER_WIDTH-1:0]   reg_param_vsync_end;
    reg                             reg_param_vsync_pol;        // 0:n 1:p
    
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
    
    always @(posedge s_wb_clk_i ) begin
        if ( s_wb_rst_i ) begin
            reg_ctl_control       <= INIT_CTL_CONTROL;
            reg_param_htotal      <= INIT_HTOTAL;
            reg_param_hdisp_start <= INIT_HDISP_START;
            reg_param_hdisp_end   <= INIT_HDISP_END;
            reg_param_hsync_start <= INIT_HSYNC_START;
            reg_param_hsync_end   <= INIT_HSYNC_END;
            reg_param_hsync_pol   <= INIT_HSYNC_POL;
            reg_param_vtotal      <= INIT_VTOTAL;
            reg_param_vdisp_start <= INIT_VDISP_START;
            reg_param_vdisp_end   <= INIT_VDISP_END;
            reg_param_vsync_start <= INIT_VSYNC_START;
            reg_param_vsync_end   <= INIT_VSYNC_END;
            reg_param_vsync_pol   <= INIT_VSYNC_POL;
        end
        else if ( s_wb_stb_i && s_wb_we_i ) begin
            case ( s_wb_adr_i )
            ADR_CTL_CONTROL:          reg_ctl_control       <= reg_mask(reg_ctl_control,       s_wb_dat_i, s_wb_sel_i);
            ADR_PARAM_HTOTAL:         reg_param_htotal      <= reg_mask(reg_param_htotal,      s_wb_dat_i, s_wb_sel_i);
            ADR_PARAM_HDISP_START:    reg_param_hdisp_start <= reg_mask(reg_param_hdisp_start, s_wb_dat_i, s_wb_sel_i);
            ADR_PARAM_HDISP_END:      reg_param_hdisp_end   <= reg_mask(reg_param_hdisp_end,   s_wb_dat_i, s_wb_sel_i);
            ADR_PARAM_HSYNC_START:    reg_param_hsync_start <= reg_mask(reg_param_hsync_start, s_wb_dat_i, s_wb_sel_i);
            ADR_PARAM_HSYNC_END:      reg_param_hsync_end   <= reg_mask(reg_param_hsync_end ,  s_wb_dat_i, s_wb_sel_i);
            ADR_PARAM_HSYNC_POL:      reg_param_hsync_pol   <= reg_mask(reg_param_hsync_pol,   s_wb_dat_i, s_wb_sel_i);
            ADR_PARAM_VTOTAL:         reg_param_vtotal      <= reg_mask(reg_param_vtotal,      s_wb_dat_i, s_wb_sel_i);
            ADR_PARAM_VDISP_START:    reg_param_vdisp_start <= reg_mask(reg_param_vdisp_start, s_wb_dat_i, s_wb_sel_i);
            ADR_PARAM_VDISP_END:      reg_param_vdisp_end   <= reg_mask(reg_param_vdisp_end,   s_wb_dat_i, s_wb_sel_i);
            ADR_PARAM_VSYNC_START:    reg_param_vsync_start <= reg_mask(reg_param_vsync_start, s_wb_dat_i, s_wb_sel_i);
            ADR_PARAM_VSYNC_END:      reg_param_vsync_end   <= reg_mask(reg_param_vsync_end,   s_wb_dat_i, s_wb_sel_i);
            ADR_PARAM_VSYNC_POL:      reg_param_vsync_pol   <= reg_mask(reg_param_vsync_pol,   s_wb_dat_i, s_wb_sel_i);
            endcase
        end
    end
    
    assign s_wb_dat_o = (s_wb_adr_i == ADR_CORE_ID)           ? CORE_ID               :
                        (s_wb_adr_i == ADR_CORE_VERSION)      ? CORE_VERSION          :
                        (s_wb_adr_i == ADR_CTL_CONTROL)       ? reg_ctl_control       :
                        (s_wb_adr_i == ADR_CTL_STATUS)        ? sig_ctl_status        :
                        (s_wb_adr_i == ADR_PARAM_HTOTAL)      ? reg_param_htotal      :
                        (s_wb_adr_i == ADR_PARAM_HDISP_START) ? reg_param_hdisp_start :
                        (s_wb_adr_i == ADR_PARAM_HDISP_END)   ? reg_param_hdisp_end   :
                        (s_wb_adr_i == ADR_PARAM_HSYNC_START) ? reg_param_hsync_start :
                        (s_wb_adr_i == ADR_PARAM_HSYNC_END)   ? reg_param_hsync_end   :
                        (s_wb_adr_i == ADR_PARAM_HSYNC_POL)   ? reg_param_hsync_pol   :
                        (s_wb_adr_i == ADR_PARAM_VTOTAL)      ? reg_param_vtotal      :
                        (s_wb_adr_i == ADR_PARAM_VDISP_START) ? reg_param_vdisp_start :
                        (s_wb_adr_i == ADR_PARAM_VDISP_END)   ? reg_param_vdisp_end   :
                        (s_wb_adr_i == ADR_PARAM_VSYNC_START) ? reg_param_vsync_start :
                        (s_wb_adr_i == ADR_PARAM_VSYNC_END)   ? reg_param_vsync_end   :
                        (s_wb_adr_i == ADR_PARAM_VSYNC_POL)   ? reg_param_vsync_pol   :
                        32'h0000_0000;
    
    assign s_wb_ack_o = s_wb_stb_i;
    
    
    // ---------------------------------
    //  Core
    // ---------------------------------
    
    jelly_vsync_generator_core
            #(
                .V_COUNTER_WIDTH    (V_COUNTER_WIDTH),
                .H_COUNTER_WIDTH    (H_COUNTER_WIDTH)
            )
        i_vsync_generator_core
            (
                .reset              (reset),
                .clk                (clk),
                
                .ctl_enable         (reg_ctl_control[0]),
                .ctl_busy           (sig_ctl_status[0]),
                
                .param_htotal       (reg_param_htotal),
                .param_hdisp_start  (reg_param_hdisp_start),
                .param_hdisp_end    (reg_param_hdisp_end),
                .param_hsync_start  (reg_param_hsync_start),
                .param_hsync_end    (reg_param_hsync_end),
                .param_hsync_pol    (reg_param_hsync_pol),
                .param_vtotal       (reg_param_vtotal),
                .param_vdisp_start  (reg_param_vdisp_start),
                .param_vdisp_end    (reg_param_vdisp_end),
                .param_vsync_start  (reg_param_vsync_start),
                .param_vsync_end    (reg_param_vsync_end),
                .param_vsync_pol    (reg_param_vsync_pol),
                
                .out_vsync          (out_vsync),
                .out_hsync          (out_hsync),
                .out_de             (out_de)
            );
    
endmodule


`default_nettype wire


// end of file
