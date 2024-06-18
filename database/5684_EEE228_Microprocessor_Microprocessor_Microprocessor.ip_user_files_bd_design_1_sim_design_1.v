// This program was cloned from: https://github.com/BlackWatch0/EEE228_Microprocessor
// License: GNU General Public License v3.0

//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Sat Feb 24 02:30:58 2024
//Host        : Micheal running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (A0_0,
    A1_0,
    A2_0,
    A3_0,
    ALU_Sel_0,
    B0_0,
    B1_0,
    B2_0,
    B3_0,
    instruction_0,
    regA_0,
    regB_0);
  input A0_0;
  input A1_0;
  input A2_0;
  input A3_0;
  output [3:0]ALU_Sel_0;
  input B0_0;
  input B1_0;
  input B2_0;
  input B3_0;
  input [3:0]instruction_0;
  output [3:0]regA_0;
  output [3:0]regB_0;

  wire A0_0_1;
  wire A1_0_1;
  wire A2_0_1;
  wire A3_0_1;
  wire B0_0_1;
  wire B1_0_1;
  wire B2_0_1;
  wire B3_0_1;
  wire [3:0]Instruction_Decoder_0_ALU_Sel;
  wire Instruction_Decoder_0_loadA;
  wire Instruction_Decoder_0_loadB;
  wire [3:0]Register_A_0_regA;
  wire [3:0]Register_B_0_regB;
  wire [3:0]instruction_0_1;

  assign A0_0_1 = A0_0;
  assign A1_0_1 = A1_0;
  assign A2_0_1 = A2_0;
  assign A3_0_1 = A3_0;
  assign ALU_Sel_0[3:0] = Instruction_Decoder_0_ALU_Sel;
  assign B0_0_1 = B0_0;
  assign B1_0_1 = B1_0;
  assign B2_0_1 = B2_0;
  assign B3_0_1 = B3_0;
  assign instruction_0_1 = instruction_0[3:0];
  assign regA_0[3:0] = Register_A_0_regA;
  assign regB_0[3:0] = Register_B_0_regB;
  design_1_Instruction_Decoder_0_0 Instruction_Decoder_0
       (.ALU_Sel(Instruction_Decoder_0_ALU_Sel),
        .instruction(instruction_0_1),
        .loadA(Instruction_Decoder_0_loadA),
        .loadB(Instruction_Decoder_0_loadB),
        .shifter_flag(1'b0));
  design_1_Register_A_0_0 Register_A_0
       (.A0(A0_0_1),
        .A1(A1_0_1),
        .A2(A2_0_1),
        .A3(A3_0_1),
        .loadA(Instruction_Decoder_0_loadA),
        .regA(Register_A_0_regA));
  design_1_Register_B_0_0 Register_B_0
       (.B0(B0_0_1),
        .B1(B1_0_1),
        .B2(B2_0_1),
        .B3(B3_0_1),
        .loadB(Instruction_Decoder_0_loadB),
        .regB(Register_B_0_regB));
endmodule
