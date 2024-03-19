/*******************************************************************************
 * Module: oddr_ds
 * Date:2014-05-13  
 * Author: Andrey Filippov
 * Description: wrapper for ODDR+OBUFDS
 *
 * Copyright (c) 2014 Elphel, Inc.
 * oddr_ds.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  oddr_ds.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
`timescale 1ns/1ps

module  oddr_ds # (
        parameter CAPACITANCE =  "DONT_CARE",
        parameter IOSTANDARD =   "DIFF_SSTL15",
        parameter SLEW =         "SLOW",
        parameter DDR_CLK_EDGE = "OPPOSITE_EDGE",
        parameter INIT         = 1'b0,
        parameter SRTYPE = "SYNC"
)(
    input  clk,
    input  ce,
    input  rst,
    input  set,
    input [1:0] din,
    input  tin, // tristate control
    output dq,
    output ndq
);
    wire idq;
    /* Instance template for module ODDR */
    ODDR #(
        .DDR_CLK_EDGE(DDR_CLK_EDGE),
        .INIT(INIT),
        .SRTYPE(SRTYPE)
    ) ODDR_i (
        .Q(idq), // output 
        .C(clk), // input 
        .CE(ce), // input 
        .D1(din[0]), // input 
        .D2(din[1]), // input 
        .R(rst), // input 
        .S(set) // input 
    );

    /* Instance template for module OBUFDS */
/*    
    OBUFDS #(
        .CAPACITANCE(CAPACITANCE),
        .IOSTANDARD(IOSTANDARD),
        .SLEW(SLEW)
    ) OBUFDS_i (
        .O(dq), // output 
        .OB(ndq), // output 
        .I(idq) // input 
    );
*/
    /* Instance template for module OBUFTDS */
    OBUFTDS #(
        .CAPACITANCE (CAPACITANCE),
        .IOSTANDARD  (IOSTANDARD),
        .SLEW        (SLEW)
    ) OBUFDS_i (
        .O  (dq), // output 
        .OB (ndq), // output 
        .I  (idq), // input 
//        .T  (tin || rst) // input 
        .T  (tin) // input 
    );

endmodule

