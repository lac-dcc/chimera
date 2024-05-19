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


module diff_calc
        #(
            parameter   WB_ADR_WIDTH    = 6,
            parameter   WB_DAT_SIZE     = 2,
            parameter   WB_DAT_WIDTH    = (8 << WB_DAT_SIZE),
            parameter   WB_SEL_WIDTH    = WB_DAT_WIDTH / 8,
            
            parameter   ASYNC           = 1,
            parameter   IN_WIDTH        = 32,
            parameter   OUT_WIDTH       = 32,
            parameter   GAIN_WIDTH      = 18,
            parameter   Q_WIDTH         = 18,
            
            parameter   INIT_ENABLE     = 0,
            parameter   INIT_TARGET     = 0,
            parameter   INIT_GAIN       = 10
        )
        (
            input   wire                            s_wb_rst_i,
            input   wire                            s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]      s_wb_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]      s_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]      s_wb_dat_o,
            input   wire                            s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]      s_wb_sel_i,
            input   wire                            s_wb_stb_i,
            output  wire                            s_wb_ack_o,
            
            input   wire                            in_reset,
            input   wire                            in_clk,
            input   wire    signed  [IN_WIDTH-1:0]  in_data,
            input   wire                            in_valid,
            
            input   wire                            out_reset,
            input   wire                            out_clk,
            output  wire    signed  [OUT_WIDTH-1:0] out_data,
            output  wire                            out_valid
        );
    
    
    
    // -----------------------------------------
    //  monitor
    // -----------------------------------------
    
    reg     signed  [IN_WIDTH-1:0]   reg_in_data;
    reg     signed  [OUT_WIDTH-1:0]  reg_out_data;
    always @(posedge s_wb_clk_i) begin
        reg_in_data  <= in_data;
        reg_out_data <= out_data;
    end
    
    
    // -----------------------------------------
    //  Registers
    // -----------------------------------------
    
    localparam  ADR_ENABLE  = 0;
    localparam  ADR_TARGET  = 1;
    localparam  ADR_GAIN    = 2;
    localparam  ADR_INPUT   = 3;
    localparam  ADR_OUTPUT  = 4;
    
    reg                                 reg_enable;
    reg     signed  [IN_WIDTH-1:0]      reg_target;
    reg     signed  [GAIN_WIDTH-1:0]    reg_gain;
    
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
            reg_enable <= INIT_ENABLE;
            reg_target <= INIT_TARGET;
            reg_gain   <= INIT_GAIN;
        end
        else begin
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                ADR_ENABLE: reg_enable <= reg_mask(reg_enable, s_wb_dat_i, s_wb_sel_i);
                ADR_TARGET: reg_target <= reg_mask(reg_target, s_wb_dat_i, s_wb_sel_i);
                ADR_GAIN:   reg_gain   <= reg_mask(reg_gain,   s_wb_dat_i, s_wb_sel_i);
                endcase
            end
        end
    end
    
    assign s_wb_dat_o = (s_wb_adr_i == ADR_ENABLE) ? reg_enable   :
                        (s_wb_adr_i == ADR_TARGET) ? reg_target   :
                        (s_wb_adr_i == ADR_GAIN)   ? reg_gain     :
                        (s_wb_adr_i == ADR_INPUT)  ? reg_in_data  :
                        (s_wb_adr_i == ADR_OUTPUT) ? reg_out_data :
                        0;
    assign s_wb_ack_o = s_wb_stb_i;
    
    
    
    // -----------------------------------------
    //  Core
    // -----------------------------------------
    
    // async
    wire    [IN_WIDTH-1:0]      src_data;
    wire                        src_valid;
    
    jelly_data_async
            #(
                .ASYNC          (ASYNC),
                .DATA_WIDTH     (IN_WIDTH)
            )
        i_data_async
            (
                .s_reset        (in_reset),
                .s_clk          (in_clk),
                .s_data         (in_data),
                .s_valid        (in_valid),
                .s_ready        (),
                
                .m_reset        (out_reset),
                .m_clk          (out_clk),
                .m_data         (src_data),
                .m_valid        (src_valid),
                .m_ready        (1'b1)
            );
    
    localparam  DIFF_WIDTH = IN_WIDTH;
    localparam  MUL_WIDTH  = DIFF_WIDTH + GAIN_WIDTH;
    
    
    // calc
    reg     signed  [DIFF_WIDTH-1:0]    st0_data;
    reg     signed  [DIFF_WIDTH-1:0]    st0_target;
    reg                                 st0_valid;
    
    reg     signed  [DIFF_WIDTH-1:0]    st1_diff;
    reg                                 st1_valid;
    
    reg     signed  [MUL_WIDTH-1:0]     st2_data;
    reg                                 st2_valid;
    
    reg     signed  [OUT_WIDTH-1:0]     st3_data;
    reg                                 st3_valid;
    
    always @(posedge out_clk) begin
        if ( out_reset ) begin
            st0_data   <= {DIFF_WIDTH{1'bx}};
            st0_target <= {DIFF_WIDTH{1'bx}};
            st0_valid  <= 1'b0;
            st1_diff   <= {DIFF_WIDTH{1'bx}};
            st1_valid  <= 1'b0;
            st2_data   <= {MUL_WIDTH{1'bx}};
            st2_valid  <= 1'b0;
            st3_data   <= {OUT_WIDTH{1'b0}};
            st3_valid  <= 1'b0;
        end
        else begin
            // stage 0
            st0_data   <= in_data;
            st0_target <= reg_target;
            st0_valid  <= (src_valid & reg_enable);
            
            // stage 1
            st1_diff   <= st0_data - st0_target;
            st1_valid  <= st0_valid;
            
            // stage 2
            st2_data   <= st1_diff * reg_gain;
            st2_valid  <= st1_valid;
            
            // stage 2
            if ( st2_valid ) begin
                st3_data <= (st2_data >>> Q_WIDTH);
            end
            st3_valid <= st2_valid;
        end
    end
    
    assign out_data  = st3_data;
    assign out_valid = st3_valid;
    
endmodule


`default_nettype wire


// end of file
