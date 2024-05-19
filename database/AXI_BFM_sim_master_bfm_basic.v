// This program was cloned from: https://github.com/ptracton/AXI_BFM
// License: MIT License

//                              -*- Mode: Verilog -*-
// Filename        : basic.v
// Description     : Basic Test Case
// Author          : Philip Tracton
// Created On      : Fri Dec  9 20:43:36 2016
// Last Modified By: Philip Tracton
// Last Modified On: Fri Dec  9 20:43:36 2016
// Update Count    : 0
// Status          : Unknown, Use with caution!

`include "axi_defines.vh"

module test_case (/*AUTOARG*/ ) ;
`define TB testbench_axi_master_bfm
`define MASTER `TB.master
`define SLAVE `TB.slave
`define MEMORY `SLAVE.memory
   
   initial begin
`ifdef NCVERILOG
      $shm_open("basic.shm");	  
      $shm_probe(`TB,"MAC");      
`else
      $dumpfile("basic.vcd");
	  $dumpvars(0, `TB);
`endif
   end

   integer i;
   reg [31:0] read_data;

   initial begin
      repeat(100) @(posedge `TB.aclk);
      $display("BASIC: Timeout Failure! @ %d", $time);
      $finish;      
   end
   
   initial begin
      $display("AXI Master BFM Test: Basic");
      
      @(negedge `TB.aresetn);
      @(posedge `TB.aresetn);
      repeat (10) @(posedge `TB.aclk);
      `MASTER.write_single(32'h0000_0004, 32'hdead_beef, `AXI_BURST_SIZE_WORD, 4'hF);
      `MASTER.write_single(32'h0000_0008, 32'h1234_5678, `AXI_BURST_SIZE_WORD, 4'hF);
      `MASTER.write_single(32'h0000_000C, 32'hABCD_EF00, `AXI_BURST_SIZE_WORD, 4'hF);
      `MASTER.write_single(32'h0000_0010, 32'hAA55_66BB, `AXI_BURST_SIZE_WORD, 4'hF);
      repeat (10) @(posedge `TB.aclk);
    
      `MASTER.read_single_and_check(32'h0000_0004, 32'hdead_beef, `AXI_BURST_SIZE_WORD, 4'hF);
      `MASTER.read_single_and_check(32'h0000_0008, 32'h1234_5678, `AXI_BURST_SIZE_WORD, 4'hF);
      `MASTER.read_single_and_check(32'h0000_000C, 32'hABCD_EF00, `AXI_BURST_SIZE_WORD, 4'hF);
      `MASTER.read_single_and_check(32'h0000_0010, 32'hAA55_66BB, `AXI_BURST_SIZE_WORD, 4'hF);

      for (i=0; i<32; i=i+1) begin
         $display("MEMORY[%d] = 0x%04x", i, `MEMORY[i]);         
      end
      
      `TB.test_passed <= 1;      
      
   end
   
endmodule // test_case
