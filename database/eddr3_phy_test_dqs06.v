/*******************************************************************************
 * Module: test_dqs06
 * Date:2014-04-26  
 * Author: Andrey Filippov
 * Description: Testing DQS implementation
 *
 * Copyright (c) 2014 Elphel, Inc.
 * test_dqs06.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  test_dqs06.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
`timescale 1ns/1ps

module  test_dqs06(
    inout       dqs,
    inout       ndqs,
    output      dqs_received,
    input       clk_in,
    input       clk_ref_in,
    input       rst,
    input       dci_disable,
    input [7:0] dly_data,
    input       set,
    input       ld,
    output      dly_ready
);
wire clk,clk_div,clk_ref;
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


dqs_single #(
    .IBUF_LOW_PWR("FALSE"),
    .IOSTANDARD("DIFF_SSTL15_T_DCI"),
    .SLEW("FAST"),
    .REFCLK_FREQUENCY(300.0)
)dqs_single_i(
    .dqs(dqs),
    .ndqs(ndqs),
    .clk(clk),
    .clk_div(clk_div),
    .rst(rst),
    .dqs_received_dly(dqs_received),
    .dci_disable(dci_disable),  // disable DCI termination during writes and idle
    .dly_data(dly_data[7:0]),
    .din(dly_data[3:0]),
    .tin({4{dly_data[4]}}),
    .set_odelay(set),
    .ld_odelay(ld),
    .set_idelay(set),
    .ld_idelay(ld)
);


endmodule

