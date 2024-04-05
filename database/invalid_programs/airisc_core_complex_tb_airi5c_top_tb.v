//
// Copyright 2022 FRAUNHOFER INSTITUTE OF MICROELECTRONIC CIRCUITS AND SYSTEMS (IMS), DUISBURG, GERMANY.
// --- All rights reserved --- 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License");
// you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
// You may obtain a copy of the License at
// https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.
//
//
// File              : airi5c_top_tb.v
// Author            : A. Stanitzki, I. Hoyer
// Creation Date     : 09.10.20
// Last Modified     : 08.10.22
// Version           : 1.0
// Abstract          : TOP testbench
// Note              :
`timescale 1ns/1ns
`include "../src/airi5c_ctrl_constants.vh"
`include "../src/airi5c_csr_addr_map.vh"
`include "../src/airi5c_hasti_constants.vh"
`include "../src/airi5c_alu_ops.vh"
`include "../src/rv32_opcodes.vh"
`include "../src/airi5c_arch_options.vh"
`include "../src/airi5c_hasti_constants.vh"
//`include "../src/modules/airi5c_dtm/src/airi5c_dmi_constants.vh"

//`timescale 1ns/1ns

//`define AI_Tests
`undef AI_Tests

module airi5c_top_tb();

// Interface declarations for DUT interface
// ========================================

// global signals driven by testbench
reg VDD;
reg CLK, CLKQSPI, RESET;
`ifdef CONFIG_DOLPHIN_SRAM
reg FCLK, MEM_RESET; 
`endif
reg EXT_INT;

wire  [3:0]     debug_state;
wire  [7:0]     debug_out;

// Scan Interface to DUT
reg SDI, SEN;
wire  SDO;

// peripherals typically integrated in DUT, which
// may or may not be present in the configuration.

// Signal declarations for testbench internal use
// ==============================================

// select between normal simulation (with jtag signals
// set by the testbench) or VPI mode (with jtag signals
// set by externally connected OpenOCD-Process via VPI
// interface module).

`ifndef VPIMODE
reg tck, tms, tdi;
wire  tdo;
`else
wire  tck, tms, tdi, tdo;
`endif

// include virtual JTAG controller if VPI mode is enabled.
// this can be used to run a virtual prototype and connect
// to it via openocd/gdb.
`ifdef VPIMODE
// Clock half period (Clock period = 100 ns => 10 MHz)
reg init_done;
jtag_vpi #(.DEBUG_INFO(0), .TP(1), .TCK_HALF_PERIOD(3000), .CMD_DELAY(3000))
jtag
  (
    .tms(tms),
    .tck(tck),
    .tdi(tdi),
    .tdo(tdo),
    .enable(1'b1),
    .init_done(init_done)
  );
`endif

// ======================== DUT instance ======================================
// =              uncomment appropriate configuration                         =
// ============================================================================

// configurations are now placed in the /configs subfolder.
// A configuration consists of the base core, memories, peripherals and all
// glue logic for bus access etc.
// The constant interface between the configuration and the testbench is
// defined by the signal declarations at the top of this file.



