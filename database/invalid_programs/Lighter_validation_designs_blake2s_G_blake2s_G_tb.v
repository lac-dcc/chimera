//======================================================================
//
// tb_blake2s_G.v
// --------------
// Testbench for the BLAKE2s G function.
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
module tb_blake2s_G();

  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  parameter DEBUG = 0;
  parameter VERBOSE = 0;

  parameter CLK_HALF_PERIOD = 2;
  parameter CLK_PERIOD = 2 * CLK_HALF_PERIOD;


  //----------------------------------------------------------------
  // Register and Wire declarations.
  //----------------------------------------------------------------
  reg [63 : 0]  cycle_ctr;
  reg [31 : 0]  error_ctr;
  reg [31 : 0]  tc_ctr;

  reg           tb_clk;
  reg  [31 : 0] tb_a;
  reg  [31 : 0] tb_b;
  reg  [31 : 0] tb_c;
  reg  [31 : 0] tb_d;
  reg  [31 : 0] tb_m0;
  reg  [31 : 0] tb_m1;
  wire [31 : 0] tb_a_prim;
  wire [31 : 0] tb_b_prim;
  wire [31 : 0] tb_c_prim;
  wire [31 : 0] tb_d_prim;

  reg           display_cycle_ctr;


  //----------------------------------------------------------------
  // blake2_G device under test.
  //----------------------------------------------------------------
  blake2s_G dut(
               .a(tb_a),
               .b(tb_b),
               .c(tb_c),
               .d(tb_d),
               .m0(tb_m0),
               .m1(tb_m1),
               .a_prim(tb_a_prim),
               .b_prim(tb_b_prim),
               .c_prim(tb_c_prim),
               .d_prim(tb_d_prim)
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
          $display("");
          $display("DUT internal state");
          $display("------------------");
          $display("a1: 0x%08x, a2: 0x%08x", dut.a1, dut.a2);
          $display("b1: 0x%08x, b2: 0x%08x, b3: 0x%08x, b4: 0x%08x", dut.b1, dut.b2, dut.b3, dut.b4);
          $display("c1: 0x%08x, c2: 0x%08x", dut.c1, dut.c2);
          $display("d1: 0x%08x, d2: 0x%08x, d3: 0x%08x, d4: 0x%08x", dut.d1, dut.d2, dut.d3, dut.d4);
          $display("");
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
      $display("*** %02d test cases executed ****", tc_ctr);
      if (error_ctr == 0)
        begin
          $display("*** All %02d test cases completed successfully ****", tc_ctr);
        end
      else
        begin
          $display("*** %02d test cases  FAILED . ***", error_ctr);
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
      cycle_ctr = 0;
      error_ctr = 0;
      tc_ctr    = 0;
      tb_clk    = 0;
      tb_a      = 32'h0;
      tb_b      = 32'h0;
      tb_c      = 32'h0;
      tb_d      = 32'h0;
      tb_m0     = 32'h0;
      tb_m1     = 32'h0;
    end
  endtask // init_dut


  //----------------------------------------------------------------
  // task1
  //
  // First task with vectors captured from the blake2s reference
  // while running.
  //----------------------------------------------------------------
  task test1;
    begin : tc1
      integer tc1_error;
      reg [31 : 0] expected_a;
      reg [31 : 0] expected_b;
      reg [31 : 0] expected_c;
      reg [31 : 0] expected_d;
      tc1_error = 0;
      tc_ctr = tc_ctr + 1;

      tb_a  = 32'h6b08c647;
      tb_b  = 32'h510e527f;
      tb_c  = 32'h6a09e667;
      tb_d  = 32'h510e523f;
      tb_m0 = 32'h03020100;
      tb_m1 = 32'h07060504;

      expected_a = 32'h263d8fa2;
      expected_b = 32'h0e16dfd0;
      expected_c = 32'h6b7198df;
      expected_d = 32'hb56dc461;

      $display("*** Running test case 1 ****");
      dump_dut_state();
      #(CLK_PERIOD);
      dump_dut_state();

      if (tb_a_prim != expected_a)
        begin
          $display("Error in a. Expected 0x%08x. Got 0x%08x", expected_a, tb_a_prim);
          tc1_error = 1;
        end

      if (tb_b_prim != expected_b)
        begin
          $display("Error in b. Expected 0x%08x. Got 0x%08x", expected_b, tb_b_prim);
          tc1_error = 1;
        end

      if (tb_c_prim != expected_c)
        begin
          $display("Error in c. Expected 0x%08x. Got 0x%08x", expected_c, tb_c_prim);
          tc1_error = 1;
        end

      if (tb_d_prim != expected_d)
        begin
          $display("Error in d. Expected 0x%08x. Got 0x%08x", expected_d, tb_d_prim);
          tc1_error = 1;
        end

      if (tc1_error)
        error_ctr = error_ctr + 1;

      $display("");
    end
  endtask // test1


  //----------------------------------------------------------------
  // testrunner
  //
  // The main test functionality.
  //----------------------------------------------------------------
  initial
    begin : testrunner
      $display("*** Testbench for BLAKE2 G function test started ***");
      $display("----------------------------------------------------");
      $display("");

      init_dut();
      test1();
      display_test_result();
      $display("*** BLAKE2 G functions simulation done  ****");
      $finish_and_return(error_ctr);
    end // testrunner

endmodule // tb_blake2s_G

//======================================================================
// EOF tb_blake2s_G.v
//======================================================================
