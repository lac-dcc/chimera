// This program was cloned from: https://github.com/AUCOHL/Lighter
// License: Apache License 2.0

//======================================================================
//
// tb_blake2s_core.v
// ------------------
// Testbench for the BLAKE2s core function.
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

module tb_blake2s_core();

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
  reg [63 : 0]   cycle_ctr;
  reg [31 : 0]   error_ctr;
  reg [31 : 0]   tc_ctr;
  reg            display_cycle_ctr;
  reg            display_dut_state;

  reg            tb_clk;
  reg            tb_reset_n;

  reg            tb_init;
  reg            tb_update;
  reg            tb_finish;
  reg [511 : 0]  tb_block;
  reg [6 : 0]    tb_blocklen;
  wire [255 : 0] tb_digest;
  wire           tb_ready;

initial begin


//    $display("*******in here*******");
//    $monitor("ready=0x%0h, _0593_=0x%0h, _2316_=0x%0h",dut.ready, dut._0593_, dut._2316_);
////  _2352_  clk  _0560_
//// en 



end
  //----------------------------------------------------------------
  // Device under test.
  //----------------------------------------------------------------
  blake2s_core dut(
                   .clk(tb_clk),
                   .reset_n(tb_reset_n),

                   .init(tb_init),
                   .update(tb_update),
                   .finish(tb_finish),

                   .block(tb_block),
                   .blocklen(tb_blocklen),

                   .digest(tb_digest),
                   .ready(tb_ready)
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

      if (display_dut_state)
        dump_dut_state();
    end // dut_monitor


  //----------------------------------------------------------------
  // dump_dut_state
  //
  // Dump the internal state of the dut to std out.
  //----------------------------------------------------------------
  task dump_dut_state;
    begin
      $display("-------------------------------------------------------------------------------------");
      $display("-------------------------------------------------------------------------------------");
      $display("DUT internal state at cycle: %08d", cycle_ctr);
      $display("-------------------------------------");
      $display("init:     0x%01x, update: 0x%01x, finish: 0x%01x", dut.init, dut.update, dut.finish);
      $display("block M:  0x%064x", dut.block[511 : 256]);
      $display("block L:  0x%064x", dut.block[255 : 000]);
      $display("blocklen: 0x%02x", dut.blocklen);
      $display("digest:   0x%064x", dut.digest);
      $display("ready:    0x%01x", dut.ready);
    //  $display("");
    //  $display("blake2s_ctrl_reg: 0x%02x, blake2s_ctrl_new: 0x%02x, blake2s_ctrl_we: 0x%01x",
    //           dut.blake2s_ctrl_reg, dut.blake2s_ctrl_new, dut.blake2s_ctrl_we);
    //  $display("");

    //  $display("h0: 0x%08x, h1: 0x%08x, h2: 0x%08x, h3: 0x%08x",
    //           dut.h_reg[0], dut.h_reg[1], dut.h_reg[2], dut.h_reg[3]);
    //  $display("h4: 0x%08x, h5: 0x%08x, h6: 0x%08x, h7: 0x%08x",
    ////           dut.h_reg[4], dut.h_reg[5], dut.h_reg[6], dut.h_reg[7]);
    ////  $display("");
    //  $display("v0:  0x%08x, v1:  0x%08x, v2:  0x%08x, v3:  0x%08x",
    //           dut.\v_reg[0] , dut.\v_reg[1] , dut.\v_reg[2] , dut.\v_reg[3] );
    //  $display("v4:  0x%08x, v5:  0x%08x, v6:  0x%08x, v7:  0x%08x",
    //           dut.\v_reg[4] , dut.\v_reg[5] , dut.\v_reg[6] , dut.\v_reg[7] );
    //  $display("v8:  0x%08x, v9:  0x%08x, v10: 0x%08x, v11: 0x%08x",
    //           dut.\v_reg[8] , dut.\v_reg[9] , dut.\v_reg[10] , dut.\v_reg[11] );
    //  $display("v12: 0x%08x, v13: 0x%08x, v14: 0x%08x, v15: 0x%08x",
    //           dut.\v_reg[12] , dut.\v_reg[13] , dut.\v_reg[14] , dut.\v_reg[15] );
    ////  $display("init_v: 0x%1x, update_v: 0x%1x, v_we: 0x%1x", dut.init_v, dut.update_v, dut.v_we);
    //  $display("");

    //  $display("t0_reg: 0x%08x, t0_new: 0x%08x", dut.t0_reg, dut.t0_new);
    //  $display("t1_reg: 0x%08x, t1_new: 0x%08x", dut.t1_reg, dut.t1_new);
    //  $display("t_ctr_rst: 0x%1x, t_ctr_inc: 0x%1x", dut.t_ctr_rst, dut.t_ctr_inc);
    //  $display("last_reg: 0x%1x, last_new: 0x%1x, last_we: 0x%1x",
    //           dut.last_reg, dut.last_new, dut.last_we);
      $display("");

    //  $display("v0_new:  0x%08x, v1_new:  0x%08x, v2_new:  0x%08x, v3_new:  0x%08x",
    //           dut.v_new[0], dut.v_new[1], dut.v_new[2], dut.v_new[3]);
    //  $display("v4_new:  0x%08x, v5_new:  0x%08x, v6_new:  0x%08x, v7_new:  0x%08x",
    //           dut.v_new[4], dut.v_new[5], dut.v_new[6], dut.v_new[7]);
    //  $display("v8_new:  0x%08x, v9_new:  0x%08x, v10_new: 0x%08x, v11_new: 0x%08x",
    //           dut.v_new[8], dut.v_new[9], dut.v_new[10], dut.v_new[11]);
    //  $display("v12_new: 0x%08x, v13_new: 0x%08x, v14_new: 0x%08x, v15_new: 0x%08x",
    //           dut.v_new[12], dut.v_new[13], dut.v_new[14], dut.v_new[15]);
    //  $display("");

    //  $display("G_mode: 0x%1x, ", dut.G_mode);
    //  $display("G0_m0: 0x%08x, G0_m1: 0x%08x, G1_m0: 0x%08x, G1_m1: 0x%08x",
    //           dut.G0_m0, dut.G0_m1, dut.G1_m0, dut.G1_m1);
    //  $display("G2_m0: 0x%08x, G2_m1: 0x%08x, G3_m0: 0x%08x, G3_m1: 0x%08x",
    //           dut.G2_m0, dut.G2_m1, dut.G3_m0, dut.G3_m1);
    //  $display("round_ctr_reg: 0x%02x, round_ctr_new: 0x%02x", dut.round_ctr_reg, dut.round_ctr_reg);
    ////  $display("round_ctr_rst: 0x%1x, round_ctr_inc: 0x%1x, round_ctr_we: 0x%1x",
    //           dut.round_ctr_rst, dut.round_ctr_inc, dut.round_ctr_we);
      $display("-------------------------------------------------------------------------------------");
      $display("-------------------------------------------------------------------------------------");
      $display("");
      $display("");
    end
  endtask // dump_dut_state


  //----------------------------------------------------------------
  // inc_tc_ctr
  //----------------------------------------------------------------
  task inc_tc_ctr;
    tc_ctr = tc_ctr + 1;
  endtask // inc_tc_ctr


  //----------------------------------------------------------------
  // inc_error_ctr
  //----------------------------------------------------------------
  task inc_error_ctr;
    error_ctr = error_ctr + 1;
  endtask // inc_error_ctr


  //----------------------------------------------------------------
  // pause_finish()
  //
  // Pause for a given number of cycles and then finish sim.
  //----------------------------------------------------------------
  task pause_finish(input [31 : 0] num_cycles);
    begin
      $display("--- Pausing for %04d cycles and then finishing hard.", num_cycles);
      #(num_cycles * CLK_PERIOD);
      $finish;
    end
  endtask // pause_finish


  //----------------------------------------------------------------
  // wait_ready()
  //
  // Wait for the ready flag to be set in dut.
  //----------------------------------------------------------------
  task wait_ready;
    begin : wready
      while (!tb_ready)
        #(CLK_PERIOD);
    end
  endtask // wait_ready


  //----------------------------------------------------------------
  // display_test_result()
  //
  // Display the accumulated test results.
  //----------------------------------------------------------------
  task display_test_result;
    begin
      $display("--- %02d test cases executed                      ---", tc_ctr);
      if (error_ctr == 0)
        begin
          $display("--- All %02d test cases completed successfully    ---", tc_ctr);
        end
      else
        begin
          $display("--- %02d test cases FAILED ---", error_ctr);
        end
    end
  endtask // display_test_result


  //----------------------------------------------------------------
  // init_sim()
  //
  // Set the input to the DUT to defined values.
  //----------------------------------------------------------------
  task init_sim;
    begin
      cycle_ctr   = 0;
      error_ctr   = 0;
      tc_ctr      = 0;

      display_cycle_ctr = 1;
      display_dut_state = 0;

      tb_clk      = 1'h0;
      tb_reset_n  = 1'h1;
      tb_init     = 1'h0;
      tb_update   = 1'h0;
      tb_finish   = 1'h0;
      tb_block    = 512'h0;
      tb_blocklen = 7'h0;
    end
  endtask // init_sim


  //----------------------------------------------------------------
  // reset_dut()
  //
  // Toggle reset to put the DUT into a well known state.
  //----------------------------------------------------------------
  task reset_dut;
    begin
      $display("--- TB: Resetting dut.");
      tb_reset_n = 1'h0;
      #(2 * CLK_PERIOD);
      tb_reset_n = 1'h1;
      #(2 * CLK_PERIOD);
      $display("--- TB: Reset done.");
    end
  endtask // reset_dut


  //----------------------------------------------------------------
  // test_empty_message
  //----------------------------------------------------------------
  task test_empty_message;
    begin : test_rfc_7693
      tc_ctr = tc_ctr + 1;

      $display("");
      $display("--- test_empty_message: Started.");

      $display("--- test_empty_message: Asserting init.");
      tb_init = 1'h1;
      #(CLK_PERIOD);
      tb_init = 1'h0;

      wait_ready();
      $display("--- test_empty_message: Init should be completed.");


      #(CLK_PERIOD);
      $display("--- test_empty_message: Asserting finish.");
      tb_blocklen = 7'h00;
      tb_block = 512'h0;
      tb_finish = 1'h1;
      #(CLK_PERIOD);
      tb_finish = 1'h0;
      wait_ready();

      $display("--- test_empty_message: Finish should be completed.");
      #(CLK_PERIOD);

      $display("--- test_empty_message: Checking generated digest.");
      if (tb_digest == 256'h69217a3079908094e11121d042354a7c1f55b6482ca1a51e1b250dfd1ed0eef9) begin
        $display("--- test_empty_message: Correct digest generated.");
        $display("--- test_empty_message: Got: 0x%064x", tb_digest);
      end else begin
        $display("--- test_empty_message: Error. Incorrect digest generated.");
        $display("--- test_empty_message: Expected: 0x69217a3079908094e11121d042354a7c1f55b6482ca1a51e1b250dfd1ed0eef9");
        $display("--- test_empty_message: Got:      0x%064x", tb_digest);
        error_ctr = error_ctr + 1;
      end

      $display("--- test_empty_message: Completed.\n");
    end
  endtask // test_empty_message


  //----------------------------------------------------------------
  // test_one_block_message
  //----------------------------------------------------------------
  task test_one_block_message;
    begin: test_one_block_message
      tc_ctr = tc_ctr + 1;

      $display("");
      $display("--- test_one_block_message: Started.");

      #(CLK_PERIOD);
      $display("--- test_one_block_message: Asserting init.");
      tb_init = 1'h1;
      #(CLK_PERIOD);
      tb_init = 1'h0;

      wait_ready();
      $display("--- test_one_block_message: Init completed.");

      tb_block = 512'h00010203_04050607_08090a0b_0c0d0e0f_10111213_14151617_18191a1b_1c1d1e1f_20212223_24252627_28292a2b_2c2d2e2f_30313233_34353637_38393a3b_3c3d3e3f;
      tb_blocklen = 7'h40;
      $display("--- test_one_block_message: Asserting finish.");
      tb_finish = 1'h1;
      #(CLK_PERIOD);
      tb_finish = 1'h0;
      wait_ready();
      $display("--- test_one_block_message: Finish completed.");
      #(CLK_PERIOD);

      if (dut.digest == 256'h56f34e8b96557e90c1f24b52d0c89d51086acf1b00f634cf1dde9233b8eaaa3e) begin
        $display("--- test_one_block_message: Correct digest generated.");
        $display("--- test_one_block_message: Got: 0x%064x", dut.digest);

      end else begin
        $display("--- test_one_block_message: ERROR incorrect digest generated.");
        $display("--- test_one_block_message: Expected: 0x56f34e8b96557e90c1f24b52d0c89d51086acf1b00f634cf1dde9233b8eaaa3e");
        $display("--- test_one_block_message: Got:      0x%064x", dut.digest);
        error_ctr = error_ctr + 1;
      end

      $display("--- test_one_block_message: Completed.\n");
      #(2 * CLK_PERIOD);

    end
  endtask // test_one_block_message


  //----------------------------------------------------------------
  // test_one_block_one_byte_message
  //----------------------------------------------------------------
  task test_one_block_one_byte_message;
    begin: test_one_block_one_byte_message
      tc_ctr = tc_ctr + 1;

      $display("");
      $display("--- test_one_block_one_byte_message: Started.");

      #(CLK_PERIOD);
      $display("--- test_one_block_one_byte_message: Asserting init.");
      tb_init = 1'h1;
      #(CLK_PERIOD);
      tb_init = 1'h0;

      wait_ready();
      $display("--- test_one_block_one_byte_message: Init completed.");

      tb_block = 512'h00010203_04050607_08090a0b_0c0d0e0f_10111213_14151617_18191a1b_1c1d1e1f_20212223_24252627_28292a2b_2c2d2e2f_30313233_34353637_38393a3b_3c3d3e3f;
      tb_blocklen = 7'h40;
      $display("--- test_one_block_one_byte_message: Asserting update.");
      tb_update = 1'h1;
      #(CLK_PERIOD);
      tb_update = 1'h0;

      wait_ready();
      $display("--- test_one_block_one_byte_message: Update completed.");
      #(CLK_PERIOD);

      tb_block = {8'h40, {63{8'h00}}};
      tb_blocklen = 7'h01;
      $display("--- test_one_block_one_byte_message: Asserting finish.");
      tb_finish = 1'h1;
      #(CLK_PERIOD);
      tb_finish = 1'h0;
      wait_ready();
      $display("--- test_one_block_one_byte_message: Finish completed.");
      #(CLK_PERIOD);

      if (dut.digest == 256'h1b53ee94aaf34e4b159d48de352c7f0661d0a40edff95a0b1639b4090e974472) begin
        $display("--- test_one_block_one_byte_message: Correct digest generated.");
        $display("--- test_one_block_one_byte_message: Got: 0x%064x", dut.digest);

      end else begin
        $display("--- test_one_block_one_byte_message: ERROR incorrect digest generated.");
        $display("--- test_one_block_one_byte_message: Expected: 0x1b53ee94aaf34e4b159d48de352c7f0661d0a40edff95a0b1639b4090e974472");
        $display("--- test_one_block_one_byte_message: Got:      0x%064x", dut.digest);
        error_ctr = error_ctr + 1;
      end

      $display("--- test_one_block_one_byte_message: Completed.\n");
      #(2 * CLK_PERIOD);

    end
  endtask // test_one_block_one_byte_message


  //----------------------------------------------------------------
  // test_rfc_7693
  // Test using testvectors from RFC 7693.
  //----------------------------------------------------------------
  task test_rfc_7693;
    begin : test_rfc_7693
      tc_ctr = tc_ctr + 1;

      $display("");
      $display("--- test_rfc_7693: Started.");

      $display("--- test_rfc_7693: Asserting init.");
      tb_init = 1'h1;
      #(CLK_PERIOD);
      tb_init = 1'h0;

      wait_ready();
      $display("--- test_rfc_7693: Init should be completed.");


      #(CLK_PERIOD);
      $display("--- test_rfc_7693: Setting message and message length.");
      tb_blocklen = 7'h03;
      tb_block = {32'h61626300, {15{32'h0}}};
      $display("--- test_rfc_7693: Asserting finish.");
      tb_finish = 1'h1;
      #(CLK_PERIOD);
      tb_finish = 1'h0;
      wait_ready();

      $display("--- test_rfc_7693: Finish should be completed.");
      #(CLK_PERIOD);

      $display("--- test_rfc_7693: Checking generated digest.");
      if (tb_digest == 256'h508c5e8c327c14e2_e1a72ba34eeb452f_37458b209ed63a29_4d999b4c86675982) begin
        $display("--- test_rfc_7693: Correct digest generated.");
        $display("--- test_rfc_7693: Got: 0x%064x", tb_digest);
      end else begin
        $display("--- test_rfc_7693: Error. Incorrect digest generated.");
        $display("--- test_rfc_7693: Expected: 0x508c5e8c327c14e2e1a72ba34eeb452f37458b209ed63a294d999b4c86675982");
        $display("--- test_rfc_7693: Got:      0x%064x", tb_digest);
        error_ctr = error_ctr + 1;
      end

      $display("--- test_rfc_7693: Completed.\n");
    end
  endtask // test_rfc_7693


  //----------------------------------------------------------------
  // testrunner
  //
  // The main test functionality.
  //----------------------------------------------------------------
  initial
    begin : testrunner
      $display("");
      $display("-------------------------------------------");
      $display("--- Testbench for BLAKE2s core  started ---");
      $display("-------------------------------------------");
      $display("");

      init_sim();
      reset_dut();

      test_empty_message();
      test_one_block_message();
      test_one_block_one_byte_message();
      test_rfc_7693();

      display_test_result();

      $display("");
      $display("-------------------------------------------");
      $display("--- testbench for BLAKE2s core completed ---");
      $display("--------------------------------------------");
      $display("");
      $finish_and_return(error_ctr);
    end // testrunner

endmodule // tb_blake2s_core

//======================================================================
// EOF tb_blake2s_core.v
//======================================================================
