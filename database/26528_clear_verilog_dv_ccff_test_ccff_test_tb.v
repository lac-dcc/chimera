// This program was cloned from: https://github.com/efabless/clear
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

`timescale 1 ns / 1 ps

`define USE_POWER_PINS 

//`include "uprj_netlists.v"
//`include "caravel_netlists.v"
//
//`include "spiflash.v"
//`include "tbuart.v"

`define FPGA_BITSTREAM_SIZE 49696

`define POWER_UP_TIME_PERIOD 100
`define SOC_SETUP_TIME_PERIOD 2000
`define SOC_CLOCK_PERIOD 20
`define FPGA_PROG_CLOCK_PERIOD 20
`define FPGA_CLOCK_PERIOD 20

module ccff_test;
  reg clock;
  reg RSTB;
  reg power1, power2;
  reg power3, power4;

  wire gpio;
  wire [37:0] mprj_io;

  // ----- Local wires for control ports of FPGA fabric -----
  wire [0:0] pReset;
  reg [0:0] prog_clock_reg;
  wire [0:0] prog_clk;
  wire [0:0] prog_clock;
  wire [0:0] Test_en;
  wire [0:0] Reset;
  reg [0:0] op_clock_reg;
  wire [0:0] op_clk;
  wire [0:0] op_clock;
  reg [0:0] prog_reset;
  reg [0:0] greset;

  // ---- Configuration-chain head -----
  reg [0:0] ccff_head;
  // ---- Configuration-chain tail -----
  wire [0:0] ccff_tail;

  // ---- Scan-chain head -----
  wire [0:0] sc_head;
  // ---- Scan-chain tail -----
  wire [0:0] sc_tail;

  wire [0:0] IO_ISOL_N;

  // ----- Counters for error checking -----
  integer num_prog_cycles = 0; 
  integer num_errors = 0; 
  integer num_checked_points = 0; 

  // Indicate when SoC setup phase should be finished
  reg soc_setup_done = 0; 
  // Indicate when configuration should be finished
  reg config_done = 0; 

  initial
    begin
      config_done = 1'b0;
      soc_setup_done = 1'b0;
    end

  // ----- Begin raw programming clock signal generation -----
  initial
    begin
      prog_clock_reg[0] = 1'b0;
    end
  always
	begin
		#(`FPGA_PROG_CLOCK_PERIOD)	prog_clock_reg[0] = ~prog_clock_reg[0];
	end

  // ----- End raw programming clock signal generation -----

  // ----- Begin raw operating clock signal generation -----
  initial
    begin
      op_clock_reg[0] = 1'b0;
    end
// ----- End raw operating clock signal generation -----
// ----- Actual operating clock is triggered only when config_done is enabled -----
  assign prog_clock[0] = prog_clock_reg[0] & (~prog_reset[0]);
  assign op_clock[0] = op_clock_reg[0];

  // ----- Begin programming reset signal generation -----
  initial
    begin
      prog_reset[0] = 1'b1;
      #(`SOC_SETUP_TIME_PERIOD + 2 * `FPGA_PROG_CLOCK_PERIOD)  prog_reset[0] = 1'b0;
    end

  // ----- End programming reset signal generation -----
  
  // ----- Begin operating reset signal generation -----
  // ----- Reset signal is disabled always -----
  initial
    begin
      greset[0] = 1'b1;
    end
  // ----- End operating reset signal generation -----
  
  // ----- Begin connecting global ports of FPGA fabric to stimuli -----
  assign op_clk[0] = op_clock[0];
  assign prog_clk[0] = prog_clock[0];
  assign pReset[0] = ~prog_reset[0];
  assign Reset[0] = ~greset[0];
  assign Test_en[0] = prog_clock ;  //1'b1;
  assign sc_head[0] = 1'b0;
  assign IO_ISOL_N[0] = ~greset;
  // ----- End connecting global ports of FPGA fabric to stimuli -----

//  assign mprj_io[0] = Test_en;
//  assign mprj_io[1] = IO_ISOL_N;
//  assign mprj_io[2] = Reset;
  assign mprj_io[30] = pReset;
  assign mprj_io[3] = 1'b1;
  assign mprj_io[12] = ccff_head;
