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
// File             : airi5c_regfile.v
// Author           : A. Stanitzki
// Creation Date    : 09.10.20
// Last Modified    : Wed 19 Jan 2022 05:08:31 PM CET
// Version          : 1.0
// Abstract         : airi5c register file 
// History          : 20.02.18 - added debug module (Ast)
//
`include "rv32_opcodes.vh"
`include "airi5c_arch_options.vh"

//data-Arrays unsupported in simvision
//`define debug_xcelium
`undef debug_xcelium
module airi5c_regfile(
  // regular operation port
  input                             clk_i,
  input                             rst_ni,
  input       [`REG_ADDR_WIDTH-1:0] ra1_i,
  output      [`XPR_LEN-1:0]        rd1_o,
  input       [`REG_ADDR_WIDTH-1:0] ra2_i,
  output      [`XPR_LEN-1:0]        rd2_o,
  input       [`REG_ADDR_WIDTH-1:0] ra3_i,
  output      [`XPR_LEN-1:0]        rd3_o,
  input                             wen_i,
  input       [`REG_ADDR_WIDTH-1:0] wa_i,
  input       [`XPR_LEN-1:0]        wd_i,
  input       [`XPR_LEN-1:0]        wd2_i,
  input                             use_rd64_i,
`ifdef ISA_EXT_F
  input                             sel_fpu_rs1_i,
  input                             sel_fpu_rs2_i,
  input                             sel_fpu_rs3_i,
  input                             sel_fpu_rd_i,
  input                             dm_sel_fpu_reg_i,
`endif

  // debug module port
  input       [`REG_ADDR_WIDTH-1:0] dm_wara_i,
  input       [`XPR_LEN-1:0]        dm_wd_i,
  input                             dm_wen_i,
  output reg  [`XPR_LEN-1:0]        dm_rd_o
);





`ifndef ISA_EXT_E
  reg     [`XPR_LEN-1:0]  data [31:0];  // full 32 x 32 bit regs
`else
  reg     [`XPR_LEN-1:0]  data [15:0];  // reduced 16 x 32 bit regs
`endif

// Simvision/xcelium is not able to display arrays... 
`ifdef debug_xcelium
 wire [31:0] data_00; assign data_00 = data[0];
 wire [31:0] data_01; assign data_01 = data[1];
 wire [31:0] data_02; assign data_02 = data[2];
 wire [31:0] data_03; assign data_03 = data[3];
 wire [31:0] data_04; assign data_04 = data[4];
 wire [31:0] data_05; assign data_05 = data[5];
 wire [31:0] data_06; assign data_06 = data[6];
 wire [31:0] data_07; assign data_07 = data[7];
 wire [31:0] data_08; assign data_08 = data[8];
 wire [31:0] data_09; assign data_09 = data[9];
 wire [31:0] data_0A; assign data_0A = data[10];
 wire [31:0] data_0B; assign data_0B = data[11];
 wire [31:0] data_0C; assign data_0C = data[12];
 wire [31:0] data_0D; assign data_0D = data[13];


`endif

`ifdef ISA_EXT_F
  reg     [31:0]          data_fpu [31:0];
  assign  rd1_o = sel_fpu_rs1_i ? data_fpu[ra1_i] : (|ra1_i ? data[ra1_i] : 0);
  assign  rd2_o = sel_fpu_rs2_i ? data_fpu[ra2_i] : (|ra2_i ? data[ra2_i] : 0);
  assign  rd3_o = sel_fpu_rs3_i ? data_fpu[ra3_i] : (|ra3_i ? data[ra3_i] : 0);
`else
  assign  rd1_o = |ra1_i ? data[ra1_i] : 0;
  assign  rd2_o = |ra2_i ? data[ra2_i] : 0;
  assign  rd3_o = |ra3_i ? data[ra3_i] : 0;
`endif
  integer i;

  always @(*) begin
  `ifdef ISA_EXT_F
    if (dm_sel_fpu_reg_i) begin
      dm_rd_o = data_fpu[dm_wara_i];
    end else if (|dm_wara_i) begin
      dm_rd_o = data[dm_wara_i];
  `else
    if (|dm_wara_i) begin
      dm_rd_o = data[dm_wara_i];
  `endif
    end else begin
      dm_rd_o = 0;
    end
  end

`ifdef WITH_MEM_HW_RESET // use dedicated hardware reset to initialize whole register file
`ifdef WITH_LATCH_REGFILE

`ifdef ISA_EXT_F
  always @(wen_i or dm_wen_i or dm_wd_i or wd_i or wd2_i or rst_ni or dm_wara_i or wa_i or use_rd64_i\
                 or dm_sel_fpu_reg_i or sel_fpu_rd_i) begin
`else 
  always @(wen_i or dm_wen_i or dm_wd_i or wd_i or wd2_i or rst_ni or dm_wara_i or wa_i or use_rd64_i) begin
`endif

`else
  always @(posedge clk_i or negedge rst_ni) begin
`endif
    if(~rst_ni) begin
      for (i = 1; i < 32; i = i + 1)
        data[i] <= (32'hdeadbe00 + i);
    
  `ifdef ISA_EXT_F
      for (i = 0; i < 32; i = i + 1)
        data_fpu[i] <= 32'h7fc00000;
  `endif
    end else begin
`else // no reset at all (allows mapping to FPGA memory primitives)
  always @(posedge clk_i) begin
    begin
`endif
      if (dm_wen_i) begin // register file write access by debug module
      `ifdef ISA_EXT_F
        if (dm_sel_fpu_reg_i) begin
          data_fpu[dm_wara_i] <= dm_wd_i;
        end else begin
        `ifdef ISA_EXT_E
          data[dm_wara_i[3:0]] <= dm_wd_i;
        `else
          data[dm_wara_i] <= dm_wd_i;
        `endif
        end
      `else
        data[dm_wara_i] <= dm_wd_i;
      `endif
      end

      else if (wen_i) begin // register file write access by CPU pipeline
      `ifdef ISA_EXT_F
        if (sel_fpu_rd_i) begin
          data_fpu[wa_i] <= wd_i;
        end else if (use_rd64_i) begin
          data[wa_i[4:0]] <= wd_i;
          data[wa_i[4:0]+1] <= wd2_i;
        end else begin
          data[wa_i] <= wd_i;
        end
      `else
        if (use_rd64_i) begin
          data[wa_i[4:0]] <= wd_i;
          data[wa_i[4:0]+1] <= wd2_i;
        end else begin
          data[wa_i] <= wd_i;
        end
      `endif
      end
    end
  end

endmodule
