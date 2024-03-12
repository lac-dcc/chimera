//
// Copyright 2022 FRAUNHOFER INSTITUTE OF MICROELECTRONIC CIRCUITS AND SYSTEMS (IMS), DUISBURG, GERMANY.
// --- All rights reserved --- 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the “License”);
// you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
// You may obtain a copy of the License at
// https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on an “AS IS” BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.
//
//
// File              : airi5c_top_tb.v
// Author            : A. Stanitzki, I. Hoyer
// Creation Date     : 09.10.20
// Last Modified     : 08.08.22
// Version           : 1.0
// Abstract          : TOP testbench
// Note               : Added MEM_RESET
`timescale 1ns/1ns
`include "../src/airi5c_ctrl_constants.vh"
`include "../src/airi5c_csr_addr_map.vh"
`include "../src/airi5c_hasti_constants.vh"
`include "../src/airi5c_alu_ops.vh"
`include "../src/rv32_opcodes.vh"
`include "../src/airi5c_arch_options.vh"
`include "../src/airi5c_hasti_constants.vh"

module airi5c_top_tb(
  input        rst_ni,
  input        clk_i,
  input        ext_int_i,
  
  input        tdi_i,
  output       tdo_o,
  input        tck_i,
  input        tms_i,
  
  input        VDD_i,
  input        testmode_i,
  input        sdi_i,
  output       sdo_o,
  input        sen_i,

  output [7:0] debug_out_o
);

wire uart_tx;

// Config: AIRI5C with internal ideal SRAM (mainly for core verification)
// ----------------------------------------------------------------------
airi5c_cfg_ideal_sram DUT(  
  .CLK(clk_i),
  .nRESET(rst_ni),
  .EXT_INT(ext_int_i),

  .tdi(jtag_tdi),
  .tdo(jtag_tdo),
  .tck(jtag_tck),
  .tms(jtag_tms),

  .VDD(VDD_i),
  .debug_state(),
  .debug_out(debug_out_o),

  .testmode(1'b0),
  .sdi(sdi_i),
  .sdo(sdo_o),
  .sen(sen_i),
   
  //.gpio0(),

  .uart0_tx(uart_tx),
  .uart0_rx()

/*,
  .spi1_mosi(),
  .spi1_miso(),
  .spi1_sclk(),
  .spi1_ss()*/
); 


uart_monitor theMonitor(
  .clk_i(clk_i),
  .rst_ni(rst_ni),
  .uart_tx_i(uart_tx)
);

reg [31:0] memimg[0:256000000-1];

reg [31:0] simcyc;
reg written;

always @(posedge clk_i or negedge rst_ni) begin
  simcyc <= rst_ni ? simcyc + 1 : 0;
  if((DUT.DUT.dmem_haddr == 32'hC0000200) && (DUT.DUT.dmem_hwrite)) written <= 1; 
  else written <= 0;
  if(written) $write("%c",DUT.DUT.dmem_hwdata);
end


initial begin
  $readmemh("./memfiles/torture/coremark.mem",DUT.SRAM.mem);
  $write("airi5c_top_tb: tb started\r\n");
end

endmodule