//  assign mprj_io[25] = 1'b0; // Set FPGA to interface logic analyzer by default
//  assign mprj_io[26] = sc_head;
//  assign mprj_io[36] = op_clk;
  assign mprj_io[37] = prog_clk;

//  assign sc_tail = mprj_io[11];
  assign ccff_tail = mprj_io[35];

//  assign mprj_io[10:4] = {7{1'b0}};
//  assign mprj_io[24:13] = {12{1'b0}};
//  assign mprj_io[34:27] = {8{1'b0}};

// Generate a pulse after programming reset is disabled (in the 2nd clock
// cycle). Then the head of configuration chain should be always zero
	always @(negedge prog_clock[0]) begin
        ccff_head = 1'b0;
        if (num_prog_cycles == 1)
            ccff_head = 1'b1;
        else
        if (num_prog_cycles >= 2) ccff_head = 1'b0;
	end

  `ifdef ENABLE_SDF
      initial begin
        // $sdf_annotate("../../../sdf/dac_wrapper.sdf", uut.mprj.DAC.DAC) ;
        // $sdf_annotate("../../../sdf/sar.sdf", uut.mprj.ADC.SAR) ;
        // $sdf_annotate("../../../sdf/sar_adc_8bit.sdf", uut.mprj.ADC) ;
        $sdf_annotate("../../../sdf/cbx_1__0_.sdf", uut.mprj.fpga_core_uut.cbx_1__0_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_1__1_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_1__2_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_1__3_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_1__4_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_1__5_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_1__6_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_1__7_) ;
        $sdf_annotate("../../../sdf/cbx_1__2_.sdf", uut.mprj.fpga_core_uut.cbx_1__8_) ;
        $sdf_annotate("../../../sdf/cbx_1__0_.sdf", uut.mprj.fpga_core_uut.cbx_2__0_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_2__1_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_2__2_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_2__3_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_2__4_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_2__5_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_2__6_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_2__7_) ;
        $sdf_annotate("../../../sdf/cbx_1__2_.sdf", uut.mprj.fpga_core_uut.cbx_2__8_) ;
        $sdf_annotate("../../../sdf/cbx_1__0_.sdf", uut.mprj.fpga_core_uut.cbx_3__0_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_3__1_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_3__2_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_3__3_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_3__4_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_3__5_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_3__6_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_3__7_) ;
        $sdf_annotate("../../../sdf/cbx_1__2_.sdf", uut.mprj.fpga_core_uut.cbx_3__8_) ;
        $sdf_annotate("../../../sdf/cbx_1__0_.sdf", uut.mprj.fpga_core_uut.cbx_4__0_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_4__1_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_4__2_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_4__3_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_4__4_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_4__5_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_4__6_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_4__7_) ;
        $sdf_annotate("../../../sdf/cbx_1__2_.sdf", uut.mprj.fpga_core_uut.cbx_4__8_) ;
        $sdf_annotate("../../../sdf/cbx_1__0_.sdf", uut.mprj.fpga_core_uut.cbx_5__0_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_5__1_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_5__2_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_5__3_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_5__4_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_5__5_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_5__6_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_5__7_) ;
        $sdf_annotate("../../../sdf/cbx_1__2_.sdf", uut.mprj.fpga_core_uut.cbx_5__8_) ;
        $sdf_annotate("../../../sdf/cbx_1__0_.sdf", uut.mprj.fpga_core_uut.cbx_6__0_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_6__1_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_6__2_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_6__3_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_6__4_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_6__5_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_6__6_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_6__7_) ;
        $sdf_annotate("../../../sdf/cbx_1__2_.sdf", uut.mprj.fpga_core_uut.cbx_6__8_) ;
        $sdf_annotate("../../../sdf/cbx_1__0_.sdf", uut.mprj.fpga_core_uut.cbx_7__0_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_7__1_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_7__2_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_7__3_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_7__4_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_7__5_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_7__6_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_7__7_) ;
        $sdf_annotate("../../../sdf/cbx_1__2_.sdf", uut.mprj.fpga_core_uut.cbx_7__8_) ;
        $sdf_annotate("../../../sdf/cbx_1__0_.sdf", uut.mprj.fpga_core_uut.cbx_8__0_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_8__1_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_8__2_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_8__3_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_8__4_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_8__5_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_8__6_) ;
        $sdf_annotate("../../../sdf/cbx_1__1_.sdf", uut.mprj.fpga_core_uut.cbx_8__7_) ;
        $sdf_annotate("../../../sdf/cbx_1__2_.sdf", uut.mprj.fpga_core_uut.cbx_8__8_) ;
        $sdf_annotate("../../../sdf/cby_0__1_.sdf", uut.mprj.fpga_core_uut.cby_0__1_) ;
        $sdf_annotate("../../../sdf/cby_0__1_.sdf", uut.mprj.fpga_core_uut.cby_0__2_) ;
        $sdf_annotate("../../../sdf/cby_0__1_.sdf", uut.mprj.fpga_core_uut.cby_0__3_) ;
        $sdf_annotate("../../../sdf/cby_0__1_.sdf", uut.mprj.fpga_core_uut.cby_0__4_) ;
        $sdf_annotate("../../../sdf/cby_0__1_.sdf", uut.mprj.fpga_core_uut.cby_0__5_) ;
        $sdf_annotate("../../../sdf/cby_0__1_.sdf", uut.mprj.fpga_core_uut.cby_0__6_) ;
        $sdf_annotate("../../../sdf/cby_0__1_.sdf", uut.mprj.fpga_core_uut.cby_0__7_) ;
        $sdf_annotate("../../../sdf/cby_0__1_.sdf", uut.mprj.fpga_core_uut.cby_0__8_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_1__1_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_1__2_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_1__3_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_1__4_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_1__5_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_1__6_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_1__7_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_1__8_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_2__1_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_2__2_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_2__3_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_2__4_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_2__5_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_2__6_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_2__7_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_2__8_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_3__1_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_3__2_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_3__3_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_3__4_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_3__5_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_3__6_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_3__7_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_3__8_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_4__1_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_4__2_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_4__3_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_4__4_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_4__5_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_4__6_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_4__7_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_4__8_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_5__1_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_5__2_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_5__3_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_5__4_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_5__5_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_5__6_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_5__7_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_5__8_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_6__1_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_6__2_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_6__3_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_6__4_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_6__5_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_6__6_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_6__7_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_6__8_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_7__1_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_7__2_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_7__3_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_7__4_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_7__5_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_7__6_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_7__7_) ;
        $sdf_annotate("../../../sdf/cby_1__1_.sdf", uut.mprj.fpga_core_uut.cby_7__8_) ;
        $sdf_annotate("../../../sdf/cby_2__1_.sdf", uut.mprj.fpga_core_uut.cby_8__1_) ;
        $sdf_annotate("../../../sdf/cby_2__1_.sdf", uut.mprj.fpga_core_uut.cby_8__2_) ;
        $sdf_annotate("../../../sdf/cby_2__1_.sdf", uut.mprj.fpga_core_uut.cby_8__3_) ;
        $sdf_annotate("../../../sdf/cby_2__1_.sdf", uut.mprj.fpga_core_uut.cby_8__4_) ;
        $sdf_annotate("../../../sdf/cby_2__1_.sdf", uut.mprj.fpga_core_uut.cby_8__5_) ;
        $sdf_annotate("../../../sdf/cby_2__1_.sdf", uut.mprj.fpga_core_uut.cby_8__6_) ;
        $sdf_annotate("../../../sdf/cby_2__1_.sdf", uut.mprj.fpga_core_uut.cby_8__7_) ;
        $sdf_annotate("../../../sdf/cby_2__1_.sdf", uut.mprj.fpga_core_uut.cby_8__8_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_1__1_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_1__2_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_1__3_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_1__4_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_1__5_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_1__6_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_1__7_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_1__8_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_2__1_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_2__2_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_2__3_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_2__4_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_2__5_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_2__6_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_2__7_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_2__8_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_3__1_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_3__2_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_3__3_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_3__4_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_3__5_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_3__6_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_3__7_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_3__8_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_4__1_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_4__2_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_4__3_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_4__4_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_4__5_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_4__6_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_4__7_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_4__8_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_5__1_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_5__2_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_5__3_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_5__4_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_5__5_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_5__6_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_5__7_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_5__8_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_6__1_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_6__2_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_6__3_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_6__4_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_6__5_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_6__6_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_6__7_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_6__8_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_7__1_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_7__2_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_7__3_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_7__4_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_7__5_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_7__6_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_7__7_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_7__8_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_8__1_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_8__2_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_8__3_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_8__4_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_8__5_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_8__6_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_8__7_) ;
        $sdf_annotate("../../../sdf/grid_clb.sdf", uut.mprj.fpga_core_uut.grid_clb_8__8_) ;
        $sdf_annotate("../../../sdf/sb_0__0_.sdf", uut.mprj.fpga_core_uut.sb_0__0_) ;
        $sdf_annotate("../../../sdf/sb_0__1_.sdf", uut.mprj.fpga_core_uut.sb_0__1_) ;
        $sdf_annotate("../../../sdf/sb_0__1_.sdf", uut.mprj.fpga_core_uut.sb_0__2_) ;
        $sdf_annotate("../../../sdf/sb_0__1_.sdf", uut.mprj.fpga_core_uut.sb_0__3_) ;
        $sdf_annotate("../../../sdf/sb_0__1_.sdf", uut.mprj.fpga_core_uut.sb_0__4_) ;
        $sdf_annotate("../../../sdf/sb_0__1_.sdf", uut.mprj.fpga_core_uut.sb_0__5_) ;
        $sdf_annotate("../../../sdf/sb_0__1_.sdf", uut.mprj.fpga_core_uut.sb_0__6_) ;
        $sdf_annotate("../../../sdf/sb_0__1_.sdf", uut.mprj.fpga_core_uut.sb_0__7_) ;
        $sdf_annotate("../../../sdf/sb_0__2_.sdf", uut.mprj.fpga_core_uut.sb_0__8_) ;
        $sdf_annotate("../../../sdf/sb_1__0_.sdf", uut.mprj.fpga_core_uut.sb_1__0_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_1__1_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_1__2_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_1__3_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_1__4_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_1__5_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_1__6_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_1__7_) ;
        $sdf_annotate("../../../sdf/sb_1__2_.sdf", uut.mprj.fpga_core_uut.sb_1__8_) ;
        $sdf_annotate("../../../sdf/sb_1__0_.sdf", uut.mprj.fpga_core_uut.sb_2__0_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_2__1_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_2__2_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_2__3_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_2__4_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_2__5_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_2__6_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_2__7_) ;
        $sdf_annotate("../../../sdf/sb_1__2_.sdf", uut.mprj.fpga_core_uut.sb_2__8_) ;
        $sdf_annotate("../../../sdf/sb_1__0_.sdf", uut.mprj.fpga_core_uut.sb_3__0_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_3__1_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_3__2_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_3__3_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_3__4_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_3__5_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_3__6_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_3__7_) ;
        $sdf_annotate("../../../sdf/sb_1__2_.sdf", uut.mprj.fpga_core_uut.sb_3__8_) ;
        $sdf_annotate("../../../sdf/sb_1__0_.sdf", uut.mprj.fpga_core_uut.sb_4__0_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_4__1_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_4__2_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_4__3_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_4__4_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_4__5_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_4__6_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_4__7_) ;
        $sdf_annotate("../../../sdf/sb_1__2_.sdf", uut.mprj.fpga_core_uut.sb_4__8_) ;
        $sdf_annotate("../../../sdf/sb_1__0_.sdf", uut.mprj.fpga_core_uut.sb_5__0_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_5__1_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_5__2_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_5__3_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_5__4_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_5__5_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_5__6_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_5__7_) ;
        $sdf_annotate("../../../sdf/sb_1__2_.sdf", uut.mprj.fpga_core_uut.sb_5__8_) ;
        $sdf_annotate("../../../sdf/sb_1__0_.sdf", uut.mprj.fpga_core_uut.sb_6__0_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_6__1_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_6__2_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_6__3_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_6__4_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_6__5_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_6__6_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_6__7_) ;
        $sdf_annotate("../../../sdf/sb_1__2_.sdf", uut.mprj.fpga_core_uut.sb_6__8_) ;
        $sdf_annotate("../../../sdf/sb_1__0_.sdf", uut.mprj.fpga_core_uut.sb_7__0_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_7__1_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_7__2_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_7__3_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_7__4_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_7__5_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_7__6_) ;
        $sdf_annotate("../../../sdf/sb_1__1_.sdf", uut.mprj.fpga_core_uut.sb_7__7_) ;
        $sdf_annotate("../../../sdf/sb_1__2_.sdf", uut.mprj.fpga_core_uut.sb_7__8_) ;
        $sdf_annotate("../../../sdf/sb_2__0_.sdf", uut.mprj.fpga_core_uut.sb_8__0_) ;
        $sdf_annotate("../../../sdf/sb_2__1_.sdf", uut.mprj.fpga_core_uut.sb_8__1_) ;
        $sdf_annotate("../../../sdf/sb_2__1_.sdf", uut.mprj.fpga_core_uut.sb_8__2_) ;
        $sdf_annotate("../../../sdf/sb_2__1_.sdf", uut.mprj.fpga_core_uut.sb_8__3_) ;
        $sdf_annotate("../../../sdf/sb_2__1_.sdf", uut.mprj.fpga_core_uut.sb_8__4_) ;
        $sdf_annotate("../../../sdf/sb_2__1_.sdf", uut.mprj.fpga_core_uut.sb_8__5_) ;
        $sdf_annotate("../../../sdf/sb_2__1_.sdf", uut.mprj.fpga_core_uut.sb_8__6_) ;
        $sdf_annotate("../../../sdf/sb_2__1_.sdf", uut.mprj.fpga_core_uut.sb_8__7_) ;
        $sdf_annotate("../../../sdf/sb_2__2_.sdf", uut.mprj.fpga_core_uut.sb_8__8_) ;
        $sdf_annotate("../../../sdf/tie_array.sdf", uut.mprj.fpga_core_uut.tie_array) ;
        $sdf_annotate("../../../sdf/fpga_core.sdf", uut.mprj.fpga_core_uut) ;
        // $sdf_annotate("../../../sdf/user_project_wrapper.sdf", uut.mprj) ;
        $sdf_annotate("../../../mgmt_core_wrapper/sdf/DFFRAM.sdf", uut.soc.DFFRAM_0) ;
        $sdf_annotate("../../../mgmt_core_wrapper/sdf/mgmt_core.sdf", uut.soc.core) ;
        $sdf_annotate("../../../caravel/sdf/housekeeping.sdf", uut.housekeeping) ;
        $sdf_annotate("../../../caravel/sdf/chip_io.sdf", uut.padframe) ;
        $sdf_annotate("../../../caravel/sdf/mprj_logic_high.sdf", uut.mgmt_buffers.mprj_logic_high_inst) ;
        $sdf_annotate("../../../caravel/sdf/mprj2_logic_high.sdf", uut.mgmt_buffers.mprj2_logic_high_inst) ;
        $sdf_annotate("../../../caravel/sdf/mgmt_protect_hv.sdf", uut.mgmt_buffers.powergood_check) ;
        $sdf_annotate("../../../caravel/sdf/mgmt_protect.sdf", uut.mgmt_buffers) ;
        $sdf_annotate("../../../caravel/sdf/caravel_clocking.sdf", uut.clocking) ;
        $sdf_annotate("../../../caravel/sdf/digital_pll.sdf", uut.pll) ;
        $sdf_annotate("../../../caravel/sdf/xres_buf.sdf", uut.rstb_level) ;
        $sdf_annotate("../../../caravel/sdf/user_id_programming.sdf", uut.user_id_value) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_bidir_1[0] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_bidir_1[1] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_bidir_2[0] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_bidir_2[1] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_bidir_2[2] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[0] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[1] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[2] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[3] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[4] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[5] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[6] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[7] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[8] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[9] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[10] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[0] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[1] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[2] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[3] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[4] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[5] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[0] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[1] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[2] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[3] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[4] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[5] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[6] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[7] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[8] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[9] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[10] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[11] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[12] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[13] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[14] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[15] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.\gpio_defaults_block_0[0] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.\gpio_defaults_block_0[1] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.\gpio_defaults_block_2[0] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.\gpio_defaults_block_2[1] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.\gpio_defaults_block_2[2] ) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_5) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_6) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_7) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_8) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_9) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_10) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_11) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_12) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_13) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_14) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_15) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_16) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_17) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_18) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_19) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_20) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_21) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_22) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_23) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_24) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_25) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_26) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_27) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_28) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_29) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_30) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_31) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_32) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_33) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_34) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_35) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_36) ;
        $sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_37) ;
      end
	`endif

