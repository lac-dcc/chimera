// This program was cloned from: https://github.com/emern/badGPU
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Emery Nagy
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_emern_raster_core (
    input [9:0] pixel_col,
    input [8:0] pixel_row,

    input [9:0] v0_x,
    input [9:0] v1_x,
    input [9:0] v2_x,

    input [8:0] v0_y,
    input [8:0] v1_y,
    input [8:0] v2_y,

    output rasterize
);

    wire signed [22:0] l_res_a;
    wire signed [22:0] r_res_a;

    wire signed [22:0] l_res_b;
    wire signed [22:0] r_res_b;

    wire signed [22:0] l_res_c;
    wire signed [22:0] r_res_c;

    // Fast algo found here: https://erkaman.github.io/posts/fast_triangle_rasterization.html
    // Basically, calculate normal between of each of the triangle vertices and given point
    // If all normals are positive, we rasterize the pixel

    // Note that the order of supplied vertices is important!
    // V0 should have the largest magnitude X or column coordinate, V1 the second largest and V0 the smallest!

    // Vertex 0 -> 1
    assign l_res_a = ($signed({13'h0, v1_x}) - $signed({13'h0, v0_x})) * ($signed({14'h0, pixel_row}) - $signed({14'h0, v0_y}));
    assign r_res_a = ($signed({14'h0, v1_y}) - $signed({14'h0, v0_y})) * ($signed({13'h0, pixel_col}) - $signed({13'h0, v0_x}));

    // Vertex 1 -> 2
    assign l_res_b = ($signed({13'h0, v2_x}) - $signed({13'h0, v1_x})) * ($signed({14'h0, pixel_row}) - $signed({14'h0, v1_y}));
    assign r_res_b = ($signed({14'h0, v2_y}) - $signed({14'h0, v1_y})) * ($signed({13'h0, pixel_col}) - $signed({13'h0, v1_x}));

    // Vertex 2 -> 0
    assign l_res_c = ($signed({13'h0, v0_x}) - $signed({13'h0, v2_x})) * ($signed({14'h0, pixel_row}) - $signed({14'h0, v2_y}));
    assign r_res_c = ($signed({14'h0, v0_y}) - $signed({14'h0, v2_y})) * ($signed({13'h0, pixel_col}) - $signed({13'h0, v2_x}));


    // Triangle to be rasterized only if pixel fits within each of its bounding surfaces
    assign rasterize = ((l_res_a >= r_res_a) && (l_res_b >= r_res_b) && (l_res_c >= r_res_c)) ? 1'b1 : 1'b0;


endmodule