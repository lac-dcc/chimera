// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>csconvert
 * @file csconvert.v
 * @date 2015-06-14  
 * @author Andrey Filippov     
 *
 * @brief Color space convert: combine differnt color modes
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * csconvert.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  csconvert.v is distributed in the hope that it will be useful,
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

module  csconvert#(
        parameter CMPRS_COLOR18 =           0, // JPEG 4:2:0 with 18x18 overlapping tiles for de-bayer
        parameter CMPRS_COLOR20 =           1, // JPEG 4:2:0 with 18x18 overlapping tiles for de-bayer (not implemented)
        parameter CMPRS_MONO16 =            2, // JPEG 4:2:0 with 16x16 non-overlapping tiles, color components zeroed
        parameter CMPRS_JP4 =               3, // JP4 mode with 16x16 macroblocks
        parameter CMPRS_JP4DIFF =           4, // JP4DIFF mode TODO: see if correct
        parameter CMPRS_MONO8 =             7  // Regular JPEG monochrome with 8x8 macroblocks (not yet implemented)
)(
         input             xclk,
         input             frame_en,
         input      [ 2:0] converter_type,
                   
         input             ignore_color,   //zero Cb/Cr components
//         input             four_blocks, // use only 4 blocks for the output, not 6
//         input             jp4_dc_improved, // in JP4 mode, compare DC coefficients to the same color ones
         input             scale_diff,     // divide differences by 2 (to fit in 8-bit range)
         input             hdr,            // second green absolute, not difference
         input             limit_diff,   // 1 - limit color outputs to -128/+127 range, 0 - let them be limited downstream (==1)
         input      [ 9:0] m_cb,         // [9:0] scale for CB - default 0.564 (10'h90)
         input      [ 9:0] m_cr,         // [9:0] scale for CB - default 0.713 (10'hb6)
         input      [ 7:0] mb_din,       // input bayer data in scanline sequence, GR/BG sequence
         input      [ 1:0] bayer_phase,
         input             pre2_first_in, // marks the first input pixel (2 cycles ahead)
         
         output reg [ 8:0] signed_y,     //  - now signed char, -128(black) to +127 (white)
         output reg [ 8:0] signed_c,            // new, q is just signed char
         output reg [ 7:0] yaddrw,        // address for the external buffer memory to write 16x16x8bit Y data
         output reg        ywe,          // wrire enable of Y data
         output reg [ 7:0] caddrw,        // address for the external buffer memory 2x8x8x8bit Cb+Cr data (MSB=0 - Cb, 1 - Cr)
         output reg        cwe,          // write enable for CbCr data
         output reg        pre_first_out,
         
//         output reg        pre_color_enable,
//         output reg        ccv_out_start,     //TODO: adjust to minimal latency?
         output reg [ 7:0] n000, // not clear how they are used, make them just with latency1 from old
         output reg [ 7:0] n255);
    reg            pre_first_in;
    // outputs to be multiplexed:
    wire   [7:0]   conv18_signed_y, conv20_signed_y, mono16_signed_y, jp4_signed_y;
    wire   [8:0]   jp4diff_signed_y, conv18_signed_c, conv20_signed_c;
    wire   [7:0]   conv18_yaddrw, conv20_yaddrw, mono16_yaddrw, jp4_yaddrw, jp4diff_yaddrw;
    wire   [6:0]   conv18_caddrw, conv20_caddrw;
    wire           conv18_ywe, conv18_cwe, conv20_ywe, conv20_cwe, mono16_ywe, jp4_ywe, jp4diff_ywe;
    wire           conv18_pre_first_out, conv20_pre_first_out, mono16_pre_first_out, jp4_pre_first_out, jp4diff_pre_first_out;

    wire   [7:0]   conv18_n000, conv20_n000, mono16_n000, jp4_n000, jp4diff_n000;
    wire   [7:0]   conv18_n255, conv20_n255, mono16_n255, jp4_n255, jp4diff_n255;
    
    reg    [ 7:0] en_converters;    
    reg           ignore_color_r;       //zero Cb/Cr components
    reg    [2:0]   converter_type_r;
