// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmprs_tile_mode_decode
 * @file cmprs_tile_mode_decode.v
 * @date 2015-06-14  
 * @author Andrey Filippov     
 *
 * @brief Decode tile/macroblocks parameters from compressor type
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmprs_tile_mode_decode.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmprs_tile_mode_decode.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify this Program, or any covered work, by linking or combining it
 * with independent modules provided by the FPGA vendor only (this permission
 * does not extend to any 3-rd party modules, "soft cores" or macros) under
 * different license terms solely for the purpose of generating binary "bitstream"
 * files and/or simulating the code, the copyright holders of this Program give
 * you the right to distribute the covered work without those independent modules
 * as long as the source code for them is available from the FPGA vendor free of
 * charge, and there is no dependence on any encrypted modules for simulating of
 * the combined code. This permission applies to you if the distributed code
 * contains all the components and scripts required to completely simulate it
 * with at least one of the Free Software programs.
 */
`timescale 1ns/1ps

module  cmprs_tile_mode_decode #(
        parameter CMPRS_COLOR18 =           0, // JPEG 4:2:0 with 18x18 overlapping tiles for de-bayer
        parameter CMPRS_COLOR20 =           1, // JPEG 4:2:0 with 18x18 overlapping tiles for de-bayer (not implemented)
        parameter CMPRS_MONO16 =            2, // JPEG 4:2:0 with 16x16 non-overlapping tiles, color components zeroed
        parameter CMPRS_JP4 =               3, // JP4 mode with 16x16 macroblocks
        parameter CMPRS_JP4DIFF =           4, // JP4DIFF mode TODO: see if correct
        parameter CMPRS_MONO8 =             7  // Regular JPEG monochrome with 8x8 macroblocks (not yet implemented)
)(
    input          [2:0] converter_type,
    output reg    [ 5:0] mb_w_m1,            // macroblock width minus 1
    output reg    [ 5:0] mb_h_m1,            // macroblock height minus 1
    output reg    [ 4:0] mb_hper,            // macroblock horizontal period (8/16) // 3 LSB not used
    output reg    [ 1:0] tile_width,         // memory tile width (can be 128 for monochrome JPEG)   Can be 32/64/128: 0 - 16, 1 - 32, 2 - 64, 3 - 128
    output reg           tile_col_width      // 0 - 16 pixels,  1 -32 pixels
);

//    wire   [ 2:0] converter_type;    // 0 - color18, 1 - color20, 2 - mono, 3 - jp4, 4 - jp4-diff, 7 - mono8 (not yet implemented)
    always @(converter_type) begin
        case (converter_type)
            CMPRS_COLOR18:    begin
                        mb_w_m1 <=        17;            // macroblock width minus 1 
                        mb_h_m1 <=        17;            // macroblock height minus 1
                        mb_hper <=        16;            // macroblock horizontal period (8/16) // 3 LSB not used
                        tile_width <=      1;            // memory tile width (can be 128 for monochrome JPEG)   Can be 32/64/128: 0 - 16, 1 - 32, 2 - 64, 3 - 128
                        tile_col_width <=  1;            // 0 - 16 pixels,  1 -32 pixels
                     end
            CMPRS_COLOR20:    begin
                        mb_w_m1 <=        19;            // macroblock width minus 1
                        mb_h_m1 <=        19;            // macroblock height minus 1
                        mb_hper <=        16;            // macroblock horizontal period (8/16) // 3 LSB not used
                        tile_width <=      1;            // memory tile width (can be 128 for monochrome JPEG)   Can be 32/64/128: 0 - 16, 1 - 32, 2 - 64, 3 - 128
                        tile_col_width <=  1;            // 0 - 16 pixels,  1 -32 pixels
                     end
            CMPRS_MONO16:    begin
                        mb_w_m1 <=        15;            // macroblock width minus 1
                        mb_h_m1 <=        15;            // macroblock height minus 1
                        mb_hper <=        16;            // macroblock horizontal period (8/16) // 3 LSB not used
                        tile_width <=      2;            // memory tile width (can be 128 for monochrome JPEG)   Can be 32/64/128: 0 - 16, 1 - 32, 2 - 64, 3 - 128
                        tile_col_width <=  1;            // 0 - 16 pixels,  1 -32 pixels
                     end
            CMPRS_JP4:    begin
                        mb_w_m1 <=        15;            // macroblock width minus 1
                        mb_h_m1 <=        15;            // macroblock height minus 1
                        mb_hper <=        16;            // macroblock horizontal period (8/16) // 3 LSB not used
                        tile_width <=      2;            // memory tile width (can be 128 for monochrome JPEG)   Can be 32/64/128: 0 - 16, 1 - 32, 2 - 64, 3 - 128
                        tile_col_width <=  1;            // 0 - 16 pixels,  1 -32 pixels
                     end
            CMPRS_JP4DIFF:    begin
                        mb_w_m1 <=        15;            // macroblock width minus 1
                        mb_h_m1 <=        15;            // macroblock height minus 1
                        mb_hper <=        16;            // macroblock horizontal period (8/16) // 3 LSB not used
                        tile_width <=      2;            // memory tile width (can be 128 for monochrome JPEG)   Can be 32/64/128: 0 - 16, 1 - 32, 2 - 64, 3 - 128
                        tile_col_width <=  1;            // 0 - 16 pixels,  1 -32 pixels
                     end
            CMPRS_MONO8:    begin
                        mb_w_m1 <=         7;            // macroblock width minus 1
                        mb_h_m1 <=         7;            // macroblock height minus 1
                        mb_hper <=         8;            // macroblock horizontal period (8/16) // 3 LSB not used
                        tile_width <=      3;            // memory tile width (can be 128 for monochrome JPEG)   Can be 32/64/128: 0 - 16, 1 - 32, 2 - 64, 3 - 128
                        tile_col_width <=  1;            // 0 - 16 pixels,  1 -32 pixels
                     end
            default: begin
                        mb_w_m1 <=        'bx;            // macroblock width minus 1
                        mb_h_m1 <=        'bx;            // macroblock height minus 1
                        mb_hper <=        'bx;            // macroblock horizontal period (8/16) // 3 LSB not used
                        tile_width <=     'bx;            // memory tile width (can be 128 for monochrome JPEG)   Can be 32/64/128: 0 - 16, 1 - 32, 2 - 64, 3 - 128
                        tile_col_width <= 'bx;            // 0 - 16 pixels,  1 -32 pixels
                     end
        endcase
    end

endmodule

