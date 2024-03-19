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


module position_calc
        #(
            parameter   WB_ADR_WIDTH    = 6,
            parameter   WB_DAT_SIZE     = 2,
            parameter   WB_DAT_WIDTH    = (8 << WB_DAT_SIZE),
            parameter   WB_SEL_WIDTH    = WB_DAT_WIDTH / 8,
            
            parameter   ASYNC           = 1,
            parameter   IN_X_WIDTH      = 14,
            parameter   IN_Y_WIDTH      = 14,
            parameter   OUT_WIDTH       = 32,
            
            parameter   COEFF_X_WIDTH   = 24,
            parameter   COEFF_Y_WIDTH   = 24,
            parameter   OFFSET_WIDTH    = 32,
            
            parameter   INIT_ENABLE     = 0,
            parameter   INIT_COEFF_X    = 24'h000100,
            parameter   INIT_COEFF_Y    = 24'h000100,
            parameter   INIT_OFFSET     = 0
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            
            input   wire    [WB_ADR_WIDTH-1:0]  s_wb_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_o,
            input   wire                        s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]  s_wb_sel_i,
            input   wire                        s_wb_stb_i,
            output  wire                        s_wb_ack_o,
            
            input   wire                        in_reset,
            input   wire                        in_clk,
            input   wire    [IN_X_WIDTH-1:0]    in_x,
            input   wire    [IN_Y_WIDTH-1:0]    in_y,
            input   wire                        in_valid,
            
            input   wire                        out_reset,
            input   wire                        out_clk,
            output  wire    [OUT_WIDTH-1:0]     out_data,
            output  wire                        out_valid
        );
    
    
    
    // -----------------------------------------
    //  Registers
    // -----------------------------------------
    
    localparam  ADR_ENABLE  = 0;
    localparam  ADR_COEFF_X = 1;
    localparam  ADR_COEFF_Y = 2;
    localparam  ADR_OFFSET  = 3;
    
    reg                                 reg_enable;
    reg     signed  [COEFF_X_WIDTH-1:0] reg_coef_x;
    reg     signed  [COEFF_Y_WIDTH-1:0] reg_coef_y;
    reg     signed  [OFFSET_WIDTH-1:0]  reg_offset;
    
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
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_enable <= INIT_ENABLE;
            reg_coef_x <= INIT_COEFF_X;
            reg_coef_y <= INIT_COEFF_Y;
            reg_offset <= INIT_OFFSET;
        end
        else begin
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                ADR_ENABLE:    reg_enable <= reg_mask(reg_enable, s_wb_dat_i, s_wb_sel_i);
                ADR_COEFF_X:   reg_coef_x <= reg_mask(reg_coef_x, s_wb_dat_i, s_wb_sel_i);
                ADR_COEFF_Y:   reg_coef_y <= reg_mask(reg_coef_y, s_wb_dat_i, s_wb_sel_i);
                ADR_OFFSET:    reg_offset <= reg_mask(reg_offset, s_wb_dat_i, s_wb_sel_i);
                endcase
            end
        end
    end
    
    assign s_wb_dat_o = (s_wb_adr_i == ADR_ENABLE)  ? reg_enable :
                        (s_wb_adr_i == ADR_COEFF_X) ? reg_coef_x :
                        (s_wb_adr_i == ADR_COEFF_Y) ? reg_coef_y :
                        (s_wb_adr_i == ADR_OFFSET)  ? reg_offset :
                        0;
    assign s_wb_ack_o = s_wb_stb_i;
    
    
    
    // -----------------------------------------
    //  Core
    // -----------------------------------------
    
    // async
    wire    [IN_X_WIDTH-1:0]    src_x;
    wire    [IN_Y_WIDTH-1:0]    src_y;
    wire                        src_valid;
    
    jelly_data_async
            #(
                .ASYNC          (ASYNC),
                .DATA_WIDTH     (IN_Y_WIDTH+IN_X_WIDTH)
            )
        i_data_async
            (
                .s_reset        (in_reset),
                .s_clk          (in_clk),
                .s_data         ({in_y, in_x}),
                .s_valid        (in_valid),
                .s_ready        (),
                
                .m_reset        (out_reset),
                .m_clk          (out_clk),
                .m_data         ({src_y, src_x}),
                .m_valid        (src_valid),
                .m_ready        (1'b1)
            );
    
    
    // caloc
    reg     signed  [OUT_WIDTH-1:0]     st0_x;
    reg     signed  [OUT_WIDTH-1:0]     st0_y;
    reg                                 st0_valid;
    reg     signed  [OUT_WIDTH-1:0]     st1_data;
    reg                                 st1_valid;
    reg     signed  [OUT_WIDTH-1:0]     st2_data;
    reg                                 st2_valid;
    
    always @(posedge out_clk) begin
        if ( out_reset ) begin
            st0_x     <= {OUT_WIDTH{1'bx}};
            st0_y     <= {OUT_WIDTH{1'bx}};
            st0_valid <= 1'b0;
            st1_data  <= {OUT_WIDTH{1'bx}};
            st1_valid <= 1'b0;
            st2_data  <= {OUT_WIDTH{1'b0}};
            st2_valid <= 1'b0;
        end
        else begin
            // stage 0
            st0_x     <= src_x * reg_coef_x;
            st0_y     <= src_y * reg_coef_y;
            st0_valid <= (src_valid & reg_enable);
            
            // stage 1
            st1_data  <= st0_x + st0_y;
            st1_valid <= st0_valid;
            
            // stage 2
            if ( st1_valid ) begin
                st2_data <= st1_data + reg_offset;
            end
            st2_valid <= st1_valid;
        end
    end
    
    assign out_data  = st2_data;
    assign out_valid = st2_valid;
    
endmodule


`default_nettype wire


// end of file
