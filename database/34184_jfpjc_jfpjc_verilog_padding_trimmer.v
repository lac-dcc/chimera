// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

/**
 * Some cameras pad their active area with pixels on the top and bottom.
 *
 * This module adjusts vsync and hsync so that those pixels are discarded.
 */

`timescale 1ns/100ps

module vsync_hsync_roi(input                pixclk_in,
                       input                hsync_in,
                       input                vsync_in,

                       output               pixclk_out,
                       output reg           hsync_out,
                       output reg           vsync_out);
    parameter roi_width = 320, roi_height = 240;
    parameter left_padding = 2, right_padding = 2;
    parameter top_padding = 2, bottom_padding = 2;
    localparam xmax = roi_width + left_padding + right_padding;
    localparam ymax = roi_height + top_padding + bottom_padding;

    reg [($clog2(xmax) - 1):0] x, x_next;
    reg [($clog2(ymax) - 1):0] y, y_next;

    // have hsync low act as asynchronous reset
    always @(negedge pixclk_in or negedge hsync_in) begin
        if (!hsync_in)
            x <= 'h0;
        else begin
            x <= (x == xmax) ? xmax : x + 'h1;
        end
    end

    // x is incremented by pixclk posedge... I see no reason that y can't be incremented by hsync
    // negedge. We're already using async reset.
    always @(negedge hsync_in or negedge vsync_in) begin
        if (!vsync_in)
            y <= 'h0;
        else
            y <= (y == ymax) ? ymax : y + 'h1;
    end

    always @* begin
        hsync_out = hsync_in & ((x >= left_padding) && (x < (left_padding + roi_width)));
        vsync_out = vsync_in & ((y >= top_padding) && (y < (top_padding + roi_height)));
    end
    assign pixclk_out = pixclk_in;
endmodule