//    reg            jp4_dc_improved_r;
//    reg            four_blocks_r;
    reg            scale_diff_r;
    reg            hdr_r;
//    reg    [1:0]   tile_margin_r;
    reg    [1:0]   bayer_phase_r;
//    reg    [3:0]   bayer_phase_onehot;
//    wire           limit_diff     = 1'b1;  // as in the prototype - just a constant 1
/*
    reg [5:0]  component_numsLS;  // component_num [0]
    reg [5:0]  component_numsMS;  // component_num [1]
    reg [5:0]  component_numsHS;  // component_num [2]
    reg [5:0]  component_colorsS; // use color quantization table (YCbCR, jp4diff)
    reg [5:0]  component_firstsS; // first_r this component in a frame (DC absolute, otherwise - difference to previous)
*/
    always @ (posedge xclk) begin
        pre_first_in <= pre2_first_in;
        if (pre2_first_in) begin
            converter_type_r [2:0] <= converter_type[2:0];
            ignore_color_r         <= ignore_color;
//            jp4_dc_improved_r      <= jp4_dc_improved;
//            four_blocks_r          <= four_blocks;
            scale_diff_r           <= scale_diff;
            hdr_r                  <= hdr;
//            tile_margin_r[1:0]     <= tile_margin[1:0];
            bayer_phase_r[1:0]     <= bayer_phase[1:0];
