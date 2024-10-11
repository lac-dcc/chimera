// This program was cloned from: https://github.com/secworks/trng
// License: BSD 2-Clause "Simplified" License

//======================================================================
//
// tb_trng.v
// -----------
// Testbench for the trng module in the trng.
//
//
// Author: Joachim Strombergson
// Copyright (c) 2014, Secworks Sweden AB
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or
// without modification, are permitted provided that the following
// conditions are met:
//
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in
//    the documentation and/or other materials provided with the
//    distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
// COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//======================================================================

//------------------------------------------------------------------
// Simulator directives.
//------------------------------------------------------------------
`timescale 1ns/100ps


//------------------------------------------------------------------
// Test module.
//------------------------------------------------------------------
module tb_trng();

  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  parameter DEBUG     = 1;

  parameter CLK_HALF_PERIOD = 1;
  parameter CLK_PERIOD      = 2 * CLK_HALF_PERIOD;

  // The DUT address map.
  parameter TRNG_PREFIX                 = 4'h0;
  parameter ENTROPY1_PREFIX             = 4'h5;
  parameter ENTROPY2_PREFIX             = 4'h6;
  parameter MIXER_PREFIX                = 4'ha;
  parameter CSPRNG_PREFIX               = 4'hb;

  parameter ADDR_TRNG_CTRL              = 8'h10;
  parameter TRNG_CTRL_ENABLE_BIT        = 0;
  parameter TRNG_CTRL_ENT0_ENABLE_BIT   = 1;
  parameter TRNG_CTRL_ENT1_ENABLE_BIT   = 2;
  parameter TRNG_CTRL_ENT2_ENABLE_BIT   = 3;
  parameter TRNG_CTRL_SEED_BIT          = 8;

  parameter ADDR_TRNG_STATUS            = 8'h11;

  parameter ADDR_TRNG_RND_DATA          = 8'h20;
  parameter ADDR_TRNG_RND_DATA_VALID    = 8'h21;
  parameter TRNG_RND_VALID_BIT          = 0;

  parameter ADDR_CSPRNG_CTRL            = 8'h10;
  parameter CSPRNG_CTRL_ENABLE_BIT      = 0;
  parameter CSPRNG_CTRL_SEED_BIT        = 1;

  parameter ADDR_CSPRNG_STATUS          = 8'h11;
  parameter CSPRNG_STATUS_RND_VALID_BIT = 0;

  parameter ADDR_CSPRNG_NUM_ROUNDS      = 8'h40;
  parameter ADDR_CSPRNG_NUM_BLOCKS_LOW  = 8'h41;
  parameter ADDR_CSPRNG_NUM_BLOCKS_HIGH = 8'h42;

  parameter ADDR_ENTROPY0_RAW           = 8'h40;
  parameter ADDR_ENTROPY0_STATS         = 8'h41;

  parameter ADDR_ENTROPY1_RAW           = 8'h50;
  parameter ADDR_ENTROPY1_STATS         = 8'h51;

  parameter ADDR_ENTROPY2_RAW           = 8'h60;
  parameter ADDR_ENTROPY2_STATS         = 8'h61;

  parameter ADDR_MIXER_CTRL             = 8'h10;
  parameter MIXER_CTRL_ENABLE_BIT       = 0;
  parameter MIXER_CTRL_RESTART_BIT      = 1;

  //----------------------------------------------------------------
  // Register and Wire declarations.
  //----------------------------------------------------------------
  reg [31 : 0]  cycle_ctr;
  reg [31 : 0]  error_ctr;
  reg [31 : 0]  tc_ctr;

  reg [31 : 0]  read_data;

  reg           tb_clk;
  reg           tb_reset_n;
  reg           tb_avalanche_noise;
  reg           tb_cs;
  reg           tb_we;
  reg [11  : 0] tb_address;
  reg [31 : 0]  tb_write_data;
  wire [31 : 0] tb_read_data;
  wire [7 : 0]  tb_debug;
  reg           tb_debug_update;
  wire          tb_error;
  wire          tb_security_error;


  //----------------------------------------------------------------
  // Device Under Test.
  //----------------------------------------------------------------
  trng dut(
           .clk(tb_clk),
           .reset_n(tb_reset_n),
           .avalanche_noise(tb_avalanche_noise),
           .cs(tb_cs),
           .we(tb_we),
           .address(tb_address),
           .write_data(tb_write_data),
           .read_data(tb_read_data),
           .error(tb_error),
           .debug(tb_debug),
           .debug_update(tb_debug_update),
           .security_error(tb_security_error)
          );


  //----------------------------------------------------------------
  // Concurrent assignments.
  //----------------------------------------------------------------


  //----------------------------------------------------------------
  // clk_gen
  //
  // Always running clock generator process.
  //----------------------------------------------------------------
  always
    begin : clk_gen
      #CLK_HALF_PERIOD;
      tb_clk = !tb_clk;
    end // clk_gen


  //----------------------------------------------------------------
  // sys_monitor()
  //
  // An always running process that creates a cycle counter and
  // conditionally displays information about the DUT.
  //----------------------------------------------------------------
  always
    begin : sys_monitor
      cycle_ctr = cycle_ctr + 1;

      #(CLK_PERIOD);

      if (DEBUG)
        begin
          dump_dut_state();
        end
    end


  //----------------------------------------------------------------
  // dump_dut_state()
  //
  // Dump the state of the dump when needed.
  //----------------------------------------------------------------
  task dump_dut_state;
    begin
      $display("cycle: 0x%016x", cycle_ctr);
      $display("State of DUT");
      $display("------------");
      $display("");
    end
  endtask // dump_dut_state


  //----------------------------------------------------------------
  // write_word()
  //
  // Write the given word to the DUT using the DUT interface.
  //----------------------------------------------------------------
  task write_word(input [11 : 0]  address,
                  input [31 : 0] word);
    begin
      if (DEBUG)
        begin
          $display("*** Writing 0x%08x to 0x%02x.", word, address);
          $display("");
        end

      tb_address = address;
      tb_write_data = word;
      tb_cs = 1;
      tb_we = 1;
      #(2 * CLK_PERIOD);
      tb_cs = 0;
      tb_we = 0;
    end
  endtask // write_word


  //----------------------------------------------------------------
  // read_word()
  //
  // Read a data word from the given address in the DUT.
  // the word read will be available in the global variable
  // read_data.
  //----------------------------------------------------------------
  task read_word(input [11 : 0]  address);
    begin
      tb_address = address;
      tb_cs = 1;
      tb_we = 0;
      #(CLK_PERIOD);
      read_data = tb_read_data;
      tb_cs = 0;

      if (DEBUG)
        begin
          $display("*** Reading 0x%08x from 0x%02x.", read_data, address);
          $display("");
        end
    end
  endtask // read_word


  //----------------------------------------------------------------
  // reset_dut()
  //
  // Toggle reset to put the DUT into a well known state.
  //----------------------------------------------------------------
  task reset_dut;
    begin
      $display("*** Toggle reset.");
      tb_reset_n = 0;

      #(2 * CLK_PERIOD);
      tb_reset_n = 1;
      $display("");
    end
  endtask // reset_dut


  //----------------------------------------------------------------
  // display_test_results()
  //
  // Display the accumulated test results.
  //----------------------------------------------------------------
  task display_test_results;
    begin
      if (error_ctr == 0)
        begin
          $display("*** All %02d test cases completed successfully", tc_ctr);
        end
      else
        begin
          $display("*** %02d tests completed - %02d test cases did not complete successfully.",
                   tc_ctr, error_ctr);
        end
    end
  endtask // display_test_results


  //----------------------------------------------------------------
  // init_sim()
  //
  // Initialize all counters and testbed functionality as well
  // as setting the DUT inputs to defined values.
  //----------------------------------------------------------------
  task init_sim;
    begin
      cycle_ctr          = 0;
      error_ctr          = 0;
      tc_ctr             = 0;

      tb_clk             = 0;
      tb_reset_n         = 1;

      tb_avalanche_noise = 0;
      tb_cs              = 0;
      tb_we              = 0;
      tb_address         = 12'h000;
      tb_write_data      = 32'h00000000;
      tb_debug_update    = 0;
    end
  endtask // init_sim


  //----------------------------------------------------------------
  // tc1_gen_rnd()
  //
  // A simple first testcase that tries to make the DUT generate
  // a number of random values.
  //----------------------------------------------------------------
  task tc1_gen_rnd;
    reg [31 : 0] i;

    begin
      $display("*** Starting TC1: Generating random values from entropy.");

      tb_debug_update = 1;

      #(10 * CLK_PERIOD);

      tb_debug_update = 0;

      // Enable the csprng and the mixer
      write_word({CSPRNG_PREFIX, ADDR_CSPRNG_CTRL}, 32'h00000001);
      write_word({MIXER_PREFIX, ADDR_MIXER_CTRL}, 32'h00000001);


      // We try to change number of blocks to a low value to force reseeding.
      write_word({CSPRNG_PREFIX, ADDR_CSPRNG_NUM_BLOCKS_LOW}, 32'h00000002);
      write_word({CSPRNG_PREFIX, ADDR_CSPRNG_NUM_BLOCKS_HIGH}, 32'h00000000);

      #(100 * CLK_PERIOD);

      i = 0;
      while (i < 10000)
        begin
          $display("Reading rnd word %08x.", i);
          i = i + 1;
          read_word({CSPRNG_PREFIX, ADDR_TRNG_RND_DATA});
          #(2 * CLK_PERIOD);
        end

      $display("*** TC1 done.");
    end
  endtask // tc1_gen_seeds


  //----------------------------------------------------------------
  // trng_test
  //
  // The main test functionality.
  //----------------------------------------------------------------
  initial
    begin : trng_test

      $display("   -= Testbench for TRNG started =-");
      $display("    ===============================");
      $display("");

      init_sim();
      dump_dut_state();
      reset_dut();
      dump_dut_state();

      tc1_gen_rnd();

      display_test_results();

      $display("");
      $display("*** TRNG simulation done. ***");
      $finish;
    end // trng_test
endmodule // tb_trng

//======================================================================
// EOF tb_trng.v
//======================================================================
