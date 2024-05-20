// This program was cloned from: https://github.com/BlackWatch0/EEE228_Microprocessor
// License: GNU General Public License v3.0

// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2700185 Thu Oct 24 18:46:05 MDT 2019
// Date        : Fri Mar 15 14:31:08 2024
// Host        : TEN14B31F0D48DB running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               U:/EEE228/EEE228_Microprocessor/Microprocessor/Microprocessor.srcs/sources_1/bd/final_design/ip/final_design_Instruction_Register_0_0/final_design_Instruction_Register_0_0_stub.v
// Design      : final_design_Instruction_Register_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "Instruction_Register,Vivado 2019.2" *)
module final_design_Instruction_Register_0_0(instructionIn, update, instructionOut)
/* synthesis syn_black_box black_box_pad_pin="instructionIn[3:0],update,instructionOut[3:0]" */;
  input [3:0]instructionIn;
  input update;
  output [3:0]instructionOut;
endmodule
