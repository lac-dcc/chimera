//======================================================================
//
// tb_blake2s.v
// -----------
// Testbench for the blake2s top level wrapper
//
//
// Author: Joachim Strombergson
// Copyright (c) 2019, Assured AB
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

`default_nettype none


`include "includes/primitives.v"
`include "includes/sky130_hd.v"
module tb_blake2s();

initial begin
    $display("*******in here*******");
        $display("*******in here*******");
            $display("*******in here*******");
                $display("*******in here*******");
end
  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  parameter DEBUG     = 0;
  parameter DUMP_WAIT = 0;

  parameter CLK_HALF_PERIOD = 1;
  parameter CLK_PERIOD = 2 * CLK_HALF_PERIOD;

  localparam ADDR_NAME0       = 8'h00;
  localparam ADDR_NAME1       = 8'h01;
  localparam ADDR_VERSION     = 8'h02;

  localparam ADDR_CTRL        = 8'h08;
  localparam CTRL_INIT_BIT    = 0;
  localparam CTRL_UPDATE_BIT  = 1;
  localparam CTRL_FINISH_BIT  = 2;

  localparam ADDR_STATUS      = 8'h09;
  localparam STATUS_READY_BIT = 0;

  localparam ADDR_BLOCKLEN    = 8'h0a;

  localparam ADDR_BLOCK0      = 8'h10;
  localparam ADDR_BLOCK15     = 8'h1f;

  localparam ADDR_DIGEST0     = 8'h40;
  localparam ADDR_DIGEST7     = 8'h47;


  //----------------------------------------------------------------
  // Register and Wire declarations.
  //----------------------------------------------------------------
  reg [31 : 0]  cycle_ctr;
  reg [31 : 0]  error_ctr;
  reg [31 : 0]  tc_ctr;
  reg           tb_monitor;

  reg           display_dut_state;
  reg           display_core_state;

  reg           tb_clk;
  reg           tb_reset_n;
  reg           tb_cs;
  reg           tb_we;
  reg [7 : 0]   tb_address;
  reg [31 : 0]  tb_write_data;
  wire [31 : 0] tb_read_data;

  reg [31 : 0]  read_data;
  reg [255 : 0] digest;


  //----------------------------------------------------------------
  // Device Under Test.
  //----------------------------------------------------------------
  blake2s dut(
           .clk(tb_clk),
           .reset_n(tb_reset_n),

           .cs(tb_cs),
           .we(tb_we),

           .address(tb_address),
           .write_data(tb_write_data),
           .read_data(tb_read_data)
           );
initial begin
    //$display("*******in here*******");
    //$display("*******in here*******");
    //$monitor("A=0x%0h, B=0x%0h, C=0x%0h",dut.core._0950_, dut.core._0951_, dut.core._0952_);
    ////$monitor("tb_write_data=0x%0h",tb_write_data );
    ////$monitor("tb_we=0x%0h",tb_we );
    //$display("*******in here*******");
    //    $display("*******in here*******");

end

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
      if (tb_monitor)
        begin
          dump_dut_state();
        end
    end


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
      if (display_dut_state) begin
        //$display("block 0 ... 3:   0x%08x 0x%08x 0x%08x 0x%08x",
        //         dut.\block_mem[0] , 
        //         dut.\block_mem[1] , dut.\block_mem[2] , dut.\block_mem[3] );
        //$display("block 4 ... 7:   0x%08x 0x%08x 0x%08x 0x%08x",
        //         dut.\block_mem[4] , dut.\block_mem[5] , dut.\block_mem[6] , dut.\block_mem[7] );
        //$display("block 8 ... 11:  0x%08x 0x%08x 0x%08x 0x%08x",
        //         dut.\block_mem[8] , dut.\block_mem[9] , dut.\block_mem[10] , dut.\block_mem[11] );
        //$display("block 12 ... 15: 0x%08x 0x%08x 0x%08x 0x%08x",
        //         dut.\block_mem[12] , dut.\block_mem[13] , dut.\block_mem[14] , dut.\block_mem[15] );
        //$display("");

      end

      if (display_core_state) begin
        //$display("Core internal state");
        //$display("-------------------");
        //$display("init:     0x%01x, update: 0x%01x, finish: 0x%01x", dut.core.init, dut.core.update, dut.core.finish);
        //$display("block M:  0x%064x", dut.core.block[511 : 256]);
        //$display("block L:  0x%064x", dut.core.block[255 : 000]);
        //$display("blocklen: 0x%02x", dut.core.blocklen);
        //$display("digest:   0x%064x", dut.core.digest);
        //$display("ready:    0x%01x", dut.core.ready);
        //$display("");
        //$display("blake2s_ctrl_reg: 0x%02x, blake2s_ctrl_new: 0x%02x, blake2s_ctrl_we: 0x%01x",
        //         dut.core.blake2s_ctrl_reg, dut.core.blake2s_ctrl_new, dut.core.blake2s_ctrl_we);
        //$display("");

        //$display("h0: 0x%08x, h1: 0x%08x, h2: 0x%08x, h3: 0x%08x",
        //         dut.core.h_reg[0], dut.core.h_reg[1], dut.core.h_reg[2], dut.core.h_reg[3]);
        //$display("h4: 0x%08x, h5: 0x%08x, h6: 0x%08x, h7: 0x%08x",
        //         dut.core.h_reg[4], dut.core.h_reg[5], dut.core.h_reg[6], dut.core.h_reg[7]);
        //$display("");
        //$display("v0:  0x%08x, v1:  0x%08x, v2:  0x%08x, v3:  0x%08x",
        //         dut.core.\v_reg[0] , dut.core.\v_reg[1] , dut.core.\v_reg[2] , dut.core.\v_reg[3] );
        //$display("v4:  0x%08x, v5:  0x%08x, v6:  0x%08x, v7:  0x%08x",
        //        dut.core.\v_reg[4] , dut.core.\v_reg[5] , dut.core.\v_reg[6] , dut.core.\v_reg[7] );
        //$display("v8:  0x%08x, v9:  0x%08x, v10: 0x%08x, v11: 0x%08x",
        //         dut.core.\v_reg[8] , dut.core.\v_reg[9] , dut.core.\v_reg[10] , dut.core.\v_reg[11] );
        //$display("v12: 0x%08x, v13: 0x%08x, v14: 0x%08x, v15: 0x%08x",
        //         dut.core.\v_reg[12] , dut.core.\v_reg[13] , dut.core.\v_reg[14] , dut.core.\v_reg[15] );
        //$display("init_v: 0x%1x, update_v: 0x%1x, v_we: 0x%1x", dut.core.init_v, dut.core.update_v, dut.core.v_we);
        //$display("");

        //$display("t0_reg: 0x%08x, t0_new: 0x%08x", dut.core.t0_reg, dut.core.t0_new);
        //$display("t1_reg: 0x%08x, t1_new: 0x%08x", dut.core.t1_reg, dut.core.t1_new);
        //$display("t_ctr_rst: 0x%1x, t_ctr_inc: 0x%1x", dut.core.t_ctr_rst, dut.core.t_ctr_inc);
        //$display("last_reg: 0x%1x, last_new: 0x%1x, last_we: 0x%1x",
        //       dut.core.last_reg, dut.core.last_new, dut.core.last_we);
        //$display("");

        //$display("v0_new:  0x%08x, v1_new:  0x%08x, v2_new:  0x%08x, v3_new:  0x%08x",
        //       dut.core.v_new[0], dut.core.v_new[1], dut.core.v_new[2], dut.core.v_new[3]);
        //$display("v4_new:  0x%08x, v5_new:  0x%08x, v6_new:  0x%08x, v7_new:  0x%08x",
        //         dut.core.v_new[4], dut.core.v_new[5], dut.core.v_new[6], dut.core.v_new[7]);
        //$display("v8_new:  0x%08x, v9_new:  0x%08x, v10_new: 0x%08x, v11_new: 0x%08x",
        //         dut.core.v_new[8], dut.core.v_new[9], dut.core.v_new[10], dut.core.v_new[11]);
        //$display("v12_new: 0x%08x, v13_new: 0x%08x, v14_new: 0x%08x, v15_new: 0x%08x",
        //         dut.core.v_new[12], dut.core.v_new[13], dut.core.v_new[14], dut.core.v_new[15]);
        //$display("");

        //$display("G_mode: 0x%1x, ", dut.core.G_mode);
        //$display("G0_m0: 0x%08x, G0_m1: 0x%08x, G1_m0: 0x%08x, G1_m1: 0x%08x",
        //         dut.core.G0_m0, dut.core.G0_m1, dut.core.G1_m0, dut.core.G1_m1);
        //$display("G2_m0: 0x%08x, G2_m1: 0x%08x, G3_m0: 0x%08x, G3_m1: 0x%08x",
        //         dut.core.G2_m0, dut.core.G2_m1, dut.core.G3_m0, dut.core.G3_m1);
        //$display("round_ctr_reg: 0x%02x, round_ctr_new: 0x%02x", dut.core.round_ctr_reg, dut.core.round_ctr_reg);
        //$display("round_ctr_rst: 0x%1x, round_ctr_inc: 0x%1x, round_ctr_we: 0x%1x",
        //         dut.core.round_ctr_rst, dut.core.round_ctr_inc, dut.core.round_ctr_we);
      end // if (display_core_state)

        $display("-------------------------------------------------------------------------------------");
        $display("-------------------------------------------------------------------------------------");
        $display("");
        $display("");
      end
  endtask // dump_dut_state


  //----------------------------------------------------------------
  // reset_dut()
  //
  // Toggle reset to put the DUT into a well known state.
  //----------------------------------------------------------------
  task reset_dut;
    begin
      $display("--- Toggle reset.");
      tb_reset_n = 0;
      #(2 * CLK_PERIOD);
      tb_reset_n = 1;
    end
  endtask // reset_dut


  //----------------------------------------------------------------
  // display_test_result()
  //
  // Display the accumulated test results.
  //----------------------------------------------------------------
  task display_test_result;
    begin
      $display("");

      if (error_ctr == 0) begin
        $display("--- All %02d test cases completed successfully", tc_ctr);
      end else begin
        $display("--- %02d tests completed - %02d test cases FAILED .",
                 tc_ctr, error_ctr);
      end
    end
  endtask // display_test_result


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
      tb_monitor         = 0;
      display_dut_state  = 0;
      display_core_state = 0;

      tb_clk        = 1'h0;
      tb_reset_n    = 1'h1;
      tb_cs         = 1'h0;
      tb_we         = 1'h0;
      tb_address    = 8'h0;
      tb_write_data = 32'h0;
    end
  endtask // init_sim


  //----------------------------------------------------------------
  // write_word()
  //
  // Write the given word to the DUT using the DUT interface.
  //----------------------------------------------------------------
  task write_word(input [11 : 0] address,
                  input [31 : 0] word);
    begin
      if (DEBUG)
        begin
          $display("--- Writing 0x%08x to 0x%02x.", word, address);
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
          $display("--- Reading 0x%08x from 0x%02x.", read_data, address);
          $display("");
        end
    end
  endtask // read_word


  //----------------------------------------------------------------
  // wait_ready()
  //
  // Wait for the ready flag to be set in dut.
  //----------------------------------------------------------------
  task wait_ready;
    begin : wready
      read_word(ADDR_STATUS);
      while (read_data == 0)
        read_word(ADDR_STATUS);
    end
  endtask // wait_ready


  //----------------------------------------------------------------
  // get_digest()
  //----------------------------------------------------------------
  task get_digest;
    begin
      read_word(ADDR_DIGEST0);
      digest[255 : 224] = read_data;

      read_word(ADDR_DIGEST0 + 8'h1);
      digest[223 : 192] = read_data;

      read_word(ADDR_DIGEST0 + 8'h2);
      digest[191 : 160] = read_data;

      read_word(ADDR_DIGEST0 + 8'h3);
      digest[159 : 128] = read_data;

      read_word(ADDR_DIGEST0 + 8'h4);
      digest[127 : 96] = read_data;

      read_word(ADDR_DIGEST0 + 8'h5);
      digest[95 : 64] = read_data;

      read_word(ADDR_DIGEST0 + 8'h6);
      digest[63 : 32] = read_data;

      read_word(ADDR_DIGEST0 + 8'h7);
      digest[31 : 0] = read_data;
    end
  endtask // get_digest


  //----------------------------------------------------------------
  // clean_block()
  //----------------------------------------------------------------
  task clean_block;
    begin: clean_block
      integer i;
      for (i = 0 ; i < 16 ; i = i + 1) begin
        write_word(ADDR_BLOCK0 + i, 32'h0);
      end
    end
  endtask // clean_block


  //----------------------------------------------------------------
  // test_name_version
  //----------------------------------------------------------------
  task test_name_version;
    begin: test_name_version
      reg [31 : 0] name0;
      reg [31 : 0] name1;
      reg [31 : 0] version;

      $display("");
      $display("--- test_name_version: Started.");

      read_word(ADDR_NAME0);
      name0 = read_data;

      read_word(ADDR_NAME1);
      name1 = read_data;

      read_word(ADDR_VERSION);
      version = read_data;

      $display("--- test_name_version: Name: %c%c%c%c%c%c%c%c",
               name0[31 : 24], name0[23 : 16], name0[15 : 8], name0[7 : 0],
               name1[31 : 24], name1[23 : 16], name1[15 : 8], name1[7 : 0]);

      $display("--- test_name_version: Version: %c%c%c%c",
               version[31 : 24], version[23 : 16], version[15 : 8], version[7 : 0]);


      $display("--- test_name_version: Completed.");
      $display("");
    end
  endtask // test_name_version


  //----------------------------------------------------------------
  // test_empty_message
  //----------------------------------------------------------------
  task test_empty_message;
    begin : test_rfc_7693
      tc_ctr = tc_ctr + 1;

      tb_monitor         = 0;
      display_dut_state  = 0;
      display_core_state = 0;

      $display("");
      $display("--- test_empty_message: Started.");

      $display("--- test_empty_message: Asserting init.");
      write_word(ADDR_CTRL, 32'h1);
      wait_ready();
      $display("--- test_empty_message: Init should be completed.");


      $display("--- test_empty_message: Asserting finish.");
      write_word(ADDR_BLOCKLEN, 32'h0);
      write_word(ADDR_CTRL, 32'h4);
      wait_ready();

      $display("--- test_empty_message: Finish should be completed.");
      get_digest();

      $display("--- test_empty_message: Checking generated digest.");
      if (digest == 256'h69217a3079908094e11121d042354a7c1f55b6482ca1a51e1b250dfd1ed0eef9) begin
        $display("--- test_empty_message: Correct digest generated.");
        $display("--- test_empty_message: Got: 0x%064x", digest);
      end else begin
        $display("--- test_empty_message: Error. Incorrect digest generated.");
        $display("--- test_empty_message: Expected: 0x69217a3079908094e11121d042354a7c1f55b6482ca1a51e1b250dfd1ed0eef9");
        $display("--- test_empty_message: Got:      0x%064x", digest);
        error_ctr = error_ctr + 1;
      end

      tb_monitor         = 0;
      display_dut_state  = 0;
      display_core_state = 0;

      $display("--- test_empty_message: Completed.\n");
    end
  endtask // test_empty_message


  //----------------------------------------------------------------
  // test_rfc_7693
  //----------------------------------------------------------------
  task test_rfc_7693;
    begin : test_rfc_7693
      tc_ctr = tc_ctr + 1;

      tb_monitor         = 0;
      display_dut_state  = 0;
      display_core_state = 0;

      clean_block();

      $display("");
      $display("--- ttest_rfc_7693: Started.");

      $display("--- test_rfc_7693: Asserting init.");
      write_word(ADDR_CTRL, 32'h1);
      wait_ready();
      $display("--- test_rfc_7693: Init should be completed.");


      $display("--- test_rfc_7693: Writing message and message length.");
      write_word(ADDR_BLOCK0, 32'h61626300);
      write_word(ADDR_BLOCKLEN, 32'h3);
      $display("--- test_rfc_7693: Asserting finish.");
      write_word(ADDR_CTRL, 32'h4);
      wait_ready();

      $display("--- test_rfc_7693: Finish should be completed.");
      get_digest();

      $display("--- test_rfc_7693: Checking generated digest.");
      if (digest == 256'h508c5e8c327c14e2_e1a72ba34eeb452f_37458b209ed63a29_4d999b4c86675982) begin
        $display("--- test_rfc_7693: Correct digest generated.");
        $display("--- test_rfc_7693: Got: 0x%064x", digest);
      end else begin
        $display("--- test_rfc_7693: Error. Incorrect digest generated.");
        $display("--- test_rfc_7693: Expected: 0x508c5e8c327c14e2_e1a72ba34eeb452f_37458b209ed63a29_4d999b4c86675982");
        $display("--- test_rfc_7693: Got:      0x%064x", digest);
        error_ctr = error_ctr + 1;
      end

      tb_monitor         = 0;
      display_dut_state  = 0;
      display_core_state = 0;

      $display("--- test_rfc_7693: Completed.\n");
    end
  endtask // test_rfc_7693


  //----------------------------------------------------------------
  // test_one_block_message
  //----------------------------------------------------------------
  task test_one_block_message;
    begin : test_one_block_message
      tc_ctr = tc_ctr + 1;

      tb_monitor         = 0;
      display_dut_state  = 0;
      display_core_state = 0;

      clean_block();

      $display("");
      $display("--- test_one_block_message: Started.");

      $display("--- test_one_block_message: Asserting init.");
      write_word(ADDR_CTRL, 32'h1);
      wait_ready();
      $display("--- test_one_block_message: Init should be completed.");


      $display("--- test_one_block_message: Writing message and message length.");
      write_word(ADDR_BLOCK0 + 0,  32'h00010203);
      write_word(ADDR_BLOCK0 + 1,  32'h04050607);
      write_word(ADDR_BLOCK0 + 2,  32'h08090a0b);
      write_word(ADDR_BLOCK0 + 3,  32'h0c0d0e0f);
      write_word(ADDR_BLOCK0 + 4,  32'h10111213);
      write_word(ADDR_BLOCK0 + 5,  32'h14151617);
      write_word(ADDR_BLOCK0 + 6,  32'h18191a1b);
      write_word(ADDR_BLOCK0 + 7,  32'h1c1d1e1f);
      write_word(ADDR_BLOCK0 + 8,  32'h20212223);
      write_word(ADDR_BLOCK0 + 9,  32'h24252627);
      write_word(ADDR_BLOCK0 + 10, 32'h28292a2b);
      write_word(ADDR_BLOCK0 + 11, 32'h2c2d2e2f);
      write_word(ADDR_BLOCK0 + 12, 32'h30313233);
      write_word(ADDR_BLOCK0 + 13, 32'h34353637);
      write_word(ADDR_BLOCK0 + 14, 32'h38393a3b);
      write_word(ADDR_BLOCK0 + 15, 32'h3c3d3e3f);
      write_word(ADDR_BLOCKLEN, 32'h40);
      $display("--- test_one_block_message: Asserting finish.");
      write_word(ADDR_CTRL, 32'h4);
      wait_ready();

      $display("--- test_one_block_message: Finish should be completed.");
      get_digest();

      $display("--- test_one_block_message: Checking generated digest.");
      if (digest == 256'h56f34e8b96557e90c1f24b52d0c89d51086acf1b00f634cf1dde9233b8eaaa3e) begin
        $display("--- test_one_block_message: Correct digest generated.");
        $display("--- test_one_block_message: Got: 0x%064x", digest);
      end else begin
        $display("--- test_one_block_message: Error. Incorrect digest generated.");
        $display("--- test_one_block_message: Expected: 0x56f34e8b96557e90c1f24b52d0c89d51086acf1b00f634cf1dde9233b8eaaa3e");
        $display("--- test_one_block_message: Got:      0x%064x", digest);
        error_ctr = error_ctr + 1;
      end

      tb_monitor         = 0;
      display_dut_state  = 0;
      display_core_state = 0;

      $display("--- test_one_block_message: Completed.\n");
    end
  endtask // test_one_block_message


  //----------------------------------------------------------------
  // test_one_block_one_byte_message
  //----------------------------------------------------------------
  task test_one_block_one_byte_message;
    begin : test_one_block_one_byte_message
      tc_ctr = tc_ctr + 1;

      tb_monitor         = 0;
      display_dut_state  = 0;
      display_core_state = 0;

      clean_block();

      $display("");
      $display("--- test_one_block_one_byte_message: Started.");

      $display("--- test_one_block_one_byte_message: Asserting init.");
      write_word(ADDR_CTRL, 32'h1);
      wait_ready();
      $display("--- test_one_block_one_byte_message: Init should be completed.");


      $display("--- test_one_block_one_byte_message: Writing message and message length.");
      write_word(ADDR_BLOCK0 + 0,  32'h00010203);
      write_word(ADDR_BLOCK0 + 1,  32'h04050607);
      write_word(ADDR_BLOCK0 + 2,  32'h08090a0b);
      write_word(ADDR_BLOCK0 + 3,  32'h0c0d0e0f);
      write_word(ADDR_BLOCK0 + 4,  32'h10111213);
      write_word(ADDR_BLOCK0 + 5,  32'h14151617);
      write_word(ADDR_BLOCK0 + 6,  32'h18191a1b);
      write_word(ADDR_BLOCK0 + 7,  32'h1c1d1e1f);
      write_word(ADDR_BLOCK0 + 8,  32'h20212223);
      write_word(ADDR_BLOCK0 + 9,  32'h24252627);
      write_word(ADDR_BLOCK0 + 10, 32'h28292a2b);
      write_word(ADDR_BLOCK0 + 11, 32'h2c2d2e2f);
      write_word(ADDR_BLOCK0 + 12, 32'h30313233);
      write_word(ADDR_BLOCK0 + 13, 32'h34353637);
      write_word(ADDR_BLOCK0 + 14, 32'h38393a3b);
      write_word(ADDR_BLOCK0 + 15, 32'h3c3d3e3f);
      write_word(ADDR_BLOCKLEN, 32'h40);

      $display("--- test_one_block_one_byte_message: Asserting next.");
      write_word(ADDR_CTRL, 32'h2);
      wait_ready();

      $display("--- test_one_block_one_byte_message: Next should be completed.");
      get_digest();


      $display("--- test_one_block_one_byte_message: Writing message and message length.");
      clean_block();
      write_word(ADDR_BLOCK0 + 0,  32'h40000000);
      write_word(ADDR_BLOCKLEN, 32'h01);

      $display("--- test_one_block_one_byte_message: Asserting finish.");
      write_word(ADDR_CTRL, 32'h4);
      wait_ready();

      $display("--- test_one_block_one_byte_message: Finish should be completed.");
      get_digest();

      $display("--- test_one_block_one_byte_message: Checking generated digest.");
      if (digest == 256'h1b53ee94aaf34e4b159d48de352c7f0661d0a40edff95a0b1639b4090e974472) begin
        $display("--- test_one_block_one_byte_message: Correct digest generated.");
        $display("--- test_one_block_one_byte_message: Got: 0x%064x", digest);
      end else begin
        $display("--- test_one_block_one_byte_message: Error. Incorrect digest generated.");
        $display("--- test_one_block_one_byte_message: Expected: 0x1b53ee94aaf34e4b159d48de352c7f0661d0a40edff95a0b1639b4090e974472");
        $display("--- test_one_block_one_byte_message: Got:      0x%064x", digest);
        error_ctr = error_ctr + 1;
      end

      tb_monitor         = 0;
      display_dut_state  = 0;
      display_core_state = 0;

      $display("--- test_one_block_one_byte_message: Completed.\n");
    end
  endtask // test_one_block_one_byte_message


  //----------------------------------------------------------------
  // blake2s_test
  //----------------------------------------------------------------
  initial
    begin : blake2s_test
      $display("   -= Testbench for blake2s started =-");
      $display("     =================================");
      $display("");

      init_sim();
      reset_dut();

      test_name_version();
      test_empty_message();
      test_rfc_7693();
      test_one_block_message();
      test_one_block_one_byte_message();

      display_test_result();
      $display("");
      $display("   -= Testbench for blake2s completed =-");
      $display("     =================================");
      $display("");
      $finish;
    end // blake2s_test
endmodule // tb_blake2s

//======================================================================
// EOF tb_blake2s.v
//======================================================================
