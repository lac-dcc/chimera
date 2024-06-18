// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>table_ad_transmit
 * @file table_ad_transmit.v
 * @date 2015-06-18  
 * @author Andrey Filippov     
 *
 * @brief transmit byte-wide table address/data from 32-bit cmd_desr
 * In 32-bit mode we duty cycle is >= 6, so there will always be gaps in
 * chn_stb[i] active 
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * table_ad_transmit.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  table_ad_transmit.v is distributed in the hope that it will be useful,
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
// Table address is BYTE address
module  table_ad_transmit#(
    parameter NUM_CHANNELS = 1,
    parameter ADDR_BITS=4
)(
    input                         clk,        // posedge mclk
    input                         srst,       // reset @posedge clk
    input                         a_not_d_in, // address/not data input (valid @ we)
    input                         we,         // write address/data (single cycle) with at least 5 inactive between
    input                  [31:0] din,        // 32 bit data to send or 8-bit channel select concatenated with 24-bit byte address (@we)
    output                 [ 7:0] ser_d,      // 8-bit address/data to be sent to submodules that have table write port(s), LSB first
    output reg                    a_not_d,    // sending adderass / not data - valid during all bytes
    output reg [NUM_CHANNELS-1:0] chn_en      // sending  address or data
);
    wire [NUM_CHANNELS-1:0] sel;
    reg              [31:0] d_r;
    reg                     any_en;
    reg               [ADDR_BITS-1:0] sel_a;
    reg                     we_r;
    wire                    we3;
    
    assign ser_d = d_r[7:0];
    
    always @ (posedge clk) begin
        if (we)          d_r <= din;
        else if (any_en) d_r <= d_r >> 8;
        
        if (we)          a_not_d <= a_not_d_in;
        
        we_r <= we && a_not_d_in;
        
        if      (srst)                        any_en <= 0; 
        else if ((we && !a_not_d_in) || we_r) any_en <= 1;
        else if (we3)                         any_en <= 0;

        if      (srst)                        chn_en <= 0; 
        else if ((we && !a_not_d_in) || we_r) chn_en <= sel;
        else if (we3)                         chn_en <= 0;

        if (we && a_not_d_in) sel_a <= din[24+:ADDR_BITS];
        
    end
//    dly_16 #(.WIDTH(1)) i_end_burst(.clk(clk),.rst(1'b0), .dly(4'd2), .din(we), .dout(we3)); // dly=2+1=3
    dly_16 #(.WIDTH(1)) i_end_burst(.clk(clk),.rst(1'b0), .dly(4'd3), .din(we), .dout(we3)); // dly=3+1=4
    
    genvar i;
    generate 
      for (i = 0; i < NUM_CHANNELS; i = i + 1)  begin : gsel 
        assign sel[i] = sel_a == i;
      end
    endgenerate

endmodule

