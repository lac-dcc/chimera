/*******************************************************************************
 * Module: test_dqs01
 * Date:2014-04-26  
 * Author: Andrey Filippov
 * Description: Testing DQS implementation
 *
 * Copyright (c) 2014 Elphel, Inc.
 * test_dqs01.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  test_dqs01.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
`timescale 1ns/1ps

module  test_dqs01( 
    input  [1:0] dqs_data, 
    inout  [1:0] dqs,
    inout  [1:0] ndqs,
    output [1:0] dqs_received,
    input  [1:0] dqs_tri
   
);



IOBUFDS #(
    .DQS_BIAS("FALSE"),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
) iobufs_dqs_i0 (
    .O(dqs_received[0]), 
    .IO(dqs[0]),
    .IOB(ndqs[0]),
    .I(dqs_data[0]),
    .T(dqs_tri[0]));

IOBUFDS #(
    .DQS_BIAS("FALSE"),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
) iobufs_dqs_i1 (
    .O(dqs_received[1]), 
    .IO(dqs[1]),
    .IOB(ndqs[1]),
    .I(dqs_data[1]),
    .T(dqs_tri[1]));

endmodule

