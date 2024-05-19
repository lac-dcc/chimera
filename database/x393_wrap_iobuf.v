// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>iobuf
 * @file iobuf.v
 * @date 2015-05-15  
 * @author Andrey Filippov     
 *
 * @brief Wrapper for IOBUF primitive
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * iobuf.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  iobuf.v is distributed in the hope that it will be useful,
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

module  iobuf#(
    parameter integer DRIVE = 12,
    parameter IBUF_LOW_PWR = "TRUE",
    parameter IOSTANDARD = "DEFAULT",
`ifdef XIL_TIMING
    parameter LOC = " UNPLACED",
`endif
    parameter SLEW = "SLOW"
)(
    output O,
    inout  IO,
    input  I,
    input  T
);

    IOBUF #(
        .DRIVE        (DRIVE),
        .IBUF_LOW_PWR (IBUF_LOW_PWR),
        .IOSTANDARD   (IOSTANDARD),
        .SLEW         (SLEW)
    ) IOBUF_i (
        .O  (O), // output 
        .IO (IO), // inout 
        .I  (I), // input 
        .T  (T) // input 
    );
endmodule

