// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmd_addr
 * @file cmd_addr.v
 * @date 2014-04-26  
 * @author Andrey Filippov
 *
 * @brief DDR3 command/address signals 
 *
 * @copyright Copyright (c) 2014 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmd_addr.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmd_addr.v is distributed in the hope that it will be useful,
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
/*
 Currently ddr3_a, ddr3_ba, ddr_cke and ddr_odt do not change inside a 2-clock command cycle, so half register
 bits are removed during optimization
*/
module  cmd_addr #(
    parameter IODELAY_GRP = "IODELAY_MEMORY",
    parameter IOSTANDARD =  "SSTL15",
    parameter SLEW =        "SLOW",
    parameter real REFCLK_FREQUENCY = 300.0,
    parameter HIGH_PERFORMANCE_MODE = "FALSE",
    parameter integer ADDRESS_NUMBER= 15
)(
    output  [ADDRESS_NUMBER-1:0] ddr3_a,   // output address ports (14:0) for 4Gb device
    output  [2:0]                ddr3_ba,  // output bank address ports
    output                       ddr3_we,  // output WE port
    output                       ddr3_ras, // output RAS port
    output                       ddr3_cas, // output CAS port
    output                       ddr3_cke, // output Clock Enable port
    output                       ddr3_odt, // output ODT port
    input                        clk,      // free-running system clock, same frequency as iclk (shared for R/W)
    input                        clk_div,  // free-running half clk frequency, front aligned to clk (shared for R/W)
    input                        rst,      // reset delays/serdes
    input [2*ADDRESS_NUMBER-1:0] in_a,     // input address, 2 bits per signal (first, second) (29:0) for 4Gb device
    input                  [5:0] in_ba,    // input bank address, 2 bits per signal (first, second)
    input                  [1:0] in_we,    // input WE, 2 bits (first, second)
    input                  [1:0] in_ras,   // input RAS, 2 bits (first, second)
    input                  [1:0] in_cas,   // input CAS, 2 bits (first, second)
    input                  [1:0] in_cke,   // input CKE, 2 bits (first, second)
    input                  [1:0] in_odt,   // input ODT, 2 bits (first, second)
//    input                  [1:0] in_tri,   // tristate command/address outputs - same timing, but no odelay
    input                        in_tri,   // tristate command/address outputs - same timing, but no odelay
    input                  [7:0] dly_data, // delay value (3 LSB - fine delay)
    input                  [4:0] dly_addr, // select which delay to program
    input                        ld_delay, // load delay data to selected iodelayl (clk_div synchronous)
    input                        set       // clk_div synchronous set all delays from previously loaded values
);
reg  [2*ADDRESS_NUMBER-1:0] in_a_r=0;
reg  [5:0] in_ba_r=0;
reg  [1:0] in_we_r=2'h3, in_ras_r=2'h3, in_cas_r=2'h3, in_cke_r=2'h3, in_odt_r=2'h0;
//reg  [1:0] in_tri_r=2'h0; // or tri-state on reset?
reg  in_tri_r=1'b1; // or tri-state on reset?
// Preventing register duplication
 `ifndef IGNORE_ATTR
    (* keep = "true" *)
`endif    
reg  [7:0] dly_data_r=0; 
`ifndef IGNORE_ATTR
    (* keep = "true" *)
`endif    
reg        set_r=0;
reg  [7:0] ld_dly_cmd=8'b0;
reg  [ADDRESS_NUMBER-1:0] ld_dly_addr=0;
//wire  [ADDRESS_NUMBER-1:0] decode_addr;
wire  [23:0] decode_addr24;
wire [7:0] decode_sel={
    (dly_addr[2:0]==7)?1'b1:1'b0,
    (dly_addr[2:0]==6)?1'b1:1'b0,
    (dly_addr[2:0]==5)?1'b1:1'b0,
    (dly_addr[2:0]==4)?1'b1:1'b0,
    (dly_addr[2:0]==3)?1'b1:1'b0,
    (dly_addr[2:0]==2)?1'b1:1'b0,
    (dly_addr[2:0]==1)?1'b1:1'b0,
    (dly_addr[2:0]==0)?1'b1:1'b0};
