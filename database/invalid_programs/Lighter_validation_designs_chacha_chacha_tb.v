//======================================================================
//
// tb_chacha.v
// -----------
// Testbench for the Chacha top level wrapper.
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

`include "includes/primitives.v"
`include "includes/sky130_hd.v"


module tb_chacha();

  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  parameter DEBUG = 0;

  localparam CLK_HALF_PERIOD = 1;
  localparam CLK_PERIOD = 2 * CLK_HALF_PERIOD;

  localparam TC1  = 1;
  localparam TC2  = 2;
  localparam TC3  = 3;
  localparam TC4  = 4;
  localparam TC5  = 5;
  localparam TC6  = 6;
  localparam TC7  = 7;
  localparam TC8  = 8;
  localparam TC9  = 9;
  localparam TC10 = 10;

  localparam ONE   = 1;
  localparam TWO   = 2;
  localparam THREE = 3;
  localparam FOUR  = 4;
  localparam FIVE  = 5;
  localparam SIX   = 6;
  localparam SEVEN = 7;
  localparam EIGHT = 8;

  localparam KEY_128_BITS = 0;
  localparam KEY_256_BITS = 1;

  localparam EIGHT_ROUNDS  = 8;
  localparam TWELWE_ROUNDS = 12;
  localparam TWENTY_ROUNDS = 20;

  localparam DISABLE = 0;
  localparam ENABLE  = 1;

  // API for the dut.
  localparam ADDR_NAME0       = 8'h00;
  localparam ADDR_NAME1       = 8'h01;
  localparam ADDR_VERSION     = 8'h02;

  localparam ADDR_CTRL        = 8'h08;
  localparam CTRL_INIT_BIT    = 0;
  localparam CTRL_NEXT_BIT    = 1;

  localparam ADDR_STATUS      = 8'h09;
  localparam STATUS_READY_BIT = 0;

  localparam ADDR_KEYLEN      = 8'h0a;
  localparam KEYLEN_BIT       = 0;
  localparam ADDR_ROUNDS      = 8'h0b;
  localparam ROUNDS_HIGH_BIT  = 4;
  localparam ROUNDS_LOW_BIT   = 0;

  localparam ADDR_KEY0        = 8'h10;
  localparam ADDR_KEY1        = 8'h11;
  localparam ADDR_KEY2        = 8'h12;
  localparam ADDR_KEY3        = 8'h13;
  localparam ADDR_KEY4        = 8'h14;
  localparam ADDR_KEY5        = 8'h15;
  localparam ADDR_KEY6        = 8'h16;
  localparam ADDR_KEY7        = 8'h17;

  localparam ADDR_IV0         = 8'h20;
  localparam ADDR_IV1         = 8'h21;

  localparam ADDR_DATA_IN0    = 8'h40;
  localparam ADDR_DATA_IN15   = 8'h4f;

  localparam ADDR_DATA_OUT0   = 8'h80;
  localparam ADDR_DATA_OUT1   = 8'h81;
  localparam ADDR_DATA_OUT2   = 8'h82;
  localparam ADDR_DATA_OUT3   = 8'h83;
  localparam ADDR_DATA_OUT4   = 8'h84;
  localparam ADDR_DATA_OUT5   = 8'h85;
  localparam ADDR_DATA_OUT6   = 8'h86;
  localparam ADDR_DATA_OUT7   = 8'h87;
  localparam ADDR_DATA_OUT8   = 8'h88;
  localparam ADDR_DATA_OUT9   = 8'h89;
  localparam ADDR_DATA_OUT10  = 8'h8a;
  localparam ADDR_DATA_OUT11  = 8'h8b;
  localparam ADDR_DATA_OUT12  = 8'h8c;
  localparam ADDR_DATA_OUT13  = 8'h8d;
  localparam ADDR_DATA_OUT14  = 8'h8e;
  localparam ADDR_DATA_OUT15  = 8'h8f;


  //----------------------------------------------------------------
  // Register and Wire declarations.
  //----------------------------------------------------------------
  reg tb_clk;
  reg tb_reset_n;

  reg           tb_cs;
  reg           tb_write_read;

  reg  [7 : 0]  tb_address;
  reg  [31 : 0] tb_data_in;
  wire [31 : 0] tb_data_out;
  wire          tb_error;

  reg [63 : 0] cycle_ctr;
  reg [31 : 0] error_ctr;
  reg [31 : 0] tc_ctr;

  reg          error_found;
  reg [31 : 0] read_data;

  reg [511 : 0] extracted_data;

  reg display_cycle_ctr;
  reg display_read_write;
  reg display_core_state;





  //----------------------------------------------------------------
  // Chacha device under test.
  //----------------------------------------------------------------
  chacha dut(
             .clk(tb_clk),
             .reset_n(tb_reset_n),
             .cs(tb_cs),
             .we(tb_write_read),
             .addr(tb_address),
             .write_data(tb_data_in),
             .read_data(tb_data_out)
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

      if (display_core_state)
        begin
        //  $display("core ctrl: 0x%02x, core_qr_ctr: 0x%02x, core_dr_ctr: 0x%02x, init: 0x%01x, next: 0x%01x, core_ready: 0x%02x",
        //           dut.core.chacha_ctrl_reg, dut.core.qr_ctr_reg,
        //           dut.core.dr_ctr_reg, dut.core.init,
        //           dut.core.next, dut.core.\ready_reg );

        //  $display("state0_reg  = 0x%08x, state1_reg  = 0x%08x, state2_reg  = 0x%08x, state3_reg  = 0x%08x",
        //           dut.core.\state_reg[0] ,
        //            dut.core.\state_reg[1] ,
        //             dut.core.\state_reg[2] ,
        //              dut.core.\state_reg[3] );
        //  $display("state4_reg  = 0x%08x, state5_reg  = 0x%08x, state6_reg  = 0x%08x, state7_reg  = 0x%08x",
        //           dut.core.\state_reg[4] , dut.core.\state_reg[5] , dut.core.\state_reg[6] , dut.core.\state_reg[7] );
        //  $display("state8_reg  = 0x%08x, state9_reg  = 0x%08x, state10_reg = 0x%08x, state11_reg = 0x%08x",
        //           dut.core.\state_reg[8] , dut.core.\state_reg[9] , dut.core.\state_reg[10] , dut.core.\state_reg[11] );
        //  $display("state12_reg = 0x%08x, state13_reg = 0x%08x, state14_reg = 0x%08x, state15_reg = 0x%08x",
        //           dut.core.\state_reg[12] , dut.core.\state_reg[13] , dut.core.\state_reg[14] , dut.core.\state_reg[15] );
        //  $display("");
        end

      if (display_read_write)
        begin

          if (dut.cs)
            begin
              if (dut.we)
                begin
                  $display("*** Write acess: addr 0x%02x = 0x%08x", dut.addr, dut.write_data);
                end
              else
                begin
                  $display("*** Read acess: addr 0x%02x = 0x%08x", dut.addr, dut.read_data);
                end
            end
        end

    end // dut_monitor


  //----------------------------------------------------------------
  // reset_dut
  //----------------------------------------------------------------
  task reset_dut;
    begin
      tb_reset_n = 0;
      #(2 * CLK_PERIOD);
      tb_reset_n = 1;
    end
  endtask // reset_dut


  //----------------------------------------------------------------
  // init_sim()
  //
  // Set the input to the DUT to defined values.
  //----------------------------------------------------------------
  task init_sim;
    begin
      cycle_ctr     = 0;
      error_ctr     = 0;
      tc_ctr        = 0;
      tb_clk        = 0;
      tb_reset_n    = 0;
      tb_cs         = 0;
      tb_write_read = 0;
      tb_address    = 8'h0;
      tb_data_in    = 32'h0;

      display_cycle_ctr  = 0;
      display_read_write = 0;
      display_core_state = 0;
    end
  endtask // init_sim


  //----------------------------------------------------------------
  // read_reg
  //
  // Task that reads and display the value of
  // a register in the dut.
  //----------------------------------------------------------------
  task read_reg(input [7 : 0] addr);
    begin
      tb_cs         = 1;
      tb_write_read = 0;
      tb_address    = addr;
      #(CLK_PERIOD);
      tb_cs         = 0;
      tb_write_read = 0;
      tb_address    = 8'h0;
      tb_data_in    = 32'h0;
    end
  endtask // read_reg


  //----------------------------------------------------------------
  // write_reg
  //
  // Task that writes to a register in the dut.
  //----------------------------------------------------------------
  task write_reg(input [7 : 0] addr, input [31 : 0] data);
    begin
      tb_cs         = 1;
      tb_write_read = 1;
      tb_address    = addr;
      tb_data_in    = data;
      #(CLK_PERIOD);
      tb_cs         = 0;
      tb_write_read = 0;
      tb_address    = 8'h0;
      tb_data_in    = 32'h0;
    end
  endtask // write_reg


  //----------------------------------------------------------------
  // dump_top_state
  //
  // Dump the internal state of the top to std out.
  //----------------------------------------------------------------
  task dump_top_state;
    begin
    //  $display("");
    //  $display("Top internal state");
    //  $display("------------------");
    //  $display("init_reg   = %01x", dut.init_reg);
    //  $display("next_reg   = %01x", dut.next_reg);
    //  $display("keylen_reg = %01x", dut.keylen_reg);
    //  $display("rounds_reg = %01x", dut.rounds_reg);
    //  $display("");

    //  $display("key0_reg = %08x, key1_reg  = %08x, key2_reg = %08x, key3_reg  = %08x",
    //           \dut.key_reg[0] ,
    //            \dut.key_reg[1] , \dut.key_reg[2] , \dut.key_reg[3] );
    //  $display("key4_reg = %08x, key5_reg  = %08x, key6_reg = %08x, key7_reg  = %08x",
    //           \dut.key_reg[4] , \dut.key_reg[5] , \dut.key_reg[6] , \dut.key_reg[7] );
    //  $display("");

    //  $display("iv0_reg = %08x, iv1_reg = %08x", dut.iv_reg[0], dut.iv_reg[1]);
    //  $display("");

    //  $display("data_in0_reg  = %08x, data_in1_reg   = %08x, data_in2_reg  = %08x, data_in3_reg   = %08x",
    //           dut.\data_in_reg[00] , dut.\data_in_reg[01] , dut.\data_in_reg[02] , dut.\data_in_reg[03] );
    //  $display("data_in4_reg  = %08x, data_in5_reg   = %08x, data_in6_reg  = %08x, data_in7_reg   = %08x",
    //           dut.\data_in_reg[04] , dut.\data_in_reg[05] , dut.\data_in_reg[06] , dut.\data_in_reg[07] );
    //  $display("data_in8_reg  = %08x, data_in9_reg   = %08x, data_in10_reg = %08x, data_in11_reg  = %08x",
    //           dut.\data_in_reg[08] , dut.\data_in_reg[09] , dut.\data_in_reg[10] , dut.\data_in_reg[11] );
    //  $display("data_in12_reg = %08x, data_in13_reg  = %08x, data_in14_reg = %08x, data_in15_reg  = %08x",
    //           dut.\data_in_reg[12] , dut.\data_in_reg[13] , dut.\data_in_reg[14] , dut.\data_in_reg[15] );
    //  $display("");

    //  $display("ready = 0x%01x, data_out_valid = %01x", dut.core_ready, dut.core_data_out_valid);
    //  $display("data_out00 = %08x, data_out01 = %08x, data_out02 = %08x, data_out03 = %08x",
    //           dut.core_data_out[511 : 480], dut.core_data_out[479 : 448],
    //           dut.core_data_out[447 : 416], dut.core_data_out[415 : 384]);
    //  $display("data_out04 = %08x, data_out05 = %08x, data_out06 = %08x, data_out07 = %08x",
    //           dut.core_data_out[383 : 352], dut.core_data_out[351 : 320],
    //           dut.core_data_out[319 : 288], dut.core_data_out[287 : 256]);
    //  $display("data_out08 = %08x, data_out09 = %08x, data_out10 = %08x, data_out11 = %08x",
    //           dut.core_data_out[255 : 224], dut.core_data_out[223 : 192],
    //           dut.core_data_out[191 : 160], dut.core_data_out[159 : 128]);
    //  $display("data_out12 = %08x, data_out13 = %08x, data_out14 = %08x, data_out15 = %08x",
    //           dut.core_data_out[127 :  96], dut.core_data_out[95  :  64],
    //           dut.core_data_out[63  :  32], dut.core_data_out[31  :   0]);
      $display("");
    end
  endtask // dump_top_state






  //----------------------------------------------------------------
  // dump_core_state
  //
  // Dump the internal state of the core to std out.
  //----------------------------------------------------------------
  task dump_core_state;
    begin
    //  $display("");
    //  $display("Core internal state");
    //  $display("-------------------");
    //  $display("Round state:");
    //  $display("state0_reg  = 0x%08x, state1_reg  = 0x%08x, state2_reg  = 0x%08x, state3_reg  = 0x%08x",
    //           dut.core.\state_reg[0] , dut.core.\state_reg[1] , dut.core.\state_reg[2] , dut.core.\state_reg[3] );
    //  $display("state4_reg  = 0x%08x, state5_reg  = 0x%08x, state6_reg  = 0x%08x, state7_reg  = 0x%08x",
    //           dut.core.\state_reg[4] , dut.core.\state_reg[5] , dut.core.\state_reg[6] , dut.core.\state_reg[7] );
    //  $display("state8_reg  = 0x%08x, state9_reg  = 0x%08x, state10_reg = 0x%08x, state11_reg = 0x%08x",
    //           dut.core.\state_reg[8] , dut.core.\state_reg[9] , dut.core.\state_reg[10] , dut.core.\state_reg[11] );
    //  $display("state12_reg = 0x%08x, state13_reg = 0x%08x, state14_reg = 0x%08x, state15_reg = 0x%08x",
    //           dut.core.\state_reg[12] , dut.core.\state_reg[13] , dut.core.\state_reg[14] , dut.core.\state_reg[15] );
    //  $display("");

    //  $display("rounds = %01x", dut.core.rounds);
    //  $display("qr_ctr_reg = %01x, dr_ctr_reg  = %01x", dut.core.qr_ctr_reg, dut.core.dr_ctr_reg);
    //  $display("block0_ctr_reg = %08x, block1_ctr_reg = %08x", dut.core.block0_ctr_reg, dut.core.block1_ctr_reg);

    //  $display("");

    //  $display("chacha_ctrl_reg = %02x", dut.core.chacha_ctrl_reg);
    //  $display("");

    //  $display("data_in = %064x", dut.core.data_in);
    ////  $display("data_out_valid_reg = %01x", dut.core.data_out_valid_reg);
    //  $display("");

    //  $display("qr0_a_prim = %08x, qr0_b_prim = %08x", dut.core.qr0_a_prim, dut.core.qr0_b_prim);
    //  $display("qr0_c_prim = %08x, qr0_d_prim = %08x", dut.core.qr0_c_prim, dut.core.qr0_d_prim);
    //  $display("");
    end
  endtask // dump_core_state


  //----------------------------------------------------------------
  // display_test_result()
  //
  // Display the accumulated test results.
  //----------------------------------------------------------------
  task display_test_result;
    begin
      if (error_ctr == 0)
        begin
          $display("*** All %02d test cases completed successfully", tc_ctr);
        end
      else
        begin
          $display("*** %02d test cases FAILED .", error_ctr);
        end
    end
  endtask // display_test_result


  //----------------------------------------------------------------
  // read_write_test()
  //
  // Simple test case that tries to read and write to the
  // registers in the dut.
  //
  // Note: Currently not self testing. No expected values.
  //----------------------------------------------------------------
  task read_write_test;
    begin
      tc_ctr = tc_ctr + 1;

      write_reg(ADDR_KEY0, 32'h55555555);
      read_reg(ADDR_KEY0);
      write_reg(ADDR_KEY1, 32'haaaaaaaa);
      read_reg(ADDR_KEY1);
      read_reg(ADDR_CTRL);
      read_reg(ADDR_STATUS);
      read_reg(ADDR_KEYLEN);
      read_reg(ADDR_ROUNDS);

      read_reg(ADDR_KEY0);
      read_reg(ADDR_KEY1);
      read_reg(ADDR_KEY2);
      read_reg(ADDR_KEY3);
      read_reg(ADDR_KEY4);
      read_reg(ADDR_KEY5);
      read_reg(ADDR_KEY6);
      read_reg(ADDR_KEY7);
    end
  endtask // read_write_test


  //----------------------------------------------------------------
  // write_localparams()
  //
  // Write key, iv and other parameters to the dut.
  //----------------------------------------------------------------
  task write_parameters(input [256 : 0] key,
                            input           key_length,
                            input [64 : 0]  iv,
                            input [4 : 0]   rounds);
    begin
      write_reg(ADDR_KEY0, key[255 : 224]);
      write_reg(ADDR_KEY1, key[223 : 192]);
      write_reg(ADDR_KEY2, key[191 : 160]);
      write_reg(ADDR_KEY3, key[159 : 128]);
      write_reg(ADDR_KEY4, key[127 :  96]);
      write_reg(ADDR_KEY5, key[95  :  64]);
      write_reg(ADDR_KEY6, key[63  :  32]);
      write_reg(ADDR_KEY7, key[31 :    0]);
      write_reg(ADDR_IV0, iv[63 : 32]);
      write_reg(ADDR_IV1, iv[31 : 0]);
      write_reg(ADDR_KEYLEN, {{31'h0}, key_length});
      write_reg(ADDR_ROUNDS, {{27'h0}, rounds});
    end
  endtask // write_parameters


  //----------------------------------------------------------------
  // start_init_block()
  //
  // Toggle the init signal in the dut to make it start processing
  // the first block available in the data in registers.
  //
  // Note: It is the callers responsibility to call the function
  // when the dut is ready to react on the init signal.
  //----------------------------------------------------------------
  task start_init_block;
    begin
      write_reg(ADDR_CTRL, 32'h00000001);
      #(2 * CLK_PERIOD);
      write_reg(ADDR_CTRL, 32'h00000000);
    end
  endtask // start_init_block


  //----------------------------------------------------------------
  // start_next_block()
  //
  // Toggle the next signal in the dut to make it start processing
  // the next block available in the data in registers.
  //
  // Note: It is the callers responsibility to call the function
  // when the dut is ready to react on the next signal.
  //----------------------------------------------------------------
  task start_next_block;
    begin
      write_reg(ADDR_CTRL, 32'h00000002);
      #(2 * CLK_PERIOD);
      write_reg(ADDR_CTRL, 32'h00000000);

      if (DEBUG)
        begin
          $display("Debug of next state.");
          dump_core_state();
          #(2 * CLK_PERIOD);
          dump_core_state();
        end
    end
  endtask // start_next_block


  //----------------------------------------------------------------
  // wait_ready()
  //
  // Wait for the ready flag in the dut to be set.
  //
  // Note: It is the callers responsibility to call the function
  // when the dut is actively processing and will in fact at some
  // point set the flag.
  //----------------------------------------------------------------
  task wait_ready;
    begin
      while (!tb_data_out[STATUS_READY_BIT])
        begin
          read_reg(ADDR_STATUS);
        end
    end
  endtask // wait_ready


  //----------------------------------------------------------------
  // extract_data()
  //
  // Extracts all 16 data out words and combine them into the
  // global extracted_data.
  //----------------------------------------------------------------
  task extract_data;
    begin
      read_reg(ADDR_DATA_OUT0);
      extracted_data[511 : 480] = tb_data_out;
      read_reg(ADDR_DATA_OUT1);
      extracted_data[479 : 448] = tb_data_out;
      read_reg(ADDR_DATA_OUT2);
      extracted_data[447 : 416] = tb_data_out;
      read_reg(ADDR_DATA_OUT3);
      extracted_data[415 : 384] = tb_data_out;
      read_reg(ADDR_DATA_OUT4);
      extracted_data[383 : 352] = tb_data_out;
      read_reg(ADDR_DATA_OUT5);
      extracted_data[351 : 320] = tb_data_out;
      read_reg(ADDR_DATA_OUT6);
      extracted_data[319 : 288] = tb_data_out;
      read_reg(ADDR_DATA_OUT7);
      extracted_data[287 : 256] = tb_data_out;
      read_reg(ADDR_DATA_OUT8);
      extracted_data[255 : 224] = tb_data_out;
      read_reg(ADDR_DATA_OUT9);
      extracted_data[223 : 192] = tb_data_out;
      read_reg(ADDR_DATA_OUT10);
      extracted_data[191 : 160] = tb_data_out;
      read_reg(ADDR_DATA_OUT11);
      extracted_data[159 : 128] = tb_data_out;
      read_reg(ADDR_DATA_OUT12);
      extracted_data[127 :  96] = tb_data_out;
      read_reg(ADDR_DATA_OUT13);
      extracted_data[95  :  64] = tb_data_out;
      read_reg(ADDR_DATA_OUT14);
      extracted_data[63  :  32] = tb_data_out;
      read_reg(ADDR_DATA_OUT15);
      extracted_data[31  :   0] = tb_data_out;
    end
  endtask // extract_data


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
      $display("*** Trying to read name and version from core.");
      read_reg(ADDR_NAME0);
      name0 = tb_data_out;
      read_reg(ADDR_NAME1);
      name1 = tb_data_out;
      read_reg(ADDR_VERSION);
      version = tb_data_out;

      $display("DUT name: %c%c%c%c%c%c%c%c",
               name0[31 : 24], name0[23 : 16], name0[15 : 8], name0[7 : 0],
               name1[31 : 24], name1[23 : 16], name1[15 : 8], name1[7 : 0]);
      $display("DUT version: %c%c%c%c",
               version[31 : 24], version[23 : 16], version[15 : 8], version[7 : 0]);
      $display("");
    end
  endtask // check_name_version


  //----------------------------------------------------------------
  // run_two_blocks_test_vector()
  //
  // Runs a test case with two blocks based on the given
  // test vector. Only the final block is compared.
  //----------------------------------------------------------------
  task run_two_blocks_test_vector(input [7 : 0]   major,
                                  input [7 : 0]   minor,
                                  input [256 : 0] key,
                                  input           key_length,
                                  input [64 : 0]  iv,
                                  input [4 : 0]   rounds,
                                  input [511 : 0] expected);
    begin
      tc_ctr = tc_ctr + 1;

      $display("***TC%2d-%2d started", major, minor);
      $display("***-----------------");
      write_parameters(key, key_length, iv, rounds);
      start_init_block();
      wait_ready();
      extract_data();

      if (DEBUG)
        begin
          $display("State after first block:");
          dump_core_state();

          $display("First block:");
          $display("0x%064x", extracted_data);
        end

      start_next_block();

      if (DEBUG)
        begin
          $display("State after init of second block:");
          dump_core_state();
        end

      wait_ready();
      extract_data();

      if (DEBUG)
        begin
          $display("State after init of second block:");
          dump_core_state();

          $display("Second block:");
          $display("0x%064x", extracted_data);
        end

      if (extracted_data != expected)
        begin
          error_ctr = error_ctr + 1;
          $display("***TC%2d-%2d - ERROR", major, minor);
          $display("***-----------------");
          $display("Expected:");
          $display("0x%064x", expected);
          $display("Got:");
          $display("0x%064x", extracted_data);
        end
      else
        begin
          $display("***TC%2d-%2d - SUCCESS", major, minor);
          $display("***-------------------");
        end
      $display("");
    end
  endtask // run_two_blocks_test_vector


  //----------------------------------------------------------------
  // run_test_vector()
  //
  // Runs a test case based on the given test vector.
  //----------------------------------------------------------------
  task run_test_vector(input [7 : 0]   major,
                       input [7 : 0]   minor,
                       input [256 : 0] key,
                       input           key_length,
                       input [64 : 0]  iv,
                       input [4 : 0]   rounds,
                       input [511 : 0] expected);
    begin
      tc_ctr = tc_ctr + 1;

      $display("***TC%2d-%2d started", major, minor);
      $display("***-----------------");
      write_parameters(key, key_length, iv, rounds);

      start_init_block();
      $display("*** Started.");
      wait_ready();
      $display("*** Ready seen.");
      dump_top_state();
      extract_data();

      if (extracted_data != expected)
        begin
          error_ctr = error_ctr + 1;
          $display("***TC%2d-%2d - ERROR", major, minor);
          $display("***-----------------");
          $display("Expected:");
          $display("0x%064x", expected);
          $display("Got:");
          $display("0x%064x", extracted_data);
        end
      else
        begin
          $display("***TC%2d-%2d - SUCCESS", major, minor);
          $display("***-------------------");
        end
      $display("");
    end
  endtask // run_test_vector


  //----------------------------------------------------------------
  // chacha_test
  // The main test functionality.
  //----------------------------------------------------------------
  initial
    begin : chacha_test
      $display("   -- Testbench for chacha started --");
      init_sim();
      reset_dut();

      $display("State at init after reset:");
      dump_top_state();

      // Check name and version.
      check_name_version();

      $display("TC1-1: All zero inputs. 128 bit key, 8 rounds.");
      run_test_vector(TC1, ONE,
                    256'h0,
                    KEY_128_BITS,
                    64'h0,
                    EIGHT_ROUNDS,
                    512'he28a5fa4a67f8c5defed3e6fb7303486aa8427d31419a729572d777953491120b64ab8e72b8deb85cd6aea7cb6089a101824beeb08814a428aab1fa2c816081b);

      $display("TC7-2: Increasing, decreasing sequences in key and IV. 256 bit key, 8 rounds.");
      run_test_vector(TC7, TWO,
                    256'h00112233445566778899aabbccddeeffffeeddccbbaa99887766554433221100,
                    KEY_256_BITS,
                    64'h0f1e2d3c4b596877,
                    EIGHT_ROUNDS,
                    512'h60fdedbd1a280cb741d0593b6ea0309010acf18e1471f68968f4c9e311dca149b8e027b47c81e0353db013891aa5f68ea3b13dd2f3b8dd0873bf3746e7d6c567);


      $display("TC7-3: Increasing, decreasing sequences in key and IV. 256 bit key, 8 rounds.");
      $display("TC7-3: Testing correct second block.");
      run_two_blocks_test_vector(TC7, THREE,
                                 256'h00112233445566778899aabbccddeeffffeeddccbbaa99887766554433221100,
                                 KEY_256_BITS,
                                 64'h0f1e2d3c4b596877,
                                 EIGHT_ROUNDS,
                                 512'hfe882395601ce8aded444867fe62ed8741420002e5d28bb573113a418c1f4008e954c188f38ec4f26bb8555e2b7c92bf4380e2ea9e553187fdd42821794416de);


      display_test_result();
      $display("*** chacha simulation done.");
      $finish;
    end // chacha_test




//initial begin
//    $display("*******in here*******");
  
//    $monitor("tb_data_out=0x%0h",tb_data_out);
////, expected=0x%0h
//        $display("*******in here*******");

//end


endmodule // tb_chacha

//======================================================================
// EOF tb_chacha.v
//======================================================================
