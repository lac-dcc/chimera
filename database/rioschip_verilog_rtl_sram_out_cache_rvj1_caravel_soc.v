// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

////////////////////////////////////////////////////////////////////////////////                                          
// SPDX-FileCopyrightText: 2022, Jure Vreca                                   //                                          
//                                                                            //                                          
// Licenseunder the Apache License, Version 2.0(the "License");               //                                          
// you maynot use this file except in compliance with the License.            //                                           
// You may obtain a copy of the License at                                    //                                          
//                                                                            //                                          
//      http://www.apache.org/licenses/LICENSE-2.0                            //                                          
//                                                                            //                                          
// Unless required by applicable law or agreed to in writing, software        //                                          
// distributed under the License is distributed on an "AS IS" BASIS,          //                                          
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.   //                                          
// See the License for the specific language governing permissions and        //                                          
// limitations under the License.                                             //                                          
// SPDX-License-Identifier: Apache-2.0                                        //                                          
// SPDX-FileContributor: Jure Vreca <jurevreca12@gmail.com>                   //                                          
////////////////////////////////////////////////////////////////////////////////      

`include "inc/rvj1_defines.v"

`default_nettype none
module rvj1_caravel_soc #(
    parameter JEDRO_1_BOOT_ADDR = `JEDRO_1_BOOT_ADDR,
    parameter IRAM_BASE_ADDR = `IRAM_BASE_ADDR,
    parameter IRAM_ADDR_WIDTH_WORDS = `IRAM_ADDR_WIDTH_WORDS,
    parameter IRAM_ADDR_WIDTH_WORDS_PER_MACRO = `IRAM_ADDR_WIDTH_WORDS_PER_MACRO,
    parameter DRAM_BASE_ADDR = `DRAM_BASE_ADDR,
    parameter DRAM_ADDR_WIDTH_WORDS = `DRAM_ADDR_WIDTH_WORDS,
	parameter RVJ1_GPIO_BASE_ADDR = `RVJ1_GPIO_BASE_ADDR,
	parameter RVJ1_TIMER_BASE_ADDR = `RVJ1_TIMER_BASE_ADDR
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif
    //crarvel------------------------------------------------------------
	// Logic analyzer signals
	input  [127:0] la_data_in,
	output [127:0] la_data_out,
	input  [127:0] la_oenb,

    //input hehe_rstn,
    //input sel_wb,

	input  [24-1:0] gpio_in,
	output [24-1:0] gpio_out,
	output [38-1:0] gpio_oeb,

	output [2:0] user_irq,

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
    //crarvel------------------------------------------------------------


    //i sram
    output iram_clk0, 
    output iram_csb0_A,
	output iram_csb0_B, 
    output iram_web0,
    output [3:0] iram_wmask0,
    output [IRAM_ADDR_WIDTH_WORDS_PER_MACRO-1:0] iram_addr0,
    output [31:0] iram_din0, 
    input  [31:0] iram_dout0_A,
	input  [31:0] iram_dout0_B,

    
    //d sram
    output dram_clk0, 
    output dram_csb0, 
    output dram_web0,
    output [3:0] dram_wmask0,
    output [DRAM_ADDR_WIDTH_WORDS-1:0] dram_addr0,
    output  [31:0] dram_din0, 
    input [31:0] dram_dout0,


    //arb //bug here
    input   cpu2dmux_we,
    input         cpu2dmux_stb,
    output         cpu2dmux_ack,
    input [31:0]  cpu2dmux_addr,
    input [31:0]  cpu2dmux_wdata,
    output [31:0]  cpu2dmux_rdata,
    input [3:0]   cpu2dmux_sel,
    input [9:0] cpu2dmux_bl,
    input cpu2dmux_bry,
    input cpu2dmux_cyc,

    //I$
    output [31:0]  cpu2imux_rdata,
    input [31:0]  cpu2imux_addr,
    output cpu2imux_ack,
    input [9:0] cpu2imux_bl,
    input cpu2imux_bry,
    input cpu2imux_we,
    input cpu2imux_cyc,
    input cpu2imux_stb
);
    wire    cpu2dmux_err;

    ///////////////////////////////////////////
    // LOCAL PARAMS
    ///////////////////////////////////////////
    localparam IRAM_ADDR_WIDTH_BYTES = IRAM_ADDR_WIDTH_WORDS + 2;
    localparam DRAM_ADDR_WIDTH_BYTES = DRAM_ADDR_WIDTH_WORDS + 2;
    
	///////////////////////////////////////////
    // SIGNAL DEFINITIONS
    ///////////////////////////////////////////
	// wire         hehe_rstn;
	wire		 sel_wb;



	wire [31:0]  iram_dout0;
	wire		 iram_csb0; 
	wire [IRAM_ADDR_WIDTH_WORDS-1:0] iram_addr0_internal;


    wire         wbs0_stb;
    wire         wbs0_cyc;
    wire         wbs0_we;
    wire [3:0]   wbs0_sel;
    wire [31:0]  wbs0_dat_toram;
    wire [31:0]  wbs0_adr;
    wire         wbs0_ack;
    wire [31:0]  wbs0_dat_fromram;

    wire         wbs1_stb;
    wire         wbs1_cyc;
    wire         wbs1_we;
    wire [3:0]   wbs1_sel;
    wire [31:0]  wbs1_dat_toram;
    wire [31:0]  wbs1_adr;
    wire         wbs1_ack;
    wire [31:0]  wbs1_dat_fromram;

    wire         wbs2_stb;
    wire         wbs2_cyc;
    wire         wbs2_we;
    wire [3:0]   wbs2_sel;
    wire [31:0]  wbs2_dat_towb;
    wire [31:0]  wbs2_adr;
    wire         wbs2_ack;
    wire [31:0]  wbs2_dat_fromwb;
	
	wire	     wb_rvj1_tomux_clk;
	wire		 wb_rvj1_tomux_rst;
	wire         wb_rvj1_tomux_stb;
	wire         wb_rvj1_tomux_cyc;
	wire         wb_rvj1_tomux_we;
	wire [3:0]   wb_rvj1_tomux_sel;
	wire [31:0]  wb_rvj1_tomux_dat_fromcpu;
	wire [31:0]  wb_rvj1_tomux_adr;
	wire         wb_rvj1_tomux_ack;
	wire [31:0]  wb_rvj1_tomux_dat_tocpu;
	
	wire         wb_rvj1_gpio_stb;
	wire         wb_rvj1_gpio_cyc;
	wire         wb_rvj1_gpio_we;
	wire [3:0]   wb_rvj1_gpio_sel;
	wire [31:0]  wb_rvj1_gpio_dat_fromcpu;
	wire [31:0]  wb_rvj1_gpio_adr;
	wire         wb_rvj1_gpio_ack;
	wire [31:0]  wb_rvj1_gpio_dat_tocpu;
	
	wire         wb_rvj1_timer_stb;
	wire         wb_rvj1_timer_cyc;
	wire         wb_rvj1_timer_we;
	wire [3:0]   wb_rvj1_timer_sel;
	wire [31:0]  wb_rvj1_timer_dat_fromcpu;
	wire [31:0]  wb_rvj1_timer_adr;
	wire         wb_rvj1_timer_ack;
	wire [31:0]  wb_rvj1_timer_dat_tocpu;

	wire [31:0] time_debug;


	assign sel_wb = la_data_in[0];
	assign la_data_out = {5'b0, gpio_out, cpu2imux_rdata, cpu2imux_addr, time_debug, 2'b0};
	assign user_irq = 3'b000;

    wishbone_mux #(.BASE_ADDR_0(IRAM_BASE_ADDR),
                   .ADDR_WIDTH_0(IRAM_ADDR_WIDTH_BYTES),
                   .BASE_ADDR_1(DRAM_BASE_ADDR),
                   .ADDR_WIDTH_1(DRAM_ADDR_WIDTH_BYTES)) wishbone_mux_inst (
						`ifdef USE_POWER_PINS
							.vccd1(vccd1),	// User area 1 1.8V power
							.vssd1(vssd1),	// User area 1 digital ground
						`endif

                            .wbs_stb_i (wbs_stb_i),
                            .wbs_cyc_i (wbs_cyc_i),
                            .wbs_we_i  (wbs_we_i),
                            .wbs_sel_i (wbs_sel_i),
                            .wbs_dat_i (wbs_dat_i),
                            .wbs_adr_i (wbs_adr_i),
                            .wbs_ack_o (wbs_ack_o),
                            .wbs_dat_o (wbs_dat_o),

                            .wbs0_stb_o (wbs0_stb),
                            .wbs0_cyc_o (wbs0_cyc),
                            .wbs0_we_o  (wbs0_we),
                            .wbs0_sel_o (wbs0_sel),
                            .wbs0_dat_o (wbs0_dat_toram),
                            .wbs0_adr_o (wbs0_adr),
                            .wbs0_ack_i (wbs0_ack),
                            .wbs0_dat_i (wbs0_dat_fromram),

                            .wbs1_stb_o (wbs1_stb),
                            .wbs1_cyc_o (wbs1_cyc),
                            .wbs1_we_o  (wbs1_we),
                            .wbs1_sel_o (wbs1_sel),
                            .wbs1_dat_o (wbs1_dat_toram),
                            .wbs1_adr_o (wbs1_adr),
                            .wbs1_ack_i (wbs1_ack),
                            .wbs1_dat_i (wbs1_dat_fromram),

                            .wbs2_stb_o (),
                            .wbs2_cyc_o (),
                            .wbs2_we_o  (),
                            .wbs2_sel_o (),
                            .wbs2_dat_o (),
                            .wbs2_adr_o (),
                            .wbs2_ack_i (1'b0),
                            .wbs2_dat_i (0));
                            
                            
    instr_ram_mux #(.RAM_ADDR_WIDTH_BYTES(IRAM_ADDR_WIDTH_BYTES),
                    .BASE_ADDR(IRAM_BASE_ADDR)) iram_mux_inst (
							`ifdef USE_POWER_PINS
								.vccd1(vccd1),	// User area 1 1.8V power
								.vssd1(vssd1),	// User area 1 digital ground
							`endif

                    			.sel_wb      (sel_wb),
                                                
                                .rdata       (cpu2imux_rdata),
                                .addr        (cpu2imux_addr),
                                .we (cpu2imux_we),
                                .cyc (cpu2imux_cyc),
                                .stb (cpu2imux_stb),
                                .ack (cpu2imux_ack),

                                .wb_clk_i    (wb_clk_i),
                                .wb_rst_i    (wb_rst_i),
                                .wbs_stb_i   (wbs0_stb),
                                .wbs_cyc_i   (wbs0_cyc),
                                .wbs_we_i    (wbs0_we),
                                .wbs_sel_i   (wbs0_sel),
                                .wbs_dat_i   (wbs0_dat_toram),
                                .wbs_adr_i   (wbs0_adr),
                                .wbs_ack_o   (wbs0_ack),
                                .wbs_dat_o   (wbs0_dat_fromram),

                                .ram_clk0    (iram_clk0),
                                .ram_csb0    (iram_csb0),
                                .ram_web0    (iram_web0),
                                .ram_wmask0  (iram_wmask0),
                                .ram_addr0   (iram_addr0_internal),
                                .ram_din0    (iram_din0),
                                .ram_dout0   (iram_dout0));

	assign iram_csb0_A = !(!iram_csb0 & (!iram_addr0_internal[IRAM_ADDR_WIDTH_WORDS-1]));
	assign iram_csb0_B = !(!iram_csb0 & iram_addr0_internal[IRAM_ADDR_WIDTH_WORDS-1]);
	assign iram_dout0  = iram_addr0_internal[IRAM_ADDR_WIDTH_WORDS-1] ? iram_dout0_B : iram_dout0_A;
	assign iram_addr0  = iram_addr0_internal[IRAM_ADDR_WIDTH_WORDS_PER_MACRO-1:0];

	data_ram_mux #(.RAM_ADDR_WIDTH_WORDS(DRAM_ADDR_WIDTH_WORDS),
                   .BASE_ADDR_RAM(DRAM_BASE_ADDR)) dram_mux_inst(
							`ifdef USE_POWER_PINS
								.vccd1(vccd1),	// User area 1 1.8V power
								.vssd1(vssd1),	// User area 1 digital ground
							`endif

                   				.sel_wb(sel_wb),
                                                            
                                .rdata       (cpu2dmux_rdata),
                                .ack         (cpu2dmux_ack),
                                .err         (cpu2dmux_err),
                                .we          (cpu2dmux_we),
                                .stb         (cpu2dmux_stb),
                                .addr        (cpu2dmux_addr),
                                .wdata       (cpu2dmux_wdata),
                                .sel         (cpu2dmux_sel),

                                .wb_clk_i    (wb_clk_i),
                                .wb_rst_i    (wb_rst_i),
                                .wbs_stb_i   (wbs1_stb),
                                .wbs_cyc_i   (wbs1_cyc),
                                .wbs_we_i    (wbs1_we),
                                .wbs_sel_i   (wbs1_sel),
                                .wbs_dat_i   (wbs1_dat_toram),
                                .wbs_adr_i   (wbs1_adr),
                                .wbs_ack_o   (wbs1_ack),
                                .wbs_dat_o   (wbs1_dat_fromram),

                                .ram_clk0    (dram_clk0),
                                .ram_csb0    (dram_csb0),
                                .ram_web0    (dram_web0),
                                .ram_wmask0  (dram_wmask0),
                                .ram_addr0   (dram_addr0),
                                .ram_din0    (dram_din0),
                                .ram_dout0   (dram_dout0),

								.wbm_clk_o   (wb_rvj1_tomux_clk),
								.wbm_rst_o   (wb_rvj1_tomux_rst),
								.wbm_stb_o   (wb_rvj1_tomux_stb),
								.wbm_cyc_o   (wb_rvj1_tomux_cyc),
								.wbm_we_o    (wb_rvj1_tomux_we),
								.wbm_sel_o   (wb_rvj1_tomux_sel),
								.wbm_dat_o   (wb_rvj1_tomux_dat_fromcpu),
								.wbm_adr_o   (wb_rvj1_tomux_adr),
								.wbm_ack_i   (wb_rvj1_tomux_ack),
								.wbm_dat_i   (wb_rvj1_tomux_dat_tocpu));
    
	wishbone_mux #(.BASE_ADDR_0(RVJ1_GPIO_BASE_ADDR),
                   .ADDR_WIDTH_0(2),
                   .BASE_ADDR_1(RVJ1_TIMER_BASE_ADDR),
                   .ADDR_WIDTH_1(2)) wb_mux_rvj1_internal (
						`ifdef USE_POWER_PINS
							.vccd1(vccd1),	// User area 1 1.8V power
							.vssd1(vssd1),	// User area 1 digital ground
						`endif

                            .wbs_stb_i (wb_rvj1_tomux_stb),
                            .wbs_cyc_i (wb_rvj1_tomux_cyc),
                            .wbs_we_i  (wb_rvj1_tomux_we),
                            .wbs_sel_i (wb_rvj1_tomux_sel),
                            .wbs_dat_i (wb_rvj1_tomux_dat_fromcpu),
                            .wbs_adr_i (wb_rvj1_tomux_adr),
                            .wbs_ack_o (wb_rvj1_tomux_ack),
                            .wbs_dat_o (wb_rvj1_tomux_dat_tocpu),

                            .wbs0_stb_o (wb_rvj1_gpio_stb),
                            .wbs0_cyc_o (wb_rvj1_gpio_cyc),
                            .wbs0_we_o  (wb_rvj1_gpio_we),
                            .wbs0_sel_o (wb_rvj1_gpio_sel),
                            .wbs0_dat_o (wb_rvj1_gpio_dat_fromcpu),
                            .wbs0_adr_o (wb_rvj1_gpio_adr),
                            .wbs0_ack_i (wb_rvj1_gpio_ack),
                            .wbs0_dat_i (wb_rvj1_gpio_dat_tocpu),

                            .wbs1_stb_o (wb_rvj1_timer_stb),
                            .wbs1_cyc_o (wb_rvj1_timer_cyc),
                            .wbs1_we_o  (wb_rvj1_timer_we),
                            .wbs1_sel_o (wb_rvj1_timer_sel),
                            .wbs1_dat_o (wb_rvj1_timer_dat_fromcpu),
                            .wbs1_adr_o (wb_rvj1_timer_adr),
                            .wbs1_ack_i (wb_rvj1_timer_ack),
                            .wbs1_dat_i (wb_rvj1_timer_dat_tocpu),

                            .wbs2_stb_o (),
                            .wbs2_cyc_o (),
                            .wbs2_we_o  (),
                            .wbs2_sel_o (),
                            .wbs2_dat_o (),
                            .wbs2_adr_o (),
                            .wbs2_ack_i (1'b0),
                            .wbs2_dat_i (0));


	gpio gpio_inst (	
					`ifdef USE_POWER_PINS
						.vccd1(vccd1),	// User area 1 1.8V power
						.vssd1(vssd1),	// User area 1 digital ground
					`endif
						.clk_i (wb_clk_i),
						.rst_i (wb_rst_i),

						.wbs_cyc_i (wb_rvj1_gpio_cyc),
						.wbs_stb_i (wb_rvj1_gpio_stb),
						.wbs_we_i  (wb_rvj1_gpio_we),
						.wbs_adr_i (wb_rvj1_gpio_adr),
						.wbs_dat_i (wb_rvj1_gpio_dat_fromcpu),
					    .wbs_sel_i (wb_rvj1_gpio_sel),
					    .wbs_ack_o (wb_rvj1_gpio_ack),
						.wbs_dat_o (wb_rvj1_gpio_dat_tocpu),

						.gpio_in   (gpio_in),
						.gpio_out  (gpio_out),
						.gpio_oeb  (gpio_oeb));


	timer timer_inst (
					`ifdef USE_POWER_PINS
						.vccd1(vccd1),	// User area 1 1.8V power
						.vssd1(vssd1),	// User area 1 digital ground
					`endif
						.clk_i (wb_clk_i),
						.rst_i (wb_rst_i),

						.wbs_cyc_i (wb_rvj1_timer_cyc),
						.wbs_stb_i (wb_rvj1_timer_stb),
						.wbs_we_i  (wb_rvj1_timer_we),
						.wbs_adr_i (wb_rvj1_timer_adr),
						.wbs_dat_i (wb_rvj1_timer_dat_fromcpu),
					    .wbs_sel_i (wb_rvj1_timer_sel),
					    .wbs_ack_o (wb_rvj1_timer_ack),
						.wbs_dat_o (wb_rvj1_timer_dat_tocpu),
						
						.time_debug_o (time_debug));
	

endmodule

`default_nettype wire
