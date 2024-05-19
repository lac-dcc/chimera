// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>byte_lane
 * @file byte_lane.v
 * @date 2014-04-26  
 * @author Andrey Filippov
 *
 * @brief DDR3 byte lane, including DQS I/O, 8xDQ I/O and DM output 
 *
 * @copyright Copyright (c) 2014 Elphel, Inc.
 *
 * <b>License:</b>
 *
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
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify this Program, or any covered work, by linking or combining it
 * with independent modules provided by the FPGA vendor only (this permission
 * does not extend to any 3-rd party modules, "soft cores" or macros) under
 * different license terms solely for the purpose of generating binary "bitstream"
 * files and/or simulating the code, the copyright holders of this Program give
 * you the right to distribute the covered work without those independent modules
 * as long as the source code for them is available from the FPGA vendor free of
 * charge, and there is no dependence on any encrypted modules for simulating of
 * the combined code. This permission applies to you if the distributed code
 * contains all the components and scripts required to completely simulate it
 * with at least one of the Free Software programs.
 */
`timescale 1ns/1ps
`include "system_defines.vh" 
// minimizing total DQS in delay to match DQ (finedelay stage adds some?)
//`define NOFINEDELAY_DQS 1
module  byte_lane #(
    parameter IODELAY_GRP ="IODELAY_MEMORY",
    parameter IBUF_LOW_PWR ="TRUE",
    parameter IOSTANDARD_DQ = "SSTL15_T_DCI",
    parameter IOSTANDARD_DM = "SSTL15",
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

wire dqs_read;
wire  iclk;         // source-synchronous clock (BUFR from DQS)
reg  [31:0] din_r=0;
// Preventing register removal of equivalent registers
`ifndef IGNORE_ATTR
    (* keep = "true" *)
`endif    
reg  [3:0] din_dm_r=0, din_dqs_r=0, tin_dq_r=4'hf, tin_dqs_r=4'hf;
`ifndef IGNORE_ATTR
    (* keep = "true" *)
`endif    
reg  [7:0] dly_data_r=0; 
`ifndef IGNORE_ATTR
    (* keep = "true" *)
`endif    
reg        set_r=0;
`ifndef IGNORE_ATTR
    (* keep = "true" *)
`endif    
reg  dci_disable_dqs_r, dci_disable_dq_r;
reg  [7:0] ld_odly=8'b0, ld_idly=8'b0;
reg        ld_odly_dqs,ld_idly_dqs,ld_odly_dm;

BUFR  iclk_i    (.O(iclk),.I(dqs_read), .CLR(1'b0),.CE(1'b1)); // OK, works with constraint? Seems now work w/o
/*
wire iclk_int;
//BUFR     iclk_int_i (.O(iclk_int), .I(dqs_read), .CLR(1'b0),.CE(1'b1));
    assign iclk_int = dqs_read && !rst;
BUFIO    iclk_i     (.O(iclk),     .I(iclk_int));
CRITICAL WARNING: [Vivado 12-1411] Cannot set LOC property of ports, Could not legally place instance
mcntrl393_i/memctrl16_i/mcontr_sequencer_i/phy_cmd_i/phy_top_i/byte_lane0_i/dqs_i/iobufs_dqs_i/IBUFDS/IBUFDS_M at N7 (IOB_X1Y120
since it belongs to a shape containing instance mcntrl393_i/memctrl16_i/mcontr_sequencer_i/phy_cmd_i/phy_top_i/byte_lane0_i/iclk_i.
The shape requires relative placement between 
mcntrl393_i/memctrl16_i/mcontr_sequencer_i/phy_cmd_i/phy_top_i/byte_lane0_i/dqs_i/iobufs_dqs_i/IBUFDS/IBUFDS_M and
mcntrl393_i/memctrl16_i/mcontr_sequencer_i/phy_cmd_i/phy_top_i/byte_lane0_i/iclk_i that cannnot be honored because it would result in
an invalid location for mcntrl393_i/memctrl16_i/mcontr_sequencer_i/phy_cmd_i/phy_top_i/byte_lane0_i/iclk_i. [x393.xdc:193]
----------
ERROR: [DRC 23-20] Rule violation (RTSTAT-1) Unrouted net - 2 net(s) are unrouted. The problem bus(es) and/or net(s) are 
mcntrl393_i/memctrl16_i/mcontr_sequencer_i/phy_cmd_i/phy_top_i/byte_lane1_i/iclk_int,
mcntrl393_i/memctrl16_i/mcontr_sequencer_i/phy_cmd_i/phy_top_i/byte_lane0_i/iclk_int.


*/
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
 
//always @ (posedge clk_div or posedge rst) begin
always @ (posedge clk_div) begin
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
        .tin(tin_dq_r),                 // tristate for data out (sent out earlier than data!) 
        .dout({dout[i+24],dout[i+16],dout[i+8],dout[i]}),          // parallel data received from DDR3 memory
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
        .IOSTANDARD(IOSTANDARD_DM),
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

