// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>gtx_comma_align
 * @file gtx_comma_align.v
 * @date  2015-07-11  
 * @author Alexey     
 *
 * @brief comma aligner implementation
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * gtx_comma_align.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * gtx_comma_align.v file is distributed in the hope that it will be useful,
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
module gtx_comma_align(
    input   wire            rst,
    input   wire            clk,
    // input data comes this way (standart 8/10 bit notation)
    // cycle 0: {[hgfedcba]=1st byte,[hgfedcba]=0st byte}
    // cycle 1: {[hgfedcba]=3rd byte,[hgfedcba]=2dn byte}
    // => {[cycle1 data], [cycle0 data]} = as if we were reading by dwords
    input   wire    [19:0]  indata,
    output  wire    [19:0]  outdata,
    // outdata contains comma
    output  wire            comma,
    // pulse, indicating that stream was once again adjusted to a comma
    // if asserted after link was down - OK
    // if asserted during a work - most likely indicates an error in a stream
    output  wire            realign
    // asserted when input stream looks like comma, but it is not
    // later on after 10/8 it would get something link NOTINTHETABLE error anyways
//    output  wire            error
);
// only comma character = K28.5, has 5 '1's or 5 '0's in a row. 
// after we met it, call it a comma group, we could compare other symbols
/*
// create a window
reg     [19:0]  indata_r;
wire    [23:0]  window;
always @ (posedge clk)
    indata_r <= indata;
assign  window = {indata_r[17:0], indata[19:14]};

// search for a comma group - parallel 24-bit window into 20 5-bit words
// transposed -> 5 x 20-bit words
wire    [19:0] lane0;
wire    [19:0] lane1;
wire    [19:0] lane2;
wire    [19:0] lane3;
wire    [19:0] lane4;
assign  lane0 = window[19:0];
assign  lane1 = window[20:1];
assign  lane2 = window[21:2];
assign  lane3 = window[22:3];
assign  lane4 = window[23:4];
// calcute at what position in a window comma group is detected, 
// so the position in actual {indata_r, indata} would be +2 from the left side
wire    [19:0] comma_pos;
assign  comma_pos = lane0 & lane1 & lane2 & lane3 & lane4;
*/

// seach for a comma
// TODO make it less expensive
reg     [19:0] indata_r;
wire    [38:0] window;
always @ (posedge clk)
    indata_r <= indata;
assign  window = {indata[18:0], indata_r};

// there is only 1 matched subwindow due to 20-bit comma's non-repetative pattern
wire    [19:0]  subwindow [19:0];
wire    [19:0]  comma_match;
wire    [19:0]  comma_match_p;
reg     [19:0]  aligned_data;
reg     [19:0]  comma_match_prev;
wire            comma_detected;
wire    [19:0]  comma_p = 20'b10101010100101111100;
wire    [19:0]  comma_n = 20'b10101010101010000011;

genvar ii;
generate
    for (ii = 0; ii < 20; ii = ii + 1)
    begin: look_for_comma
        assign  subwindow[ii]   = window[ii + 19:ii];
//        assign  comma_match[ii] = subwindow[ii] == 20'b01010101010011111010 | subwindow[ii] == 20'b01010101011100000101;
        // stream comes inverted
        assign  comma_match_p[ii] = subwindow[ii] == comma_p;
        assign  comma_match[ii]   = comma_match_p[ii] | subwindow[ii] == comma_n;
    end
endgenerate

assign  comma_detected = |comma_match;

// save the shift count
always @ (posedge clk)
    comma_match_prev <= rst ? 20'h1 : comma_detected ? comma_match : comma_match_prev;
// shift
/* TODO
wire    [38:0] shifted_window;
assign  shifted_window = comma_detected ? {window >> (comma_match - 1)} : {window >> (comma_match_prev - 1)};
*/
// temp shift
wire    [19:0]  shifted_window;
wire    [19:0]  ored_subwindow [19:0];
wire    [19:0]  ored_subwindow_comdet [19:0];
assign  ored_subwindow_comdet[0] = {20{comma_match_p[0]}} & comma_p | {20{~comma_match_p[0] & comma_match[0]}} & comma_n;
assign  ored_subwindow[0]       = {20{comma_match_prev[0]}} & subwindow[0];
generate
    for (ii = 1; ii < 20; ii = ii + 1)
    begin: or_all_possible_windows
        assign ored_subwindow_comdet[ii] = {20{comma_match_p[ii]}} & comma_p | {20{~comma_match_p[ii] & comma_match[ii]}} & comma_n | ored_subwindow_comdet[ii-1];  // SuppressThisWarning VEditor -warning would be fixed in future releases
        assign ored_subwindow[ii]        = {20{comma_match_prev[ii]}} & subwindow[ii] | ored_subwindow[ii-1];                                                       // SuppressThisWarning VEditor -warning would be fixed in future releases
    end
endgenerate

assign  shifted_window = comma_detected ? ored_subwindow_comdet[19] : ored_subwindow[19];
always @ (posedge clk)
//    aligned_data <= comma_detected ? {window >> (comma_match - 1)}[19:0] : {window >> (comma_match_prev - 1)}[19:0];
    aligned_data <= shifted_window[19:0];

// form outputs
assign  comma   = comma_detected;
assign  realign = comma_detected & |(comma_match_prev ^ comma_match);
assign  outdata = aligned_data;

endmodule
