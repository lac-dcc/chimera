// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */
`include "inc/rvj1_defines.v"
`include "caravel_defines.v"
`include "hehe/src/params.vh"
`include "../rtl/user_defines.v"
module user_project_wrapper #(
    parameter BITS = 32
) (
`ifdef USE_POWER_PINS 
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif
    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);


wire [31:0] data_dout1;
wire [7:0] okk0;
wire [3:0] iram_wmask0;
    wire [`IRAM_ADDR_WIDTH_WORDS_PER_MACRO-1:0] iram_addr0;
    wire [31:0] iram_din0;
    wire [31:0] iram_dout0_A;
    wire [31:0] iram_dout0_B;
    wire [3:0] dram_wmask0;
    wire [`DRAM_ADDR_WIDTH_WORDS-1:0] dram_addr0;
    wire  [31:0] dram_din0;
    wire [31:0] dram_dout0;
    wire [3:0] icache_write_tag_mask;
    wire [7:0] icache_tag_index;
    wire [31:0] icache_tag_data_in;
    wire [31:0] icache_tag_out;    
    wire [3:0] icache_write_data_mask;
    wire [7:0] icache_data_index;
    wire [31:0] icache_data_in;
    wire [31:0] icache_data_out;
    wire [3:0] dcache_write_tag_mask;
    wire [7:0] dcache_tag_index;
    wire [31:0] dcache_tag_data_in;
    wire [31:0]  dcache_tag_out;
    wire [3:0] dcache_write_data_mask_1;
    wire [7:0] dcache_data_index_1;
    wire [31:0] dcache_data_in_1;
    wire [31:0] dcache_data_out_1;
    wire [3:0] dcache_write_data_mask_2;
    wire [7:0] dcache_data_index_2;
    wire [31:0] dcache_data_out_2_1;
    wire [31:0] dcache_data_in_2_1;
    wire iram_csb0_A;
    wire iram_web0;

    wire iram_csb0_B;

    wire dram_clk0;
    wire dram_csb0;
    wire dram_web0;

    wire icache_tag_chip_en;
    wire icache_tag_write_en;

    wire icache_data_chip_en;
    wire icache_data_write_en;

    wire dcache_tag_chip_en;
    wire dcache_tag_write_en;

    wire dcache_data_chip_en_1;
    wire dcache_data_write_en_1;
    wire dcache_data_chip_en_2;
    wire dcache_data_write_en_2;
//  sky130_fd_sc_hd__conb_1 okk0 (
//     .HI(okk0)
//   );
  sky130_fd_sc_hd__conb_1 okk1 (
    .LO(okk1)
  );
wire clk;
assign clk = wb_clk_i;
top top1 (
    `ifdef USE_POWER_PINS
            .vccd1(vccd1),  // User area 1 1.8V power
            .vssd1(vssd1),  // User area 1 digital ground
    `endif
    .clk(wb_clk_i),
    .wb_rst_i(wb_rst_i),
    .wbs_stb_i(wbs_stb_i),
    .wbs_cyc_i(wbs_cyc_i),
    .wbs_we_i(wbs_we_i),
    .wbs_sel_i(wbs_sel_i),
    .wbs_dat_i(wbs_dat_i),
    .wbs_adr_i(wbs_adr_i),
    .wbs_ack_o(wbs_ack_o),
    .wbs_dat_o(wbs_dat_o),
    // Logic Analyzer Signals
    .la_data_in(la_data_in),
    .la_data_out(la_data_out),
    .la_oenb(la_oenb),
    // IOs
    .io_in(io_in),
    .io_out(io_out),
    .io_oeb(io_oeb),
    .user_irq(user_irq),
    //iram
    .iram_clk0(iram_clk0),
    .iram_web0(iram_web0),
    .iram_wmask0(iram_wmask0),
    .iram_addr0(iram_addr0),
    .iram_din0(iram_din0),
        //iram_inst_A
    .iram_csb0_A(iram_csb0_A),
    .iram_dout0_A(iram_dout0_A),
        //iram_inst_B
    .iram_csb0_B(iram_csb0_B),
    .iram_dout0_B(iram_dout0_B),
    //dram
    .dram_clk0      (dram_clk0),
    .dram_csb0      (dram_csb0),
    .dram_web0      (dram_web0),
    .dram_wmask0    (dram_wmask0),
    .dram_addr0     (dram_addr0),
    .dram_din0      (dram_din0),
    .dram_dout0     (dram_dout0),
    //icache
        //icache_tag
    .icache_tag_chip_en(icache_tag_chip_en),    
    .icache_tag_write_en(icache_tag_write_en),
    .icache_write_tag_mask(icache_write_tag_mask),
    .icache_tag_index(icache_tag_index),
    .icache_tag_data_in(icache_tag_data_in),
    .icache_tag_out(icache_tag_out),    
        //icache_data
    .icache_data_chip_en(icache_data_chip_en),    
    .icache_data_write_en(icache_data_write_en),
    .icache_write_data_mask(icache_write_data_mask),
    .icache_data_index(icache_data_index),
    .icache_data_in(icache_data_in),
    .icache_data_out(icache_data_out),
    //dcache
        //dcache_tag
    .dcache_tag_chip_en(dcache_tag_chip_en),
    .dcache_tag_write_en(dcache_tag_write_en),
    .dcache_write_tag_mask(dcache_write_tag_mask),
    .dcache_tag_index(dcache_tag_index),
    .dcache_tag_data_in(dcache_tag_data_in),
    .dcache_tag_out(dcache_tag_out),
        //dcache_data_1
    .dcache_data_chip_en_1(dcache_data_chip_en_1),
    .dcache_data_write_en_1(dcache_data_write_en_1),
    .dcache_write_data_mask_1(dcache_write_data_mask_1),
    .dcache_data_index_1(dcache_data_index_1),
    .dcache_data_in_1(dcache_data_in_1),
    .dcache_data_out_1(dcache_data_out_1),
        //dcache_data_2
    .dcache_data_chip_en_2 (dcache_data_chip_en_2),
    .dcache_data_write_en_2 (dcache_data_write_en_2),
    .dcache_write_data_mask_2 (dcache_write_data_mask_2),
    .dcache_data_index_2 (dcache_data_index_2),
    .dcache_data_in_2 (dcache_data_in_2_1),
    .dcache_data_out_2 (dcache_data_out_2_1));

sky130_sram_1kbyte_1rw1r_32x256_8 iram_inst_A (
    `ifdef USE_POWER_PINS
            .vccd1(vccd1),  // User area 1 1.8V power
            .vssd1(vssd1),  // User area 1 digital ground
    `endif		
                        .clk0   (iram_clk0),
                        .csb0   (iram_csb0_A),
                        .web0   (iram_web0),
                        .wmask0 (iram_wmask0),
                        .addr0  (iram_addr0),
                        .din0   (iram_din0),
                        .dout0  (iram_dout0_A),
                        .clk1 (clk),
                        .csb1 (okk1),
                        .addr1 (okk0),
                        .dout1 (data_dout1));                                             
    
sky130_sram_1kbyte_1rw1r_32x256_8 iram_inst_B (
    `ifdef USE_POWER_PINS
            .vccd1(vccd1),  // User area 1 1.8V power
            .vssd1(vssd1),  // User area 1 digital ground
    `endif
    					.clk0   (iram_clk0),
                        .csb0   (iram_csb0_B),
                        .web0   (iram_web0),
                        .wmask0 (iram_wmask0),
                        .addr0  (iram_addr0),
                        .din0   (iram_din0),
                        .dout0  (iram_dout0_B),
                        .clk1 (clk),
                        .csb1 (okk1),
                        .addr1 (okk0),
                        .dout1 (data_dout1));  
 


sky130_sram_1kbyte_1rw1r_32x256_8  dram_inst (
    `ifdef USE_POWER_PINS
            .vccd1(vccd1),  // User area 1 1.8V power
            .vssd1(vssd1),  // User area 1 digital ground
    `endif
    						.clk0   (dram_clk0),
                            .csb0   (dram_csb0),
                            .web0   (dram_web0),
                            .wmask0 (dram_wmask0),
                            .addr0  (dram_addr0),
                            .din0   (dram_din0),
                            .dout0  (dram_dout0),
                            .clk1 (clk),
                            .csb1 (okk1),
                            .addr1 (okk0),
                            .dout1 (data_dout1));  




sky130_sram_1kbyte_1rw1r_32x256_8  icache_tag_ram (
    `ifdef USE_POWER_PINS
            .vccd1(vccd1),  // User area 1 1.8V power
            .vssd1(vssd1),  // User area 1 digital ground
    `endif
    						.clk0   (clk),
                            .csb0   (icache_tag_chip_en),
                            .web0   (icache_tag_write_en),
                            .wmask0 (icache_write_tag_mask),
                            .addr0  (icache_tag_index),
                            .din0   (icache_tag_data_in),
                            .dout0  (icache_tag_out),
                            .clk1 (clk),
                            .csb1 (okk1),
                            .addr1 (okk0),
                            .dout1 (data_dout1));  


sky130_sram_1kbyte_1rw1r_32x256_8  icache_data_ram (
    `ifdef USE_POWER_PINS
            .vccd1(vccd1),  // User area 1 1.8V power
            .vssd1(vssd1),  // User area 1 digital ground
    `endif
    						.clk0   (clk),
                            .csb0   (icache_data_chip_en),
                            .web0   (icache_data_write_en),
                            .wmask0 (icache_write_data_mask),
                            .addr0  (icache_data_index),
                            .din0   (icache_data_in),
                            .dout0  (icache_data_out),
                            .clk1 (clk),
                            .csb1 (okk1),
                            .addr1 (okk0),
                            .dout1 (data_dout1));  

sky130_sram_1kbyte_1rw1r_32x256_8  dcache_tag_ram (
    `ifdef USE_POWER_PINS
            .vccd1(vccd1),  // User area 1 1.8V power
            .vssd1(vssd1),  // User area 1 digital ground
    `endif
    						.clk0   (clk),
                            .csb0   (dcache_tag_chip_en),
                            .web0   (dcache_tag_write_en),
                            .wmask0 (dcache_write_tag_mask),
                            .addr0  (dcache_tag_index),
                            .din0   (dcache_tag_data_in),
                            .dout0  (dcache_tag_out),
                            .clk1 (clk),
                            .csb1 (okk1),
                            .addr1 (okk0),
                            .dout1 (data_dout1));  

sky130_sram_1kbyte_1rw1r_32x256_8  dcache_data_ram_1 (
    `ifdef USE_POWER_PINS
            .vccd1(vccd1),  // User area 1 1.8V power
            .vssd1(vssd1),  // User area 1 digital ground
    `endif
    						.clk0   (clk),
                            .csb0   (dcache_data_chip_en_1),
                            .web0   (dcache_data_write_en_1),
                            .wmask0 (dcache_write_data_mask_1),
                            .addr0  (dcache_data_index_1),
                            .din0   (dcache_data_in_1),
                            .dout0  (dcache_data_out_1),
                            .clk1 (clk),
                            .csb1 (okk1),
                            .addr1 (okk0),
                            .dout1 (data_dout1));   


sky130_sram_1kbyte_1rw1r_32x256_8  dcache_data_ram_2 (
    `ifdef USE_POWER_PINS
            .vccd1(vccd1),  // User area 1 1.8V power
            .vssd1(vssd1),  // User area 1 digital ground
    `endif
    						.clk0   (clk),
                            .csb0   (dcache_data_chip_en_2),
                            .web0   (dcache_data_write_en_2),
                            .wmask0 (dcache_write_data_mask_2),
                            .addr0  (dcache_data_index_2),
                            .din0   (dcache_data_in_2_1),
                            .dout0  (dcache_data_out_2_1),
                            .clk1 (clk),
                            .csb1 (okk1),
                            .addr1 (okk0),
                            .dout1 (data_dout1));  


endmodule	// user_project_wrapper

`default_nettype wire