//            bayer_phase_onehot[3:0]<={(bayer_phase[1:0]==2'h3)?1'b1:1'b0,
//                                      (bayer_phase[1:0]==2'h2)?1'b1:1'b0,
//                                      (bayer_phase[1:0]==2'h1)?1'b1:1'b0,
//                                      (bayer_phase[1:0]==2'h0)?1'b1:1'b0};
        end
    
        // generate one-hot converter enable  
        if      (!frame_en)      en_converters[CMPRS_COLOR18] <= 0;
        else if (pre2_first_in)  en_converters[CMPRS_COLOR18] <= converter_type == CMPRS_COLOR18;
        
        if       (!frame_en)     en_converters[CMPRS_COLOR20] <= 0;
        else  if (pre2_first_in) en_converters[CMPRS_COLOR20] <= converter_type == CMPRS_COLOR20;
        
        if      (!frame_en)      en_converters[CMPRS_MONO16] <=  0;
        else if (pre2_first_in)  en_converters[CMPRS_MONO16] <=  converter_type == CMPRS_MONO16;
        
        if      (!frame_en)      en_converters[CMPRS_JP4] <=     0;
        else if (pre2_first_in)  en_converters[CMPRS_JP4] <=     converter_type == CMPRS_JP4;
        
        if      (!frame_en)      en_converters[CMPRS_JP4DIFF] <= 0;
        else if (pre2_first_in)  en_converters[CMPRS_JP4DIFF] <= converter_type == CMPRS_JP4DIFF;
        
        if      (!frame_en)      en_converters[CMPRS_MONO8] <=   0;
        else if (pre2_first_in)  en_converters[CMPRS_MONO8] <=   converter_type == CMPRS_MONO8;
    end


 csconvert18a    i_csconvert18 (
                         .RST           (!en_converters[CMPRS_COLOR18]), // input
                         .CLK           (xclk),                // input
                         .mono          (ignore_color_r),      // input
                         .limit_diff    (limit_diff),          // input 1 - limit color outputs to -128/+127 range, 0 - let them be limited downstream
                         .m_cb          (m_cb[9:0]),           // input[9:0] scale for CB - default 0.564 (10'h90)
                         .m_cr          (m_cr[9:0]),           // input[9:0] scale for CB - default 0.713 (10'hb6)
                         .din           (mb_din[7:0]),         // input[7:0]
                         .pre_first_in  (pre_first_in),        // input
                         .signed_y      (conv18_signed_y[7:0]),// output[7:0]
                         .q             (conv18_signed_c[8:0]),// output[8:0] 
                         .yaddr         (conv18_yaddrw[7:0]),  // output[7:0] 
                         .ywe           (conv18_ywe),          // output
                         .caddr         (conv18_caddrw[6:0]),  // output[6:0] 
                         .cwe           (conv18_cwe),          // output
                         .pre_first_out (conv18_pre_first_out),// output
                         .bayer_phase   (bayer_phase_r[1:0]),  // input[1:0]
                         .n000          (conv18_n000[7:0]),    // output[7:0] 
                         .n255          (conv18_n255[7:0]));   // output[7:0] 

 csconvert_mono i_csconvert_mono (
                         .en            (en_converters[CMPRS_MONO16]),
                         .clk           (xclk),
                         .din           (mb_din[7:0]),
                         .pre_first_in  (pre_first_in),
                         .y_out         (mono16_signed_y[7:0]),
                         .yaddr         (mono16_yaddrw[7:0]),
                         .ywe           (mono16_ywe),
                         .pre_first_out(mono16_pre_first_out));
 csconvert_jp4 i_csconvert_jp4 (
                         .en            (en_converters[CMPRS_JP4]),
                         .clk           (xclk),
                         .din           (mb_din[7:0]),
                         .pre_first_in  (pre_first_in),
                         .y_out         (jp4_signed_y[7:0]),
                         .yaddr         (jp4_yaddrw[7:0]),
                         .ywe           (jp4_ywe),
                         .pre_first_out (jp4_pre_first_out));

 csconvert_jp4diff i_csconvert_jp4diff (
                         .en            (en_converters[CMPRS_JP4DIFF]),
                         .clk           (xclk),
                         .scale_diff    (scale_diff_r),
                         .hdr           (hdr_r),
                         .din           (mb_din[7:0]),
                         .pre_first_in  (pre_first_in),
                         .y_out         (jp4diff_signed_y[8:0]),
                         .yaddr         (jp4diff_yaddrw[7:0]),
                         .ywe           (jp4diff_ywe),
                         .pre_first_out (jp4diff_pre_first_out),
                         .bayer_phase   (bayer_phase_r[1:0]));


    //TODO:  temporary plugs, until module for 20x20 is created
    // will be wrong, of course
    assign conv20_signed_y[7:0]=     conv18_signed_y[7:0];
    assign conv20_yaddrw[7:0]=   conv18_yaddrw[7:0];
    assign conv20_ywe=           conv18_ywe;
    assign conv20_signed_c[8:0]=     conv18_signed_c[8:0];
    assign conv20_caddrw[6:0]=   conv18_caddrw[6:0];
    assign conv20_cwe=           conv18_cwe;
    assign conv20_pre_first_out= conv18_pre_first_out;
    // TODO: temporary assign N000 and N255 for other (not csconvert18) modes until they are implemented in those modules

    assign conv20_n000=   conv18_n000;
    assign mono16_n000=   conv18_n000;
    assign jp4_n000=      conv18_n000;
    assign jp4diff_n000=  conv18_n000;
    assign conv20_n255=   conv18_n255;
    assign mono16_n255=   conv18_n255;
    assign jp4_n255=      conv18_n255;
    assign jp4diff_n255=  conv18_n255;

