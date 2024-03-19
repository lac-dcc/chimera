/*******************************************************************************
 * Module: test_dqs05
 * Date:2014-04-26  
 * Author: Andrey Filippov
 * Description: Testing DQS implementation
 *
 * Copyright (c) 2014 Elphel, Inc.
 * test_dqs05.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  test_dqs05.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
`timescale 1ns/1ps

module  test_dqs05(
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
    input       ld,
    input       ldt
    
);
wire clk,clk_div,clk_ref;
wire dqs_data_dly;
wire dly_ready_0;
assign dly_ready= dly_ready_0 && dqs_data;
wire d_ser;
wire dqs_tri1;

//wire d_tri;

BUFR #(.BUFR_DIVIDE("2"))      clk_div_i (.I(clk_in),.O(clk_div),.CLR(rst), .CE(1'b1));
BUFR #(.BUFR_DIVIDE("BYPASS")) clk_i     (.I(clk_in),.O(clk),    .CLR(1'b0),.CE(1'b1));
BUFG                           ref_clk_i (.I(clk_ref_in),.O(clk_ref));

           OSERDESE2 #(
               .DATA_RATE_OQ         ("DDR"),
//               .DATA_RATE_TQ         ("DDR"),
               .DATA_RATE_TQ         ("BUF"),
               .DATA_WIDTH           (4),
               .INIT_OQ              (1'b0),
               .INIT_TQ              (1'b0),
               .SERDES_MODE          ("MASTER"),
               .SRVAL_OQ             (1'b0),
               .SRVAL_TQ             (1'b0),
               .TRISTATE_WIDTH       (1),
               .TBYTE_CTL            ("FALSE"), 
               .TBYTE_SRC            ("FALSE")
            ) oserdes_i (
                .OFB                 (d_ser),
                .OQ                  (),
                .SHIFTOUT1           (),
                .SHIFTOUT2           (),
                .TFB                 (),
//                .TFB                 (d_tri),
//                .TQ                  (dqs_tri1),
                .TQ                  (),
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
//               .T1                   (dly_data[4]),
//               .T2                   (dly_data[4]),
//               .T3                   (dly_data[4]),
//               .T4                   (dly_data[4]),
               .T1                   (),
               .T2                   (),
               .T3                   (),
               .T4                   (),
//               .TCE                  (1'b1),
               .TCE                  (),
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

odelay_pipe # (
    .IODELAY_GRP("IODELAY_MEMORY"),
    .DELAY_VALUE(0),
    .REFCLK_FREQUENCY(300.0),
    .HIGH_PERFORMANCE_MODE("FALSE")
) dqs_tri_dly_i(
    .clk(clk_div),
    .rst(rst),
    .set(set),
    .ld(ldt),
    .delay(dly_data),
    .data_in(dqs_tri), //d_tri), //dqs_data),
    .data_out(dqs_tri1)
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
/*
Does not work.
 http://forums.xilinx.com/t5/7-Series-FPGAs/How-to-use-2-odelya-on-one-IOB-on-V7/m-p/361317#M2312
  There is only one ODELAY per IOI/IOB, therefore to use a second ODELAY you would require the use of a second IOI/IOB.
Secondly the DATAOUT of an ODELAY can ONLY be connected to OBUF (or IOBUF), it will not route to a T port of an IOBUF.
Thirdly when you are using an OSERDES followed by an IOBUFT the T port needs to be driven from the TQ of the OSERDES.

What you can do is take the DATAOUT of the Tristate ODELAY and drive an IOBUFT and then use the input side of the buffer
drive the T1 port of the OSERDES and connect the TQ port of the data IOBUFT. The obvious down side to this is the use of
the second IOB/IOI and the routing delay from IOB to the T1 port of the OSERDES.

Another option would be to use the IDELAY in the data IOB/IOI using the DATAIN port and the DELAY_src=> "DATAIN", you can
LOC the IDELAY to the same site (tools won’t automatically choose this location). You will still have the routing delays
as the output of the IDELAY goes into Fabric to get back to the OSERDES T1 port but it only uses data IOB/IOI.
*/
