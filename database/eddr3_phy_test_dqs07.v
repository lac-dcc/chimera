/*******************************************************************************
 * Module: test_dqs07
 * Date:2014-04-26  
 * Author: Andrey Filippov
 * Description: Testing DQS implementation
 *
 * Copyright (c) 2014 Elphel, Inc.
 * test_dqs07.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  test_dqs07.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
`timescale 1ns/1ps

module  test_dqs07(
    inout        dqs,
    inout        ndqs,
//    output      dqs_received,
    input        clk_in,
    input        clk_ref_in,
    input        rst,
    input        dci_disable_dqs,
    input  [7:0] dly_data,
    input        set,
    input        ld,
    output       dly_ready,
    
    inout        dq,
    output [3:0] dout,
    input        dci_disable_dq
);
wire clk,clk_div,clk_ref;
(* CLOCK_DEDICATED_ROUTE = "FALSE" *) wire dqs_read; // does not seem to work
wire iclk;

BUFR #(.BUFR_DIVIDE("2"))      clk_div_i (.I(clk_in),.O(clk_div),.CLR(rst), .CE(1'b1));
BUFR #(.BUFR_DIVIDE("BYPASS")) clk_i     (.I(clk_in),.O(clk),    .CLR(1'b0),.CE(1'b1));
BUFG                           ref_clk_i (.I(clk_ref_in),.O(clk_ref));
//set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets dqs_single_i/dqs_in_dly_i/dqs_read]
//BUFR                          iclk_i    (.O(iclk),.I(dqs_read), .CLR(1'b0),.CE(1'b1)); // OK, works with constraint above
BUFIO                          iclk_i    (.O(iclk),.I(dqs_read)); // Fails even with the constraint
idelay_ctrl# (
 .IODELAY_GRP("IODELAY_MEMORY")
) idelay_ctrl_i (
    .refclk(clk_ref),
    .rst(rst),
    .rdy(dly_ready)
);


dqs_single #(
    .IODELAY_GRP("IODELAY_MEMORY"),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DIFF_SSTL15_T_DCI"),
    .SLEW("FAST"),
    .REFCLK_FREQUENCY(300.0),
    .HIGH_PERFORMANCE_MODE("FALSE")
) dqs_single_i (
    .dqs(dqs),
    .ndqs(ndqs),
    .clk(clk),
    .clk_div(clk_div),
    .rst(rst),
    .dqs_received_dly(dqs_read),
    .dci_disable(dci_disable_dqs),  // disable DCI termination during writes and idle
    .dly_data(dly_data[7:0]),
    .din(dly_data[3:0]),
    .tin({4{dly_data[4]}}),
    .set_odelay(set),
    .ld_odelay(ld),
    .set_idelay(set),
    .ld_idelay(ld)
);
dq_single #(
    .IODELAY_GRP("IODELAY_MEMORY"),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("SSTL15_T_DCI"),
    .SLEW("FAST"),
    .REFCLK_FREQUENCY(300.0),
    .HIGH_PERFORMANCE_MODE("FALSE")
) dq_single_i (
    .dq(dq),
    .iclk(iclk),         // source-synchronous clock (BUFR from DQS)
    .clk(clk),          // free-running system clock, same frequency as iclk (shared for R/W)
    .clk_div(clk_div),      // free-running half clk frequency, front aligned to clk (shared for R/W)
    .inv_clk_div(1'b0),  // invert clk_div for R channel (clk_div is shared between R and W)
    .rst(rst),
    .dci_disable(dci_disable_dq),  // disable DCI termination during writes and idle
    .dly_data(dly_data[7:0]),     // delay value (3 LSB - fine delay)
    .din(dly_data[3:0]),          // parallel data to be sent out
    .tin({4{dly_data[4]}}),          // tristate for data out (sent out earlier than data!) 
    .dout(dout[3:0]),         // parallel data received from DDR3 memory
    .set_odelay(set),   // clk_div synchronous load odelay value from dly_data
    .ld_odelay(ld),    // clk_div synchronous set odealy value from loaded
    .set_idelay(set),   // clk_div synchronous load idelay value from dly_data
    .ld_idelay(ld)     // clk_div synchronous set idealy value from loaded
);

endmodule

