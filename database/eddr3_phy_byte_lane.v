/*******************************************************************************
 * Module: byte_lane
 * Date:2014-04-26  
 * Author: Andrey Filippov
 * Description: DDR3 byte lane, including DQS I/O, 8xDQ I/O and DM output 
 *
 * Copyright (c) 2014 Elphel, Inc.
 * byte_lane.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  byte_lane.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
`timescale 1ns/1ps
// minimizing total DQS in delay to match DQ (finedelay stage adds some?)
//`define NOFINEDELAY_DQS 1
module  byte_lane #(
    parameter IODELAY_GRP ="IODELAY_MEMORY",
    parameter IBUF_LOW_PWR ="TRUE",
    parameter IOSTANDARD_DQ = "SSTL15_T_DCI",
    parameter IOSTANDARD_DQS = "DIFF_SSTL15_T_DCI",
    parameter SLEW_DQ = "SLOW",
    parameter SLEW_DQS = "SLOW",
    parameter real REFCLK_FREQUENCY = 300.0,
    parameter HIGH_PERFORMANCE_MODE = "FALSE"
)(
    inout   [7:0] dq,              // DQ  I/O pads
//    inout         dm,              // DM  I/O pad (actually only output)
    output        dm,              // DM  I/O pad (actually only output)
    inout         dqs,             //  DQS I/O pad
    inout         ndqs,            // ~DQS I/O pad
    input         clk,             // free-running system clock, same frequency as iclk (shared for R/W)
    input         clk_div,         // free-running half clk frequency, front aligned to clk (shared for R/W)
    input         inv_clk_div,     // invert clk_div for R channels (clk_div is shared between R and W)
    input         rst,
    input         dci_disable_dqs, // disable DCI termination during writes and idle for dqs
    input         dci_disable_dq,  // disable DCI termination during writes and idle for dq and dm signals
    input  [31:0] din,             // parallel data to be sent out (4 bits per DG I/))
    input   [3:0] din_dm,          // parallel data to be sent out over DM
    input   [3:0] tin_dq,          // tristate for data out (sent out earlier than data!) and dm 
    input   [3:0] din_dqs,         // parallel data to be sent out over DQS
    input   [3:0] tin_dqs,         // tristate for DQS out (sent out earlier than data!) 
    output [31:0] dout,            // parallel data received from DDR3 memory, 4 bits per DQ I/O
    input   [7:0] dly_data,        // delay value (3 LSB - fine delay)
    input   [4:0] dly_addr,        // select which delay to program
    input         ld_delay,        // load delay data to selected iodelay (clk_div synchronous)
    input         set              // clk_div synchronous set all delays from previously loaded values
);

//(* CLOCK_DEDICATED_ROUTE = "FALSE" *)  // does not seem to work
wire dqs_read;
wire  iclk;         // source-synchronous clock (BUFR from DQS)
reg  [31:0] din_r=0;
// Preventing register removal of equivalent registers
 (* keep = "true" *) reg  [3:0] din_dm_r=0, din_dqs_r=0, tin_dq_r=4'hf, tin_dqs_r=4'hf;
 (* keep = "true" *) reg  [7:0] dly_data_r=0; 
 (* keep = "true" *) reg        set_r=0;
 (* keep = "true" *) reg  dci_disable_dqs_r, dci_disable_dq_r;
reg  [7:0] ld_odly=8'b0, ld_idly=8'b0;
reg        ld_odly_dqs,ld_idly_dqs,ld_odly_dm;
BUFR                          iclk_i    (.O(iclk),.I(dqs_read), .CLR(1'b0),.CE(1'b1)); // OK, works with constraint? Seems now work w/o
wire [9:0] decode_sel={
    (dly_addr[3:0]==9)?1'b1:1'b0,
    (dly_addr[3:0]==8)?1'b1:1'b0,
    (dly_addr[3:0]==7)?1'b1:1'b0,
    (dly_addr[3:0]==6)?1'b1:1'b0,
    (dly_addr[3:0]==5)?1'b1:1'b0,
    (dly_addr[3:0]==4)?1'b1:1'b0,
    (dly_addr[3:0]==3)?1'b1:1'b0,
    (dly_addr[3:0]==2)?1'b1:1'b0,
    (dly_addr[3:0]==1)?1'b1:1'b0,
    (dly_addr[3:0]==0)?1'b1:1'b0};
 
always @ (posedge clk_div or posedge rst) begin
    if (rst) begin
        din_r <= 32'b0; din_dm_r<=0; din_dqs_r<=0; tin_dq_r<=4'hf; tin_dqs_r<=4'hf;
        dly_data_r<=8'b0;set_r<=1'b0;
        dci_disable_dqs_r <= 1'b1; dci_disable_dq_r <=1'b1;
        ld_odly<=8'b0; ld_idly<=8'b0; ld_odly_dqs<=1'b0; ld_idly_dqs<=1'b0; ld_odly_dm<=1'b0;
    end else begin
        din_r<=din[31:0];  din_dm_r<=din_dm; din_dqs_r<=din_dqs; tin_dq_r<=tin_dq; tin_dqs_r<=tin_dqs;
        dly_data_r<=dly_data; set_r<=set;
        dci_disable_dqs_r <= dci_disable_dqs; dci_disable_dq_r <= dci_disable_dq;
        {ld_odly_dm,ld_odly_dqs,ld_odly[7:0]} <= {10{(~dly_addr[4]) & ld_delay}} & decode_sel;
        {           ld_idly_dqs,ld_idly[7:0]} <= {9 {( dly_addr[4]) & ld_delay}} & decode_sel[8:0];
    end
end     

generate
    genvar i;
    for (i=0; i < 8; i=i+1) begin: dq_block
    dq_single #(
        .IODELAY_GRP(IODELAY_GRP),
        .IBUF_LOW_PWR(IBUF_LOW_PWR),
        .IOSTANDARD(IOSTANDARD_DQ),
        .SLEW(SLEW_DQ),
        .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
        .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE)
    ) dq_i(
        .dq(dq[i]),                     // I/O pad
        .iclk(iclk),                    // source-synchronous clock (BUFR from DQS)
        .clk(clk),                      // free-running system clock, same frequency as iclk (shared for R/W)
        .clk_div(clk_div),              // free-running half clk frequency, front aligned to clk (shared for R/W)
        .inv_clk_div(inv_clk_div),      // invert clk_div for R channel (clk_div is shared between R and W)
        .rst(rst),
        .dci_disable(dci_disable_dq_r), // disable DCI termination during writes and idle
        .dly_data(dly_data_r),          // delay value (3 LSB - fine delay)
        .din({din_r[i+24],din_r[i+16],din_r[i+8],din_r[i]}) ,        // parallel data to be sent out
//        .din(din_r[4*i+3:4*i]) ,        // parallel data to be sent out
//        .din(din_r[4*i+3-:4]) ,        // parallel data to be sent out
        .tin(tin_dq_r),                 // tristate for data out (sent out earlier than data!) 
        .dout({dout[i+24],dout[i+16],dout[i+8],dout[i]}),          // parallel data received from DDR3 memory
//        .dout(dout[4*i+3:4*i]),          // parallel data received from DDR3 memory
        .set_odelay(set_r),             // clk_div synchronous load odelay value from dly_data
        .ld_odelay(ld_odly[i]),         // clk_div synchronous set odealy value from loaded
        .set_idelay(set_r),             // clk_div synchronous load idelay value from dly_data
        .ld_idelay(ld_idly[i])          // clk_div synchronous set idealy value from loaded
    );
    end
endgenerate

dm_single #(
        .IODELAY_GRP(IODELAY_GRP),
        .IBUF_LOW_PWR(IBUF_LOW_PWR),
        .IOSTANDARD(IOSTANDARD_DQ),
        .SLEW(SLEW_DQ),
        .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
        .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE)
) dm_i(
        .dm(dm),                        // DM output pad
        .clk(clk),                      // free-running system clock, same frequency as iclk (shared for R/W)
        .clk_div(clk_div),              // free-running half clk frequency, front aligned to clk (shared for R/W)
        .rst(rst),
        .dci_disable(dci_disable_dq_r), // disable DCI termination during writes and idle
        .dly_data(dly_data_r),          // delay value (3 LSB - fine delay)
        .din(din_dm_r[3:0]) ,           // parallel data to be sent out
        .tin(tin_dq_r),                 // tristate for data out (sent out earlier than data!) 
        .set_odelay(set_r),             // clk_div synchronous load odelay value from dly_data
        .ld_odelay(ld_odly_dm)         // clk_div synchronous set odealy value from loaded
);

`ifdef NOFINEDELAY_DQS
dqs_single_nofine #(
`else
dqs_single #(
`endif
        .IODELAY_GRP(IODELAY_GRP),
        .IBUF_LOW_PWR(IBUF_LOW_PWR),
        .IOSTANDARD(IOSTANDARD_DQS),
        .SLEW(SLEW_DQS),
        .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
        .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE)
) dqs_i (
    .dqs(dqs),
    .ndqs(ndqs),
    .clk(clk),
    .clk_div(clk_div),
    .rst(rst),
    .dqs_received_dly(dqs_read),
    .dci_disable(dci_disable_dqs_r),  // disable DCI termination during writes and idle
    .dly_data(dly_data_r[7:0]),
    .din(din_dqs_r[3:0]),
    .tin(tin_dqs_r[3:0]),
    .set_odelay(set_r),
    .ld_odelay(ld_odly_dqs),
    .set_idelay(set_r),
    .ld_idelay(ld_idly_dqs)
);
endmodule