// multiplex outputs
 // average for each block should be calculated before the data goes to output output
  always @ (posedge xclk) case (converter_type_r[2:0])
    CMPRS_COLOR18:begin //color 18
          pre_first_out <= conv18_pre_first_out;
          signed_y[8:0]        <= {conv18_signed_y[7],conv18_signed_y[7:0]};
          ywe              <= conv18_ywe;
          yaddrw[7:0]      <= {conv18_yaddrw[7],conv18_yaddrw[3],conv18_yaddrw[6:4],conv18_yaddrw[2:0]};
          signed_c[8:0]        <= {conv18_signed_c[8:0]};
          cwe              <= conv18_cwe;
          caddrw[7:0]      <= {1'b0,conv18_caddrw[6:0]};
          n000             <= conv18_n000;
          n255             <= conv18_n255;
//          pre_color_enable <= 1'b1;
//          ccv_out_start    <= (conv18_yaddrw[7:0]==8'hc5); //TODO: adjust to minimal latency?
         end
    CMPRS_COLOR20:begin //color 20
          pre_first_out <= conv20_pre_first_out;
          signed_y[8:0]        <= {conv20_signed_y[7],conv20_signed_y[7:0]};
          ywe              <= conv20_ywe;
          yaddrw[7:0]      <= {conv20_yaddrw[7],conv20_yaddrw[3],conv20_yaddrw[6:4],conv20_yaddrw[2:0]};
          signed_c[8:0]        <= {conv20_signed_c[8:0]};
          cwe              <= conv20_cwe;
          caddrw[7:0]      <= {1'b0,conv20_caddrw[6:0]};
          n000             <= conv20_n000;
          n255             <= conv20_n255;
          
 //         pre_color_enable <= 1'b1;
 //         ccv_out_start    <= (conv20_yaddrw[7:0]==8'hc5); //TODO: adjust to minimal latency?
         end
    CMPRS_MONO16:begin //mono
          pre_first_out <= mono16_pre_first_out;
          signed_y[8:0]        <= {mono16_signed_y[7],mono16_signed_y[7:0]};
          ywe              <= mono16_ywe;
          yaddrw[7:0]      <= {mono16_yaddrw[7],mono16_yaddrw[3],mono16_yaddrw[6:4],mono16_yaddrw[2:0]};
          signed_c[8:0]        <= 9'h0;
          cwe              <= 1'b0;
          caddrw[7:0]      <= 8'h0;
          n000             <= mono16_n000;
          n255             <= mono16_n255;
          
//          pre_color_enable <= 1'b0;
//          ccv_out_start    <=  accYdone[0];
         end
    CMPRS_JP4:begin // jp4
          pre_first_out <= jp4_pre_first_out;
          signed_y[8:0]        <= {jp4_signed_y[7],jp4_signed_y[7:0]};
          ywe              <= jp4_ywe;
          yaddrw[7:0]      <= {jp4_yaddrw[7],jp4_yaddrw[3],jp4_yaddrw[6:4],jp4_yaddrw[2:0]};
          signed_c[8:0]        <= 9'h0;
          cwe              <= 1'b0;
          caddrw[7:0]      <= 8'h0;
          n000             <= jp4_n000;
          n255             <= jp4_n255;
          
//          pre_color_enable <= 1'b0;
//          ccv_out_start    <=  accYdone[0];
         end
    CMPRS_JP4DIFF:begin //jp4diff
          pre_first_out <= jp4diff_pre_first_out;
          signed_y[8:0]        <= {jp4diff_signed_y[8:0]};
          ywe              <= jp4diff_ywe;
          yaddrw[7:0]      <= {jp4diff_yaddrw[7],jp4diff_yaddrw[3],jp4diff_yaddrw[6:4],jp4diff_yaddrw[2:0]};
          signed_c[8:0]        <= 9'h0;
          cwe              <= 1'b0;
          caddrw[7:0]      <= 8'h0;
          n000             <= jp4diff_n000;
          n255             <= jp4diff_n255;
          
//          pre_color_enable <= 1'b0;
//          ccv_out_start    <=  accYdone[0];
         end
    default:begin //color 18 (or try 'X'
          pre_first_out    <= 'bx; // conv18_pre_first_out;
          signed_y[8:0]    <= 'bx; // {conv18_signed_y[7],conv18_signed_y[7:0]};
          ywe              <= 'bx; //conv18_ywe;
          yaddrw[7:0]      <= 'bx; //{conv18_yaddrw[7],conv18_yaddrw[3],conv18_yaddrw[6:4],conv18_yaddrw[2:0]};
          signed_c[8:0]    <= 'bx; //{conv18_signed_c[8:0]};
          cwe              <= 'bx; //conv18_cwe;
          caddrw[7:0]      <= 'bx; //{1'b0,conv18_caddrw[6:0]};
          n000             <= 'bx; //conv18_n000;
          n255             <= 'bx; //conv18_n255;
         end
         
  endcase

    
    
    

endmodule

