/*******************************************************************************
 * Module: obuf
 * Date:2014-05-27  
 * Author: Andrey Filippov
 * Description: Wrapper for OBUF primitive
 *
 * Copyright (c) 2014 Elphel, Inc.
 * obuf.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  obuf.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
`timescale 1ns/1ps

module  obuf # (
    parameter CAPACITANCE="DONT_CARE",
    parameter DRIVE = 12,
    parameter IOSTANDARD = "DEFAULT",
    parameter SLEW = "SLOW"
) (
    output O,
    input I
);
    OBUF #(
        .CAPACITANCE(CAPACITANCE),
        .DRIVE(DRIVE),
        .IOSTANDARD(IOSTANDARD),
        .SLEW(SLEW)
    ) OBUF_i (
        .O(O), // output 
        .I(I) // input 
    );
endmodule