assign decode_addr24={
  (dly_addr[4:3] == 2'h2)?decode_sel[7:0]:8'h0,
  (dly_addr[4:3] == 2'h1)?decode_sel[7:0]:8'h0,
  (dly_addr[4:3] == 2'h0)?decode_sel[7:0]:8'h0};
//always @ (posedge clk_div or posedge rst) begin
always @ (posedge clk_div) begin
    if (rst) begin
        in_a_r <= 0; in_ba_r <= 6'b0;
        in_we_r <= 2'h3; in_ras_r <= 2'h3; in_cas_r <= 2'h3; in_cke_r <= 2'h3; in_odt_r <= 2'h0;
        in_tri_r <= 1'b1; // or tri-state on reset?
        dly_data_r<=8'b0;set_r<=1'b0;
        ld_dly_cmd <= 8'b0; ld_dly_addr <= 0;
    end else begin
        in_a_r <= in_a;
        in_ba_r <= in_ba; 
        in_we_r <= in_we; in_ras_r <= in_ras; in_cas_r <= in_cas; in_cke_r <= in_cke; in_odt_r <= in_odt;
        in_tri_r <= in_tri;
        dly_data_r<=dly_data;
        set_r<=set;
        ld_dly_cmd <=  {8 { dly_addr[4] & dly_addr[3] & ld_delay}} & decode_sel[7:0];
//        ld_dly_addr <= {(ADDRESS_NUMBER) {ld_delay}} & decode_addr;
        ld_dly_addr <= {(ADDRESS_NUMBER) {ld_delay}} & decode_addr24[ADDRESS_NUMBER-1:0];
    end
end     

// All addresses
generate
    genvar i;
    for (i=0; i<ADDRESS_NUMBER; i=i+1) begin: addr_block
//       assign decode_addr[i]=(ld_dly_addr[4:0] == i)?1'b1:1'b0;
    cmda_single #(
         .IODELAY_GRP(IODELAY_GRP),
         .IOSTANDARD(IOSTANDARD),
         .SLEW(SLEW),
         .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
         .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE)
    ) cmda_addr_i (
    .dq(ddr3_a[i]),               // I/O pad (appears on the output 1/2 clk_div earlier, than DDR data)
    .clk(clk),          // free-running system clock, same frequency as iclk (shared for R/W)
    .clk_div(clk_div),      // free-running half clk frequency, front aligned to clk (shared for R/W)
    .rst(rst),
    .dly_data(dly_data_r[7:0]),     // delay value (3 LSB - fine delay)
    .din({in_a_r[ADDRESS_NUMBER+i],in_a_r[i]}),      // parallel data to be sent out
//    .tin(in_tri_r[1:0]),          // tristate for data out (sent out earlier than data!) 
    .tin(in_tri_r),          // tristate for data out (sent out earlier than data!) 
    .set_delay(set_r),             // clk_div synchronous load odelay value from dly_data
    .ld_delay(ld_dly_addr[i])      // clk_div synchronous set odealy value from loaded
);       
    end
endgenerate
// Bank addresses
// ba0
    cmda_single #(
         .IODELAY_GRP(IODELAY_GRP),
         .IOSTANDARD(IOSTANDARD),
         .SLEW(SLEW),
         .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
         .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE)
    ) cmda_ba0_i (
    .dq(ddr3_ba[0]),
    .clk(clk),
    .clk_div(clk_div),
    .rst(rst),
    .dly_data(dly_data_r[7:0]),
    .din({in_ba_r[3],in_ba_r[0]}),
//    .tin(in_tri_r[1:0]), 
    .tin(in_tri_r), 
    .set_delay(set_r),
    .ld_delay(ld_dly_cmd[0]));
