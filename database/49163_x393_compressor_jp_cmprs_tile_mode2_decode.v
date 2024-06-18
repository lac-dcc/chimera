// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmprs_tile_mode2_decode
 * @file cmprs_tile_mode2_decode.v
 * @date 2015-06-14  
 * @author Andrey Filippov     
 *
 * @brief Decode mode parameters, registered at pre-start of the macroblock
 * data to color conversion module
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmprs_tile_mode2_decode.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmprs_tile_mode2_decode.v is distributed in the hope that it will be useful,
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

module  cmprs_tile_mode2_decode #(
        parameter CMPRS_COLOR18 =           0, // JPEG 4:2:0 with 18x18 overlapping tiles for de-bayer
        parameter CMPRS_COLOR20 =           1, // JPEG 4:2:0 with 18x18 overlapping tiles for de-bayer (not implemented)
        parameter CMPRS_MONO16 =            2, // JPEG 4:2:0 with 16x16 non-overlapping tiles, color components zeroed
        parameter CMPRS_JP4 =               3, // JP4 mode with 16x16 macroblocks
        parameter CMPRS_JP4DIFF =           4, // JP4DIFF mode TODO: see if correct
        parameter CMPRS_MONO8 =             7  // Regular JPEG monochrome with 8x8 macroblocks (not yet implemented)
)(
    input             xclk,
    input             pre_first_in, // marks the first input pixel
    input       [2:0] converter_type,
    input      [ 1:0] bayer_phase,
    input             jp4_dc_improved,
    input             hdr,
    input             subtract_dc_in,
    input             first_mb_in,    // valid @ pre_first_in - reading first macroblock
    input             last_mb_in,     // valid @ pre_first_in - reading last macroblock
    
    
    output reg        four_blocks,      // 1 - 4 blocks, 0 - 6 blocks
    output reg        subtract_dc,      // enable subtracting DC components
    output reg        first_mb,         // valid @ pre_first_in - reading first macroblock
    output reg        last_mb,          // valid @ pre_first_in - reading last macroblock
    
    output reg        color_enable,     // prevent JPEG random colors
    output reg [5:0]  component_numsL,  // component_num [0]
    output reg [5:0]  component_numsM,  // component_num [1]
    output reg [5:0]  component_numsH,  // component_num [2]
    output reg [5:0]  component_colors, // use color quantization table (YCbCR, jp4diff)
    output reg [5:0]  component_first // first_r this component in a frame (DC absolute, otherwise - difference to previous)
);

    reg    [2:0]   converter_type_r;
    reg            jp4_dc_improved_r;
    reg            hdr_r;
    reg    [3:0]   bayer_phase_onehot;
    reg            first_in;
    always @ (posedge xclk) begin
        first_in <= pre_first_in;
        if (pre_first_in)begin
            converter_type_r [2:0] <= converter_type[2:0];
            jp4_dc_improved_r      <= jp4_dc_improved;
            hdr_r                  <= hdr;
            subtract_dc            <= subtract_dc_in;
            first_mb               <= first_mb_in;
            last_mb                <= last_mb_in;
            bayer_phase_onehot[3:0]<={(bayer_phase[1:0]==2'h3)?1'b1:1'b0,
                                      (bayer_phase[1:0]==2'h2)?1'b1:1'b0,
                                      (bayer_phase[1:0]==2'h1)?1'b1:1'b0,
                                      (bayer_phase[1:0]==2'h0)?1'b1:1'b0};
        end
        if (first_in) begin
            case (converter_type_r)
                CMPRS_COLOR18:    begin
                            component_numsL  <= 6'h10; // component_num [0]
                            component_numsM  <= 6'h20; // component_num [1]
                            component_numsH  <= 6'h00; // component_num [2]
                            component_colors <= 6'h30; // use color quantization table (YCbCR, jp4diff)
                            component_first  <= 6'h31; // first_r this component in a frame (DC absolute, otherwise - difference to previous)
                            four_blocks      <= 0; // 6 blocks/maceoblock mode
                            color_enable     <= 1'b1;
                         end
                CMPRS_COLOR20:    begin
                            component_numsL  <= 6'h10; // component_num [0]
                            component_numsM  <= 6'h20; // component_num [1]
                            component_numsH  <= 6'h3f; // component_num [2]
                            component_colors <= 6'h30; // use color quantization table (YCbCR, jp4diff)
                            component_first  <= 6'h31; // first_r this component in a frame (DC absolute, otherwise - difference to previous)
                            four_blocks      <= 0; // 6 blocks/maceoblock mode
                            color_enable     <= 1'b1;
                         end
                CMPRS_MONO16:    begin
                            component_numsL  <= 6'h10; // component_num [0]
                            component_numsM  <= 6'h20; // component_num [1]
                            component_numsH  <= 6'h30; // component_num [2]
                            component_colors <= 6'h30; // use color quantization table (YCbCR, jp4diff)
                            component_first  <= 6'h31; // first_r this component in a frame (DC absolute, otherwise - difference to previous)
                            four_blocks      <= 0; // 6 blocks/maceoblock mode
                            color_enable     <= 1'b0;
                         end
                CMPRS_JP4:    begin
                            component_numsL  <= jp4_dc_improved_r?6'h0a:6'h10; // LSb of component_num
                            component_numsM  <= jp4_dc_improved_r?6'h0c:6'h20; // MSb of component_num
                            component_numsH  <= 6'h30; // component_num [2]
                            component_colors <= 6'h30; // use color quantization table (YCbCR, jp4diff)
                            component_first  <= jp4_dc_improved_r?6'h3f:6'h31; // first_r this component in a frame (DC absolute, otherwise - difference to previous)
                            four_blocks      <= 1; // 4 blocks/maceoblock mode
                            color_enable     <= 1'b0;
                         end
                CMPRS_JP4DIFF:    begin
                            component_numsL  <= 6'h0a; // LSb of component_num
                            component_numsM  <= 6'h0c; // MSb of component_num
                            component_numsH  <= 6'h30; // component_num [2]
                            component_colors <= {2'h3,~bayer_phase_onehot[3:0] | (hdr_r? {~bayer_phase_onehot[1:0],~bayer_phase_onehot[3:2]} : 4'h0)}; // use color quantization table (YCbCR, jp4diff)
                            component_first  <= 6'h3f; // first_r this component in a frame (DC absolute, otherwise - difference to previous)
                            four_blocks      <= 1; // 4 blocks/maceoblock mode
                            color_enable     <= 1'b0;
                         end
                         
                CMPRS_MONO8:    begin
    /*            
                            component_numsL  <= 6'h00; // TODO: Implement, put actuqal data in this and other fields
                            component_numsM  <= 6'h00;
                            component_numsH  <= 6'h30;
                            component_colors <= 6'h30;
                            component_first <= 6'h31;
                            color_enable     <= 1'b0;
    */                        
                         end
                         
                default: begin
                            component_numsL  <= 'bx;
                            component_numsM  <= 'bx;
                            component_numsH  <= 'bx;
                            component_colors <= 'bx;
                            component_first  <= 'bx;
                            four_blocks      <= 'bx;
                            color_enable     <= 'bx;
                         end
            endcase
        end
    end

endmodule

