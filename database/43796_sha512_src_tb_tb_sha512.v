// This program was cloned from: https://github.com/secworks/sha512
// License: BSD 2-Clause "Simplified" License

//======================================================================
//
// tb_sha512.v
// -----------
// Testbench for the SHA-512 top level wrapper.
//
//
// Author: Joachim Strombergson
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

module tb_sha512();

  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  parameter DEBUG = 0;

  parameter CLK_PERIOD      = 2;
  parameter CLK_HALF_PERIOD = CLK_PERIOD / 2;


  // The address map.
  parameter ADDR_NAME0           = 8'h00;
  parameter ADDR_NAME1           = 8'h01;
  parameter ADDR_VERSION         = 8'h02;

  parameter ADDR_CTRL            = 8'h08;
  parameter CTRL_INIT_BIT        = 0;
  parameter CTRL_NEXT_BIT        = 1;
  parameter CTRL_MODE_LOW_BIT    = 2;
  parameter CTRL_MODE_HIGH_BIT   = 3;
  parameter CTRL_WORK_FACTOR_BIT = 7;

  parameter ADDR_STATUS          = 8'h09;
  parameter STATUS_READY_BIT     = 0;
  parameter STATUS_VALID_BIT     = 1;

  parameter ADDR_WORK_FACTOR_NUM = 8'h0a;

  parameter ADDR_BLOCK0          = 8'h10;
  parameter ADDR_BLOCK1          = 8'h11;
  parameter ADDR_BLOCK2          = 8'h12;
  parameter ADDR_BLOCK3          = 8'h13;
  parameter ADDR_BLOCK4          = 8'h14;
  parameter ADDR_BLOCK5          = 8'h15;
  parameter ADDR_BLOCK6          = 8'h16;
  parameter ADDR_BLOCK7          = 8'h17;
  parameter ADDR_BLOCK8          = 8'h18;
  parameter ADDR_BLOCK9          = 8'h19;
  parameter ADDR_BLOCK10         = 8'h1a;
  parameter ADDR_BLOCK11         = 8'h1b;
  parameter ADDR_BLOCK12         = 8'h1c;
  parameter ADDR_BLOCK13         = 8'h1d;
  parameter ADDR_BLOCK14         = 8'h1e;
  parameter ADDR_BLOCK15         = 8'h1f;
  parameter ADDR_BLOCK16         = 8'h20;
  parameter ADDR_BLOCK17         = 8'h21;
  parameter ADDR_BLOCK18         = 8'h22;
  parameter ADDR_BLOCK19         = 8'h23;
  parameter ADDR_BLOCK20         = 8'h24;
  parameter ADDR_BLOCK21         = 8'h25;
  parameter ADDR_BLOCK22         = 8'h26;
  parameter ADDR_BLOCK23         = 8'h27;
  parameter ADDR_BLOCK24         = 8'h28;
  parameter ADDR_BLOCK25         = 8'h29;
  parameter ADDR_BLOCK26         = 8'h2a;
  parameter ADDR_BLOCK27         = 8'h2b;
  parameter ADDR_BLOCK28         = 8'h2c;
  parameter ADDR_BLOCK29         = 8'h2d;
  parameter ADDR_BLOCK30         = 8'h2e;
  parameter ADDR_BLOCK31         = 8'h2f;

  parameter ADDR_DIGEST0         = 8'h40;
  parameter ADDR_DIGEST1         = 8'h41;
  parameter ADDR_DIGEST2         = 8'h42;
  parameter ADDR_DIGEST3         = 8'h43;
  parameter ADDR_DIGEST4         = 8'h44;
  parameter ADDR_DIGEST5         = 8'h45;
  parameter ADDR_DIGEST6         = 8'h46;
  parameter ADDR_DIGEST7         = 8'h47;
  parameter ADDR_DIGEST8         = 8'h48;
  parameter ADDR_DIGEST9         = 8'h49;
  parameter ADDR_DIGEST10        = 8'h4a;
  parameter ADDR_DIGEST11        = 8'h4b;
  parameter ADDR_DIGEST12        = 8'h4c;
  parameter ADDR_DIGEST13        = 8'h4d;
  parameter ADDR_DIGEST14        = 8'h4e;
  parameter ADDR_DIGEST15        = 8'h4f;

  parameter MODE_SHA_512_224     = 2'h0;
  parameter MODE_SHA_512_256     = 2'h1;
  parameter MODE_SHA_384         = 2'h2;
  parameter MODE_SHA_512         = 2'h3;

  parameter CTRL_INIT_VALUE        = 2'h1;
  parameter CTRL_NEXT_VALUE        = 2'h2;
  parameter CTRL_WORK_FACTOR_VALUE = 1'h1;


  //----------------------------------------------------------------
  // Register and Wire declarations.
  //----------------------------------------------------------------
  reg [31 : 0]  cycle_ctr;
  reg [31 : 0]  error_ctr;
  reg [31 : 0]  tc_ctr;

  reg           tb_clk;
  reg           tb_reset_n;
  reg           tb_cs;
  reg           tb_we;
  reg [7 : 0]   tb_address;
  reg [31 : 0]  tb_write_data;
  wire [31 : 0] tb_read_data;
  wire          tb_error;

  reg [31 : 0]  read_data;
  reg [511 : 0] digest_data;


  //----------------------------------------------------------------
  // Device Under Test.
  //----------------------------------------------------------------
  sha512 dut(
             .clk(tb_clk),
             .reset_n(tb_reset_n),

             .cs(tb_cs),
             .we(tb_we),


             .address(tb_address),
             .write_data(tb_write_data),
             .read_data(tb_read_data),
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
  //
  // Generates a cycle counter and displays information about
  // the dut as needed.
  //----------------------------------------------------------------
  always
    begin : sys_monitor
      #(2 * CLK_HALF_PERIOD);
      cycle_ctr = cycle_ctr + 1;
    end


  //----------------------------------------------------------------
  // dump_dut_state()
  //
  // Dump the state of the dump when needed.
  //----------------------------------------------------------------
  task dump_dut_state;
    begin
      $display("State of DUT");
      $display("------------");
      $display("Inputs and outputs:");
      $display("cs = 0x%01x, we = 0x%01x",
               dut.cs, dut.we);
      $display("address = 0x%02x", dut.address);
      $display("write_data = 0x%08x, read_data = 0x%08x",
               dut.write_data, dut.read_data);
      $display("tmp_read_data = 0x%08x", dut.tmp_read_data);
      $display("");

      $display("Control and status:");
      $display("ctrl = 0x%02x, status = 0x%02x",
               {dut.next_reg, dut.init_reg},
               {dut.digest_valid_reg, dut.ready_reg});
      $display("");

      $display("Message block:");
      $display("block0  = 0x%08x, block1  = 0x%08x, block2  = 0x%08x,  block3  = 0x%08x",
               dut.block_reg[00], dut.block_reg[01], dut.block_reg[02], dut.block_reg[03]);
      $display("block4  = 0x%08x, block5  = 0x%08x, block6  = 0x%08x,  block7  = 0x%08x",
               dut.block_reg[04], dut.block_reg[05], dut.block_reg[06], dut.block_reg[07]);
      $display("block8  = 0x%08x, block9  = 0x%08x, block10 = 0x%08x,  block11 = 0x%08x",
               dut.block_reg[08], dut.block_reg[09], dut.block_reg[10], dut.block_reg[11]);
      $display("block12 = 0x%08x, block13 = 0x%08x, block14 = 0x%08x,  block15 = 0x%08x",
               dut.block_reg[12], dut.block_reg[13], dut.block_reg[14], dut.block_reg[15]);
      $display("block16 = 0x%08x, block17 = 0x%08x, block18 = 0x%08x,  block19 = 0x%08x",
               dut.block_reg[16], dut.block_reg[17], dut.block_reg[18], dut.block_reg[19]);
      $display("block20 = 0x%08x, block21 = 0x%08x, block22 = 0x%08x,  block23 = 0x%08x",
               dut.block_reg[20], dut.block_reg[21], dut.block_reg[22], dut.block_reg[23]);
      $display("block24 = 0x%08x, block25 = 0x%08x, block26 = 0x%08x,  block27 = 0x%08x",
               dut.block_reg[24], dut.block_reg[25], dut.block_reg[26], dut.block_reg[27]);
      $display("block28 = 0x%08x, block29 = 0x%08x, block30 = 0x%08x,  block31 = 0x%08x",
               dut.block_reg[28], dut.block_reg[29], dut.block_reg[30], dut.block_reg[31]);

      $display("");

      $display("Digest:");
      $display("digest = 0x%0128x", dut.digest_reg);
      $display("");

    end
  endtask // dump_dut_state


  //----------------------------------------------------------------
  // reset_dut()
  //
  // Toggles reset to force the DUT into a well defined state.
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
      tb_we         = 0;
      tb_address    = 6'h00;
      tb_write_data = 32'h00000000;
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
  // write_word()
  //
  // Write the given word to the DUT using the DUT interface.
  //----------------------------------------------------------------
  task write_word(input [7 : 0]  address,
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
      #(2 * CLK_HALF_PERIOD);
      tb_cs = 0;
      tb_we = 0;
    end
  endtask // write_word


  //----------------------------------------------------------------
  // write_block()
  //
  // Write the given block to the dut.
  //----------------------------------------------------------------
  task write_block(input [1023 : 0] block);
    begin
      write_word(ADDR_BLOCK0,  block[1023 : 992]);
      write_word(ADDR_BLOCK1,  block[991  : 960]);
      write_word(ADDR_BLOCK2,  block[959  : 928]);
      write_word(ADDR_BLOCK3,  block[927  : 896]);
      write_word(ADDR_BLOCK4,  block[895  : 864]);
      write_word(ADDR_BLOCK5,  block[863  : 832]);
      write_word(ADDR_BLOCK6,  block[831  : 800]);
      write_word(ADDR_BLOCK7,  block[799  : 768]);
      write_word(ADDR_BLOCK8,  block[767  : 736]);
      write_word(ADDR_BLOCK9,  block[735  : 704]);
      write_word(ADDR_BLOCK10, block[703  : 672]);
      write_word(ADDR_BLOCK11, block[671  : 640]);
      write_word(ADDR_BLOCK12, block[639  : 608]);
      write_word(ADDR_BLOCK13, block[607  : 576]);
      write_word(ADDR_BLOCK14, block[575  : 544]);
      write_word(ADDR_BLOCK15, block[543  : 512]);
      write_word(ADDR_BLOCK16, block[511  : 480]);
      write_word(ADDR_BLOCK17, block[479  : 448]);
      write_word(ADDR_BLOCK18, block[447  : 416]);
      write_word(ADDR_BLOCK19, block[415  : 384]);
      write_word(ADDR_BLOCK20, block[383  : 352]);
      write_word(ADDR_BLOCK21, block[351  : 320]);
      write_word(ADDR_BLOCK22, block[319  : 288]);
      write_word(ADDR_BLOCK23, block[287  : 256]);
      write_word(ADDR_BLOCK24, block[255  : 224]);
      write_word(ADDR_BLOCK25, block[223  : 192]);
      write_word(ADDR_BLOCK26, block[191  : 160]);
      write_word(ADDR_BLOCK27, block[159  : 128]);
      write_word(ADDR_BLOCK28, block[127  :  96]);
      write_word(ADDR_BLOCK29, block[95   :  64]);
      write_word(ADDR_BLOCK30, block[63   :  32]);
      write_word(ADDR_BLOCK31, block[31   :   0]);
    end
  endtask // write_block


  //----------------------------------------------------------------
  // read_word()
  //
  // Read a data word from the given address in the DUT.
  // the word read will be available in the global variable
  // read_data.
  //----------------------------------------------------------------
  task read_word(input [7 : 0]  address);
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
      digest_data[511 : 480] = read_data;
      read_word(ADDR_DIGEST1);
      digest_data[479 : 448] = read_data;
      read_word(ADDR_DIGEST2);
      digest_data[447 : 416] = read_data;
      read_word(ADDR_DIGEST3);
      digest_data[415 : 384] = read_data;
      read_word(ADDR_DIGEST4);
      digest_data[383 : 352] = read_data;
      read_word(ADDR_DIGEST5);
      digest_data[351 : 320] = read_data;
      read_word(ADDR_DIGEST6);
      digest_data[319 : 288] = read_data;
      read_word(ADDR_DIGEST7);
      digest_data[287 : 256] = read_data;

      read_word(ADDR_DIGEST8);
      digest_data[255 : 224] = read_data;
      read_word(ADDR_DIGEST9);
      digest_data[223 : 192] = read_data;
      read_word(ADDR_DIGEST10);
      digest_data[191 : 160] = read_data;
      read_word(ADDR_DIGEST11);
      digest_data[159 : 128] = read_data;
      read_word(ADDR_DIGEST12);
      digest_data[127 :  96] = read_data;
      read_word(ADDR_DIGEST13);
      digest_data[95  :  64] = read_data;
      read_word(ADDR_DIGEST14);
      digest_data[63  :  32] = read_data;
      read_word(ADDR_DIGEST15);
      digest_data[31  :   0] = read_data;
    end
  endtask // read_digest


  //----------------------------------------------------------------
  // get_mask()
  //
  // Create the mask needed for a given mode.
  //----------------------------------------------------------------
  function [511 : 0] get_mask(input [1 : 0] mode);
    begin
      case (mode)
        MODE_SHA_512_224:
          begin
            if (DEBUG)
              begin
                $display("Mode MODE_SHA_512_224");
              end
            get_mask = {{7{32'hffffffff}}, {9{32'h00000000}}};
          end

        MODE_SHA_512_256:
          begin
            if (DEBUG)
              begin
                $display("Mode MODE_SHA_512_256");
              end
            get_mask = {{8{32'hffffffff}}, {8{32'h00000000}}};
          end

        MODE_SHA_384:
          begin
            if (DEBUG)
              begin
                $display("Mode MODE_SHA_512_384");
              end
            get_mask = {{12{32'hffffffff}}, {4{32'h00000000}}};
          end

        MODE_SHA_512:
          begin
            if (DEBUG)
              begin
                $display("Mode MODE_SHA_512");
              end
            get_mask = {16{32'hffffffff}};
          end
      endcase // case (mode)
    end
  endfunction // get_mask


  //----------------------------------------------------------------
  // single_block_test()
  //
  //
  // Perform test of a single block digest.
  //----------------------------------------------------------------
  task single_block_test(input [7 : 0]    tc_number,
                         input [1 : 0]    mode,
                         input [1023 : 0] block,
                         input [511 : 0]  expected);

    reg [511 : 0] mask;
    reg [511 : 0] masked_data;

    begin
      $display("*** TC%01d - Single block test started.", tc_ctr);

      write_block(block);
      write_word(ADDR_CTRL, {28'h0000000, mode, CTRL_INIT_VALUE});
      #(CLK_PERIOD);
      wait_ready();
      read_digest();

      mask = get_mask(mode);
      masked_data = digest_data & mask;

      if (DEBUG)
        begin
          $display("masked_data = 0x%0128x", masked_data);
        end

      if (masked_data == expected)
        begin
          $display("TC%01d: OK.", tc_ctr);
        end
      else
        begin
          $display("TC%01d: ERROR.", tc_ctr);
          $display("TC%01d: Expected: 0x%0128x", tc_ctr, expected);
          $display("TC%01d: Got:      0x%0128x", tc_ctr, masked_data);
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
  task double_block_test(input [7 : 0]    tc_number,
                         input [1 : 0]    mode,
                         input [1023 : 0] block0,
                         input [1023 : 0] block1,
                         input [511 : 0]  expected0,
                         input [511 : 0]  expected1
                        );
    reg [511 : 0] mask;
    reg [511 : 0] masked_data1;
    reg [31 :  0] ctrl_cmd;

    begin
      $display("*** TC%01d - Double block test started.", tc_ctr);

      // First block
      write_block(block0);
      write_word(ADDR_CTRL, {28'h0000000, mode, CTRL_INIT_VALUE});
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
          $display("TC%01d: Expected: 0x%064x", tc_ctr, expected0);
          $display("TC%01d: Got:      0x%064x", tc_ctr, digest_data);
          error_ctr = error_ctr + 1;
        end

      // Final block
      write_block(block1);
      write_word(ADDR_CTRL, {28'h0000000, mode, CTRL_NEXT_VALUE});
      #(CLK_PERIOD);
      wait_ready();
      read_digest();

      mask = get_mask(mode);
      masked_data1 = digest_data & mask;

      if (masked_data1 == expected1)
        begin
          $display("TC%01d final block: OK.", tc_ctr);
        end
      else
        begin
          $display("TC%01d: ERROR in final digest", tc_ctr);
          $display("TC%01d: Expected: 0x%0128x", tc_ctr, expected1);
          $display("TC%01d: Got:      0x%0128x", tc_ctr, masked_data1);
          error_ctr = error_ctr + 1;
        end

      $display("*** TC%01d - Double block test done.", tc_ctr);
      tc_ctr = tc_ctr + 1;
    end
  endtask // double_block_test


  //----------------------------------------------------------------
  // work_factor_test()
  //
  // Perform test of the work factor function.
  //----------------------------------------------------------------
  task work_factor_test;
    reg [1023 : 0] my_block;
    reg [511 :  0] my_digest;
    reg [31 : 0]   my_ctrl_cmd;

    begin
      $display("*** TC%01d - Work factor test started.", tc_ctr);

      // Read out work factor number.
      read_word(ADDR_WORK_FACTOR_NUM);

      // Trying to change the work factor number.
      write_word(ADDR_WORK_FACTOR_NUM, 32'h00000003);
      read_word(ADDR_WORK_FACTOR_NUM);

      // Set block to all zero
      my_block = {16{64'h0000000000000000}};
      write_block(my_block);

      // Set init+ work factor. We use SHA-512 mode.
      my_ctrl_cmd = 32'h00000000 + (CTRL_WORK_FACTOR_VALUE << 7) +
                    (MODE_SHA_512 << 2) + CTRL_INIT_VALUE;
      write_word(ADDR_CTRL, my_ctrl_cmd);
      #(CLK_PERIOD);
      wait_ready();
      read_digest();

      $display("*** TC%01d - Work factor test done.", tc_ctr);
      tc_ctr = tc_ctr + 1;
    end
  endtask // work_factor_test


  //----------------------------------------------------------------
  // sha512_test
  // The main test functionality.
  //
  // Test cases taken from:
  // http://csrc.nist.gov/groups/ST/toolkit/documents/Examples/SHA_All.pdf
  //----------------------------------------------------------------
  initial
    begin : sha512_test
      reg [1024 : 0] single_block;
      reg [511 : 0]  tc1_expected;
      reg [511 : 0]  tc2_expected;
      reg [511 : 0]  tc3_expected;
      reg [511 : 0]  tc4_expected;

      reg [1024 : 0] double_block_one;
      reg [1024 : 0] double_block_two;
      reg [511 : 0]  tc5_expected;
      reg [511 : 0]  tc6_expected;
      reg [511 : 0]  tc7_expected;
      reg [511 : 0]  tc8_expected;
      reg [511 : 0]  tc9_expected;
      reg [511 : 0]  tc10_expected;
      reg [511 : 0]  tc11_expected;
      reg [511 : 0]  tc12_expected;

      $display("   -- Testbench for sha512 started --");

      init_sim();
      reset_dut();
      check_name_version();

      // dump_dut_state();
      // write_word(ADDR_BLOCK0, 32'hdeadbeef);
      dump_dut_state();
      // read_word(ADDR_BLOCK0);
      // dump_dut_state();

      // Single block test mesage.
      single_block = 1024'h6162638000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018;

      // SHA-512 single block digest and test.
      tc1_expected = 512'hDDAF35A193617ABACC417349AE20413112E6FA4E89A97EA20A9EEEE64B55D39A2192992A274FC1A836BA3C23A3FEEBBD454D4423643CE80E2A9AC94FA54CA49F;
      single_block_test(8'h01, MODE_SHA_512, single_block, tc1_expected);

      // SHA-512_224 single block digest and test.
      tc2_expected = {224'h4634270F707B6A54DAAE7530460842E20E37ED265CEEE9A43E8924AA, {9{32'h00000000}}};
      single_block_test(8'h02, MODE_SHA_512_224, single_block, tc2_expected);

      // SHA-512_256 single block digest and test.
      tc3_expected = {256'h53048E2681941EF99B2E29B76B4C7DABE4C2D0C634FC6D46E0E2F13107E7AF23, {8{32'h00000000}}};
      single_block_test(8'h03, MODE_SHA_512_256, single_block, tc3_expected);

      // SHA-384 single block digest and test.
      tc4_expected = {384'hCB00753F45A35E8BB5A03D699AC65007272C32AB0EDED1631A8B605A43FF5BED8086072BA1E7CC2358BAECA134C825A7, {4{32'h00000000}}};
      single_block_test(8'h04, MODE_SHA_384, single_block, tc4_expected);


      // Two block test message.
      double_block_one = 1024'h61626364656667686263646566676869636465666768696A6465666768696A6B65666768696A6B6C666768696A6B6C6D6768696A6B6C6D6E68696A6B6C6D6E6F696A6B6C6D6E6F706A6B6C6D6E6F70716B6C6D6E6F7071726C6D6E6F707172736D6E6F70717273746E6F70717273747580000000000000000000000000000000;
      double_block_two = 1024'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000380;

      // SHA-512 two block digests and test.
      tc5_expected = 512'h4319017A2B706E69CD4B05938BAE5E890186BF199F30AA956EF8B71D2F810585D787D6764B20BDA2A26014470973692000EC057F37D14B8E06ADD5B50E671C72;
      tc6_expected = 512'h8E959B75DAE313DA8CF4F72814FC143F8F7779C6EB9F7FA17299AEADB6889018501D289E4900F7E4331B99DEC4B5433AC7D329EEB6DD26545E96E55B874BE909;
      double_block_test(8'h05, MODE_SHA_512, double_block_one, double_block_two, tc5_expected, tc6_expected);

      // SHA-512_224 two block digests and test.
      tc7_expected = 512'h9606CB2DB7823CE75FE35E2674A8F9EF1417ED9E89C412BB54EA29664586108625852563EED495096DEBAAE2F4737FD75319224B135486F8E6C0F55E700C35B3;
      tc8_expected = {224'h23FEC5BB94D60B23308192640B0C453335D664734FE40E7268674AF9, {9{32'h00000000}}};
      double_block_test(8'h06, MODE_SHA_512_224, double_block_one, double_block_two, tc7_expected, tc8_expected);

      // SHA-512_256 two block digests and test.
      tc9_expected = 512'h8DD99EB081311F8BCBBBC42CC7AFB288E8E9408730419D1E953FF7A2B194048DAE24175483C44C7C809B348E8E88E3ECBF2EA614CEED9C5B51807937F11867E1;
      tc10_expected = {256'h3928E184FB8690F840DA3988121D31BE65CB9D3EF83EE6146FEAC861E19B563A, {8{32'h00000000}}};
      double_block_test(8'h07, MODE_SHA_512_256, double_block_one, double_block_two, tc9_expected, tc10_expected);

      // SHA-384 two block digests and test.
      tc11_expected = 512'h2A7F1D895FD58E0BEAAE96D1A673C741015A2173796C1A88F6352CA156ACAFF7C662113E9EBB4D6417B61A85E2CCF0A937EB9A6660FEB5198F2EBE9A81E6A2C5;
      tc12_expected = {384'h09330C33F71147E83D192FC782CD1B4753111B173B3B05D22FA08086E3B0F712FCC7C71A557E2DB966C3E9FA91746039, {4{32'h00000000}}};
      double_block_test(8'h08, MODE_SHA_384, double_block_one, double_block_two, tc11_expected, tc12_expected);

      // Work factor test.
      work_factor_test();

      dump_dut_state();

      display_test_result();

      $display("   -- Testbench for sha512 done. --");
      $finish;
    end // sha512_test
endmodule // tb_sha512

//======================================================================
// EOF tb_sha512.v
//======================================================================
