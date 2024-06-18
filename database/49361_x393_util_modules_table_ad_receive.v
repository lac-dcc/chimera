// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>table_ad_receive
 * @file table_ad_receive.v
 * @date 2015-06-18  
 * @author Andrey Filippov     
 *
 * @brief Receive tabble address/data sent by table_ad_transmit
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * table_ad_receive.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  table_ad_receive.v is distributed in the hope that it will be useful,
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
module  table_ad_receive #(
    parameter MODE_16_BITS = 1,
    parameter NUM_CHN = 1
)(
    input                          clk,        // posedge mclk
    input                          a_not_d,    // receiving adderass / not data - valid during all bytes
    input                    [7:0] ser_d,      // byte-wide address/data
    input            [NUM_CHN-1:0] dv,         // data valid - active for each address or data bytes
    output     [23-MODE_16_BITS:0] ta,         // table address
    output [(MODE_16_BITS?15:7):0] td,         // 8/16 bit table data, LSB first
    output           [NUM_CHN-1:0] twe         // table write enable
);
    reg                  [23:0] addr_r;
    reg           [NUM_CHN-1:0] twe_r;
    reg [(MODE_16_BITS?15:7):0] td_r;
    
    assign td =  td_r;
    assign ta =  MODE_16_BITS ? addr_r[23:1] : addr_r[23:0];
//    assign twe = twe_r && (MODE_16_BITS ? addr_r[0]: 1'b1);
    assign twe = (MODE_16_BITS ? addr_r[0]: 1'b1)? twe_r : {NUM_CHN{1'b0}} ;
    
    always @(posedge clk) begin
//        twe_r <= en && !a_not_d;
        twe_r <= a_not_d ? 0 : dv;
        if ((|dv) && a_not_d)  addr_r[23:0] <= {ser_d,addr_r[23:8]};
        else if (|twe_r)       addr_r[23:0] <= addr_r[23:0] + 1;
    end
    generate
        if (MODE_16_BITS) always @ (posedge clk) td_r[15:0] <= {ser_d[7:0],td_r[15:8]}; //LSB received first
        else              always @ (posedge clk) td_r[ 7:0] <= ser_d[7:0];
    endgenerate

endmodule

