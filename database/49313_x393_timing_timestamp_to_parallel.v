// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>timestamp_to_parallel
 * @file timestamp_to_parallel.v
 * @date 2015-07-04  
 * @author Andrey Filippov     
 *
 * @brief convert byte-parallel timestamp message to parallel sec, usec
 * compatible to the x353 code (for NC353 camera)
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * timestamp_to_parallel.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  timestamp_to_parallel.v is distributed in the hope that it will be useful,
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

module  timestamp_to_parallel(
    input                clk, // clock that drives time counters
    input                pre_stb, // just before receiving sequence of 7 bytes
    input          [7:0] tdata,   // byte-parallel timestamp data
    output reg    [31:0] sec,     // time seconds
    output reg    [19:0] usec,    // time microseconds
    output               done     // got serial timetamp message, output is valid (1-cycle pulse)
);
    reg [6:0] seq;
    assign done = seq[6];
    always @ (posedge clk) begin
        seq <= {seq[5:0],pre_stb};
        if (seq[0])  sec[ 7: 0] <= tdata;
        if (seq[1])  sec[15: 8] <= tdata;
        if (seq[2])  sec[23:16] <= tdata;
        if (seq[3])  sec[31:24] <= tdata;
        if (seq[4]) usec[ 7: 0] <= tdata;
        if (seq[5]) usec[15: 8] <= tdata;
        if (seq[6]) usec[19:16] <= tdata[3:0];
    end
endmodule

