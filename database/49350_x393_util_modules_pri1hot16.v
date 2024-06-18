// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>pri1hot16
 * @file pri1hot16.v
 * @date 2015-01-09  
 * @author Andrey Filippov     
 *
 * @brief Priority select one of 16 inputs
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * pri1hot16.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  pri1hot16.v is distributed in the hope that it will be useful,
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

module  pri1hot16(
    input  [15:0] in,
    output [15:0] out,
    output some
);
    assign out={
        in[15] & ~(|in[14:0]),
        in[14] & ~(|in[13:0]),
        in[13] & ~(|in[12:0]),
        in[12] & ~(|in[11:0]),
        in[11] & ~(|in[10:0]),
        in[10] & ~(|in[ 9:0]),
        in[ 9] & ~(|in[ 8:0]),
        in[ 8] & ~(|in[ 7:0]),
        in[ 7] & ~(|in[ 6:0]),
        in[ 6] & ~(|in[ 5:0]),
        in[ 5] & ~(|in[ 4:0]),
        in[ 4] & ~(|in[ 3:0]),
        in[ 3] & ~(|in[ 2:0]),
        in[ 2] & ~(|in[ 1:0]),
        in[ 1] & ~(|in[ 0:0]),
        in[ 0]
    };
    assign some=|in;
endmodule