// ----- Begin bitstream loading during configuration phase -----

// ----- Count the number of programming cycles -------
	always @(posedge prog_clock[0]) begin
        num_prog_cycles = num_prog_cycles + 1; 
        // Indicate when configuration is suppose to end
        if (`FPGA_BITSTREAM_SIZE + 1 == num_prog_cycles) begin
            config_done = 1'b1;
        end

        // Check the ccff_tail when configuration is done 
        if (1'b1 == config_done) begin
           // The tail should spit a pulse after configuration is done
           // So it should be at logic '1' and then pulled down to logic '0'
           if (0 == num_checked_points) begin
             if (ccff_tail !== 1'b0) begin
               $display("Error: ccff_tail = %b", ccff_tail);
               num_errors = num_errors + 1;
             end
           end
          if (1 == num_checked_points) begin
             if (ccff_tail !== 1'b1) begin
               $display("Error: ccff_tail = %b", ccff_tail);
               num_errors = num_errors + 1;
             end
           end
           if (2 <= num_checked_points) begin
             if (ccff_tail !== 1'b0) begin
               $display("Error: ccff_tail = %b", ccff_tail);
               num_errors = num_errors + 1;
             end
           end
           num_checked_points = num_checked_points + 1;
        end

        if (5 < num_checked_points) begin
           $display("Simulation finish with %d errors", num_errors);

           // End simulation
           $finish;
        end
	end


  // External clock is used by default.  Make this artificially fast for the
  // simulation.  Normally this would be a slow clock and the digital PLL
  // would be the fast clock.

  always #(`SOC_CLOCK_PERIOD) clock <= (clock === 1'b0);

  initial begin
    clock = 0;
  end

  initial begin
    RSTB <= 1'b0;
    soc_setup_done <= 1'b1;
    #(`SOC_SETUP_TIME_PERIOD);
    RSTB <= 1'b1;      // Release reset
    soc_setup_done <= 1'b1; // We can start scff test
  end

  initial begin
    $dumpfile("ccff_test.vcd");
  	$dumpvars(0, ccff_test);
      repeat (`FPGA_BITSTREAM_SIZE + 10) @(posedge prog_clk);
    $display("%c[1;31m",27);
    $display ("Monitor: Timeout, Test Mega-Project IO (ccff_test) Failed");
    $display("%c[0m",27);
    $finish;
  end

  initial begin    // Power-up sequence
    power1 <= 1'b0;
    power2 <= 1'b0;
    power3 <= 1'b0;
    power4 <= 1'b0;
    #(`POWER_UP_TIME_PERIOD);
    power1 <= 1'b1;
    #(`POWER_UP_TIME_PERIOD);
    power2 <= 1'b1;
    #(`POWER_UP_TIME_PERIOD);
    power3 <= 1'b1;
    #(`POWER_UP_TIME_PERIOD);
    power4 <= 1'b1;
  end

  wire flash_csb;
  wire flash_clk;
  wire flash_io0;
  wire flash_io1;

  wire VDD3V3 = power1;
  wire VDD1V8 = power2;
  wire USER_VDD3V3 = power3;
  wire USER_VDD1V8 = power4;
  wire VSS = 1'b0;

  caravel uut (
    .vddio    (VDD3V3),
    .vssio    (VSS),
    .vdda    (VDD3V3),
    .vssa    (VSS),
    .vccd    (VDD1V8),
    .vssd    (VSS),
    .vdda1    (USER_VDD3V3),
    .vdda2    (USER_VDD3V3),
    .vssa1    (VSS),
    .vssa2    (VSS),
    .vccd1    (USER_VDD1V8),
    .vccd2    (USER_VDD1V8),
    .vssd1    (VSS),
    .vssd2    (VSS),
    .clock    (clock),
    .gpio     (gpio),
    .mprj_io  (mprj_io),
    .flash_csb(flash_csb),
    .flash_clk(flash_clk),
    .flash_io0(flash_io0),
    .flash_io1(flash_io1),
    .resetb    (RSTB)
  );

  spiflash #(
    .FILENAME("ccff_test.hex")
  ) spiflash (
    .csb(flash_csb),
    .clk(flash_clk),
    .io0(flash_io0),
    .io1(flash_io1),
    .io2(),      // not used
    .io3()      // not used
  );

endmodule
`default_nettype wire