// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// colormap
module jelly_colormap
        #(
            parameter   USER_WIDTH = 0,
            parameter   COLORMAP   = "JET",   // "HSV"
            
            parameter   USER_BITS  = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire    [USER_BITS-1:0]     s_user,
            input   wire    [7:0]               s_data,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire     [USER_BITS-1:0]    m_user,
            output  wire    [7:0]               m_data,
            output  wire    [23:0]              m_color,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    
    wire    [23:0]  s_color;
    jelly_colormap_table
            #(
                .COLORMAP       (COLORMAP)
            )
        i_colormap_table
            (
                .in_data        (s_data),
                .out_data       (s_color)
            );
    
    reg     [USER_BITS-1:0]     reg_user;
    reg     [7:0]               reg_data;
    reg     [23:0]              reg_color;
    reg                         reg_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_user  <= {USER_BITS{1'bx}};
            reg_data  <= {8{1'bx}};
            reg_color <= {24{1'bx}};
            reg_valid <= 1'b0;
        end
        else if ( cke ) begin
            if ( s_ready ) begin
                reg_user  <= s_user;
                reg_data  <= s_data;
                reg_color <= s_color;
                reg_valid <= s_valid;
            end
        end
    end
    
    assign s_ready = (!m_valid || m_ready);
    
    assign m_user  = reg_user;
    assign m_data  = reg_data;
    assign m_color = reg_color;
    assign m_valid = reg_valid;
    
endmodule


`default_nettype wire


// end of file
