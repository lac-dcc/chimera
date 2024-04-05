//======================================================================
//
// tb_blake2s_m_select.v
// ---------------------
// Testbench for the BLAKE2s M selection module.
//
//
// Author: Joachim Strömbergson
// Copyright (c) 2018, Assured AB
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

`include "includes/primitives.v"
`include "includes/sky130_hd.v"


module tb_blake2s_m_select();

  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  parameter VERBOSE = 1;

  parameter CLK_HALF_PERIOD = 2;
  parameter CLK_PERIOD = 2 * CLK_HALF_PERIOD;


  //----------------------------------------------------------------
  // Register and Wire declarations.
  //----------------------------------------------------------------
  reg [63 : 0]   cycle_ctr;
  reg [31 : 0]   error_ctr;
  reg [31 : 0]   tc_ctr;

  reg            tb_clk;
  reg            tb_reset_n;
  reg            tb_load;
  reg  [511 : 0] tb_m;
  reg  [3 : 0]   tb_round;
  reg            tb_mode;
  wire [31 : 0]  tb_G0_m0;
  wire [31 : 0]  tb_G0_m1;
  wire [31 : 0]  tb_G1_m0;
  wire [31 : 0]  tb_G1_m1;
  wire [31 : 0]  tb_G2_m0;
  wire [31 : 0]  tb_G2_m1;
  wire [31 : 0]  tb_G3_m0;
  wire [31 : 0]  tb_G3_m1;

  reg            display_cycle_ctr;


  //----------------------------------------------------------------
  // blake2_G device under test.
  //----------------------------------------------------------------
  blake2s_m_select dut(
                       .clk(tb_clk),
                       .reset_n(tb_reset_n),
                       .load(tb_load),
                       .m(tb_m),
                       .round(tb_round),
                       .mode(tb_mode),
                       .G0_m0(tb_G0_m0),
                       .G0_m1(tb_G0_m1),
                       .G1_m0(tb_G1_m0),
                       .G1_m1(tb_G1_m1),
                       .G2_m0(tb_G2_m0),
                       .G2_m1(tb_G2_m1),
                       .G3_m0(tb_G3_m0),
                       .G3_m1(tb_G3_m1)
                      );


  //----------------------------------------------------------------
  // clk_gen
  //
  // Clock generator process.
  //----------------------------------------------------------------
  always
    begin : clk_gen
      #CLK_HALF_PERIOD tb_clk = !tb_clk;
    end // clk_gen


  //--------------------------------------------------------------------
  // dut_monitor
  //
  // Monitor displaying information every cycle.
  // Includes the cycle counter.
  //--------------------------------------------------------------------
  always @ (posedge tb_clk)
    begin : dut_monitor
      cycle_ctr = cycle_ctr + 1;

      if (display_cycle_ctr)
        begin
          $display("cycle = %016x:", cycle_ctr);
        end

    end // dut_monitor


  //----------------------------------------------------------------
  // dump_dut_state
  //
  // Dump the internal state of the dut to std out.
  //----------------------------------------------------------------
  task dump_dut_state;
    begin
      if (VERBOSE)
        begin
        //  $display("");
        //  $display("DUT internal state");
        //  $display("------------------");
        //  $display("contents of m:");
        //  $display("0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x ",
        //           dut.\m_mem[0] , dut.\m_mem[1] , dut.\m_mem[2] , dut.\m_mem[3] ,
        //           dut.\m_mem[4] , dut.\m_mem[5] , dut.\m_mem[6] , dut.\m_mem[7] );

        //  $display("0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x ",
        //           dut.\m_mem[8] ,  dut.\m_mem[9] ,  dut.\m_mem[10] , dut.\m_mem[11] ,
        //           dut.\m_mem[12] , dut.\m_mem[13] , dut.\m_mem[14] , dut.\m_mem[15] );
        //  $display("");
        end
    end
  endtask // dump_dut_state


  //----------------------------------------------------------------
  // display_test_result()
  //
  // Display the accumulated test results.
  //----------------------------------------------------------------
  task display_test_result;
    begin
      $display("--- %02d test cases executed ---", tc_ctr);
      if (error_ctr == 0)
        begin
          $display("--- All %02d test cases completed successfully ---", tc_ctr);
        end
      else
        begin
          $display("--- %02d test cases FAILED . ---", error_ctr);
        end
    end
  endtask // display_test_result


  //----------------------------------------------------------------
  // init_dut()
  //
  // Set the input to the DUT to defined values.
  //----------------------------------------------------------------
  task init_dut;
    begin
      cycle_ctr  = 0;
      error_ctr  = 0;
      display_cycle_ctr = 0;

      tc_ctr     = 0;
      tb_clk     = 0;
      tb_reset_n = 1;
      tb_load    = 0;
      tb_m       = 512'h0;
      tb_round   = 0;
      tb_mode    = 0;
    end
  endtask // init_dut


  //----------------------------------------------------------------
  // test_reset
  //
  // Check that the m_memory registers cleared by dropping reset.
  //----------------------------------------------------------------
  task test_reset;
    begin : tc_reset
      tc_ctr = tc_ctr + 1;

      $display("--- Testing that reset clears the m memory");
      $display("--- Memory before reset:");
      dump_dut_state();
      tb_reset_n = 0;
      #(CLK_PERIOD);
      $display("--- Pulling reset");
      tb_reset_n = 1;
      #(CLK_PERIOD);
      $display("--- Memory after reset:");
      dump_dut_state();
      $display("");
    end
  endtask // test_reset


  //----------------------------------------------------------------
  // test_case1
  //
  // Check that we can load a known block into m and get the
  // big to little endian conversion performed during load.
  //----------------------------------------------------------------
  task test_case1;
    begin : tc1
      tc_ctr  = tc_ctr + 1;

      tb_round = 0;
      tb_mode  = 0;
      tb_load  = 0;
      tb_m     = {32'h00010203, 32'h04050607, 32'h08090a0b, 32'h0c0d0e0f,
                  32'h10111213, 32'h14151617, 32'h18191a1b, 32'h1c1d1e1f,
                  32'h20212223, 32'h24252627, 32'h28292a2b, 32'h2c2d2e2f,
                  32'h30313233, 32'h34353637, 32'h38393a3b, 32'h3c3d3e3f};

      $display("--- TC1: Test case 1 started. Loading the m with a known block");
      $display("--- TC1: Before loading:");
      dump_dut_state();

      tb_load = 1;
      #(CLK_PERIOD);
      tb_load = 0;
      $display("--- TC1: After loading:");
      dump_dut_state();

      $display("");
    end
  endtask // test_case1


  //----------------------------------------------------------------
  // test_case2
  //
  // Check that we can get expected words based on rounds and mode.
  //----------------------------------------------------------------
  task test_case2;
    begin : tc2
      integer i;

      tc_ctr  = tc_ctr + 1;

      tb_round = 0;
      tb_mode  = 0;

      tb_load = 0;
      tb_m    = {32'h00010203, 32'h04050607, 32'h08090a0b, 32'h0c0d0e0f,
                 32'h10111213, 32'h14151617, 32'h18191a1b, 32'h1c1d1e1f,
                 32'h20212223, 32'h24252627, 32'h28292a2b, 32'h2c2d2e2f,
                 32'h30313233, 32'h34353637, 32'h38393a3b, 32'h3c3d3e3f};

      $display("--- TC2: Test case 2 started. Loading the m with a known block");
      tb_load = 1;
      #(CLK_PERIOD);
      tb_load = 0;

      $display("--- TC2: Looping over all rounds and modes.");
      for (i = 0 ; i < 16 ; i = i + 1) begin
        tb_round = i[3 : 0];
        tb_mode  = 0;
        #(CLK_PERIOD);
        $display("--- TC2: round %2d, mode: %1x:", tb_round, tb_mode);
        $display("--- G0_m0: 0x%08x, G0_m1: 0x%08x, G1_m0: 0x%08x, G1_m1: 0x%08x",
                 tb_G0_m0, tb_G0_m1, tb_G1_m0, tb_G1_m1);
        $display("--- G2_m0: 0x%08x, G2_m1: 0x%08x, G3_m0: 0x%08x, G3_m1: 0x%08x",
                 tb_G2_m0, tb_G2_m1, tb_G3_m0, tb_G3_m1);
        #(CLK_PERIOD);

        tb_mode  = 1;
        #(CLK_PERIOD);
        $display("--- TC2: round %2d, mode: %1x:", tb_round, tb_mode);
        $display("--- G0_m0: 0x%08x, G0_m1: 0x%08x, G1_m0: 0x%08x, G1_m1: 0x%08x",
                 tb_G0_m0, tb_G0_m1, tb_G1_m0, tb_G1_m1);
        $display("--- G2_m0: 0x%08x, G2_m1: 0x%08x, G3_m0: 0x%08x, G3_m1: 0x%08x",
                 tb_G2_m0, tb_G2_m1, tb_G3_m0, tb_G3_m1);
        #(CLK_PERIOD);
      end

      $display("--- TC2: Test case 2 completed");
      tb_load = 1;
      $display("");
    end
  endtask // test_case1


  //----------------------------------------------------------------
  // testrunner
  //
  // The main test functionality.
  //----------------------------------------------------------------
  initial
    begin : testrunner
      $display("--- Testbench for BLAKE2 m select module started ---");
      $display("----------------------------------------------------");
      $display("");

      init_dut();
      test_reset();
      test_case1();
      test_case2();

      display_test_result();
      $display("--- Testbench for BLAKE2 m select module completed ---");
      $display("------------------------------------------------------");
      $finish_and_return(error_ctr);
    end // testrunner

endmodule // tb_blake2s_m_select

//======================================================================
// EOF tb_blake2s_m_select.v
//======================================================================
