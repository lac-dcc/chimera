// This program was cloned from: https://github.com/gfg-development/grayblastVGA
// License: Apache License 2.0

/* The VGA driver for the 4 bit gray-scale GPU.
 * It reads the pixel values from a frame buffer and outputs them.
 * Via the pixel_div signal the number of merge pixel, can be configured.
 *
 * -----------------------------------------------------------------------------
 *
 * Copyright (c) 2024 Gerrit Grutzeck (g.grutzeck@gfg-development.de)
 * SPDX-License-Identifier: Apache-2.0
 *
 * -----------------------------------------------------------------------------
 *
 * Author   : Gerrit Grutzeck g.grutzeck@gfg-development.de
 * File     : vga.v
 * Create   : Mai 10, 2024
 * Revise   : Mai 10, 2024
 * Revision : 1.0
 *
 * -----------------------------------------------------------------------------
 */

`default_nettype none

module vga #(
    parameter LINE_VISIBLE      = 800,
    parameter LINE_FRONT_PORCH  = 40,
    parameter LINE_SYNC_PULSE   = 128,
    parameter LINE_BACK_PORCH   = 88,

    parameter ROW_VISIBLE       = 600,
    parameter ROW_FRONT_PORCH   = 1,
    parameter ROW_SYNC_PULSE    = 4,
    parameter ROW_BACK_PORCH    = 23,

    parameter WIDTH_PIXEL_DIV   = 4
) (
    /* General signals */
    input  wire                             clk,                    // clock
    input  wire                             rst_n,                  // low active reset, already synchronized to the clock

    /* configuration signals */
    input  wire [WIDTH_PIXEL_DIV - 1 : 0]   pixel_div,              // divider minus 1 for the pixel shifting, minimal value for it is 3

    /* VGA signals */
    output wire                             v_sync_out,             // vertical sync pulse
    output wire                             h_sync_out,             // horizontal sync pulse
    output wire [3:0]                       gray_out,               // the gray scale pixel value

    /* Framebuffer signals */
    output wire                             frame_next_pixel_out,   // request the next pixel with a rising edge
    output wire                             frame_reset_out,        // request a reset of the frame buffer pointer
    input  wire [3:0]                       frame_pixel_in          // the pixel data from the frame buffer
);
    /* Calculate some helpfull constants */
    parameter WIDTH_PIXEL_CTR   = $clog2(LINE_VISIBLE + LINE_FRONT_PORCH + LINE_SYNC_PULSE + LINE_BACK_PORCH);
    parameter WIDTH_LINE_CTR    = $clog2(ROW_VISIBLE + ROW_FRONT_PORCH + ROW_SYNC_PULSE + ROW_BACK_PORCH);

    assign v_sync_out           = v_sync;
    assign h_sync_out           = h_sync;

    assign frame_reset_out      = v_sync;
    assign frame_next_pixel_out = shift_pixel_out;

    /* Counter and state machine for pixels in a line */
    reg  [WIDTH_PIXEL_CTR - 1 : 0]  pixel_ctr;
    reg                             h_sync;
    reg                             new_line;
    reg                             row_reset;
    always @(posedge clk) begin
        if (rst_n == 0) begin
            pixel_ctr                       <= 0;
            row_reset                       <= 1;
            h_sync                          <= 0;
        end else begin
            new_line                        <= 0;
            pixel_ctr                       <= pixel_ctr + 1;

            if (pixel_ctr == LINE_VISIBLE - 1) begin
                row_reset                   <= 1;
            end

            if (pixel_ctr == LINE_VISIBLE + LINE_FRONT_PORCH - 2) begin
                new_line                    <= 1;
            end

            if (pixel_ctr == LINE_VISIBLE + LINE_FRONT_PORCH - 1) begin
                h_sync                      <= 1;
            end

            if (pixel_ctr == LINE_VISIBLE + LINE_FRONT_PORCH + LINE_SYNC_PULSE - 1) begin
                h_sync                      <= 0;
            end

            if (pixel_ctr == LINE_VISIBLE + LINE_FRONT_PORCH + LINE_SYNC_PULSE + LINE_BACK_PORCH - 1) begin
                row_reset                   <= 0;
                pixel_ctr                   <= 0;
            end
        end
    end

    /* Counter and state machine for lines in a frame */
    reg  [WIDTH_LINE_CTR - 1 : 0]   line_ctr;
    reg                             v_sync;
    reg                             line_reset;
    always @(posedge clk) begin
        if (rst_n == 0) begin
            line_ctr                        <= 0;
            line_reset                      <= 1;
            v_sync                          <= 0;
        end else begin
            if (new_line == 1) begin
                line_ctr                        <= line_ctr + 1;

                if (line_ctr == ROW_VISIBLE - 1) begin
                    line_reset                  <= 1;
                end

                if (line_ctr == ROW_VISIBLE + ROW_FRONT_PORCH - 1) begin
                    v_sync                      <= 1;
                end

                if (line_ctr == ROW_VISIBLE + ROW_FRONT_PORCH + ROW_SYNC_PULSE - 1) begin
                    v_sync                      <= 0;
                end

                if (line_ctr == ROW_VISIBLE + ROW_FRONT_PORCH + ROW_SYNC_PULSE + ROW_BACK_PORCH - 1) begin
                    line_reset                  <= 0;
                    line_ctr                    <= 0;
                end
            end
        end
    end

    /* Black out the pixels while not in the visible area */
    assign  gray_out = (row_reset == 1 || line_reset == 1) ? 0 : pixel_buffer;

    /* Handle the buffering and reading of pixels from the frame buffer */
    reg  [WIDTH_PIXEL_DIV - 1 : 0]  clk_ctr;
    reg                             shift_pixel_out;
    reg  [3 : 0]                    pixel_buffer;
    always @(posedge clk) begin
        if (row_reset == 1 || line_reset == 1) begin
            clk_ctr                         <= 0;
            shift_pixel_out                 <= 0;
            pixel_buffer                    <= frame_pixel_in;
        end else begin
            if (clk_ctr == pixel_div) begin
                clk_ctr                     <= 0;
                pixel_buffer                <= frame_pixel_in;
            end else begin
                clk_ctr                     <= clk_ctr + 1;
            end

            if (clk_ctr == 0) begin
                shift_pixel_out             <= 1;
            end

            if (clk_ctr == (pixel_div >> 1)) begin
                shift_pixel_out             <= 0;
            end
        end
    end
endmodule
