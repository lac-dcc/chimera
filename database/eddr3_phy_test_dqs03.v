/*******************************************************************************
 * Module: test_dqs03
 * Date:2014-04-26  
 * Author: Andrey Filippov
 * Description: Testing DQS implementation
 *
 * Copyright (c) 2014 Elphel, Inc.
 * test_dqs03.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  test_dqs03.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
`timescale 1ns/1ps

module  test_dqs03(
    input       dqs_data,
    inout       dqs,
    inout       ndqs,
    input       clk_in,
    input       clk_ref_in,
    input       rst,
    output      dqs_received,
    input       dqs_tri,
    output      dly_ready,
    
    input [4:0] dly_data,
    input       set,
    input       ld
    
);
//SuppressWarnings all
wire clk;
wire clk_div,clk_ref;
wire dqs_data_dly;
BUFR #(.BUFR_DIVIDE("2"))      clk_div_i (.I(clk_in),.O(clk_div),.CLR(rst), .CE(1'b1));
BUFR #(.BUFR_DIVIDE("BYPASS")) clk_i     (.I(clk_in),.O(clk),    .CLR(1'b0),.CE(1'b1));
BUFG                           ref_clk_i (.I(clk_ref_in),.O(clk_ref));
idelay_ctrl# (
 .IODELAY_GRP("IODELAY_MEMORY")
) idelay_ctrl_i (
    .refclk(clk_ref),
    .rst(rst),
    .rdy(dly_ready)
);

odelay_pipe # (
    .IODELAY_GRP("IODELAY_MEMORY"),
    .DELAY_VALUE(0),
    .REFCLK_FREQUENCY(300.0),
    .HIGH_PERFORMANCE_MODE("FALSE")
) dqs_data_dly_i(
    .clk(clk_div),
    .rst(rst),
    .set(set),
    .ld(ld),
    .delay(dly_data),
    .data_in(dqs_data),
    .data_out(dqs_data_dly)
);


IOBUFDS #(
    .DQS_BIAS("FALSE"),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
) iobufs_dqs_i (
    .O(dqs_received),
    .IO(dqs),
    .IOB(ndqs),
    .I(dqs_data_dly), //dqs_data),
    .T(dqs_tri));

endmodule

