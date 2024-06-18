// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_img_selector_core
        #(
            parameter   NUM          = 2,
            parameter   SEL_WIDTH    = 1,
            parameter   USER_WIDTH   = 0,
            parameter   DATA_WIDTH   = 32,
            
            parameter   USER_BITS    = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire    [SEL_WIDTH-1:0]         sel,
            
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
    
    (* ASYNC_REG="true" *)  reg     [SEL_WIDTH-1:0]   ff0_sel, ff1_sel;
    always @(posedge clk) begin
        ff0_sel <= sel;
        ff1_sel <= ff0_sel;
    end
    
    
    reg                         reg_busy;
    reg                         reg_change;
    reg     [SEL_WIDTH-1:0]     reg_sel;
    
    reg                         reg_line_first;
    reg                         reg_line_last;
    reg                         reg_pixel_first;
    reg                         reg_pixel_last;
    reg                         reg_de;
    reg     [USER_BITS-1:0]     reg_user;
    reg     [DATA_WIDTH-1:0]    reg_data;
    reg                         reg_valid;
    
    wire                        sel_line_first  = s_img_line_first [reg_sel];
    wire                        sel_line_last   = s_img_line_last  [reg_sel];
    wire                        sel_pixel_first = s_img_pixel_first[reg_sel];
    wire                        sel_pixel_last  = s_img_pixel_last [reg_sel];
    wire                        sel_de          = s_img_de         [reg_sel];
    wire    [USER_BITS-1:0]     sel_user        = s_img_user       [reg_sel*USER_BITS  +: USER_BITS];
    wire    [DATA_WIDTH-1:0]    sel_data        = s_img_data       [reg_sel*DATA_WIDTH +: DATA_WIDTH];
    wire                        sel_valid       = s_img_valid      [reg_sel];
    
    wire                        frame_start = (sel_valid & sel_line_first & sel_pixel_first);
    wire                        frame_end   = (reg_valid & reg_line_last  & reg_pixel_last);
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_busy        <= 0;
            reg_change      <= 0;
            reg_sel         <= ff1_sel;
            reg_line_first  <= 1'b0;
            reg_line_last   <= 1'b0;
            reg_pixel_first <= 1'b0;
            reg_pixel_last  <= 1'b0;
            reg_de          <= 1'b0;
            reg_user        <= {USER_BITS{1'bx}};
            reg_data        <= {DATA_WIDTH{1'bx}};
            reg_valid       <= 1'b0;
        end
        else if ( cke ) begin
            reg_change <= (reg_sel != ff1_sel);
            
            if ( frame_start && !reg_change ) begin
                reg_busy <= 1'b1;
            end
            else if ( frame_end ) begin
                reg_busy <= 1'b0;
            end
            
            if ( !frame_start && !reg_busy ) begin
                reg_sel <= ff1_sel;
            end
            
            reg_line_first  <= sel_line_first;
            reg_line_last   <= sel_line_last;
            reg_pixel_first <= sel_pixel_first;
            reg_pixel_last  <= sel_pixel_last;
            reg_de          <= sel_de;
            reg_user        <= sel_user;
            reg_data        <= sel_data;
            reg_valid       <= sel_valid;
        end
    end
    
    assign m_img_line_first  = reg_line_first;
    assign m_img_line_last   = reg_line_last;
    assign m_img_pixel_first = reg_pixel_first;
    assign m_img_pixel_last  = reg_pixel_last;
    assign m_img_de          = reg_de;
    assign m_img_user        = reg_user;
    assign m_img_data        = reg_data;
    assign m_img_valid       = reg_valid;
    
    
endmodule


`default_nettype wire


// end of file
