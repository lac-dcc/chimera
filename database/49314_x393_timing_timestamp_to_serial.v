// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>timestamp_to_serial
 * @file timestamp_to_serial.v
 * @date 2015-07-04  
 * @author Andrey Filippov     
 *
 * @brief convert legacy parallel timestamp data to a byte-parallel message
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * timestamp_to_serial.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  timestamp_to_serial.v is distributed in the hope that it will be useful,
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

module  timestamp_to_serial(
    input                clk, // clock that drives time counters
    input                stb, // serialize and send timestamp message
    input         [31:0] sec,     // time seconds
    input         [19:0] usec,    // time microseconds
    output reg    [7:0] tdata    // byte-parallel timestamp data sent right after stb input
);
    reg  [2:0] cntr;
    reg        busy = 0;
    wire [2:0] cntr_w;
    assign cntr_w= stb? 3'b0 : cntr;
    always @ (posedge clk) begin
        if      (stb)          busy <= 1;
        else if (&cntr_w[2:1]) busy <= 0;
        if      (stb)   cntr <= 1;
        else if (busy)  cntr <= cntr + 1;
        
        case (cntr_w)
            3'h0:tdata <=  sec[ 7: 0];
            3'h1:tdata <=  sec[15: 8];
            3'h2:tdata <=  sec[23:16];
            3'h3:tdata <=  sec[31:24];
            3'h4:tdata <= usec[ 7: 0];
            3'h5:tdata <= usec[15: 8];
            3'h6:tdata <= {4'h0,usec[19:16]};
            3'h7:tdata <= 8'h0;
        endcase
    end

endmodule

