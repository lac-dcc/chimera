// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_img_selector
        #(
            parameter   NUM             = 2,
            parameter   USER_WIDTH      = 0,
            parameter   DATA_WIDTH      = 32,
            
            parameter   WB_ADR_WIDTH    = 8,
            parameter   WB_DAT_WIDTH    = 32,
            parameter   WB_SEL_WIDTH    = (WB_DAT_WIDTH / 8),
            
            parameter   CORE_ID         = 32'h527a_2f10,
            parameter   CORE_VERSION    = 32'h0001_0000,
            
            parameter   INIT_CTL_SELECT = 0,
            
            parameter   USER_BITS       = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire                            s_wb_rst_i,
            input   wire                            s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]      s_wb_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]      s_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]      s_wb_dat_o,
            input   wire                            s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]      s_wb_sel_i,
            input   wire                            s_wb_stb_i,
            output  wire                            s_wb_ack_o,
            
            input   wire    [NUM-1:0]               s_img_line_first,
            input   wire    [NUM-1:0]               s_img_line_last,
            input   wire    [NUM-1:0]               s_img_pixel_first,
            input   wire    [NUM-1:0]               s_img_pixel_last,
            input   wire    [NUM-1:0]               s_img_de,
            input   wire    [NUM*USER_BITS-1:0]     s_img_user,
            input   wire    [NUM*DATA_WIDTH-1:0]    s_img_data,
            input   wire    [NUM-1:0]               s_img_valid,
            
            // master (output)
            output  wire                            m_img_line_first,
            output  wire                            m_img_line_last,
            output  wire                            m_img_pixel_first,
            output  wire                            m_img_pixel_last,
            output  wire                            m_img_de,
            output  wire    [USER_BITS-1:0]         m_img_user,
            output  wire    [DATA_WIDTH-1:0]        m_img_data,
            output  wire                            m_img_valid
        );
    
    localparam SEL_WIDTH = NUM <   2 ? 1 :
                           NUM <   4 ? 2 :
                           NUM <   8 ? 3 :
                           NUM <  16 ? 4 :
                           NUM <  32 ? 5 :
                           NUM <  64 ? 6 :
                           NUM < 128 ? 7 : 8;
    
    
    // ---------------------------------
    //  Register
    // ---------------------------------
    
    // register address offset
    localparam  ADR_CORE_ID      = 8'h00;
    localparam  ADR_CORE_VERSION = 8'h01;
    localparam  ADR_CTL_SELECT   = 8'h08;
    localparam  ADR_CONFIG_NUM   = 8'h10;
    
    // registers
    reg     [SEL_WIDTH-1:0]     reg_ctl_select;
    
    function [WB_DAT_WIDTH-1:0] write_mask(
                                        input [WB_DAT_WIDTH-1:0] org,
                                        input [WB_DAT_WIDTH-1:0] wdat,
                                        input [WB_SEL_WIDTH-1:0] msk
                                    );
    integer i;
    begin
        for ( i = 0; i < WB_DAT_WIDTH; i = i+1 ) begin
            write_mask[i] = msk[i/8] ? wdat[i] : org[i];
        end
    end
    endfunction
    
    always @(posedge s_wb_clk_i) begin
        if ( s_wb_rst_i ) begin
            reg_ctl_select <= INIT_CTL_SELECT;
        end
        else begin
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                ADR_CTL_SELECT:    reg_ctl_select <= write_mask(reg_ctl_select, s_wb_dat_i, s_wb_sel_i);
                default: ;
                endcase
            end
        end
    end
    
    assign s_wb_dat_o = (s_wb_adr_i == ADR_CORE_ID)      ? CORE_ID        :
                        (s_wb_adr_i == ADR_CORE_VERSION) ? CORE_VERSION   :
                        (s_wb_adr_i == ADR_CTL_SELECT)   ? reg_ctl_select :
                        (s_wb_adr_i == ADR_CONFIG_NUM)   ? NUM            :
                        {WB_DAT_WIDTH{1'b0}};
    
    assign s_wb_ack_o = s_wb_stb_i;
    
    
    
    // ---------------------------------
    //  Core
    // ---------------------------------
    
    jelly_img_selector_core
            #(
                .NUM                (NUM),
                .SEL_WIDTH          (SEL_WIDTH),
                .USER_WIDTH         (USER_WIDTH),
                .DATA_WIDTH         (DATA_WIDTH)
            )
        i_img_selector_core
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .sel                (reg_ctl_select),
                
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
                .m_img_valid        (m_img_valid)
            );
    
    
endmodule


`default_nettype wire


// end of file
