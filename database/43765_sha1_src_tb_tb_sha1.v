// This program was cloned from: https://github.com/secworks/sha1
// License: BSD 2-Clause "Simplified" License

//======================================================================
//
// tb_sha1.v
// ---------
// Testbench for the SHA-1 top level wrapper.
//
//
// Copyright (c) 2013, Secworks Sweden AB
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

module tb_sha1();

  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  parameter DEBUG_CORE = 0;
  parameter DEBUG_TOP  = 0;

  parameter CLK_HALF_PERIOD = 1;
  parameter CLK_PERIOD = CLK_HALF_PERIOD * 2;

  parameter ADDR_NAME0       = 8'h00;
  parameter ADDR_NAME1       = 8'h01;
  parameter ADDR_VERSION     = 8'h02;

  parameter ADDR_CTRL        = 8'h08;
  parameter CTRL_INIT_BIT    = 0;
  parameter CTRL_NEXT_BIT    = 1;
  parameter CTRL_INIT_VALUE  = 8'h01;
  parameter CTRL_NEXT_VALUE  = 8'h02;

  parameter ADDR_STATUS      = 8'h09;
  parameter STATUS_READY_BIT = 0;
  parameter STATUS_VALID_BIT = 1;

  parameter ADDR_BLOCK0    = 8'h10;
  parameter ADDR_BLOCK1    = 8'h11;
  parameter ADDR_BLOCK2    = 8'h12;
  parameter ADDR_BLOCK3    = 8'h13;
  parameter ADDR_BLOCK4    = 8'h14;
  parameter ADDR_BLOCK5    = 8'h15;
  parameter ADDR_BLOCK6    = 8'h16;
  parameter ADDR_BLOCK7    = 8'h17;
  parameter ADDR_BLOCK8    = 8'h18;
  parameter ADDR_BLOCK9    = 8'h19;
  parameter ADDR_BLOCK10   = 8'h1a;
  parameter ADDR_BLOCK11   = 8'h1b;
  parameter ADDR_BLOCK12   = 8'h1c;
  parameter ADDR_BLOCK13   = 8'h1d;
  parameter ADDR_BLOCK14   = 8'h1e;
  parameter ADDR_BLOCK15   = 8'h1f;

  parameter ADDR_DIGEST0   = 8'h20;
  parameter ADDR_DIGEST1   = 8'h21;
  parameter ADDR_DIGEST2   = 8'h22;
  parameter ADDR_DIGEST3   = 8'h23;
  parameter ADDR_DIGEST4   = 8'h24;


  //----------------------------------------------------------------
  // Register and Wire declarations.
  //----------------------------------------------------------------
  reg [31 : 0] cycle_ctr;
  reg [31 : 0] error_ctr;
  reg [31 : 0] tc_ctr;

  reg           tb_clk;
  reg           tb_reset_n;
  reg           tb_cs;
  reg           tb_write_read;
  reg [7 : 0]   tb_address;
  reg [31 : 0]  tb_data_in;
  wire [31 : 0] tb_data_out;
  wire          tb_error;

  reg [31 : 0]  read_data;
  reg [159 : 0] digest_data;


  //----------------------------------------------------------------
  // Device Under Test.
  //----------------------------------------------------------------
  sha1 dut(
           .clk(tb_clk),
           .reset_n(tb_reset_n),

           .cs(tb_cs),
           .we(tb_write_read),

           .address(tb_address),
           .write_data(tb_data_in),
           .read_data(tb_data_out),
           .error(tb_error)
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


  //----------------------------------------------------------------
  // sys_monitor
  //----------------------------------------------------------------
  always
    begin : sys_monitor
      if (DEBUG_CORE)
        begin
          dump_core_state();
        end

      if (DEBUG_TOP)
        begin
          dump_top_state();
        end

      #(CLK_PERIOD);
      cycle_ctr = cycle_ctr + 1;
    end


  //----------------------------------------------------------------
  // dump_top_state()
  //
  // Dump state of the the top of the dut.
  //----------------------------------------------------------------
  task dump_top_state;
    begin
      $display("State of top");
      $display("-------------");
      $display("Inputs and outputs:");
      $display("cs      = 0x%01x,  we         = 0x%01x", dut.cs, dut.we);
      $display("address = 0x%02x, write_data = 0x%08x", dut.address, dut.write_data);
      $display("error   = 0x%01x,  read_data  = 0x%08x", dut.error, dut.read_data);
      $display("");

      $display("Control and status flags:");
      $display("init = 0x%01x, next = 0x%01x, ready = 0x%01x",
               dut.init_reg, dut.next_reg, dut.ready_reg);
      $display("");

      $display("block registers:");
      $display("block0  = 0x%08x, block1  = 0x%08x, block2  = 0x%08x,  block3  = 0x%08x",
               dut.block_reg[00], dut.block_reg[01], dut.block_reg[02], dut.block_reg[03]);
      $display("block4  = 0x%08x, block5  = 0x%08x, block6  = 0x%08x,  block7  = 0x%08x",
               dut.block_reg[04], dut.block_reg[05], dut.block_reg[06], dut.block_reg[07]);
      $display("block8  = 0x%08x, block9  = 0x%08x, block10 = 0x%08x,  block11 = 0x%08x",
               dut.block_reg[08], dut.block_reg[09], dut.block_reg[10], dut.block_reg[11]);
      $display("block12 = 0x%08x, block13 = 0x%08x, block14 = 0x%08x,  block15 = 0x%08x",
               dut.block_reg[12], dut.block_reg[13], dut.block_reg[14], dut.block_reg[15]);
      $display("");

      $display("Digest registers:");
      $display("digest_reg  = 0x%040x", dut.digest_reg);
      $display("");
    end
  endtask // dump_top_state


  //----------------------------------------------------------------
  // dump_core_state()
  //
  // Dump the state of the core inside the dut.
  //----------------------------------------------------------------
  task dump_core_state;
    begin
      $display("State of core");
      $display("-------------");
      $display("Inputs and outputs:");
      $display("init   = 0x%01x, next  = 0x%01x",
               dut.core.init, dut.core.next);
      $display("block  = 0x%0128x", dut.core.block);

      $display("ready  = 0x%01x, valid = 0x%01x",
               dut.core.ready, dut.core.digest_valid);
      $display("digest = 0x%040x", dut.core.digest);
      $display("H0_reg = 0x%08x, H1_reg = 0x%08x, H2_reg = 0x%08x, H3_reg = 0x%08x, H4_reg = 0x%08x",
               dut.core.H0_reg, dut.core.H1_reg, dut.core.H2_reg, dut.core.H3_reg, dut.core.H4_reg);
      $display("");

      $display("Control signals and counter:");
      $display("sha1_ctrl_reg = 0x%01x", dut.core.sha1_ctrl_reg);
      $display("digest_init   = 0x%01x, digest_update = 0x%01x",
               dut.core.digest_init, dut.core.digest_update);
      $display("state_init    = 0x%01x, state_update  = 0x%01x",
               dut.core.state_init, dut.core.state_update);
      $display("first_block   = 0x%01x, ready_flag    = 0x%01x, w_init        = 0x%01x",
               dut.core.first_block, dut.core.ready_flag, dut.core.w_init);
      $display("round_ctr_inc = 0x%01x, round_ctr_rst = 0x%01x, round_ctr_reg = 0x%02x",
               dut.core.round_ctr_inc, dut.core.round_ctr_rst, dut.core.round_ctr_reg);
      $display("");

      $display("State registers:");
      $display("a_reg = 0x%08x, b_reg = 0x%08x, c_reg = 0x%08x, d_reg = 0x%08x, e_reg = 0x%08x",
               dut.core.a_reg, dut.core.b_reg, dut.core.c_reg, dut.core.d_reg,  dut.core.e_reg);
      $display("a_new = 0x%08x, b_new = 0x%08x, c_new = 0x%08x, d_new = 0x%08x, e_new = 0x%08x",
               dut.core.a_new, dut.core.b_new, dut.core.c_new, dut.core.d_new, dut.core.e_new);
      $display("");

      $display("State update values:");
      $display("f = 0x%08x, k = 0x%08x, t = 0x%08x, w = 0x%08x,",
               dut.core.state_logic.f, dut.core.state_logic.k, dut.core.state_logic.t, dut.core.w);
      $display("");
    end
  endtask // dump_core_state


  //----------------------------------------------------------------
  // reset_dut()
  //----------------------------------------------------------------
  task reset_dut;
    begin
      $display("*** Toggle reset.");
      tb_reset_n = 0;
      #(4 * CLK_HALF_PERIOD);
      tb_reset_n = 1;
    end
  endtask // reset_dut


  //----------------------------------------------------------------
  // init_sim()
  //
  // Initialize all counters and testbed functionality as well
  // as setting the DUT inputs to defined values.
  //----------------------------------------------------------------
  task init_sim;
    begin
      cycle_ctr = 32'h00000000;
      error_ctr = 32'h00000000;
      tc_ctr    = 32'h00000000;

      tb_clk        = 0;
      tb_reset_n    = 0;
      tb_cs         = 0;
      tb_write_read = 0;
      tb_address    = 6'h00;
      tb_data_in    = 32'h00000000;
    end
  endtask // init_dut


  //----------------------------------------------------------------
  // display_test_result()
  //
  // Display the accumulated test results.
  //----------------------------------------------------------------
  task display_test_result;
    begin
      if (error_ctr == 0)
        begin
          $display("*** All %02d test cases completed successfully.", tc_ctr);
        end
      else
        begin
          $display("*** %02d test cases completed.", tc_ctr);
          $display("*** %02d errors detected during testing.", error_ctr);
        end
    end
  endtask // display_test_result


  //----------------------------------------------------------------
  // wait_ready()
  //
  // Wait for the ready flag in the dut to be set.
  // (Actually we wait for either ready or valid to be set.)
  //
  // Note: It is the callers responsibility to call the function
  // when the dut is actively processing and will in fact at some
  // point set the flag.
  //----------------------------------------------------------------
  task wait_ready;
    begin
      read_data = 0;

      while (read_data == 0)
        begin
          read_word(ADDR_STATUS);
        end
    end
  endtask // wait_ready


  //----------------------------------------------------------------
  // read_word()
  //
  // Read a data word from the given address in the DUT.
  // the word read will be available in the global variable
  // read_data.
  //----------------------------------------------------------------
  task read_word(input [7 : 0] address);
    begin
      tb_address = address;
      tb_cs = 1;
      tb_write_read = 0;
      #(CLK_PERIOD);
      read_data = tb_data_out;
      tb_cs = 0;

      if (DEBUG_TOP)
        begin
          $display("*** Reading 0x%08x from 0x%02x.", read_data, address);
          $display("");
        end
    end
  endtask // read_word


  //----------------------------------------------------------------
  // write_word()
  //
  // Write the given word to the DUT using the DUT interface.
  //----------------------------------------------------------------
  task write_word(input [7 : 0]  address,
                  input [31 : 0] word);
    begin
      if (DEBUG_TOP)
        begin
          $display("*** Writing 0x%08x to 0x%02x.", word, address);
          $display("");
        end

      tb_address = address;
      tb_data_in = word;
      tb_cs = 1;
      tb_write_read = 1;
      #(CLK_PERIOD);
      tb_cs = 0;
      tb_write_read = 0;
    end
  endtask // write_word


  //----------------------------------------------------------------
  // write_block()
  //
  // Write the given block to the dut.
  //----------------------------------------------------------------
  task write_block(input [511 : 0] block);
    begin
      write_word(ADDR_BLOCK0,  block[511 : 480]);
      write_word(ADDR_BLOCK1,  block[479 : 448]);
      write_word(ADDR_BLOCK2,  block[447 : 416]);
      write_word(ADDR_BLOCK3,  block[415 : 384]);
      write_word(ADDR_BLOCK4,  block[383 : 352]);
      write_word(ADDR_BLOCK5,  block[351 : 320]);
      write_word(ADDR_BLOCK6,  block[319 : 288]);
      write_word(ADDR_BLOCK7,  block[287 : 256]);
      write_word(ADDR_BLOCK8,  block[255 : 224]);
      write_word(ADDR_BLOCK9,  block[223 : 192]);
      write_word(ADDR_BLOCK10, block[191 : 160]);
      write_word(ADDR_BLOCK11, block[159 : 128]);
      write_word(ADDR_BLOCK12, block[127 :  96]);
      write_word(ADDR_BLOCK13, block[95  :  64]);
      write_word(ADDR_BLOCK14, block[63  :  32]);
      write_word(ADDR_BLOCK15, block[31  :   0]);
    end
  endtask // write_block


  //----------------------------------------------------------------
  // check_name_version()
  //
  // Read the name and version from the DUT.
  //----------------------------------------------------------------
  task check_name_version;
    reg [31 : 0] name0;
    reg [31 : 0] name1;
    reg [31 : 0] version;
    begin

      read_word(ADDR_NAME0);
      name0 = read_data;
      read_word(ADDR_NAME1);
      name1 = read_data;
      read_word(ADDR_VERSION);
      version = read_data;

      $display("DUT name: %c%c%c%c%c%c%c%c",
               name0[31 : 24], name0[23 : 16], name0[15 : 8], name0[7 : 0],
               name1[31 : 24], name1[23 : 16], name1[15 : 8], name1[7 : 0]);
      $display("DUT version: %c%c%c%c",
               version[31 : 24], version[23 : 16], version[15 : 8], version[7 : 0]);
    end
  endtask // check_name_version


  //----------------------------------------------------------------
  // read_digest()
  //
  // Read the digest in the dut. The resulting digest will be
  // available in the global variable digest_data.
  //----------------------------------------------------------------
  task read_digest;
    begin
      read_word(ADDR_DIGEST0);
      digest_data[159 : 128] = read_data;
      read_word(ADDR_DIGEST1);
      digest_data[127 :  96] = read_data;
      read_word(ADDR_DIGEST2);
      digest_data[95  :  64] = read_data;
      read_word(ADDR_DIGEST3);
      digest_data[63  :  32] = read_data;
      read_word(ADDR_DIGEST4);
      digest_data[31  :   0] = read_data;
    end
  endtask // read_digest


  //----------------------------------------------------------------
  // single_block_test()
  //
  //
  // Perform test of a single block digest.
  //----------------------------------------------------------------
  task single_block_test(input [511 : 0] block,
                         input [159 : 0] expected
                         );
    begin
      $display("*** TC%01d - Single block test started.", tc_ctr);

      write_block(block);
      write_word(ADDR_CTRL, CTRL_INIT_VALUE);
      #(CLK_PERIOD);
      wait_ready();
      read_digest();

      if (digest_data == expected)
        begin
          $display("TC%01d: OK.", tc_ctr);
        end
      else
        begin
          $display("TC%01d: ERROR.", tc_ctr);
          $display("TC%01d: Expected: 0x%040x", tc_ctr, expected);
          $display("TC%01d: Got:      0x%040x", tc_ctr, digest_data);
          error_ctr = error_ctr + 1;
        end
      $display("*** TC%01d - Single block test done.", tc_ctr);
      tc_ctr = tc_ctr + 1;
    end
  endtask // single_block_test


  //----------------------------------------------------------------
  // double_block_test()
  //
  //
  // Perform test of a double block digest. Note that we check
  // the digests for both the first and final block.
  //----------------------------------------------------------------
  task double_block_test(input [511 : 0] block0,
                         input [159 : 0] expected0,
                         input [511 : 0] block1,
                         input [159 : 0] expected1
                        );
    begin
      $display("*** TC%01d - Double block test started.", tc_ctr);

      // First block
      write_block(block0);
      write_word(ADDR_CTRL, CTRL_INIT_VALUE);
      #(CLK_PERIOD);
      wait_ready();
      read_digest();

      if (digest_data == expected0)
        begin
          $display("TC%01d first block: OK.", tc_ctr);
        end
      else
        begin
          $display("TC%01d: ERROR in first digest", tc_ctr);
          $display("TC%01d: Expected: 0x%040x", tc_ctr, expected0);
          $display("TC%01d: Got:      0x%040x", tc_ctr, digest_data);
          error_ctr = error_ctr + 1;
        end

      // Final block
      write_block(block1);
      write_word(ADDR_CTRL, CTRL_NEXT_VALUE);
      #(CLK_PERIOD);
      wait_ready();
      read_digest();

      if (digest_data == expected1)
        begin
          $display("TC%01d final block: OK.", tc_ctr);
        end
      else
        begin
          $display("TC%01d: ERROR in final digest", tc_ctr);
          $display("TC%01d: Expected: 0x%040x", tc_ctr, expected1);
          $display("TC%01d: Got:      0x%040x", tc_ctr, digest_data);
          error_ctr = error_ctr + 1;
        end

      $display("*** TC%01d - Double block test done.", tc_ctr);
      tc_ctr = tc_ctr + 1;
    end
  endtask // double_block_test


  //----------------------------------------------------------------
  // sha1_test
  // The main test functionality.
  //
  // Test cases taken from:
  // http://csrc.nist.gov/groups/ST/toolkit/documents/Examples/SHA_All.pdf
  //----------------------------------------------------------------
  initial
    begin : sha1_test
      reg [511 : 0] tc1;
      reg [159 : 0] res1;

      reg [511 : 0] tc2_1;
      reg [159 : 0] res2_1;
      reg [511 : 0] tc2_2;
      reg [159 : 0] res2_2;

      $display("   -- Testbench for sha1 started --");

      init_sim();
      reset_dut();
      check_name_version();

      // TC1: Single block message: "abc".
      tc1 = 512'h61626380000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018;
      res1 = 160'ha9993e364706816aba3e25717850c26c9cd0d89d;
      single_block_test(tc1, res1);

      // TC2: Double block message.
      // "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"
      tc2_1 = 512'h6162636462636465636465666465666765666768666768696768696A68696A6B696A6B6C6A6B6C6D6B6C6D6E6C6D6E6F6D6E6F706E6F70718000000000000000;
      res2_1 = 160'hf4286818c37b27ae0408f581846771484a566572;

      tc2_2 = 512'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001C0;
      res2_2 = 160'h84983e441c3bd26ebaae4aa1f95129e5e54670f1;
      double_block_test(tc2_1, res2_1, tc2_2, res2_2);

      display_test_result();
      $display("*** Simulation done. ***");
      $finish;
    end // sha1_test
endmodule // tb_sha1

//======================================================================
// EOF tb_sha1.v
//======================================================================
