// This program was cloned from: https://github.com/BlackWatch0/EEE228_Microprocessor
// License: GNU General Public License v3.0

// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2700185 Thu Oct 24 18:46:05 MDT 2019
// Date        : Fri Mar 15 14:31:07 2024
// Host        : TEN14B31F0D48DB running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ final_design_Instruction_Decoder_0_0_stub.v
// Design      : final_design_Instruction_Decoder_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "Instruction_Decoder,Vivado 2019.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(instruction, clk, shifter_flag, loadA, loadB, 
  loadO, MUX_0, MUX_1, shift_direction, shifter_en, load_shifter, ALU_Sel, ALU_update, update_PC, 
  acc_reset)
/* synthesis syn_black_box black_box_pad_pin="instruction[3:0],clk,shifter_flag,loadA,loadB,loadO,MUX_0,MUX_1,shift_direction,shifter_en,load_shifter,ALU_Sel[3:0],ALU_update,update_PC,acc_reset" */;
  input [3:0]instruction;
  input clk;
  input shifter_flag;
  output loadA;
  output loadB;
  output loadO;
  output MUX_0;
  output MUX_1;
  output shift_direction;
  output shifter_en;
  output load_shifter;
  output [3:0]ALU_Sel;
  output ALU_update;
  output update_PC;
  output acc_reset;
endmodule
