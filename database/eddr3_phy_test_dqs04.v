/*******************************************************************************
 * Module: test_dqs04
 * Date:2014-04-26  
 * Author: Andrey Filippov
 * Description: Testing DQS implementation
 *
 * Copyright (c) 2014 Elphel, Inc.
 * test_dqs04.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  test_dqs04.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
`timescale 1ns/1ps

module  test_dqs04(
    input       dqs_data,
    inout       dqs,
    inout       ndqs,
    input       clk_in,
    input       clk_ref_in,
    input       rst,
    output      dqs_received,
//    input       dqs_tri,
    output      dly_ready,
    
    input [4:0] dly_data,
    input       set,
    input       ld
    
);
wire clk,clk_div,clk_ref;
wire dqs_data_dly;
wire dly_ready_0;
assign dly_ready= dly_ready_0 && dqs_data;
wire d_ser;
wire dqs_tri1;

BUFR #(.BUFR_DIVIDE("2"))      clk_div_i (.I(clk_in),.O(clk_div),.CLR(rst), .CE(1'b1));
BUFR #(.BUFR_DIVIDE("BYPASS")) clk_i     (.I(clk_in),.O(clk),    .CLR(1'b0),.CE(1'b1));
BUFG                           ref_clk_i (.I(clk_ref_in),.O(clk_ref));

           OSERDESE2 #(
               .DATA_RATE_OQ         ("DDR"),
               .DATA_RATE_TQ         ("DDR"),
               .DATA_WIDTH           (4),
               .INIT_OQ              (1'b0),
               .INIT_TQ              (1'b0),
               .SERDES_MODE          ("MASTER"),
               .SRVAL_OQ             (1'b0),
               .SRVAL_TQ             (1'b0),
               .TRISTATE_WIDTH       (4),
               .TBYTE_CTL            ("FALSE"), 
               .TBYTE_SRC            ("FALSE")
            ) oserdes_i (
                .OFB                 (d_ser),
                .OQ                  (), // dout_iob),
                .SHIFTOUT1           (),
                .SHIFTOUT2           (),
                .TFB                 (),
                .TQ                  (dqs_tri1),
                .CLK                 (clk),
                .CLKDIV              (clk_div),
                .D1                  (dly_data[0]),
                .D2                  (dly_data[1]),
                .D3                  (dly_data[2]),
                .D4                  (dly_data[3]),
                .D5                  (),
                .D6                  (),
                .D7                  (),
                .D8                  (),
               .OCE                  (1'b1),
               .RST                  (rst),
               .SHIFTIN1             (),
               .SHIFTIN2             (),
               .T1                   (dly_data[4]),
               .T2                   (dly_data[4]),
               .T3                   (dly_data[4]),
               .T4                   (dly_data[4]),
               .TCE                  (1'b1),
               .TBYTEOUT             (),
               .TBYTEIN              ()
             );

idelay_ctrl# (
 .IODELAY_GRP("IODELAY_MEMORY")
) idelay_ctrl_i (
    .refclk(clk_ref),
    .rst(rst),
    .rdy(dly_ready_0)
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
    .data_in(d_ser), //dqs_data),
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
    .T(dqs_tri1));

endmodule

