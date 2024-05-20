// This program was cloned from: https://github.com/emern/badGPU
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Emery Nagy
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

`define COLOR_DEFAULT 6'b000000
`define DEPTH_INF 3'b000


module tt_um_emern_pixel_core (
    input clk,
    input rst_n,
    input pixel_clr, // Clear the pixel state
    input cmp_en, // Enable polygon rasterization
    input [8:0] pixel_row, // Current pixel row location
    input [9:0] pixel_col, // Current pixel column location

    // Packed polygon data struct
    input [8:0] polygon_depth,
    input [17:0] polygon_color,
    input [17:0] polygon_column,
    input [17:0] polygon_row,

    output [5:0] pixel_out // Final value of pixel color
);

    reg [5:0] cur_pixel;
    reg [2:0] cur_depth;

    wire [9:0] poly_p0_col;
    wire [9:0] poly_p1_col;
    wire [9:0] poly_p2_col;

    wire [8:0] poly_p0_row;
    wire [8:0] poly_p1_row;
    wire [8:0] poly_p2_row;

    assign pixel_out = cur_pixel;

    // Each polygon column is encoded by value 0 -> 64 which needs to be interpolated to 0 -> 640 (multiply by 10)
    assign poly_p0_col = (polygon_column[5:0] << 3) + (polygon_column[5:0] << 2);
    assign poly_p1_col = (polygon_column[11:6] << 3) + (polygon_column[11:6] << 2);
    assign poly_p2_col = (polygon_column[17:12] << 3) + (polygon_column[17:12] << 2);

    // Each polygon row is encoded by value 0 -> 64 which needs to be interpolated to 0 -> 480 (multiply by 10)
    assign poly_p0_col = (polygon_row[5:0] << 3) + (polygon_row[5:0] << 2);
    assign poly_p1_col = (polygon_row[11:6] << 3) + (polygon_row[11:6] << 2);
    assign poly_p2_col = (polygon_row[17:12] << 3) + (polygon_row[17:12] << 2);


    always @(posedge clk) begin

        // Synchronous reset
        if (rst_n == 1'b0) begin
            cur_pixel <= `COLOR_DEFAULT;
            cur_depth <= `DEPTH_INF;
        end

        // Rasterize pixel
        else if (cmp_en == 1'b1) begin
            cur_pixel <= `COLOR_DEFAULT;
            cur_depth <= `DEPTH_INF;
        end

    end

endmodule
