// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>obuf
 * @file obuft.v
 * @date 2014-05-27  
 * @author Andrey Filippov
 *
 * @brief Wrapper for OBUFT primitive
 *
 * @copyright Copyright (c) 2014 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * obuft.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  obuft.v is distributed in the hope that it will be useful,
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

module  obuft # (
    parameter CAPACITANCE="DONT_CARE",
    parameter DRIVE = 12,
    parameter IOSTANDARD = "DEFAULT",
    parameter SLEW = "SLOW"
) (
    output O,
    input I,
    input T
);
    OBUFT #(
        .CAPACITANCE(CAPACITANCE),
        .DRIVE(DRIVE),
        .IOSTANDARD(IOSTANDARD),
        .SLEW(SLEW)
    ) OBUF_i (
        .O(O), // output 
        .I(I), // input 
        .T(T)  // input 
    );
endmodule
/*
OBUFT #(
    .IOSTANDARD(IOSTANDARD),
    .SLEW(SLEW)
) iobufs_dqs_i (
    .O(dq),
    .I(dq_data_dly),
    .T(dq_tri));

*/