// ba1
    cmda_single #(
         .IODELAY_GRP(IODELAY_GRP),
         .IOSTANDARD(IOSTANDARD),
         .SLEW(SLEW),
         .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
         .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE)
    ) cmda_ba1_i (
    .dq(ddr3_ba[1]),
    .clk(clk),
    .clk_div(clk_div),
    .rst(rst),
    .dly_data(dly_data_r[7:0]),
    .din({in_ba_r[4],in_ba_r[1]}),
//    .tin(in_tri_r[1:0]), 
    .tin(in_tri_r), 
    .set_delay(set_r),
    .ld_delay(ld_dly_cmd[1]));
// ba2
    cmda_single #(
         .IODELAY_GRP(IODELAY_GRP),
         .IOSTANDARD(IOSTANDARD),
         .SLEW(SLEW),
         .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
         .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE)
    ) cmda_ba2_i (
    .dq(ddr3_ba[2]),
    .clk(clk),
    .clk_div(clk_div),
    .rst(rst),
    .dly_data(dly_data_r[7:0]),
    .din({in_ba_r[5],in_ba_r[2]}),
//    .tin(in_tri_r[1:0]), 
    .tin(in_tri_r), 
    .set_delay(set_r),
    .ld_delay(ld_dly_cmd[2]));

// we
    cmda_single #(
         .IODELAY_GRP(IODELAY_GRP),
         .IOSTANDARD(IOSTANDARD),
         .SLEW(SLEW),
         .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
         .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE)
    ) cmda_we_i (
    .dq(ddr3_we),
    .clk(clk),
    .clk_div(clk_div),
    .rst(rst),
    .dly_data(dly_data_r[7:0]),
    .din(in_we_r[1:0]),
//    .tin(in_tri_r[1:0]), 
    .tin(in_tri_r), 
    .set_delay(set_r),
    .ld_delay(ld_dly_cmd[3]));

// ras
    cmda_single #(
         .IODELAY_GRP(IODELAY_GRP),
         .IOSTANDARD(IOSTANDARD),
         .SLEW(SLEW),
         .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
         .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE)
    ) cmda_ras_i (
    .dq(ddr3_ras),
    .clk(clk),
    .clk_div(clk_div),
    .rst(rst),
    .dly_data(dly_data_r[7:0]),
    .din(in_ras_r[1:0]),
//    .tin(in_tri_r[1:0]), 
    .tin(in_tri_r), 
    .set_delay(set_r),
    .ld_delay(ld_dly_cmd[4]));

// cas
    cmda_single #(
         .IODELAY_GRP(IODELAY_GRP),
         .IOSTANDARD(IOSTANDARD),
         .SLEW(SLEW),
         .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
         .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE)
    ) cmda_cas_i(
    .dq(ddr3_cas),
    .clk(clk),
    .clk_div(clk_div),
    .rst(rst),
    .dly_data(dly_data_r[7:0]),
    .din(in_cas_r[1:0]),
//    .tin(in_tri_r[1:0]), 
    .tin(in_tri_r), 
    .set_delay(set_r),
    .ld_delay(ld_dly_cmd[5]));

// cke
    cmda_single #(
         .IODELAY_GRP(IODELAY_GRP),
         .IOSTANDARD(IOSTANDARD),
         .SLEW(SLEW),
         .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
         .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE)
    ) cmda_cke_i (
    .dq(ddr3_cke),
    .clk(clk),
    .clk_div(clk_div),
    .rst(rst),
    .dly_data(dly_data_r[7:0]),
    .din(in_cke_r[1:0]),
//    .tin(in_tri_r[1:0]), 
    .tin(in_tri_r), 
    .set_delay(set_r),
    .ld_delay(ld_dly_cmd[6]));

// odt
    cmda_single #(
         .IODELAY_GRP(IODELAY_GRP),
         .IOSTANDARD(IOSTANDARD),
         .SLEW(SLEW),
         .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
         .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE)
    ) cmda_odt_i (
    .dq(ddr3_odt),
    .clk(clk),
    .clk_div(clk_div),
    .rst(rst),
    .dly_data(dly_data_r[7:0]),
    .din(in_odt_r[1:0]),
//    .tin(in_tri_r[1:0]), 
    .tin(in_tri_r), 
    .set_delay(set_r),
    .ld_delay(ld_dly_cmd[7]));

endmodule