// Config: AIRI5C with internal ideal SRAM (mainly for core verification)
// ----------------------------------------------------------------------
`ifdef CONFIG_IDEAL_SRAM_1
//`define ASIC 1 //already defined in Makefile
// number of testcases expect to fail, so the overall TB still passes
integer expectederror=0;
airi5c_cfg_ideal_sram DUT(
`elsif CONFIG_DOLPHIN_SRAM
//`define ASIC 1 //already defined in Makefile
// number of testcases expect to fail, so the overall TB still passes
`define FUNCTIONAL
integer expectederror=1;
airi5c_cfg_dolphin_sram DUT(
`elsif CONFIG_XH018_QSPI_1
  integer expectederror = 5;
  airi5c_cfg_xh018_4x8SRAM DUT(
`elsif CONFIG_XH018_QSPI_SICHEL
// number of testcases expect to fail, so the overall TB still passes
integer expectederror=1;
airi5c_cfg_xh018_NVSRAM DUT(
`elsif CONFIG_IDEAL_SRAM_N65
// number of testcases expect to fail, so the overall TB still passes
integer expectederror=2;
airi5c_cfg_ideal_sram_N65 DUT(
`elsif CONFIG_IDEAL_SRAM_XH018
// number of testcases expect to fail, so the overall TB still passes
integer expectederror=2;
airi5c_cfg_ideal_sram_XH018 DUT(
`else 
`define CONFIG_FPGA
`undef ASIC
// number of testcases expect to fail, so the overall TB still passes
integer expectederror=0;
FPGA_Top DUT(
`endif

  .CLK(CLK),
  .nRESET(~RESET),
  .EXT_INT(EXT_INT),

`ifdef ASIC
  .VDD(VDD),
  .debug_state(debug_state),
  .debug_out(debug_out),

  .testmode(1'b0),
  .sdi(SDI),
  .sdo(SDO),
  .sen(SEN),
`endif

  .tdi(tdi),
  .tdo(tdo),
  .tck(tck),
  .tms(tms),

  .uart0_tx(UART_TX),
  .uart0_rx(UART_RX)
);

`ifndef ASIC
assign debug_out = DUT.debug_out;
`endif

// ==============================================================================================================
// ===============       Main Testbench     =====================================================================
// ==============================================================================================================

`ifdef ASIC
`define CLK_PERIOD 1000        // ASIC sysclk is 50 MHz
`define CORE_CLK_PERIOD 1000   // .. no divider
`define JTAG_CLK_PERIOD 10000  // JTAG TCK is     8 MHz
`else 
`define CLK_PERIOD 10        // FPGA clock is 100 MHz, FCLK double
`define CORE_CLK_PERIOD 31   // ..  32 Mhz are generated internally.
`define JTAG_CLK_PERIOD 256  // JTAG TCK is     4 MHz
`endif

always begin
  #(`CLK_PERIOD/2)
  CLK = ~CLK;
end
//`ifdef CONFIG_DOLPHIN_SRAM
//always begin
//  #(`CLK_PERIOD/4)
//  FCLK = ~FCLK;
//end
//`endif

// current testcase and number of failed
// tests. useful for waveform inspection.
integer testcase;
integer i;

// testbench counters
reg [31:0] result;                // tb writes exit code to magic address, which is read into "result".
reg [31:0] memimg[0:256000000-1]; // this avoids a warning 
//reg [31:0] memimg[256000000-1:0]; // tb reads memfile into memimg array before writing it to imem using jtag
reg [31:0] errorcount;            // tb collects exit codes from test steps and reports total fail count
reg [31:0] errortotal;            // tb sum of testcase errors
integer testtotal=0;              // tb sum of executed testcases

`ifndef VPIMODE

// either we are in virtual prototype mode or
// we run the following testbenches.

`include "jtag_tasks.vh"    // definition of jtag commands
`include "test_tasks.vh"    // includes tasks to load and execute memfiles


initial begin
  $write("==================================\n");
  $write("==== AIRISC TESTBENCH STARTET ====\n");
  $write("==================================\n");
  
  `ifdef CONFIG_IDEAL_SRAM_1 
  $write("DUT: CONFIG_IDEAL_SRAM_1 \n");
  `elsif CONFIG_DOLPHIN_SRAM
  $write("DUT: CONFIG_DOLPHIN_SRAM \n");
  FCLK <= 0;
  `elsif CONFIG_XH018_QSPI_1 
  $write("DUT: CONFIG_XH018_QSPI_1 \n");
  `elsif CONFIG_XH018_QSPI_SICHEL
    $write("DUT: CONFIG_XH018_QSPI_SICHEL \n");
  `elsif CONFIG_IDEAL_SRAM_N65
    $write("DUT: CONFIG_IDEAL_SRAM_N65 \n");
  `elsif CONFIG_IDEAL_SRAM_XH018
    $write("DUT: CONFIG_IDEAL_SRAM_XH018 \n");
  `elsif CONFIG_FPGA
    $write("DUT: FPGA");
  `else
  $write("DUT: CONFIG_ unknown \n"); $finish();
  `endif
  
  testcase = 98;
  `include "tests/init_tests.vh"
//  testcase = 99;
//  `include "tests/debug_tests.vh"

  $write("===================== \n");
  $write("= Instruction Tests = \n");
  $write("===================== \n");


//  `include "tests/torture_tests.vh"
    `include "tests/base_isa_tests.vh"
//  `include "tests/privileged_tests.vh"

  `ifdef ISA_EXT_M
    `include "tests/m_ext_tests.vh"
  `elsif ISA_EXT_P 
    `include "tests/m_ext_tests.vh"
  `endif

  `ifdef ISA_EXT_P
    `ifdef AI_Tests
      `include "tests/mul_simd_tests.vh"
    `endif
  `endif

  `ifdef ISA_EXT_E
    `include "tests/e_ext_tests.vh"
  `endif

  `ifdef ISA_EXT_C
    `include "tests/c_ext_tests.vh"
  `endif
  
  `ifdef ISA_EXT_F
    `include "tests/f_ext_tests.vh"
  `endif

`ifdef ISA_EXT_AIACC
`ifdef AI_Tests
  $write("===================== \n");
  $write("= AI Accelerator    = \n");
  $write("===================== \n");

  `include "tests/ai_acc_tests.vh"
`endif
`endif

/*
  $write("===================== \n");
  $write("= Platform Tests    = \n");
  $write("===================== \n");

  `include "tests/platform_tests.vh"
*/

`ifdef CONFIG_XH018_QSPI_SICHEL
  `include "tests/qspi_sichel_tests.vh"
`endif

/*
  $write("===================== \n");
  $write("= Benchmark Tests   = \n");
  $write("===================== \n");

  `include "tests/benchmark_tests.vh"
*/

  $write("cumulative errors / number of tests: ", errortotal, " / ", testtotal);
  $write("\n");
  $write("expected errors: ", expectederror);
  $write("\n\n");
  if(errortotal == expectederror)
     $write("TB PASSED");
    else
     $write("TB FAILED");
  $write("\n\n");

  $finish();
end

`else

// we are in VPI mode. Only do initialization
// and keep running the simulation.


initial begin
  $write("==== VPI MODE ===\n");
  $write("\n");
  $write("Core configuration: RV32I");
  `ifdef ISA_EXT_E $write("E"); `endif
  `ifdef ISA_EXT_M $write("M"); `endif
  `ifdef ISA_EXT_F $write("F"); `endif
  `ifdef ISA_EXT_C $write("C"); `endif
  `ifdef ISA_EXT_XCRYPTO $write("Xcrypto"); `endif
  $write("\n");
  init_done = 1'b0;
  $write("VDD: 0, RESET: 1, CLK: 0, CLKQSPI: 0, EXT_INT: 0, tms: 0, tdi: 0, tck: 0, SDI = 0, SEN = 0\n");
  VDD <= 1'b1; RESET <= 1'b1; 
  CLK <= 1'b0; CLKQSPI <= 1'b0; 
  EXT_INT <= 1'b0;
  SEN <= 0; SDI <= 0;
  #(2*`CLK_PERIOD);
  $write("VDD: 1, RESET: 0, EXT_INT: 0, tms: 0, tdi: 0, tck: 0, SDI = 0, SEN = 0\n");
  VDD <= 1'b1; RESET <= 1'b0; 
  EXT_INT <= 1'b0;
  SEN <= 0; SDI <= 0;
  #(2*`CLK_PERIOD);
  $write("VDD: 1, RESET: 1, EXT_INT: 0, tms: 0, tdi: 0, tck: 0, SDI = 0, SEN = 0\n");
  VDD <= 1'b1; RESET <= 1'b0;
  EXT_INT <= 1'b0;
  SEN <= 0; SDI <= 0;
  #(8*`CLK_PERIOD);
  $write("waiting some cycles for RAM startup...\n); 
  #(56*`CLK_PERIOD); 
  //$write("waiting 2ms for NVRAM startup..\n");
  //#2000000;
  //#(5*`CLK_PERIOD); 
  $write("VDD: 1, RESET: 0, CLK: taktet, CLKQSPI: taktet, EXT_INT: 0, tms: 0, tdi: 0, tck: 0\n");
  @(negedge CLK) RESET <= 1'b0;
  #(5*`CLK_PERIOD);
  init_done <= 1'b1;
end
`endif
endmodule
