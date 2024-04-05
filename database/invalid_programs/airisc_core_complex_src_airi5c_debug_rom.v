//
// Copyright 2022 FRAUNHOFER INSTITUTE OF MICROELECTRONIC CIRCUITS AND SYSTEMS (IMS), DUISBURG, GERMANY.
// --- All rights reserved --- 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License");
// you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
// You may obtain a copy of the License at
// https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.
//
//
// File             : airi5c_debug_rom.v
// Author           : A. Stanitzki
// Creation Date    : 09.10.20
// Last Modified    : 15.02.21
// Version          : 1.0
// Abstract         : ROM for the debug module

module airi5c_debug_rom (
  input                  rst_ni,
  input                  clk_i,
  input                  postexec_req_i,
  input                  resume_req_i,
  output                 halted_o,
  output                 resume_ack_o,

  input   [`XPR_LEN-1:0] rom_imem_addr_i,
  output  [`XPR_LEN-1:0] rom_imem_rdata_o,

  input   [`XPR_LEN-1:0] progbuf0_i,
  input   [`XPR_LEN-1:0] progbuf1_i,

  input   [`XPR_LEN-1:0] rom_dmem_addr_i,
  input                  rom_dmem_write_i,
  input   [`XPR_LEN-1:0] rom_dmem_wdata_i,
  output  [`XPR_LEN-1:0] rom_dmem_rdata_o
);

// status register
// [unused[31:3] | postexec_req | halted | resume_ack]
wire postexec;
reg [`XPR_LEN-1:0]  status;

assign  postexec   = status[2];
assign  halted_o     = status[1];
assign  resume_ack_o = status[0];


reg [`XPR_LEN-1:0] rom_dmem_addr_r;
reg                rom_dmem_wen_r;

reg [`XPR_LEN-1:0] rom_imem_addr_r;

// hardware stack register
// used to save one register when entering debug mode
// and restoring the register when leaving debug.
reg [`XPR_LEN-1:0]  hwstack;

wire  [`XPR_LEN-1:0]  dm_debugrom [82:0]; // debug ROM has 256 lines 
assign  dm_debugrom[0]  = `XPR_LEN'h15C02023;  // 0001 0101 1100 0000 0010 0000 0010 0011, 14802023, sw x28, 0x140(x0) -- push x28 to debug mem space 0x140
assign  dm_debugrom[1]  = `XPR_LEN'h14402E03;  // 0001 0100 0100 0000 0010 1110 0000 0011, 14402E03, lw x28, 0x144(x0) -- read hart0_status from @0x144

assign  dm_debugrom[2]  = `XPR_LEN'h008E7E13;  // 0000 0000 0001 1110 0111 1110 0001 0011, 001E7E13, andi x28, 0x08 -- determine if resume is requested
assign  dm_debugrom[3]  = `XPR_LEN'h01C01E63;  // 0000 0001 1100 0000 0001 1110 0110 0011, 0101E63, bne x28, x0, d28(pc)
assign  dm_debugrom[4]  = `XPR_LEN'h14402E03;  // lw x28, 0x144(x0) -- read hart0_status again.
assign  dm_debugrom[5]  = `XPR_LEN'h002E6E13;  // 0000 0000 0010 1110 0110 1110 0001 0011, 002E6E13, ori x28, 0x02 -- set halted_flag
assign  dm_debugrom[6]  = `XPR_LEN'h15C02223;  // 0001 0101 1100 0000 0010 0010 0010 0011, 15C02223, sw x28, 0x144(x0) -- and store status
assign  dm_debugrom[7]  = `XPR_LEN'h004E7E13;  // 0000 0000 0100 1110 0111 1110 0001 0011, 004E7E13, andi x28, 0x04 -- check for exec

assign  dm_debugrom[8]  = `XPR_LEN'h01C01A63;  // 0000 0001 1100 0000 0001 1010 0110 0011, 01C01A63, bne x28, x0, 20(pc)
assign  dm_debugrom[9]  = `XPR_LEN'hFE1FF06F;  // 1111 1110 0001 1111 1111 0000 0110 1111, FE1FF06F, jal x0, -20 -- jump back to lw x28, 0x144(x0) ...
assign  dm_debugrom[10] = `XPR_LEN'h14002E03; // 0001 0100 0000 0000 0010 1110 0000 0011, 14002403, lw x28, 0x140(x0) -- pop x28 from "stack"
assign  dm_debugrom[11] = `XPR_LEN'h14002223; // 0001 0100 0000 0000 0010 0010 0010 0011, 14002223, sw x0, 0x144(x0) -- clear all status flags
assign  dm_debugrom[12] = `XPR_LEN'h7b200073; // DRET
assign  dm_debugrom[13] = `XPR_LEN'h14002423; // 0001 0100 0000 0000 0010 0100 0010 0011, 14002423, sw x0, 0x148(x0) -- clear postexec request 
assign  dm_debugrom[14] = `XPR_LEN'h14002E03; // 0001 0100 0000 0000 0010 1110 0000 0011, 14002403, lw x28, 0x140(x0) -- pop x28 from "stack"

assign  dm_debugrom[15] = progbuf0_i;   // first progbuf line, the debugger writes this to execute arbitrary commands
assign  dm_debugrom[16] = progbuf1_i;   // second progbuf line, the debugger writes this to execute arbitrary commands

assign  dm_debugrom[17] = `XPR_LEN'h00100073;  // 0000 0000 0001 0000 0000 0000 0111 0011, 00100073, EBREAK implicit ebreak at end of progbuf.

genvar i_gv;
for(i_gv = 18; i_gv < 80; i_gv = i_gv+1) begin
  assign  dm_debugrom[i_gv] = `XPR_LEN'h0;
end

assign  dm_debugrom[80] = hwstack;
assign  dm_debugrom[81] = {28'h0000000,resume_req_i&~resume_ack_o,postexec,halted_o,resume_ack_o};  

assign  dm_debugrom[82] = `XPR_LEN'h0;

assign rom_imem_rdata_o = dm_debugrom[rom_imem_addr_r[9:0] >> 2];
assign rom_dmem_rdata_o = dm_debugrom[rom_dmem_addr_r[9:0] >> 2];


always @(posedge clk_i or negedge rst_ni) begin
  if(~rst_ni) begin 
    hwstack <= `XPR_LEN'h0;
    status <= `XPR_LEN'h0;
    rom_dmem_addr_r <= 0;
    rom_dmem_wen_r  <= 0;
    rom_imem_addr_r <= 0;
  end else begin
      rom_dmem_addr_r <= rom_dmem_addr_i;
      rom_dmem_wen_r  <= rom_dmem_write_i;
      rom_imem_addr_r <= rom_imem_addr_i;

      if(rom_dmem_wen_r && (rom_dmem_addr_r == `ADDR_HART0_STATUS)) begin
        status[1] <= (rom_dmem_wdata_i == 0) ? 1'b0 : rom_dmem_wdata_i[1];
        status[0] <= (rom_dmem_wdata_i == 0) ? 1'b1 : rom_dmem_wdata_i[0];
      end else if(~resume_req_i) status[0] <= 1'b0;
      
      if(rom_dmem_wen_r && (rom_dmem_addr_r == `ADDR_HART0_STACK)) hwstack <= rom_dmem_wdata_i;

      if(rom_dmem_wen_r && (rom_dmem_addr_r == `ADDR_HART0_POSTEXEC)) status[2] <= 1'b0;
      else if(postexec_req_i) status[2] <= 1'b1;
  end 
end

endmodule
