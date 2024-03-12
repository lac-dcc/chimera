//======================================================================
//
// Tb_sha1_w_mem.v
// ---------------
// Testbench for the SHA-1 W memory module.
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

module tb_sha1_w_mem();


  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  parameter DEBUG          = 1;
  parameter DISPLAY_CYCLES = 0;

  parameter CLK_HALF_PERIOD = 2;


  //----------------------------------------------------------------
  // Registers including update variables and write enable.
  //----------------------------------------------------------------


  //----------------------------------------------------------------
  // Wires.
  //----------------------------------------------------------------
  reg           tb_clk;
  reg           tb_reset_n;
  reg           tb_init;
  reg           tb_next;
  reg [511 : 0] tb_block;
  wire [31 : 0] tb_w;

  reg [63 : 0]  cycle_ctr;
  reg [31 : 0]  error_ctr;
  reg [31 : 0]  tc_ctr;


  //----------------------------------------------------------------
  // Device Under Test.
  //----------------------------------------------------------------
  sha1_w_mem dut(
                 .clk(tb_clk),
                 .reset_n(tb_reset_n),

                 .block(tb_block),

                 .init(tb_init),
                 .next(tb_next),

                 .w(tb_w)
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

      if (DISPLAY_CYCLES)
        begin
          $display("cycle = %016x:", cycle_ctr);
        end

      if (DEBUG)
        begin
          dump_w_state();
        end
    end // dut_monitor


  //----------------------------------------------------------------
  // dump_w_state()
  //
  // Dump the current state of all W registers.
  //----------------------------------------------------------------
  task dump_w_state;
    begin
      $display("W state:");


      $display("w_ctr_reg = %02x, init = %01x, next = %01x",
               dut.w_ctr_reg, dut.init, dut.next);

      $display("w_tmp   = %08x, w_new   = %08x", dut.w_tmp, dut.w_new);

      $display("w0_reg  = %08x, w1_reg  = %08x, w2_reg  = %08x, w3_reg  = %08x",
               dut.w_mem[00], dut.w_mem[01], dut.w_mem[02], dut.w_mem[03]);

      $display("w4_reg  = %08x, w5_reg  = %08x, w6_reg  = %08x, w7_reg  = %08x",
               dut.w_mem[04], dut.w_mem[05], dut.w_mem[06], dut.w_mem[07]);

      $display("w8_reg  = %08x, w9_reg  = %08x, w10_reg = %08x, w11_reg = %08x",
               dut.w_mem[08], dut.w_mem[09], dut.w_mem[10], dut.w_mem[11]);

      $display("w12_reg = %08x, w13_reg = %08x, w14_reg = %08x, w15_reg = %08x",
               dut.w_mem[12], dut.w_mem[13], dut.w_mem[14], dut.w_mem[15]);

      $display("");
    end
  endtask // dump_state


  //----------------------------------------------------------------
  // reset_dut
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
  // init_sim
  //----------------------------------------------------------------
  task init_sim;
    begin
      $display("*** Simulation init.");
      tb_clk     = 0;
      tb_reset_n = 1;
      cycle_ctr  = 0;
      tb_init    = 0;
      tb_next    = 0;
      tb_block   = 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    end
  endtask // reset_dut


  //----------------------------------------------------------------
  // dump_mem()
  //
  // Dump the contents of the memory by directly reading from
  // the registers in the dut, not via the read port.
  //----------------------------------------------------------------
  task dump_mem;
    begin
      $display("*** Dumping memory:");
      $display("W[00] = 0x%08x", dut.w_mem[00]);
      $display("W[01] = 0x%08x", dut.w_mem[01]);
      $display("W[02] = 0x%08x", dut.w_mem[02]);
      $display("W[03] = 0x%08x", dut.w_mem[03]);
      $display("W[04] = 0x%08x", dut.w_mem[04]);
      $display("W[05] = 0x%08x", dut.w_mem[05]);
      $display("W[06] = 0x%08x", dut.w_mem[06]);
      $display("W[07] = 0x%08x", dut.w_mem[07]);
      $display("W[08] = 0x%08x", dut.w_mem[08]);
      $display("W[09] = 0x%08x", dut.w_mem[09]);
      $display("W[10] = 0x%08x", dut.w_mem[10]);
      $display("W[11] = 0x%08x", dut.w_mem[11]);
      $display("W[12] = 0x%08x", dut.w_mem[12]);
      $display("W[13] = 0x%08x", dut.w_mem[13]);
      $display("W[14] = 0x%08x", dut.w_mem[14]);
      $display("W[15] = 0x%08x", dut.w_mem[15]);
      $display("");
    end
  endtask // dump_mem


  //----------------------------------------------------------------
  // test_w_schedule()
  //
  // Test that W scheduling happens and work correctly.
  // Note: Currently not a self checking test case.
  //----------------------------------------------------------------
  task test_w_schedule;
    begin
      $display("*** Test of W schedule processing. --");
      tb_block = 512'h61626380000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018;
      tb_init = 1;
      #(4 * CLK_HALF_PERIOD);
      tb_init = 0;

      tb_next = 1;
      #(200 * CLK_HALF_PERIOD);

      dump_w_state();
    end
  endtask // test_w_schedule


  //----------------------------------------------------------------
  // test_read_w/(
  //
  // Test that we can read data from all W registers.
  // Note: Currently not a self checking test case.
  //----------------------------------------------------------------
  task test_read_w;
    reg [7 : 0] i;
    begin
      $display("*** Test of W read operations. --");
      i = 0;
      tb_init = 1;
      #(2 * CLK_HALF_PERIOD);
      tb_init = 0;

      while (i < 80)
        begin
          tb_next = i;
          $display("API: w%02x = 0x%02x", i, dut.w_tmp);
          i = i + 1;
          #(2 * CLK_HALF_PERIOD);
        end
    end
  endtask // read_w


  //----------------------------------------------------------------
  // The main test functionality.
  //----------------------------------------------------------------
  initial
    begin : w_mem_test
      $display("   -- Testbench for sha1 w memory started --");
      init_sim();

      dump_mem();
      reset_dut();
      dump_mem();

      test_w_schedule();

      test_read_w();

      $display("*** Simulation done.");
      $finish;
    end

endmodule // w_mem_test

//======================================================================
// EOF tb_sha1_w_mem.v
//======================================================================
