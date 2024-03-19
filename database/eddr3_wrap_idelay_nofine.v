/*******************************************************************************
 * Module: idelay_nofine
 * Date:2014-04-25  
 * Author: Andrey Filippov
 * Description: IDELAYE2 wrapper without fine delay
 * Copyright (c) 2014 Elphel, Inc.
 * idelay_nofine.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  idelay_nofine.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
`timescale 1ns/1ps

module  idelay_nofine
//SuppressWarnings VEditor - IODELAY_GRP used in (* *) construnt
# ( parameter  IODELAY_GRP  = "IODELAY_MEMORY",
    parameter integer DELAY_VALUE = 0,
    parameter real REFCLK_FREQUENCY = 200.0,
    parameter HIGH_PERFORMANCE_MODE    = "FALSE"
) (
    input clk,
    input rst,
    input set,
    input ld,
    input [4:0] delay,
    input data_in,
    output data_out
);
(* IODELAY_GROUP = IODELAY_GRP *) IDELAYE2
     #(
        .CINVCTRL_SEL("FALSE"),
        .DELAY_SRC("IDATAIN"),
//        .FINEDELAY("ADD_DLY"),
        .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE),
        .IDELAY_TYPE("VAR_LOAD_PIPE"),
        .IDELAY_VALUE(DELAY_VALUE),
//        .IS_C_INVERTED(1'b0),  // ISE does not have this parameter
//        .IS_DATAIN_INVERTED(1'b0),  // ISE does not have this parameter
//        .IS_IDATAIN_INVERTED(1'b0),  // ISE does not have this parameter
        .PIPE_SEL("TRUE"),
        .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
        .SIGNAL_PATTERN("DATA")
    )
    idelay2_i(
        .CNTVALUEOUT(),
        .DATAOUT(data_out),
        .C(clk),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN(delay[4:0]),
        .DATAIN(1'b0),
        .IDATAIN(data_in),
//        .IFDLY(fdly),
        .INC(1'b0),
        .LD(set),
        .LDPIPEEN(ld),
        .REGRST(rst)
    );

endmodule

