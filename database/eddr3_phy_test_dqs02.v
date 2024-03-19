/*******************************************************************************
 * Module: test_dqs02
 * Date:2014-04-26  
 * Author: Andrey Filippov
 * Description: Testing DQS implementation
 *
 * Copyright (c) 2014 Elphel, Inc.
 * test_dqs02.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  test_dqs02.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
`timescale 1ns/1ps

module  test_dqs02(
    input rst,    // reset
    input refclk, // 200MHz/300MHz for delay calibration
    input clk_in,
//    input set,
//    input ld_dly_data,
//    input ld_dly_tri,
//    input [7:0] dly_data,
    input [3:0] data_in,
//    input [3:0] tri_in,
    inout       dqs,
//    inout       ndqs,
    output      dqs_received,
    output      dly_ready
//    input       dqs_tri_a,
//    output      dqs_tri
//    output      dqs_data
   
);
wire refclk_b=refclk; // use buffer
wire clk, clk_div;
//wire dqs_data,dqs_tri; // after odelay
//wire dqs_data; // after odelay
//wire pre_dqs_data,pre_dqs_tri; // before odelay
wire dqs_data;
BUFR #(.BUFR_DIVIDE("2"))      clk_div_i (.I(clk_in),.O(clk_div),.CLR(rst), .CE(1'b1));
BUFR #(.BUFR_DIVIDE("BYPASS")) clk_i     (.I(clk_in),.O(clk),    .CLR(1'b0),.CE(1'b1));

oserdes_mem oserdes_dqs_i(
    .clk(clk),      // serial output clock
    .clk_div(clk_div),  // oclk divided by 2, front aligned
    .rst(rst),      // reset
    .din(data_in),      // parallel data in
//    .tin(tri_in),      // parallel tri-state in
    .tin(),      // parallel tri-state in
    .dout_dly(), //pre_dqs_data), // data out to be connected to odelay input
    .dout_iob(dqs_data), // data out to be connected directly to the output buffer
    .tout_dly(), // tristate out to be connected to odelay input
//    .tout_iob(pre_dqs_tri)  // tristate out to be connected directly to the tristate control of the output buffer
    .tout_iob()  // tristate out to be connected directly to the tristate control of the output buffer
);

idelay_ctrl# (
 .IODELAY_GRP("IODELAY_MEMORY")
) idelay_ctrl_i (
    .refclk(refclk_b),
    .rst(rst),
    .rdy(dly_ready)
);

/*
odelay_fine_pipe # (
    .IODELAY_GRP("IODELAY_MEMORY"),
    .DELAY_VALUE(0),
    .REFCLK_FREQUENCY(300.0),
    .HIGH_PERFORMANCE_MODE("FALSE")
) dqs_data_dly_i(
    .clk(clk_div),
    .rst(rst),
    .set(set),
    .ld(ld_dly_data),
    .delay(dly_data),
    .data_in(pre_dqs_data),
    .data_out(dqs_data)
);
*/

/*
odelay_pipe # (
    .IODELAY_GRP("IODELAY_MEMORY"),
    .DELAY_VALUE(0),
    .REFCLK_FREQUENCY(300.0),
    .HIGH_PERFORMANCE_MODE("FALSE")
) dqs_data_dly_i(
    .clk(clk_div),
    .rst(rst),
    .set(set),
    .ld(ld_dly_data),
    .delay(dly_data[7:3]),
    .data_in(pre_dqs_data),
    .data_out(dqs_data)
);
*/
/*
odelay_fine_pipe # (
    .IODELAY_GRP("IODELAY_MEMORY"),
    .DELAY_VALUE(0),
    .REFCLK_FREQUENCY(300.0),
    .HIGH_PERFORMANCE_MODE("FALSE")
) dqs_tri_dly_i(
    .clk(clk_div),
    .rst(rst),
    .set(set),
    .ld(ld_dly_tri),
    .delay(dly_data),
    .data_in(pre_dqs_tri),
    .data_out(dqs_tri)
);
*/

//wire dqs_tri_a;
//(* keep = "true" *) BUF buf0_i(.O(dqs_tri_a), .I(dqs_tri));

/*
IOBUFDS #(
    .DQS_BIAS("FALSE"),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
) iobufs_dqs_i (
    .O(dqs_received),
    .IO(dqs),
    .IOB(ndqs),
    .I(dqs_data),
//    .T(dqs_tri));
    .T());
*/
IOBUF #(
//    .DQS_BIAS("FALSE"),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
) iobufs_dqs_i (
    .O(dqs_received),
    .IO(dqs),
    .I(dqs_data),
//    .T(dqs_tri));
    .T(dqs_data));


endmodule

