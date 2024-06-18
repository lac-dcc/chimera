// This program was cloned from: https://github.com/BlackWatch0/EEE228_Microprocessor
// License: GNU General Public License v3.0

// (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:Instruction_Decoder:1.0
// IP Revision: 1

(* X_CORE_INFO = "Instruction_Decoder,Vivado 2019.2" *)
(* CHECK_LICENSE_TYPE = "final_design_Instruction_Decoder_0_0,Instruction_Decoder,{}" *)
(* CORE_GENERATION_INFO = "final_design_Instruction_Decoder_0_0,Instruction_Decoder,{x_ipProduct=Vivado 2019.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=Instruction_Decoder,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module final_design_Instruction_Decoder_0_0 (
  instruction,
  clk,
  shifter_flag,
  loadA,
  loadB,
  loadO,
  MUX_0,
  MUX_1,
  shift_direction,
  shifter_en,
  load_shifter,
  ALU_Sel,
  ALU_update,
  update_PC,
  acc_reset
);

input wire [3 : 0] instruction;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN final_design_clk_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
input wire shifter_flag;
output wire loadA;
output wire loadB;
output wire loadO;
output wire MUX_0;
output wire MUX_1;
output wire shift_direction;
output wire shifter_en;
output wire load_shifter;
output wire [3 : 0] ALU_Sel;
output wire ALU_update;
output wire update_PC;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME acc_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 acc_reset RST" *)
output wire acc_reset;

  Instruction_Decoder inst (
    .instruction(instruction),
    .clk(clk),
    .shifter_flag(shifter_flag),
    .loadA(loadA),
    .loadB(loadB),
    .loadO(loadO),
    .MUX_0(MUX_0),
    .MUX_1(MUX_1),
    .shift_direction(shift_direction),
    .shifter_en(shifter_en),
    .load_shifter(load_shifter),
    .ALU_Sel(ALU_Sel),
    .ALU_update(ALU_update),
    .update_PC(update_PC),
    .acc_reset(acc_reset)
  );
endmodule
